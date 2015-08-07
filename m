From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  8 Aug 2015 00:47:13 +0200
Subject: [Buildroot] [PATCH 1/7] package/rng-tools: needs argp-standalone
	with musl toolchains
Message-ID: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since argp-standalone is only available for uClibc-ng
and musl toolchains, it's safe to link with it when
the package is selected.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: fix argp-standalone dependency in rng-tools.mk
    (Yann E.Morin)
---
 package/rng-tools/Config.in    | 2 +-
 package/rng-tools/rng-tools.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 8648c4f..1b83afa 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -9,8 +9,8 @@ RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RN
 RNG_TOOLS_LICENSE = GPLv2
 RNG_TOOLS_LICENSE_FILES = COPYING
 
-# Work around for uClibc's lack of argp_*() functions
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# Work around for uClibc or musl toolchains which lack of argp_*() functions.
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 RNG_TOOLS_CONF_ENV += LIBS="-largp"
 RNG_TOOLS_DEPENDENCIES += argp-standalone
 endif
-- 
2.4.3
