From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Aug 2018 01:04:03 +0200
Subject: [Buildroot] [PATCH 1/3] fake-hwclock: new package
In-Reply-To: <20180814160032.5d2bfce8@windsurf>
References: <20180810144635.16182-1-chrismcc@gmail.com>
 <20180814160032.5d2bfce8@windsurf>
Message-ID: <e991943f-b214-b364-0dc5-276c6e306273@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-08-18 16:00, Thomas Petazzoni wrote:
> Hello,
> 
> Yann, Arnout, Peter, there is a question below.
> 
> Christopher, there are some review comments as well.
> 
> On Fri, 10 Aug 2018 07:46:34 -0700, Christopher McCrory wrote:
> 
>> +if BR2_PACKAGE_FAKE_HWCLOCK
>> +config BR2_PACKAGE_FAKE_HWCLOCK_CRONJOB
>> +        bool "install fake-hwclock cronjob"
>> +        help
>> +          Hourly cronjob to save current timestamp
> 
> What should be our policy for cronjobs ? I'm not sure we currently have
> packages that install cronjobs.

 We don't, for a good reason: we don't start a cron daemon.

 Actually the 'at' package does install crontab entries, but it's kind of
pointless without crond...

> What should we do? Install
> unconditionally? Have a sub-option?

 I agree with unconditional. Ideally, though, as part of the _INSTALL_INIT,
because for systemd you really want to use systemd.timer units instead of crontabs.

> 
> I would personally lean towards installing unconditionally, but I'd
> like to have others opinions before applying.
> 
>> +FAKE_HWCLOCK_VERSION = v0.11
>> +FAKE_HWCLOCK_SITE = https://git.einval.com/git/fake-hwclock.git
>> +FAKE_HWCLOCK_SITE_METHOD = git
>> +FAKE_HWCLOCK_LICENSE_FILES = COPYING
>> +FAKE_LICENSE = GPL-2.0
> 
> This variable is wrong: it should be FAKE_HWCLOCK_LICENSE. Also, we
> prefer to have it before the LICENSE_FILES variable.
> 
>> +define FAKE_HWCLOCK_NO_LSB
>> +	$(SED) 's at . /lib/lsb/init-functions@#. /lib/lsb/init-functions@' \
>> +		$(@D)/debian/fake-hwclock.init
>> +endef
> 
> This should be done by a patch.

 Actually I think we'd prefer a Buildroot-specific init script instead of the
bloaty Debian one.

 Regards,
 Arnout

> 
> Thanks!
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
