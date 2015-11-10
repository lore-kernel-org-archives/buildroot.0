From: Rodrigo Rebello <rprebello@gmail.com>
Date: Tue, 10 Nov 2015 18:47:58 -0200
Subject: [Buildroot] [PATCH 1/1] qemu: explicitly disable SSP support
In-Reply-To: <CAMQcK5Jma=S+O4DU8WWtUPS7aZz48rra2Gs+VaqER1sjbGAS_w@mail.gmail.com>
References: <1447175937-18022-1-git-send-email-rprebello@gmail.com>
 <CAMQcK5Jma=S+O4DU8WWtUPS7aZz48rra2Gs+VaqER1sjbGAS_w@mail.gmail.com>
Message-ID: <CABLs7GWfq__5yrTJMsqqjt+oObXVXAros3TDhb8fTKX8_rwr+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Ryan

2015-11-10 17:49 GMT-02:00 Ryan Barnett <ryan.barnett@rockwellcollins.com>:
> Hi Rodrigo,
>
> On Tue, Nov 10, 2015 at 11:18 AM, Rodrigo Rebello <rprebello@gmail.com> wrote:
>> Even though the QEMU configure script does a full compile and link test
>> to detect SSP support, it does so by using the compiler option
>> -fstack-protector-strong (and then -fstack-protector-all if that fails).
>>
>> The problem with this method is that the test program passes the check
>> with -fstack-protector-strong even when SSP support is not available in
>> the toolchain, since that option restricts stack protection to only a
>> subset of all the functions in a program and (in the case of the test
>> program) no "canary" code gets inserted, producing a false-positive.
>> This causes a subsequent failure when the probe for pthreads is
>> performed.
>>
>> To avoid patching the configure script, fix that by simply disabling the
>> use of stack protector when SSP is known to be unavailable in the
>> toolchain.
>>
>> Fixes:
>>
>>   http://autobuild.buildroot.net/results/efb/efbb4e940543894b8745bb405478a096c90a5ae2/
>>   http://autobuild.buildroot.net/results/32d/32d6d984febad2dee1f0d31c5fa0aea823297096/
>>   http://autobuild.buildroot.net/results/aa6/aa6e71c957fb6f07e7bded35a8e47be4dadd042c/
>>   ...and many others.
>>
>> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
>> ---
>>  package/qemu/qemu.mk | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
>> index 94e1bcf..0161b10 100644
>> --- a/package/qemu/qemu.mk
>> +++ b/package/qemu/qemu.mk
>> @@ -133,6 +133,12 @@ QEMU_VARS = \
>>         PYTHON=$(HOST_DIR)/usr/bin/python2 \
>>         PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
>>
>> +# Force disable stack protector when SSP isn't available in toolchain as
>> +# QEMU configure script fails to properly detect that.
>> +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
>> +QEMU_OPTS += --disable-stack-protector
>> +endif
>
> Typically when explicitly adding enable/disable configure options both
> cases of enabling or disabling the option are put within buildroot. So
> for this case, it would become:
>
> # Force disable stack protector when SSP isn't available in toolchain as
> # QEMU configure script fails to properly detect that.
> ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> QEMU_OPTS += --enable-stack-protector
> else
> QEMU_OPTS += --disable-stack-protector
> endif
>

Ok, then. I'll do as you suggested and send a new patch.

>> +
>>  # If we want to specify only a subset of targets, we must still enable all
>>  # of them, so that QEMU properly builds its list of default targets, from
>>  # which it then checks if the specified sub-set is valid. That's what we
>
> Thanks,
> -Ryan
>
> --
> Ryan Barnett / Sr Software Engineer
> Airborne Information Systems / Secure Platforms
> MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
> ryan.barnett at rockwellcollins.com
> www.rockwellcollins.com

Regards,
Rodrigo
