From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Sep 2012 10:43:20 +0200
Subject: [Buildroot] [PATCH 05/13] perl: add GDBM_File
In-Reply-To: <CAB0FRsuJ8vSgW8My3HzKVG5BDMu7049NtScW6ijbzKbL4sTPLA@mail.gmail.com>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-5-git-send-email-francois.perrad@gadz.org>
 <20120920215953.4d4650fb@skate>
 <CAB0FRsuJ8vSgW8My3HzKVG5BDMu7049NtScW6ijbzKbL4sTPLA@mail.gmail.com>
Message-ID: <50601D28.8060808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/12 20:36, Fran?ois Perrad wrote:
> 2012/9/20 Thomas Petazzoni<thomas.petazzoni@free-electrons.com>:
>> On Sat,  8 Sep 2012 14:28:37 +0200, Francois Perrad wrote:
>>> +    PERL_DEPENDENCIES += gdbm
>>> +endif
>>>   HOST_PERL_DEPENDENCIES =
>>
>> There is no configuration option or argument to pass to Perl to tell it
>> to use Gdbm (or Berkeley DB)? I am a bit worried that if GDBM is
>> available on the build machine (for the build machine architecture),
>> the Perl build system might get confused and think that GDBM or
>> Berkeley DB are available, while they are not available for the target.
>> I.e, for autotools packages, we typically have:
>>
>> ifeq ($(BR2_PACKAGE_FOO_FEATURE_A),y)
>> FOO_DEPENDENCIES += liba
>> FOO_CONF_OPT += --enable-feature-a
>> else
>> FOO_CONT_OPT += --disable-feature-a
>> endif
>>
>> Isn't a similar construct necessary here?
>>
>
> The Configure script is not created by autotools, by a tool named 'metaconfig'.
> So, an option --enable-gdbm is not needed.
> The Configure script detects the include and the lib.
> The parameter libc defines a path with SYSROOT, so, there is not
> confusion with build machine.

  Another reason to explicitly enable/disable options is to be more robust
against dependency problems.  E.g. if --enable-feature-a is specified but
the configure script can't find feature a, then it will (hopefully) error out
and we can detect this in the autobuilders.  So if metaconf allows to
explicitly enable/disable features, we would prefer to use that.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
