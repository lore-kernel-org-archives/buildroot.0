From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Sep 2015 18:47:18 +0200
Subject: [Buildroot] [PATCHv4 1/2] udisks: bump to version 1.0.5
In-Reply-To: <20150903180200.1bef81ef@free-electrons.com>
References: <1441203680-29193-1-git-send-email-Vincent.Riera@imgtec.com>
 <55E7663F.2040802@mind.be> <20150903180200.1bef81ef@free-electrons.com>
Message-ID: <55E87996.10105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-09-15 18:02, Thomas Petazzoni wrote:
> Arnout,
> 
> On Wed, 2 Sep 2015 23:12:31 +0200, Arnout Vandecappelle wrote:
> 
>>  However, I think it would be better to take a different approach here, because
>> there will be more packages with this requirement (we already have libmbim now,
>> but there are probably more that we haven't detected yet because we don't have
>> systemd in the autobuilders).
>>
>>  So I think there should be either a new virtual package or a suboption of udev
>> to handle the libgudev case.
> 
> The problem is you make a virtual package is that then you must use a
> "depends on": you cannot "select" a virtual package, at least if you
> use the normal virtual package mechanism and Config.in description.

 Right. So a suboption of udev then. Any package that needs libgudev also needs
udev, obviously. Something like:

udev/Config.in:
config BR2_PACKAGE_HAS_UDEV
	bool

if BR2_PACKAGE_HAS_UDEV
config BR2_PACKAGE_PROVIDES_UDEV
	string

config BR2_PACKAGE_NEEDS_GUDEV
	bool

config BR2_PACKAGE_PROVIDES_GUDEV
	string
endif


systemd/Config.in:
config BR2_PACKAGE_SYSTEMD
	# systemd provides udev but not libgudev
	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_NEEDS_GUDEV


eudev/Config.in:
if BR2_PACKAGE_EUDEV
config BR2_PACKAGE_PROVIDES_GUDEV
	string
	default "eudev"
endif

(Actually, for eudev nothing is needed)


libgudev/Config.in:
if BR2_PACKAGE_LIBGUDEV
config BR2_PACKAGE_PROVIDES_GUDEV
	string
	default "libgudev"
endif


udisks/Config.in:
config BR2_PACKAGE_UDISKS
	select BR2_PACKAGE_NEEDS_GUDEV


udev/udev.mk:
ifeq ($(BR2_PACKAGE_NEEDS_GUDEV),y)
UDEV_DEPENDENCIES += $(call qstrip,$(BR2_PACKAGE_PROVIDES_GUDEV))
endif


udisks already depends on udev so libgudev will be implied if necessary


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
