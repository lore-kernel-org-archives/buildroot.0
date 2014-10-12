From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Sun, 12 Oct 2014 18:34:45 +0200
Subject: [Buildroot] [PATCH 2/2] uclibc: explicitly set HAVE_SHARED
	depending on BR2_PREFER_STATIC_LIB
In-Reply-To: <1413131685-5567-1-git-send-email-abrodkin@synopsys.com>
References: <1413131685-5567-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1413131685-5567-3-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now with change of BR2_PREFER_STATIC_LIB meaning to "do not build dynamic libs
and build statically linked applications" it's possible to disable support of
shared libs in uClibc as well as builting of shared libc libs.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uClibc-0.9.31.config   |  1 -
 package/uclibc/uClibc-0.9.33.config   |  1 -
 package/uclibc/uClibc-snapshot.config |  1 -
 package/uclibc/uclibc.mk              | 11 +++++++++++
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uClibc-0.9.31.config b/package/uclibc/uClibc-0.9.31.config
index e990178..90346fb 100644
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
index eb39df6..a32f886 100644
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
index 890aefd..ce10bb5 100644
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
index 1469f8d..a400dab 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -392,6 +392,16 @@ UCLIBC_STRIP_CONFIG = $(call KCONFIG_ENABLE_OPT,DOSTRIP,$(@D)/.config)
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
 
@@ -431,6 +441,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_LOCALE_CONFIG)
 	$(UCLIBC_WCHAR_CONFIG)
 	$(UCLIBC_STRIP_CONFIG)
+	$(UCLIBC_SHARED_LIBS_CONFIG)
 endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
-- 
1.9.3
