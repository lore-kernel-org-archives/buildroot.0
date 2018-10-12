From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 12 Oct 2018 23:00:47 +0200
Subject: [Buildroot] [git commit] netsnmp: fix static build failure due
 to missing -lssl and -lz
In-Reply-To: <20181012220845.07b266ea@windsurf>
References: <20181011204516.D4311835D7@busybox.osuosl.org>
 <20181012220845.07b266ea@windsurf>
Message-ID: <8ede0cd9-9c76-7796-a5e3-22d217ae4f6c@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 12/10/2018 22:08, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Thu, 11 Oct 2018 22:26:42 +0200, Peter Korsgaard wrote:
>> diff --git a/package/netsnmp/0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch b/package/netsnmp/0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch
>> new file mode 100644
>> index 0000000000..5cbc35600f
>> --- /dev/null
>> +++ b/package/netsnmp/0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch
>> @@ -0,0 +1,41 @@
>> +From 77062d4a76f5dbd8aee03a25e9eb514b7d924bcc Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> +Date: Mon, 17 Sep 2018 21:44:20 +0200
>> +Subject: [PATCH 3/3] configure: Invert AC_CHECK_LIB(EVP_md5,..) without -lz
>> + with -lz
>> +
>> +First AC_CHECK_LIB(EVP_md5,...) is going to succeed due to
>> +[other-libraries] fields, but in that case it won't add -lz to LIBCRYPTO
>> +resulting in failing AC_CHECH_FUNCS() with LIBS=LIBCRYPTO.
>> +
>> +Try AC_CHECK_LIB(EVP_md5,..) where LIBS can miss -lz
>> +and in action-if-not-found try AC_CHECK_LIB(EVP_md5,...) without -lz.
>> +In the first case append -lz to LIBCRYPTO, in the second don't.
>> +This is done to check if -lz is present and used in -lcrypto.
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> +---
>> + configure.d/config_os_libs2 | 5 ++---
>> + 1 file changed, 2 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
>> +index 81788a209..bfd14c191 100644
>> +--- a/configure.d/config_os_libs2
>> ++++ b/configure.d/config_os_libs2
>> +@@ -307,11 +307,10 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
>> +
>> +         if test x$CRYPTO = x; then
>> +             AC_CHECK_LIB([crypto], [EVP_md5],
>> +-			 [CRYPTO="crypto"; LIBCRYPTO="-lcrypto"], [
>> ++			 [CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"], [
>> + 		unset ac_cv_lib_crypto_EVP_md5
>> + 		AC_CHECK_LIB([crypto], [EVP_md5],
>> +-			     [CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"], [],
>> +-			     [-lz])
>> ++			     [CRYPTO="crypto"; LIBCRYPTO="-lcrypto"], [])
>> + 	    ])
> 
> This patch is really not great, because it means that in a
> dynamically-linked scenario, we will be linked against both libcrypto
> and libz, while linking against libcrypto is sufficient.

Yes, you're right.

> Once again, when you have the situation of an application A that uses
> OpenSSL, you have two cases:
> 
>   - When dynamic linking, application A only needs to link against
>     libssl/libcrypto. The fact that OpenSSL indirectly uses libz is
>     totally transparent, and the application A does not need to link
>     against libz, and in fact ideally should *not* link against libz.

Ok

>   - When static linking, application A needs to link against both
>     libssl/libcrypto *and* libz, because static linking doesn't take
>     care of transitive dependencies.

Ok

> With your fix, the application A will always be linked against openssl
> *and* libz, regardless of whether dynamic linking and static linking is
> used.

And that doesn't make sense.

> I don't understand why you had to invert the test. 

It's been a mistake watching it again now.

> It should have
> worked the way it was: first try with -lcrypto (should work in dynamic
> linking case), and if it doesn't try with -lcrypto -lz (should work in
> static linking case).

Yes, you're right.

> Inverting the two cases not good, and in fact
> makes no sense: if -lcrypto -lz fails, there is no reason for -lcrypto
> to work, so the second test becomes entirely useless.

This is right too.

Need to improve this.

Thanks for the perfect explanation.

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
