From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Nov 2018 15:06:09 +0100
Subject: [Buildroot] [PATCH 1/1] libv4l: disable clang
Message-ID: <20181103140609.4528-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the time being, disable clang that is used to build BPF (in-kernel
bytecode machine) protocols.
Indeed, if an old version of clang is found on the host, it could be
used to build object files with a "None" architecture which will be
rejected by support/scripts/check-bin-arch

Fixes:
 - http://autobuild.buildroot.org/results/c18fb7f1ac81496db9c3a4e91ea028a26ca600b0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libv4l/libv4l.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 4e82dea6ad..f473c03806 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -55,6 +55,10 @@ endif
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
 LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
+
+# Disable clang that is used to build BPF (in-kernel bytecode machine) protocols
+LIBV4L_CONF_ENV += ac_cv_prog_CLANG=""
+
 ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
 LIBV4L_CONF_OPTS += --enable-qv4l2
 LIBV4L_DEPENDENCIES += qt5base
-- 
2.17.1
