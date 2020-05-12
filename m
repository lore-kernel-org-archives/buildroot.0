From: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
Date: Tue, 12 May 2020 15:28:56 +0200
Subject: [Buildroot] [PATCH 3/6] package/libglvnd: new package
In-Reply-To: <20200512132859.15189-1-jskrzypnik@novomatic-tech.com>
References: <20200512132859.15189-1-jskrzypnik@novomatic-tech.com>
Message-ID: <20200512132859.15189-3-jskrzypnik@novomatic-tech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is libglvnd, an GL Vendor-Neutral-Dispatcher.

It allows us to have more than one GL provider on the running system,
mostly for x86 images which can be applied to various boards with
different GPUs, but might be also used on ARM for example, as long as
proprietary vendor GL providers comply to this standard.

Currently, it's used by Mesa and NVIDIA, but there are some efforts on
other projects like RaspberryPi VideoCore or i.MX Vivante/Etnaviv GPUs.

It delivers own copy of OpenGL/EGL headers and technically works as a
"dispatcher" residing in libraries: libGLX.so, libGL.so, libOpenGL.so,
libEGL*.so, etc.

If there's a call on them, it's forwarded to chosen provider, for
example libGL_mesa.so when Mesa is chosen.

The provider selection on X11 is done by talking to GLX extension, on
systems using OpenGLES it's done in the same way as Vulkan or OpenCL
providers are - by ICD definitions, provided by them.

Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
---
 package/Config.in              |  1 +
 package/libglvnd/Config.in     | 21 +++++++++++++++++++++
 package/libglvnd/libglvnd.hash |  1 +
 package/libglvnd/libglvnd.mk   | 19 +++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/libglvnd/Config.in
 create mode 100644 package/libglvnd/libglvnd.hash
 create mode 100644 package/libglvnd/libglvnd.mk

diff --git a/package/Config.in b/package/Config.in
index c12676d859..22d9c344ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -311,6 +311,7 @@ comment "Graphic libraries"
 	source "package/imagemagick/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
+	source "package/libglvnd/Config.in"
 	source "package/mesa3d/Config.in"
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
new file mode 100644
index 0000000000..85302329e6
--- /dev/null
+++ b/package/libglvnd/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LIBGLVND
+	bool "libglvnd"
+        select BR2_PACKAGE_XLIB_LIBXEXT
+        select BR2_PACKAGE_XLIB_LIBX11
+        select BR2_PACKAGE_XLIB_XORGPROTO
+
+if BR2_PACKAGE_LIBGLVND
+
+config BR2_PACKAGE_PROVIDES_LIBGL_HEADERS
+	default "libglvnd"
+
+config BR2_PACKAGE_PROVIDES_LIBGL
+	default "libglvnd"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "libglvnd"
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "libglvnd"
+
+endif
diff --git a/package/libglvnd/libglvnd.hash b/package/libglvnd/libglvnd.hash
new file mode 100644
index 0000000000..9ed61b6e00
--- /dev/null
+++ b/package/libglvnd/libglvnd.hash
@@ -0,0 +1 @@
+sha256  b26c931ff79feced0d1ac69332797a08427308fa85541282ee9995680c880b24 libglvnd-v1.3.1.tar.gz
diff --git a/package/libglvnd/libglvnd.mk b/package/libglvnd/libglvnd.mk
new file mode 100644
index 0000000000..9aa561f6f8
--- /dev/null
+++ b/package/libglvnd/libglvnd.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libglvnd
+#
+################################################################################
+
+LIBGLVND_VERSION = 1.3.1
+LIBGLVND_SOURCE = libglvnd-v$(LIBGLVND_VERSION).tar.gz
+LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/-/archive/v$(LIBGLVND_VERSION)
+LIBGLVND_LICENSE = MIT
+LIBGLVND_LICENSE_FILES = LICENSE
+LIBGLVND_INSTALL_STAGING = YES
+LIBGLVND_PROVIDES = libgl-headers libgl libgles libegl
+LIBGLVND_DEPENDENCIES = \
+  xlib_libX11 \
+  xlib_libXext \
+  xorgproto
+
+$(eval $(meson-package))
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
