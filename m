From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Oct 2014 00:24:08 +0200
Subject: [Buildroot] [git commit] uclibc: explicitly set HAVE_SHARED
	depending on BR2_PREFER_STATIC_LIB
Message-ID: <20141013060647.875F7B2B68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66f4814676e6a73a78fa360c6e5d715a21aa20bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now with change of BR2_PREFER_STATIC_LIB meaning to "do not build dynamic libs
and build statically linked applications" it's possible to disable support of
shared libs in uClibc as well as builting of shared libc libs.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uClibc-0.9.31.config   |    1 -
 package/uclibc/uClibc-0.9.33.config   |    1 -
 package/uclibc/uClibc-snapshot.config |    1 -
 package/uclibc/uclibc.mk              |   11 +++++++++++
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uClibc-0.9.31.config b/package/uclibc/uClibc-0.9.31.config
index b23ba73..76772e8 100644
--- a/package/uclibc/uClibc-0.9.31.config
+++ b/package/uclibc/uClibc-0.9.31.config
@@ -61,7 +61,6 @@ HAVE_DOT_CONFIG=y
 DOPIC=y
 # ARCH_HAS_NO_SHARED is not set
 # ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
 # FORCE_SHAREABLE_TEXT_SEGMENTS is not set
 LDSO_LDD_SUPPORT=y
 # LDSO_CACHE_SUPPORT is not set
diff --git a/package/uclibc/uClibc-0.9.33.config b/package/uclibc/uClibc-0.9.33.config
index 0fbce19..1b07d4a 100644
--- a/package/uclibc/uClibc-0.9.33.config
+++ b/package/uclibc/uClibc-0.9.33.config
@@ -83,7 +83,6 @@ HAVE_DOT_CONFIG=y
 DOPIC=y
 # ARCH_HAS_NO_SHARED is not set
 # ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
 # FORCE_SHAREABLE_TEXT_SEGMENTS is not set
 LDSO_LDD_SUPPORT=y
 # LDSO_CACHE_SUPPORT is not set
diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index dea767e..ffc1535 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -85,7 +85,6 @@ HAVE_DOT_CONFIG=y
 DOPIC=y
 # ARCH_HAS_NO_SHARED is not set
 # ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
 # FORCE_SHAREABLE_TEXT_SEGMENTS is not set
 LDSO_LDD_SUPPORT=y
 # LDSO_CACHE_SUPPORT is not set
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index d66da17..b2ecce3 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -382,6 +382,16 @@ UCLIBC_WCHAR_CONFIG = $(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_WCHAR,$(@D)/.config)
 endif
 
 #
+# static/shared libs
+#
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+UCLIBC_SHARED_LIBS_CONFIG = $(call KCONFIG_DISABLE_OPT,HAVE_SHARED,$(@D)/.config)
+else
+UCLIBC_SHARED_LIBS_CONFIG = $(call KCONFIG_ENABLE_OPT,HAVE_SHARED,$(@D)/.config)
+endif
+
+#
 # Commands
 #
 
@@ -420,6 +430,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_THREAD_DEBUG_CONFIG)
 	$(UCLIBC_LOCALE_CONFIG)
 	$(UCLIBC_WCHAR_CONFIG)
+	$(UCLIBC_SHARED_LIBS_CONFIG)
 endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
