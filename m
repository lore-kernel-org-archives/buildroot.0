From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 7 Jul 2017 06:43:50 -0500
Subject: [Buildroot] [PATCH v2 1/1] paxtest: new package
In-Reply-To: <5c0cab0d-11bb-2b45-655f-cb17a5e8f9aa@mind.be>
References: <1499308509-30051-1-git-send-email-matthew.weber@rockwellcollins.com>
 <4bd9bc00-761e-be3a-6981-5def37da00e9@mind.be>
 <CANQCQpb7fPZLS48niCz7F=5E-yF7ZMkC-WByi0yvCUBaE3GddQ@mail.gmail.com>
 <5c0cab0d-11bb-2b45-655f-cb17a5e8f9aa@mind.be>
Message-ID: <CANQCQpa2SgjLfvE7vC-at9abKHd4j4Jj1GT4R3S8LSGH9abdAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Fri, Jul 7, 2017 at 2:14 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 07-07-17 04:32, Matthew Weber wrote:
>> Arnout,
>>
>> On Thu, Jul 6, 2017 at 6:32 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>
>>>
>>> On 06-07-17 04:35, Matt Weber wrote:
> [snip]
>>>> +PAXTEST_SOURCE = paxtest-$(PAXTEST_VERSION).tar.gz
>>>
>>>  This is the default and can be removed.
>>
>> Thanks, the previous site we used had the dash as a underscore, didn't
>> realize when I updated it is back to normal.  Will remove.
>
>  Easy to miss. That's why even Peter and Thomas post their patches for review.
>
> [snip]
>>>> +define PAXTEST_BUILD_CMDS
>>>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC=$(TARGET_CC) LD=$(TARGET_LD) linux
>>>
>>>  TARGET_CC may consist of multiple words, so you have to quote this.
>>>
>>>  Does this package really use LD? That's usually annoying because it breaks
>>> situations that require specific architecture options to build correctly. Can
>>> you try if it works with LD=$(TARGET_CC) ?
>>>
>>
>> It works using TARGET_CC instead.  Will make that update.
>
>  It would be good to do a build test with one of those weird MIPS architectures
> to be sure. Check e.g. if it builds correctly with BR2_mips64=y and
> BR2_MIPS_NABI32=y.

test-pkg cfg:
BR2_PACKAGE_PAXTEST=y

                armv5-ctng-linux-gnueabi [ 1/47]: OK
              armv7-ctng-linux-gnueabihf [ 2/47]: OK
                        br-aarch64-glibc [ 3/47]: OK
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                 br-mips32r6-el-hf-glibc [18/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: OK
                          br-nios2-glibc [22/47]: OK
             br-powerpc64le-power8-glibc [25/47]: OK
               br-powerpc64-power7-glibc [26/47]: OK
                        br-sparc64-glibc [29/47]: OK
                     i686-ctng-linux-gnu [34/47]: OK
                          linaro-aarch64 [35/47]: OK
                              linaro-arm [36/47]: OK
             mips64el-ctng_n32-linux-gnu [37/47]: OK
             mips64el-ctng_n64-linux-gnu [38/47]: OK
        powerpc-ctng_e500v2-linux-gnuspe [39/47]: OK
                     sourcery-arm-armv4t [40/47]: OK
                            sourcery-arm [41/47]: OK
                     sourcery-arm-thumb2 [42/47]: OK
                         sourcery-mips64 [43/47]: OK
                           sourcery-mips [44/47]: OK
                          sourcery-nios2 [45/47]: OK
                         sourcery-x86-64 [46/47]: OK
           x86_64-ctng_locales-linux-gnu [47/47]: OK
47 builds, 23 skipped, 0 build failed, 0 legal-info failed


>
>>
>>>> +endef
>>>> +
>>>> +define PAXTEST_INSTALL_TARGET_CMDS
>>>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
>>>
>>>  Please use the same options as for building, i.e. include CC= and LD=, just in
>>> case something still gets built at install time.
>>
>> Sure.
>>
>> So my .mk ends up looking like:
>>
>> PAXTEST_VERSION = 0.9.15
>> PAXTEST_SITE = https://www.grsecurity.net/~spender
>> PAXTEST_LICENSE = GPL-2.0+
>> PAXTEST_LICENSE_FILES = README
>>
>> define PAXTEST_BUILD_CMDS
>>         $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>>                 CC="$(TARGET_CC)" LD="$(TARGET_CC)" linux
>> endef
>>
>> define PAXTEST_INSTALL_TARGET_CMDS
>>         $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>>                 CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
>>                 DESTDIR=$(TARGET_DIR) \
>>                 BINDIR="usr/bin" \
>>                 RUNDIR="usr/lib" -f Makefile.psm install
>> endef
>>
>> $(eval $(generic-package))
>
>  Looks good to me.
>
>  Regards,
>  Arnout
>
>>
>>
>> Appreciate the review!
>>
>> Matt
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
