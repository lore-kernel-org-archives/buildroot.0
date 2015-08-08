From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 11:02:07 +0200
Subject: [Buildroot] [git commit] package/rng-tools: needs argp-standalone
	with musl toolchains
Message-ID: <20150808090222.B3E2B8188A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b81ee16e8e6ac699e29f0f43f1a9546456127056
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since argp-standalone is only available for uClibc-ng
and musl toolchains, it's safe to link with it when
the package is selected.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rng-tools/Config.in    |    2 +-
 package/rng-tools/rng-tools.mk |    5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 43c5a1c..469b60e 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	# For rdrand ligcrypt is required and it's not obvious to users
 	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
 	help
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 8648c4f..7e975e0 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -9,8 +9,9 @@ RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RN
 RNG_TOOLS_LICENSE = GPLv2
 RNG_TOOLS_LICENSE_FILES = COPYING
 
-# Work around for uClibc's lack of argp_*() functions
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# Work around for uClibc or musl toolchains which lack argp_*()
+# functions.
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 RNG_TOOLS_CONF_ENV += LIBS="-largp"
 RNG_TOOLS_DEPENDENCIES += argp-standalone
 endif
