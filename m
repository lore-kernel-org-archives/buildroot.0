From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Nov 2018 13:27:57 +0100
Subject: [Buildroot] [PATCH 3/4] libv4l: add elfutils optional dependency
In-Reply-To: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103122758.10578-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 1.61.1 added an optional dependency to elfutils:
https://git.linuxtv.org/v4l-utils.git/commit/?id=d6025b0e8c7f57b0f9390f987acc5eed57360d80

host-clang is also needed to build PBF protocols, see:
https://git.linuxtv.org/v4l-utils.git/commit/?id=91b37c0d9cb71fc2d5f78cc96aa2ef9f3bba145b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libv4l/libv4l.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 4e82dea6ad..7be41f8fef 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -55,6 +55,12 @@ endif
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
 LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
+
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+# host-clang is needed to build BPF protocols
+LIBV4L_DEPENDENCIES += elfutils host-clang
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
 LIBV4L_CONF_OPTS += --enable-qv4l2
 LIBV4L_DEPENDENCIES += qt5base
-- 
2.17.1
