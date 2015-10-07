From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  7 Oct 2015 23:56:50 +0200
Subject: [Buildroot] [PATCH v2 4/4] libv4l: bump version to 1.8.0
In-Reply-To: <1444255010-6341-1-git-send-email-ps.report@gmx.net>
References: <1444255010-6341-1-git-send-email-ps.report@gmx.net>
Message-ID: <1444255010-6341-4-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And add proper qt5base/qt dependency (needed for qv4l2, qt5 support
added since 1.8.0).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix typo in commit comment (depndency vs. dependency)
---
 package/libv4l/libv4l.hash | 2 +-
 package/libv4l/libv4l.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 3371d34..1395eda 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 164abf5c1befcd27e8e6ef824a82d4015bdfb5d99ae82daa00e77d895ff9864c  v4l-utils-1.6.3.tar.bz2
+sha256 50c7be033636d878e902dad0a207fc9f6d831bec27f1b410f1102acddaa5565e  v4l-utils-1.8.0.tar.bz2
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index edb2a36..7978341 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.6.3
+LIBV4L_VERSION = 1.8.0
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
@@ -40,6 +40,9 @@ LIBV4L_CONF_OPTS += --without-libudev
 endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
+ifneq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT),)
+LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5BASE),qt5base,qt)
+endif
 LIBV4L_CONF_OPTS += --enable-v4l-utils
 # clock_gettime is used, which is provided by librt for glibc < 2.17
 LIBV4L_LIBS += -lrt
-- 
2.1.4
