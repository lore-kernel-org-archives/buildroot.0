From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Nov 2014 23:17:25 +0100
Subject: [Buildroot] [PATCH 3/4] toolchain: do not allow BR2_GENERATE_LOCALE
	with musl
In-Reply-To: <1415917046-14446-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1415917046-14446-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1415917046-14446-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Generating locales is possible in two situations:

 - With the internal toolchain backend, when the uClibc library is
   used. With uClibc, locales are generated at build time of the C
   library, so with uClibc it's only possible with the internal
   toolchain backend.

 - With either the internal or external toolchain backend when the
   glibc library is used. With glibc, locales can be generated
   afterwards, using the host-localedef utility.

Until we had the musl C library supported in the internal toolchain
backend, the condition: BR2_TOOLCHAIN_BUILDROOT ||
BR2_TOOLCHAIN_USES_GLIBC was correct to capture the above two
situations. Now that we have musl support in the internal toolchain
backend, then BR2_TOOLCHAIN_BUILDROOT is incorrect, and we should use
BR2_TOOLCHAIN_BUILDROOT_UCLIBC instead.

Basic locale support in musl has appeared in musl 1.1.4, but we are
not yet capable of generating the locale files for musl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 2dfaecc..683c143 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -69,7 +69,7 @@ config BR2_GENERATE_LOCALE
 	string "Generate locale data"
 	default ""
 	depends on \
-		BR2_TOOLCHAIN_BUILDROOT      || \
+		BR2_TOOLCHAIN_BUILDROOT_UCLIBC || \
 		BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Generate support for a list of locales. Locales can be
-- 
2.1.0
