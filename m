From: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
Date: Tue, 12 May 2020 15:28:54 +0200
Subject: [Buildroot] [PATCH 1/6] package/libgl-headers: introduce as a new
 virtual package for providers of OpenGL-compatible headers
Message-ID: <20200512132859.15189-1-jskrzypnik@novomatic-tech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, there can be more than one provider of OpenGL/EGL API headers (GL/gl.h, etc.)

These are usually the same everywhere, as there are universal (as universal OpenGL is) but
to avoid excessive patching and dependency mangling, a virtual package "libgl-headers" was
born to provide these generic API headers.

Not to confuse with private Mesa headers or other vendor-specific stuff, but these are
always in different header files.

Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
---
 package/opengl/Config.in                      | 1 +
 package/opengl/libgl-headers/Config.in        | 6 ++++++
 package/opengl/libgl-headers/libgl-headers.mk | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 package/opengl/libgl-headers/Config.in
 create mode 100644 package/opengl/libgl-headers/libgl-headers.mk

diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index cbc001427d..7080fdb979 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,4 +1,5 @@
 source "package/opengl/libgl/Config.in"
+source "package/opengl/libgl-headers/Config.in"
 source "package/opengl/libegl/Config.in"
 source "package/opengl/libgles/Config.in"
 source "package/opengl/libopencl/Config.in"
diff --git a/package/opengl/libgl-headers/Config.in b/package/opengl/libgl-headers/Config.in
new file mode 100644
index 0000000000..dfc3fb40fe
--- /dev/null
+++ b/package/opengl/libgl-headers/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBGL_HEADERS
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBGL_HEADERS
+	string
+	depends on BR2_PACKAGE_HAS_LIBGL_HEADERS
diff --git a/package/opengl/libgl-headers/libgl-headers.mk b/package/opengl/libgl-headers/libgl-headers.mk
new file mode 100644
index 0000000000..2155868b6d
--- /dev/null
+++ b/package/opengl/libgl-headers/libgl-headers.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libgl-headers
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
2.26.2


-- 
CONFIDENTIALITY NOTICE
------------------------------------
This
 E-mail is 
intended only to be read or used by the addressee.The 
information 
contained in this E-mail message may be confidential 
information. If you 
are not the intended recipient, any use, 
interference with, distribution, 
disclosure or copying of this material 
is unauthorized and prohibited. 
Confidentiality attached to this 
communication is not waived or lost by 
reason of the mistaken delivery 
to you.
If you have received this message 
in error, please delete
 it and notify us by return E-mail or telephone 
NOVOMATIC Technologies 
Poland S.A. +48 12 258 00 50. Any E-mail attachment 
may contain software
 viruses which could damage your own computer system. 
Whilst reasonable 
precaution has been taken to minimize this risk, we 
cannot accept 
liability for any damage which you sustain as a result of 
software 
viruses. You should therefore carry out your own virus checks 
before 
opening any attachments.
------------------------------------

NOVOMATIC Technologies Poland S.A., Poland, Krakowska 368, 32-080 Zabierz?w
