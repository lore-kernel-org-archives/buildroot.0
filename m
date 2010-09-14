From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:47 -0700
Subject: [Buildroot] [PATCH 20/21] BugFix - Bison - Fixed Missing stddef.h
	Include In wchar.h
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-20-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When uClibc is configured without wchar support, wchar_t define is missing.
When configure runs it includes stddef.h, but when the build runs it does not.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/bison/bison-no-wchar/bison-no-wchar.patch |   13 +++++++++++++
 package/bison/bison.mk                            |    9 +++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/bison/bison-no-wchar/bison-no-wchar.patch

diff --git a/package/bison/bison-no-wchar/bison-no-wchar.patch b/package/bison/bison-no-wchar/bison-no-wchar.patch
new file mode 100644
index 0000000..6888ecf
--- /dev/null
+++ b/package/bison/bison-no-wchar/bison-no-wchar.patch
@@ -0,0 +1,13 @@
+--- bison-2.4.3/lib/wchar.in.h	2010-09-09 23:14:49.000000000 -0700
++++ bison-2.4.3.no.wchar/lib/wchar.in.h	2010-09-09 22:07:49.000000000 -0700
+@@ -72,6 +72,10 @@
+ # @INCLUDE_NEXT@ @NEXT_WCHAR_H@
+ #endif
+ 
++#ifdef __UCLIBC__
++# include <stddef.h>
++#endif
++
+ #undef _GL_ALREADY_INCLUDING_WCHAR_H
+ 
+ #ifndef _GL_WCHAR_H
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 075a078..64304a5 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -6,11 +6,20 @@
 BISON_VERSION:=2.4.3
 BISON_SOURCE:=bison-$(BISON_VERSION).tar.bz2
 BISON_SITE:=$(BR2_GNU_MIRROR)/bison
+BISON_DIR:=$(BUILD_DIR)/bison-$(BISON_VERSION)
 
 define BISON_DISABLE_EXAMPLES
 	echo 'all install:' > $(@D)/examples/Makefile
 endef
 
+define BISON_NO_WCHAR_SUPPORT
+	toolchain/patch-kernel.sh $(BISON_DIR) package/bison/bison-no-wchar/ \*.patch
+endef
+
+ifneq ($(BR2_USE_WCHAR),y)
+BISON_POST_CONFIGURE_HOOKS += BISON_NO_WCHAR_SUPPORT
+endif
+
 BISON_POST_CONFIGURE_HOOKS += BISON_DISABLE_EXAMPLES
 
 $(eval $(call AUTOTARGETS,package,bison))
-- 
1.7.2.3
