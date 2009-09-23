From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 23 Sep 2009 13:37:38 +0200
Subject: [Buildroot] OpenSSL fails to build with AVR32
In-Reply-To: <4ABA040E.1000907@mimc.co.uk>
References: <4ABA040E.1000907@mimc.co.uk>
Message-ID: <20090923133738.0cd3582c@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Sep 2009 12:18:38 +0100
Mark Jackson <mpfj-list@mimc.co.uk> wrote:

> With the latest git, openssl fails to build (see below).
> 
> Any ideas ?
>

Yes.

<snipp>

> 		./Configure \
> 			linux-avr32 \
>

AVR32 does not have any specific optimization in OpenSSL, the patch
that was present in Buildroot got deprecated.

Try something ala

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 8c24db1..dcfcf4b 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -9,9 +9,6 @@ OPENSSL_SITE:=http://www.openssl.org/source
 OPENSSL_TARGET_ARCH=generic32
 
 # Some architectures are optimized in OpenSSL
-ifeq ($(ARCH),avr32)
-OPENSSL_TARGET_ARCH=avr32
-endif
 ifeq ($(ARCH),ia64)
 OPENSSL_TARGET_ARCH=ia64
 endif


<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
