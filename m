From: Zygmunt Ptak <zygmuntptak@gmail.com>
Date: Fri, 27 Feb 2015 22:53:53 +0100
Subject: [Buildroot] [PATCH v1 1/4] directfb: bump version to 1.7.7
In-Reply-To: <trinity-852d3963-038d-4f72-af76-b69c57add69c-1425066635930@3capp-gmx-bs23>
References: <trinity-852d3963-038d-4f72-af76-b69c57add69c-1425066635930@3capp-gmx-bs23>
Message-ID: <CAMkMO5kaNLvQV+5RAy4yLSMm3tyRkCWj89N2304DdB9i7gH7rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I saw this thread, and I want share with you my few small changes.
Directfb can be compiled with gles on raspberry pi, by this patches:

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 7759f8f..f8d269f 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -70,6 +70,12 @@ config BR2_PACKAGE_DIRECTFB_EP9X

          http://cirrus.com/en/products/arm9.html

+config BR2_PACKAGE_DIRECTFB_GLES2
+    bool "compile rpi gles2 driver"
+    depends on BR2_arm
+    help
+      Enable GLESv2 in directfb
+
 config BR2_PACKAGE_DIRECTFB_UNICHROME
        bool "compile unichrome graphics driver"
        default y
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index e3dc506..2da9576 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################

-DIRECTFB_VERSION_MAJOR = 1.6
-DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).3
+DIRECTFB_VERSION_MAJOR = 1.7
+DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).7
 DIRECTFB_SITE =
http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPLv2.1+
@@ -13,6 +13,9 @@ DIRECTFB_LICENSE_FILES = COPYING
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_AUTORECONF = YES

+DIRECTFB_CONF_ENV += EGL_LIBS="-lEGL -lGLESv2 -lbcm_host -lvchostif
-L$(STAGING_DIR)/usr/lib"
+DIRECTFB_CONF_ENV += EGL_CFLAGS="-I$(STAGING_DIR)/usr/include/
-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads/
-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
+
 DIRECTFB_CONF_OPTS = \
        --disable-explicit-deps \
        --enable-zlib \
@@ -67,13 +70,15 @@ DIRECTFB_GFX = \
        $(if $(BR2_PACKAGE_DIRECTFB_PXA3XX),pxa3xx) \
        $(if $(BR2_PACKAGE_DIRECTFB_UNICHROME),unichrome) \
        $(if $(BR2_PACKAGE_DIRECTFB_I830),i830) \
-       $(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x)
+       $(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x) \
+       $(if $(BR2_PACKAGE_DIRECTFB_GLES2),gles2)

 ifeq ($(strip $(DIRECTFB_GFX)),)
 DIRECTFB_CONF_OPTS += --with-gfxdrivers=none
 else
 DIRECTFB_CONF_OPTS += \
-       --with-gfxdrivers=$(subst $(space),$(comma),$(strip
$(DIRECTFB_GFX)))
+       --with-gfxdrivers=$(subst $(space),$(comma),$(strip
$(DIRECTFB_GFX))) \
+       --enable-egl
 endif

 DIRECTFB_INPUT = \

I don't know how to better write: DIRECTFB_CONF_ENV here, it's hardcoded.
And also there is needed patch for directfb which will add line
in file: directfb-1.7.7/systems/egl/egl_system.h
with include: #include <bcm_host.h>

Regards
Zygmunt


2015-02-27 20:50 GMT+01:00 Peter Seiderer <ps.report@gmx.net>:

> Hello Peter,
>
> On Thu, Feb 26, 2015 at 10:35:32PM +0100, Peter Korsgaard wrote:
> > >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
> >
> >  > Remove 0003-remove-redefinition-of-__typeof__.patch (the only upstream
> >  > committed patch).
> >
> > Thanks, but please merge the patch bumping the version with the one
> > adding the hash file as well.
> >
>
> O.k., will do...
>
> > Are you sure no other changes are needed? From the NEWS file I see:
> >
> > 1.7.0
> > -----
> > Major new feature:
> >
> > - task-manager (must be enabled explicitly)
> >
> >   The task manager allows to automatically distribute rendering tasks
> over
> >   multiple cpu and/or gpu cores. There is an implementation for the
> generic
> >   (software) driver which can be configured with by setting
> software-cores=<n>
> >   and task-manager options in the directfbrc.
> >
>
> As I understand this, it is a config file/runtime option, no compile time
> option...
>
> > Merged Projects:
> > - DirectFB-extra (missing bits)
> > - SaWMan
> > - FusionDale
> > - FusionSound
> > - DiVine
> > - ++dfb
> >
> > So I was expecting to see an option to enable the task manager support
> > and dropping of the sawman package?
> >
>
> O.k, will check all options, will maybe take some time...
>
> Regards,
> Peter
>
> > --
> > Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150227/88054405/attachment.html>
