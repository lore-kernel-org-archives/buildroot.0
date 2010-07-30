From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 10:24:08 +0200
Subject: [Buildroot] [git commit master 1/1] libiconv: add an error when
	both libiconv and locale are enabled
Message-ID: <20100730082546.7A918836C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a302e3aaa0a7e4eec1a82143efbbd09629b499ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
