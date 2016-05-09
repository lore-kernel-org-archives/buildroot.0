From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 May 2016 00:31:45 +0200
Subject: [Buildroot] [PATCH] ipsec-tools: add patches to fix musl build
In-Reply-To: <1462726487.22644.25.camel@embedded.rocks>
References: <1462707126-21048-1-git-send-email-joerg.krause@embedded.rocks>
 <20160508154028.66be1c03@free-electrons.com>
 <1462726487.22644.25.camel@embedded.rocks>
Message-ID: <3f2b56c2-161e-d297-e58e-938d9b011109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/08/16 18:54, J?rg Krause wrote:
> On So, 2016-05-08 at 15:40 +0200, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Sun,  8 May 2016 13:32:06 +0200, J?rg Krause wrote:
[snip]
>>> 4) Check for strtouq
>>>
>>> strtouq() is a BSD function and not available on musl. Add a
>>> autoconf check
>>> for its present and if not available, replace it with its
>>> equivalent strtoull
>>> or strtoul (if strtoull is not available).
>>
>> Are you sure replacing strtouq by strtoul is safe? strtouq() is
>> converting to a 64 bits integer, while strtoul() converts to an
>> unsigned long, which is only 32 bits on 32 bits architectures. So
>> replacing strtouq() with strtoul() on 32 bits architectures is
>> only
>> safe if you're sure that the value being passed fits on 32 bits.
>
> I was not sure about this, too. The Linux man page says: "Depending on
> the wordsize of the current architecture, this may be equivalent to
> strtoull() or to strtoul()." This confused my a little bit. So, I guess
> it's only sure to replace with strtoull().

  On a 64-bit arch, long is normally 64-bit, so strtouq is equivalent to strtoul.

  But normally strtoull should always exist for gcc, except when an explicit 
-std=c90 is passed.


>>> +# We are patch configure.ac, so we need to run autoreconfigure the
>>> package.
>>
>> are patch -> are patching
>>
>>> +# Although this package uses autoconf, it does not work with the
>>> autoreconf
>>> +# tool, so we # need to call their bootstrap script which does the
>>
>> # sign in a middle of a line, probably a rewrap that went wrong.
>>
>>> +# reconfiguration.
>>> +define IPSEC_TOOLS_RUN_BOOTSTRAP
>>> +	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
>>> +endef
>>> +IPSEC_TOOLS_PRE_CONFIGURE_HOOKS += IPSEC_TOOLS_RUN_BOOTSTRAP
>>
>> You need to add host-autoconf (and possibly host-automake/host-
>> libtool)
>> in the dependencies for this to work.
>
> I see!
>
>> Or alternatively, fix the autoreconfiguration problems so that it
>> autoreconfigures properly :)
>
> I proposed a patch upstream to fix autoreconf, but it was insisted that
> bootstrap should be used nonetheless. So, it seems easier to add the
> autoreconf patch to Buildroot.

  I think it's enough to update configure.ac with:

AC_CONFIG_MACRO_DIRS([.])
AM_INIT_AUTOMAKE(dist-bzip2 foreign subdir-objects)


  That should be upstreamable as well.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
