From: Rodrigo Rebello <rprebello@gmail.com>
Date: Wed, 11 Nov 2015 21:49:31 -0200
Subject: [Buildroot] [PATCH v2 1/1] qemu: add patch to fix SSP support
	detection
In-Reply-To: <5643CF83.6000800@mind.be>
References: <1447280301-9225-1-git-send-email-rprebello@gmail.com>
 <5643CF83.6000800@mind.be>
Message-ID: <CABLs7GXMFP-vm1tRx1zcQZAsJ+KXUV8JNqxLN+3qPhGbNDL50w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

2015-11-11 21:30 GMT-02:00 Arnout Vandecappelle <arnout@mind.be>:
> On 11-11-15 23:18, Rodrigo Rebello wrote:
>> The QEMU configure script incorrectly assumes SSP is supported by the
>> toolchain in some cases where the compiler accepts -fstack-protector-*
>> flags but the C library does not provide the necessary __stack_chk_*()
>> functions.
>>
>> Even though a full compile and link test is performed by the script,
>> this is done with a code fragment which does not actually meet any of
>> the conditions required to cause the compiler to emit canary code when
>> the -fstack-protector-strong variant is used. As no compile or link
>> failure occurs in this case, a false positive is generated and a
>> subsequent error is seen when the probe for pthreads is performed.
>>
>> The fix consists in patching the configure script to use an appropriate
>> test program for the SSP support checks.
>>
>> Fixes:
>>
>>   http://autobuild.buildroot.net/results/efb/efbb4e940543894b8745bb405478a096c90a5ae2/
>>   http://autobuild.buildroot.net/results/32d/32d6d984febad2dee1f0d31c5fa0aea823297096/
>>   http://autobuild.buildroot.net/results/aa6/aa6e71c957fb6f07e7bded35a8e47be4dadd042c/
>>   ...and many others.
>>
>> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  But let's wait a day or see for upstream to comment on the patch. I have one nit:
>
>> ---
>> Changes v1 -> v2:
>>   - Patch the configure script instead of force disable SSP detection
>>     (Arnout Vandecappelle).
>> ---
>>  ...se-appropriate-code-fragment-for-fstack-p.patch | 65 ++++++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>  create mode 100644 package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch
>>
>> diff --git a/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch b/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch
>> new file mode 100644
>> index 0000000..5eee141
>> --- /dev/null
>> +++ b/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch
>> @@ -0,0 +1,65 @@
>> +From 83897ad507f8bb332000304b96d36c109c19bfad Mon Sep 17 00:00:00 2001
>> +From: Rodrigo Rebello <rprebello@gmail.com>
>> +Date: Wed, 11 Nov 2015 18:39:24 -0200
>> +Subject: [PATCH 1/1] configure: use appropriate code fragment for
>> + -fstack-protector checks
>> +Cc: qemu-trivial at nongnu.org
>> +
>> +The check for stack-protector support consisted in compiling and linking
>> +the test program below (output by function write_c_skeleton()) with the
>> +compiler flag -fstack-protector-strong first and then with
>> +-fstack-protector-all if the first one failed to work:
>> +
>> +  int main(void) { return 0; }
>> +
>> +This caused false positives when using certain toolchains in which the
>> +compiler accepted -fstack-protector-strong but no support was provided
>> +by the C library, since for this stack-protector variant the compiler
>> +emits canary code only for functions that meet specific conditions
>> +(local arrays, memory references to local variables, etc.) and the code
>> +fragment under test included none of them (hence no stack protection
>> +code generated, no link failure).
>> +
>> +This fix changes the test program used for -fstack-protector checks to
>> +include a function that meets conditions which cause the compiler to
>> +generate canary code in all variants.
>> +
>> +Upstream status: sent
>> +
>> +Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
>> +---
>> + configure | 18 ++++++++++++++++++
>> + 1 file changed, 18 insertions(+)
>> +
>> +diff --git a/configure b/configure
>> +index cd219d8..a6f4101 100755
>> +--- a/configure
>> ++++ b/configure
>> +@@ -1471,6 +1471,24 @@ for flag in $gcc_flags; do
>> + done
>> +
>> + if test "$stack_protector" != "no"; then
>> ++  cat > $TMPC << EOF
>> ++void foo(const char *c);
>
>  This declaration is unnecessary.
>

Actually it is necessary, otherwise compiling the test code fails with:

config-temp/qemu-conf.c:3:6: error: no previous prototype for ?foo?
[-Werror=missing-prototypes]
 void foo(const char *c)
      ^

Because in configure, line 410, -Wmissing-prototypes is added to
QEMU_FLAGS (used in every compile test), and tests are run with
-Werror by default, unless --disable-werror is passed to the configure
script.

>
>  Regards,
>  Arnout
>
>> ++
>> ++void foo(const char *c)
>> ++{
>> ++    char arr[64], *p;
>> ++    for (p = arr; *c; c++, p++) {
>> ++        *p = *c;
>> ++    }
>> ++}
>> ++
>> ++int main(void)
>> ++{
>> ++    char c[] = "";
>> ++    foo(c);
>> ++    return 0;
>> ++}
>> ++EOF
>> +   gcc_flags="-fstack-protector-strong -fstack-protector-all"
>> +   sp_on=0
>> +   for flag in $gcc_flags; do
>> +--
>> +2.1.4
>> +
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
