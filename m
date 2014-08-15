From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 22:31:25 +0200
Subject: [Buildroot] [git commit] systemd: disable link time optimization
Message-ID: <20140815203131.0B7789D439@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9054017cfc25c8f89225e1d18c71f112d25f9a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in https://bugs.busybox.net/show_bug.cgi?id=7286,
systemd fails to build with BR2_OPTIMIZE_2=y. This mode activates the GCC
options -flto and -ffat-lto-objects, which do not mix well with the GCC
tricks used in src/compat-libs/linkwarning.h to build the compatibility
libraries.

As a temporary workaround, this patch disables link time optimization for
systemd.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
