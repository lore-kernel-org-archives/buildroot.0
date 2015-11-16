From: Rodrigo Rebello <rprebello@gmail.com>
Date: Mon, 16 Nov 2015 18:19:35 -0200
Subject: [Buildroot] [PATCH v3 1/1] qemu: add patch to fix SSP support
	detection
In-Reply-To: <564A3814.1000106@mind.be>
References: <1447671498-9180-1-git-send-email-rprebello@gmail.com>
 <564A3814.1000106@mind.be>
Message-ID: <CABLs7GVMBbkR5gxy2uzCPBSrNAuu_6n9JGQKH=ytrPWKGDjrew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

2015-11-16 18:09 GMT-02:00 Arnout Vandecappelle <arnout@mind.be>:
[snip]
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  (untested)
>
>  Is the patch for the toolchain wrapper also coming?
>

Yes, I'll submit it as soon as I get home.

Regards,
Rodrigo

>  Regards,
>  Arnout
>
>> ---
>> Changes v2 -> v3:
>>   - Use a better test code fragment that works when LTO is enabled
>>
>> Changes v1 -> v2:
>>   - Patch the configure script instead of force disable SSP detection
>>     (Arnout Vandecappelle)
>> ---
>>  ...se-appropriate-code-fragment-for-fstack-p.patch | 58 ++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>  create mode 100644 package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch
>>
>> diff --git a/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch b/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch
>> new file mode 100644
>> index 0000000..9ebe334
>> --- /dev/null
>> +++ b/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch
>> @@ -0,0 +1,58 @@
>> +From 7b93e98143c376ed09bfd30658b8641d4a36e77e Mon Sep 17 00:00:00 2001
>> +From: Rodrigo Rebello <rprebello@gmail.com>
>> +Date: Thu, 12 Nov 2015 12:04:28 -0200
>> +Subject: [PATCH] configure: use appropriate code fragment for
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
>> +compiler accepts -fstack-protector-strong but no support is provided by
>> +the C library, since in this stack-protector variant the compiler emits
>> +canary code only for functions that meet specific conditions (local
>> +arrays, memory references to local variables, etc.) and the code
>> +fragment under test included none of them (hence no stack protection
>> +code generated, no link failure).
>> +
>> +This fix modifies the test program used for -fstack-protector checks to
>> +meet conditions which cause the compiler to generate canary code in all
>> +variants.
>> +
>> +Upstream status: sent
>> +https://patchwork.ozlabs.org/patch/543357/
>> +
>> +Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
>> +---
>> + configure | 10 ++++++++++
>> + 1 file changed, 10 insertions(+)
>> +
>> +diff --git a/configure b/configure
>> +index cd219d8..27d7b3c 100755
>> +--- a/configure
>> ++++ b/configure
>> +@@ -1471,6 +1471,16 @@ for flag in $gcc_flags; do
>> + done
>> +
>> + if test "$stack_protector" != "no"; then
>> ++  cat > $TMPC << EOF
>> ++int main(int argc, char *argv[])
>> ++{
>> ++    char arr[64], *p = arr, *c = argv[0];
>> ++    while (*c) {
>> ++        *p++ = *c++;
>> ++    }
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
