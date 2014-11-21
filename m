From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 21:50:42 +0100
Subject: [Buildroot] [git commit] toolchain: do not allow
	BR2_GENERATE_LOCALE with musl
Message-ID: <20141121205146.7DD447FE1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd0ffe2206fbd32baf7f4a1dc5fde81cfad70462
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
