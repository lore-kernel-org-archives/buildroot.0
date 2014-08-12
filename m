From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 12 Aug 2014 22:28:27 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: disable link time optimization
Message-ID: <1407875307-12036-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported in https://bugs.busybox.net/show_bug.cgi?id=7286,
systemd fails to build with BR2_OPTIMIZE_2=y. This mode activates the GCC
options -flto and -ffat-lto-objects, which do not mix well with the GCC
tricks used in src/compat-libs/linkwarning.h to build the compatibility
libraries.

As a temporary workaround, this patch disables link time optimization for
systemd.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/systemd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9729276..edde998 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -49,8 +49,11 @@ SYSTEMD_CONF_OPT += \
 	--disable-dbus \
 	--without-python
 
+SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
+
 # Override path to kmod, used in kmod-static-nodes.service
 SYSTEMD_CONF_ENV = \
+	CFLAGS="$(SYSTEMD_CFLAGS)" \
 	ac_cv_path_KMOD=/usr/bin/kmod
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
-- 
1.9.3
