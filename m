From: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
Date: Sun, 17 May 2020 22:40:01 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/mesa3d: make it aware of
 libglvnd and support it when present
In-Reply-To: <20200517204003.2187318-1-jskrzypnik@novomatic-tech.com>
References: <20200512132859.15189-1-jskrzypnik@novomatic-tech.com>
 <20200517204003.2187318-1-jskrzypnik@novomatic-tech.com>
Message-ID: <20200517204003.2187318-3-jskrzypnik@novomatic-tech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
---
 package/mesa3d/Config.in | 2 ++
 package/mesa3d/mesa3d.mk | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dd512d9b76..9b3f1546c8 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -442,6 +442,7 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endif # BR2_PACKAGE_MESA3D_DRIVER
 
+if !BR2_PACKAGE_LIBGLVND
 config BR2_PACKAGE_PROVIDES_LIBGL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_GLX
 
@@ -450,6 +451,7 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES
+endif
 
 config BR2_PACKAGE_PROVIDES_LIBOPENCL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENCL
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d1933dabfd..da21870431 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -50,6 +50,8 @@ ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
 MESA3D_DEPENDENCIES += elfutils
 endif
 
+
+
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 # Disable-mangling not yet supported by meson build system.
 # glx:
@@ -275,4 +277,11 @@ else
 MESA3D_CONF_OPTS += -Dzstd=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLVND),y)
+MESA3D_DEPENDENCIES += libglvnd
+MESA3D_CONF_OPTS += -Dglvnd=true
+MESA3D_WITH_GLVND_PROVIDES = $(filter-out libgl libegl libgles,$(MESA3D_PROVIDES))
+MESA3D_PROVIDES := $(MESA3D_WITH_GLVND_PROVIDES)
+endif
+
 $(eval $(meson-package))
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
