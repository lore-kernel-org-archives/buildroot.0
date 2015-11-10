From: Rodrigo Rebello <rprebello@gmail.com>
Date: Tue, 10 Nov 2015 19:22:03 -0200
Subject: [Buildroot] [PATCH 1/1] qemu: explicitly disable SSP support
In-Reply-To: <56425D78.80103@mind.be>
References: <1447175937-18022-1-git-send-email-rprebello@gmail.com>
 <56425D78.80103@mind.be>
Message-ID: <CABLs7GWTqOUPETR6m+GQioCjo8GeN36zbwVTiBSqP0Of1EBiSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All

2015-11-10 19:11 GMT-02:00 Arnout Vandecappelle <arnout@mind.be>:
> On 10-11-15 18:18, Rodrigo Rebello wrote:
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
>
>  Actually, it doesn't look too hard to patch the configure script, and that
> would be upstreamable.
>

I agree, that would be a better solution indeed. I'll consider
patching the configure script then, and if I come up with a working
solution, I'll send the patch upstream as well.

>  But if you feel that that is too difficult, I'm OK with this patch.
>
>  Regards,
>  Arnout
>
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
>>       PYTHON=$(HOST_DIR)/usr/bin/python2 \
>>       PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
>>
>> +# Force disable stack protector when SSP isn't available in toolchain as
>> +# QEMU configure script fails to properly detect that.
>> +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
>> +QEMU_OPTS += --disable-stack-protector
>> +endif
>> +
>>  # If we want to specify only a subset of targets, we must still enable all
>>  # of them, so that QEMU properly builds its list of default targets, from
>>  # which it then checks if the specified sub-set is valid. That's what we
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

Regards,
Rodrigo
