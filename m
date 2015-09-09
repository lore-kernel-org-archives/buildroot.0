From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Sep 2015 22:33:29 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <20150909132929.5c01433e@free-electrons.com>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <20150909132929.5c01433e@free-electrons.com>
Message-ID: <55F09799.6030609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09-09-15 13:29, Thomas Petazzoni wrote:
> Luca,
> 
> On Tue,  8 Sep 2015 23:28:51 +0200, Luca Ceresoli wrote:
>> There are a few reasons for an embedded Linux system not to use devtmpfs,
>> but still want to have dynamic /dev management. The most notable is to use
>> a kernel < 2.6.32, which have no devtmpfs support.
>>
>> For such corner cases, we introduce the ability to use busybox mdev for
>> /dev management even without devtmpfs.
>>
>> First, we need the BR2_ROOTFS_STATIC_DEVICE_TABLE just like the static
>> /dev management, in order to have the very basic devices such as /dev/null
>> and /dev/console until mdev is enabled.
> 
> As said in another e-mail, this is not really true: we just need a very
> simple, two devices long, hard-coded device table. There is no need to
> allow the user to customize it. It would in fact be potentially
> misleading because the user who would add more devices in this static
> device table would not see them on the target: they would be
> "overridden" by the tmpfs mounted in /dev.

 Right! So:

define BUSYBOX_DEVICES
	/dev/console c 666 0 0 5 1 - - -
	/dev/null c 666 0 0 1 3 0 0 -
endef


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
