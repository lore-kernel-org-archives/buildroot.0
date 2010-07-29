From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:49 +0200
Subject: [Buildroot] [PATCH 06/19] libiconv: add an error when both libiconv
	and locale are enabled
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a302e3aaa0a7e4eec1a82143efbbd09629b499ea.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This error should never show up if all Buildroot dependencies are
correct. However, rather than failing horribly later on, catch this
particular case early on and error out.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiconv/libiconv.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index cc40cd4..a3f762a 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -23,3 +23,10 @@ ifneq ($(BR2_ENABLE_DEBUG),y)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libcharset.so.*
 endif
 	touch $@
+
+# Configurations where the toolchain supports locales and the libiconv
+# package is enabled are incorrect, because the toolchain already
+# provides libiconv functionality, and having both confuses packages.
+ifeq ($(BR2_PACKAGE_LIBICONV)$(BR2_ENABLE_LOCALE),yy)
+$(error Libiconv should never be enabled when the toolchain supports locales. Report this failure to Buildroot developers)
+endif
-- 
1.7.0.4
