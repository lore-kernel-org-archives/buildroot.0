From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Jul 2017 09:14:30 +0200
Subject: [Buildroot] [PATCH v2 1/1] paxtest: new package
In-Reply-To: <CANQCQpb7fPZLS48niCz7F=5E-yF7ZMkC-WByi0yvCUBaE3GddQ@mail.gmail.com>
References: <1499308509-30051-1-git-send-email-matthew.weber@rockwellcollins.com>
 <4bd9bc00-761e-be3a-6981-5def37da00e9@mind.be>
 <CANQCQpb7fPZLS48niCz7F=5E-yF7ZMkC-WByi0yvCUBaE3GddQ@mail.gmail.com>
Message-ID: <5c0cab0d-11bb-2b45-655f-cb17a5e8f9aa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-07-17 04:32, Matthew Weber wrote:
> Arnout,
> 
> On Thu, Jul 6, 2017 at 6:32 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> On 06-07-17 04:35, Matt Weber wrote:
[snip]
>>> +PAXTEST_SOURCE = paxtest-$(PAXTEST_VERSION).tar.gz
>>
>>  This is the default and can be removed.
> 
> Thanks, the previous site we used had the dash as a underscore, didn't
> realize when I updated it is back to normal.  Will remove.

 Easy to miss. That's why even Peter and Thomas post their patches for review.

[snip]
>>> +define PAXTEST_BUILD_CMDS
>>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC=$(TARGET_CC) LD=$(TARGET_LD) linux
>>
>>  TARGET_CC may consist of multiple words, so you have to quote this.
>>
>>  Does this package really use LD? That's usually annoying because it breaks
>> situations that require specific architecture options to build correctly. Can
>> you try if it works with LD=$(TARGET_CC) ?
>>
> 
> It works using TARGET_CC instead.  Will make that update.

 It would be good to do a build test with one of those weird MIPS architectures
to be sure. Check e.g. if it builds correctly with BR2_mips64=y and
BR2_MIPS_NABI32=y.

> 
>>> +endef
>>> +
>>> +define PAXTEST_INSTALL_TARGET_CMDS
>>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
>>
>>  Please use the same options as for building, i.e. include CC= and LD=, just in
>> case something still gets built at install time.
> 
> Sure.
> 
> So my .mk ends up looking like:
> 
> PAXTEST_VERSION = 0.9.15
> PAXTEST_SITE = https://www.grsecurity.net/~spender
> PAXTEST_LICENSE = GPL-2.0+
> PAXTEST_LICENSE_FILES = README
> 
> define PAXTEST_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>                 CC="$(TARGET_CC)" LD="$(TARGET_CC)" linux
> endef
> 
> define PAXTEST_INSTALL_TARGET_CMDS
>         $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>                 CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
>                 DESTDIR=$(TARGET_DIR) \
>                 BINDIR="usr/bin" \
>                 RUNDIR="usr/lib" -f Makefile.psm install
> endef
> 
> $(eval $(generic-package))

 Looks good to me.

 Regards,
 Arnout

> 
> 
> Appreciate the review!
> 
> Matt
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
