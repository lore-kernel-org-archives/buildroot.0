From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Jan 2012 18:04:21 +0100
Subject: [Buildroot] [RFC] Support libraries for TI OMAP and DaVinci DSP
	accelerators
Message-ID: <1327251861-16833-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

This (huge) patch adds the support libraries for OMAP and DaVinci
processors to buildroot.  This is an RFC: there are still a bunch
of FIXMEs and I've only tried it on a DM365.  I post it as one
big patch this time, so it is easier to see the overall structure.

As I said, it is far from ready.  However, it has been sitting in my
repository for more than two months now and I haven't had time to
improve it.  So I thought it would be better to post it now, unfinished,
rather than risking that it becomes unusable.

Now, some explanation why this is so complex.

Normally, the TI stuff is distributed in a Platform Support Package.
That is a 2GB self-extracting executable that contains binaries and
sources of all these packages.  I consider that way too unflexible
for buildroot, so instead I split it up into separate packages.
Most packages are available as plain .tar.gz as well.  A few are
only available as a UPX self-extracting executable - for those,
I still need to find a solution.  For the time being I've extracted
them and put a .tar.gz on the Mind website.

Of all these packages, only two are really interesting.
* ti-dsps-codecs contains the accelerated codecs for H.264, AAC, etc.
  No source is available for them, they are binary-only.
* gst-ti-plugin contains a GStreamer plugin for the accelerated codecs.

There are two more that provide kernel modules + a userspace access
library:
* ti-dsps-dm365mm gives access to the MMU on the DM365
* ti-dsps-linuxutils contains several modules to give access to memory,
  interrupts etc. to communicate with the accelerators.

However, these packages sit on top of many wrappers, that unfortunately
have to be linked in.
* xdctools is the build/configuration system.  I didn't try to actually
  use it as a build system, I only use the runtime configuration
  infrastructure.
* ti-dsps-xdais contains headers to define some structures and
  enumerations.
* ti-dsps-fc is a kernel abstraction layer that provides access to
  the kernel modules in terms of the xdais primitives.
* ti-dsps-codec-engine is an abstraction layer on top of the codecs.

Since none of these packages provides a readily accessible Makefile,
I've created a Makefile.ti that is used for all packages.  It simply
compiles all the source files and puts them in a library.  It also
copies the headers to the staging directory, in a place where the
other packages can find them.

What is still missing before inclusion is possible:
* Config.in files
* Making the target SoC configurable
* Split up into separate patches
* Get rid of the FIXMEs

Thanks for your time :-)

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                                  |    3 +
 package/ti/Config.in                               |    6 +
 package/ti/Makefile.ti                             |   64 +
 ...lugin-0001-Remove-ifdef-Platform_omap3530.patch |  120 ++
 ...02-Remove-XDC-dependency-from-Makefile.am.patch | 1207 ++++++++++++++++++++
 package/ti/gst-ti-plugin/gst-ti-plugin.mk          |   33 +
 .../ti-dsps-codec-engine-001-Add-version.c.patch   |   27 +
 .../ti-dsps-codec-engine/ti-dsps-codec-engine.mk   |   25 +
 package/ti/ti-dsps-codecs/ti-dsps-codecs.mk        |   56 +
 ...m365mm-0001-Fixes-for-Linux-2.6.26-and-up.patch |  122 ++
 package/ti/ti-dsps-dm365mm/ti-dsps-dm365mm.mk      |   18 +
 package/ti/ti-dsps-dmai/Config.in                  |    6 +
 ...emove-dependency-on-VIDIOC_S_YDOFST-ioctl.patch |   74 ++
 package/ti/ti-dsps-dmai/ti-dsps-dmai.mk            |   30 +
 package/ti/ti-dsps-fc/ti-dsps-fc.mk                |   41 +
 package/ti/ti-dsps-linuxutils/Config.in            |    9 +
 ...efinition-of-arm926_dma_map_area-and-its-.patch |   53 +
 ...q-module-add-missing-include-linux-slab.h.patch |   25 +
 .../ti/ti-dsps-linuxutils/ti-dsps-linuxutils.mk    |   53 +
 package/ti/ti-dsps-xdais/ti-dsps-xdais.mk          |   21 +
 package/ti/ti.mk                                   |   92 ++
 package/ti/xdctools/xdctools.mk                    |   28 +
 22 files changed, 2113 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/Config.in
 create mode 100644 package/ti/Makefile.ti
 create mode 100644 package/ti/gst-ti-plugin/gst-ti-plugin-0001-Remove-ifdef-Platform_omap3530.patch
 create mode 100644 package/ti/gst-ti-plugin/gst-ti-plugin-0002-Remove-XDC-dependency-from-Makefile.am.patch
 create mode 100644 package/ti/gst-ti-plugin/gst-ti-plugin.mk
 create mode 100644 package/ti/ti-dsps-codec-engine/ti-dsps-codec-engine-001-Add-version.c.patch
 create mode 100644 package/ti/ti-dsps-codec-engine/ti-dsps-codec-engine.mk
 create mode 100644 package/ti/ti-dsps-codecs/ti-dsps-codecs.mk
 create mode 100644 package/ti/ti-dsps-dm365mm/ti-dsps-dm365mm-0001-Fixes-for-Linux-2.6.26-and-up.patch
 create mode 100644 package/ti/ti-dsps-dm365mm/ti-dsps-dm365mm.mk
 create mode 100644 package/ti/ti-dsps-dmai/Config.in
 create mode 100644 package/ti/ti-dsps-dmai/ti-dsps-dmai-0001-Remove-dependency-on-VIDIOC_S_YDOFST-ioctl.patch
 create mode 100644 package/ti/ti-dsps-dmai/ti-dsps-dmai.mk
 create mode 100644 package/ti/ti-dsps-fc/ti-dsps-fc.mk
 create mode 100644 package/ti/ti-dsps-linuxutils/Config.in
 create mode 100644 package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils-0001-cmemk-add-definition-of-arm926_dma_map_area-and-its-.patch
 create mode 100644 package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils-0002-irq-module-add-missing-include-linux-slab.h.patch
 create mode 100644 package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils.mk
 create mode 100644 package/ti/ti-dsps-xdais/ti-dsps-xdais.mk
 create mode 100644 package/ti/ti.mk
 create mode 100644 package/ti/xdctools/xdctools.mk

diff --git a/package/Config.in b/package/Config.in
index 2e91427..cd8dc65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -575,4 +575,7 @@ source "package/vim/Config.in"
 endif
 endmenu
 
+# TI OMAP and DaVinci utilities
+source "package/ti/Config.in"
+
 endmenu
diff --git a/package/ti/Config.in b/package/ti/Config.in
new file mode 100644
index 0000000..b082d0a
--- /dev/null
+++ b/package/ti/Config.in
@@ -0,0 +1,6 @@
+if BR2_arm || BR2_armeb
+menu "TI OMAP and DaVinci utilities"
+source "package/ti/ti-dsps-linuxutils/Config.in"
+source "package/ti/ti-dsps-dmai/Config.in"
+endmenu
+endif
diff --git a/package/ti/Makefile.ti b/package/ti/Makefile.ti
new file mode 100644
index 0000000..9177d6b
--- /dev/null
+++ b/package/ti/Makefile.ti
@@ -0,0 +1,64 @@
+# TI uses their own custom Makefile infrastructure that is quite difficult
+# to integrate in buildroot.  Therefore, we simply override it with our
+# own Makefile.
+# It should be called with the following variables set:
+# TARGET: basename of the target to make (e.g. foo to build libfoo.a)
+# TARGET_TYPE: 'exe' or 'lib'
+# SRCDIRS (optional, defaults to .): subdirectories where the sources reside
+# HDRDIRS (optional, defaults to SRCDIRS): subdirectories where the headers to install reside
+
+SRCDIRS ?= .
+HDRDIRS ?= SRCDIRS
+
+SOURCES = $(wildcard $(foreach dir,$(SRCDIRS),$(dir)/*.c))
+HEADERS = $(wildcard $(foreach dir,$(HDRDIRS),$(dir)/*.h))
+
+OBJS = $(SOURCES:%.c=%.o)
+
+ifeq ($(TARGET_TYPE),exe)
+
+TARGETFILE = $(TARGET)
+INSTALL_MODE = 0755
+INSTALL_DIR = /usr/bin
+$(TARGETFILE): $(OBJS)
+	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -o $@
+
+else
+ifeq ($(TARGET_TYPE),lib)
+
+TARGETFILE = lib$(TARGET).a
+INSTALL_MODE = 0644
+INSTALL_DIR = /usr/lib
+$(TARGETFILE): $(OBJS)
+	$(AR) $(ARFLAGS) $@ $^
+
+else
+build install clean uninstall:
+	@echo "Makefile.ti should only be used with the TARGET_TYPE variable set to exe or lib."
+	@exit 1
+endif
+endif
+
+build: $(TARGETFILE)
+
+install: $(TARGETFILE)
+	$(INSTALL) -D -m $(INSTALL_MODE) $< $(DESTDIR)$(INSTALL_DIR)/$<
+
+uninstall:
+	$(RM) $(DESTDIR)$(INSTALL_DIR)/$(TARGETFILE)
+
+clean:
+	$(RM) $(TARGETFILE) $(OBJS)
+
+ifneq ($(HEADERS),)
+install: install-headers
+install-headers: $(HEADERS)
+	@echo Installing to $(DESTDIR)/usr/include: $(HEADERS)
+	@for h in $(HEADERS); do \
+		$(INSTALL) -D -m 0644 $$h $(DESTDIR)/usr/include/$$h; \
+	done
+
+uninstall: uninstall-headers
+uninstall-headers:
+	$(RM) $(addprefix $(DESTDIR)/usr/include/,$(HEADERS))
+endif
diff --git a/package/ti/gst-ti-plugin/gst-ti-plugin-0001-Remove-ifdef-Platform_omap3530.patch b/package/ti/gst-ti-plugin/gst-ti-plugin-0001-Remove-ifdef-Platform_omap3530.patch
new file mode 100644
index 0000000..3c829a5
--- /dev/null
+++ b/package/ti/gst-ti-plugin/gst-ti-plugin-0001-Remove-ifdef-Platform_omap3530.patch
@@ -0,0 +1,120 @@
+From 33378d3e5e74edcaf3ae80c54105b8ab8fd53741 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Thu, 8 Dec 2011 14:47:00 +0100
+Subject: [PATCH 1/3] Remove #ifdef Platform_omap3530
+
+r804 | brijesh.singh | 2010-08-26 22:24:26 +0200 (Thu, 26 Aug 2010) | 14 lines
+
+OMAP3530 platform was not supported in DVSDK 1.3 DMAI release and we used this
+platform defined to avoid build time issue while adding OMAP3530 support in
+plugin.
+
+Since plugin has droped support for DVSDK 1.3 hence removing those #ifdef's.
+
+I've test the build on these support DVSDK's:
+
+DM6446 dvsdk_2_00_00_22
+DM365  dvsdk_3_10_00_19
+OMAP3530 dvsdk_3_00_02_44
+OMAPL138 dvsdk_4_00_00_17
+
+[Arnout: modified to patch cleanly against 1.02.00]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/gsttidmaivideosink.c |   12 ------------
+ src/gsttividenc1.c       |    2 --
+ 2 files changed, 0 insertions(+), 14 deletions(-)
+
+diff --git a/src/gsttidmaivideosink.c b/src/gsttidmaivideosink.c
+index 778b8ba..8ac92eb 100644
+--- a/src/gsttidmaivideosink.c
++++ b/src/gsttidmaivideosink.c
+@@ -709,11 +709,9 @@ static int gst_tidmaivideosink_videostd_get_attrs(VideoStd_Type videoStd,
+             vattrs->framerate = 60;
+             break;
+ 
+-        #if defined(Platform_omap3530)
+         case VideoStd_VGA:
+             vattrs->framerate = 60;
+             break;
+-        #endif
+ 
+         default:
+             GST_ERROR("Unknown videoStd entered (VideoStd = %d)\n", videoStd);
+@@ -765,10 +763,8 @@ static int gst_tidmaivideosink_videostd_get_refresh_latency(
+         #endif
+             return 16667;
+ 
+-        #if defined(Platform_omap3530)
+         case VideoStd_VGA:
+             return 16667;
+-        #endif
+ 
+         default:
+             break;
+@@ -1001,10 +997,8 @@ static int gst_tidmaivideosink_convert_attrs(int attr,
+             else if (!strcmp(sink->videoStd, "1080P_60"))
+                 return VideoStd_1080P_60;
+             #endif
+-            #if defined(Platform_omap3530)
+             else if (!strcmp(sink->videoStd, "VGA"))
+                 return VideoStd_VGA;
+-            #endif
+             else {
+                 GST_ERROR("Invalid videoStd entered (%s).  "
+                 "Please choose from:\n"
+@@ -1024,12 +1018,10 @@ static int gst_tidmaivideosink_convert_attrs(int attr,
+                 return Display_Output_COMPOSITE;
+             else if (!strcmp(sink->videoOutput, "COMPONENT"))
+                 return Display_Output_COMPONENT;
+-            #if defined(Platform_omap3530)
+             else if (!strcmp(sink->videoOutput, "DVI"))
+                 return Display_Output_DVI;
+             else if (!strcmp(sink->videoOutput, "LCD"))
+                 return Display_Output_LCD;
+-            #endif
+             else {
+                 GST_ERROR("Invalid videoOutput entered (%s)."
+                     "Please choose from:\n"
+@@ -1076,11 +1068,9 @@ static gboolean gst_tidmaivideosink_set_display_attrs(GstTIDmaiVideoSink *sink,
+         case Cpu_Device_DM6467:
+             sink->dAttrs = Display_Attrs_DM6467_VID_DEFAULT;
+             break;
+-        #if defined(Platform_omap3530)
+         case Cpu_Device_OMAP3530:
+             sink->dAttrs = Display_Attrs_O3530_VID_DEFAULT;
+             break;
+-        #endif
+         #if defined(Platform_dm365)
+         case Cpu_Device_DM365:
+             sink->dAttrs = Display_Attrs_DM365_VID_DEFAULT;
+@@ -1115,12 +1105,10 @@ static gboolean gst_tidmaivideosink_set_display_attrs(GstTIDmaiVideoSink *sink,
+         sink->dAttrs.displayDevice : sink->displayDevice;
+ 
+     /* Set rotation on OMAP35xx */
+-    #if defined(Platform_omap3530)
+     if (sink->cpu_dev == Cpu_Device_OMAP3530) {
+         sink->dAttrs.rotation = sink->rotation == -1 ?
+             sink->dAttrs.rotation : sink->rotation;
+     }
+-    #endif
+ 
+     /* Validate that the inputs the user gave are correct. */
+     if (sink->dAttrs.displayStd == -1) {
+diff --git a/src/gsttividenc1.c b/src/gsttividenc1.c
+index f314db0..90056af 100644
+--- a/src/gsttividenc1.c
++++ b/src/gsttividenc1.c
+@@ -1492,9 +1492,7 @@ static gboolean gst_tividenc1_codec_start (GstTIVidenc1 *videnc1)
+ 
+     /* setup codec parameters depending on device */
+     switch(videnc1->device) {
+-        #if defined(Platform_omap3530)
+         case Cpu_Device_OMAP3530:
+-        #endif
+         case Cpu_Device_DM6446:
+             params.inputChromaFormat = XDM_YUV_422ILE;
+             break;
+-- 
+1.7.7.3
+
diff --git a/package/ti/gst-ti-plugin/gst-ti-plugin-0002-Remove-XDC-dependency-from-Makefile.am.patch b/package/ti/gst-ti-plugin/gst-ti-plugin-0002-Remove-XDC-dependency-from-Makefile.am.patch
new file mode 100644
index 0000000..d465dfc
--- /dev/null
+++ b/package/ti/gst-ti-plugin/gst-ti-plugin-0002-Remove-XDC-dependency-from-Makefile.am.patch
@@ -0,0 +1,1207 @@
+From 450c82eb9028d4133a3db65b22fc163c187e1529 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Mon, 5 Dec 2011 18:26:44 +0100
+Subject: [PATCH 2/3] Remove XDC dependency from Makefile.am
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/Makefile.am              |   22 +-
+ src/gstticodecplugin_dm365.c | 1142 ++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 1149 insertions(+), 15 deletions(-)
+ create mode 100644 src/gstticodecplugin_dm365.c
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index dee7c7d..9b1307e 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,31 +1,23 @@
+ # plugindir is set in configure
++# GST_TI_PLATFORM and LINK_LIBS must be set by caller
+ 
+ XDC_CONFIG_BASENAME = gstticodecplugin_$(GST_TI_PLATFORM)
+ plugin_LTLIBRARIES  = libgstticodecplugin.la
+ 
+ # sources used to compile this plug-in
+-libgstticodecplugin_la_SOURCES = gstticodecplugin.c gsttiauddec1.c gsttividdec2.c gsttiimgenc1.c gsttiimgdec1.c gsttidmaibuffertransport.c gsttidmaibuftab.c gstticircbuffer.c gsttidmaivideosink.c gstticodecs.c gstticodecs_platform.c  gsttiquicktime_aac.c gsttiquicktime_h264.c gsttividenc1.c gsttiaudenc1.c gstticommonutils.c gsttividresize.c gsttidmaiperf.c gsttiquicktime_mpeg4.c 
++libgstticodecplugin_la_SOURCES = gstticodecplugin.c gsttiauddec1.c gsttividdec2.c gsttiimgenc1.c gsttiimgdec1.c gsttidmaibuffertransport.c gsttidmaibuftab.c gstticircbuffer.c gsttidmaivideosink.c gstticodecs.c gstticodecs_platform.c  gsttiquicktime_aac.c gsttiquicktime_h264.c gsttividenc1.c gsttiaudenc1.c gstticommonutils.c gsttividresize.c gsttidmaiperf.c gsttiquicktime_mpeg4.c gstticodecplugin_platform.c
+ 
+ # flags used to compile this plugin
+ # add other _CFLAGS and _LIBS as needed
+-libgstticodecplugin_la_CFLAGS  = $(GST_CFLAGS) $(shell cat $(XDC_CONFIG_BASENAME)/compiler.opt)
++libgstticodecplugin_la_CFLAGS  = $(GST_CFLAGS)
+ libgstticodecplugin_la_LIBADD  = $(GST_LIBS) $(GST_BASE_LIBS) $(GST_PLUGINS_BASE_LIBS) -lgstvideo-0.10 -lgstaudio-0.10 -lm
+-libgstticodecplugin_la_LDFLAGS = $(GST_PLUGIN_LDFLAGS) -Wl,$(XDC_CONFIG_BASENAME)/linker.cmd
++libgstticodecplugin_la_LDFLAGS = $(GST_PLUGIN_LDFLAGS) $(LINK_LIBS)
+ 
+ # headers we need but don't want installed
+ noinst_HEADERS = gsttiauddec1.h gsttividdec2.h gsttiimgenc1.h gsttiimgdec1.h gsttidmaibuffertransport.h gsttidmaibuftab.h gstticircbuffer.h gsttidmaivideosink.h gsttithreadprops.h gstticodecs.h gsttiquicktime_aac.h gsttiquicktime_h264.h gsttividenc1.h gsttiaudenc1.h gstticommonutils.h gsttividresize.h gsttiquicktime_mpeg4.h 
+ 
+-# XDC Configuration
+-CONFIGURO     = $(XDC_INSTALL_DIR)/xs xdc.tools.configuro
+-BUILT_SOURCES = $(XDC_CONFIG_BASENAME)/compiler.opt $(XDC_CONFIG_BASENAME)/linker.cmd
+-XDC_PATH      = .;$(XDC_INSTALL_DIR)/packages;$(LINK_XDC_ROOT);$(FC_INSTALL_DIR)/packages;$(CE_INSTALL_DIR)/packages;$(XDAIS_INSTALL_DIR)/packages;$(CODEC_INSTALL_DIR)/packages;$(CMEM_INSTALL_DIR)/packages;$(DMAI_INSTALL_DIR)/packages;$(LPM_INSTALL_DIR)/packages;$(XDC_USER_PATH);$(EDMA3_LLD_INSTALL_DIR)/packages;
+-
+-gstticodecs_platform.c :
+-	ln -s $(srcdir)/gstticodecs_$(GST_TI_PLATFORM).c gstticodecs_platform.c
+-
+-%/compiler.opt %/linker.cmd : %.cfg
+-	XDCPATH="$(XDC_PATH)" $(CONFIGURO) -c $(MVTOOL_DIR) -o  $(XDC_CONFIG_BASENAME) -t $(XDC_TARGET) -p $(XDC_PLATFORM) -b $(DMAI_INSTALL_DIR)/packages/config.bld $<
++%_platform.c : %_$(GST_TI_PLATFORM).c
++	ln -s $< $@
+ 
+ clean-local:
+-	-rm -rf $(XDC_CONFIG_BASENAME) gstticodecs_platform.c
+-
++	$(RM) gstticodecplugin_platform.c gstticodecs_platform.c
+\ No newline@end of file
+diff --git a/src/gstticodecplugin_dm365.c b/src/gstticodecplugin_dm365.c
+new file mode 100644
+index 0000000..cc6886e
+--- /dev/null
++++ b/src/gstticodecplugin_dm365.c
+@@ -0,0 +1,1142 @@
++/*
++ *  Do not modify this file; it is automatically 
++ *  generated and any modifications will be overwritten.
++ *
++ * @(#) xdc-u17
++ */
++
++#define __nested__
++#define __config__
++
++#include <xdc/std.h>
++
++/*
++ * ======== GENERATED SECTIONS ========
++ *     
++ *     MODULE INCLUDES
++ *     
++ *     <module-name> INTERNALS
++ *     <module-name> INHERITS
++ *     <module-name> VTABLE
++ *     <module-name> PATCH TABLE
++ *     <module-name> DECLARATIONS
++ *     <module-name> OBJECT OFFSETS
++ *     <module-name> TEMPLATES
++ *     <module-name> INITIALIZERS
++ *     <module-name> FUNCTION STUBS
++ *     <module-name> PROXY BODY
++ *     <module-name> OBJECT DESCRIPTOR
++ *     <module-name> SYSTEM FUNCTIONS
++ *     <module-name> PRAGMAS
++ *     
++ *     INITIALIZATION ENTRY POINT
++ *     PROGRAM GLOBALS
++ *     CLINK DIRECTIVES
++ */
++
++
++/*
++ * ======== MODULE INCLUDES ========
++ */
++
++
++
++/*
++ * ======== xdc.cfg.Program TEMPLATE ========
++ */
++
++/*
++ *  ======== __ISA__ ========
++ *  Define the ISA of this executable.  This symbol is used by platform
++ *  specific "exec" commands that support more than one ISA; e.g., gdb
++ */
++xdc__META(__ISA__, "@(#)__ISA__ = v5T");
++
++/*
++ *  ======== __PLAT__ ========
++ *  Define the name of the platform that can run this executable.  This
++ *  symbol is used by platform independent "exec" commands
++ */
++xdc__META(__PLAT__, "@(#)__PLAT__ = ti.platforms.evmDM365");
++
++/*
++ *  ======== __TARG__ ========
++ *  Define the name of the target used to build this executable.
++ */
++xdc__META(__TARG__, "@(#)__TARG__ = gnu.targets.arm.GCArmv5T");
++
++
++/*
++ * ======== ti.sdo.ce.ipc.Settings TEMPLATE ========
++ */
++
++
++/*
++ * ======== ti.sdo.ce.osal.Global TEMPLATE ========
++ */
++
++
++
++/*
++ *  ======== Global Configuration ========
++ *  Do not modify the following; it is automatically generated from the template
++ *  Server.xdt in the ti.sdo.ce package and will be overwritten next time the
++ *  executable is configured
++ */
++#include <ti/sdo/ce/osal/Log.h>
++
++Log_Handle ti_sdo_ce_dvtLog = NULL; 
++
++Bool Memory_skipVirtualAddressTranslation = FALSE;
++
++
++/* List of all packages and their versions and paths, for diagnostics */
++String Global_buildInfo[] = {
++    "    buildroot manual configuration",
++    NULL
++};
++
++/*
++ * ======== ti.sdo.ce.Engine TEMPLATE ========
++ */
++
++/*
++ *  ======== Engine Configuration ========
++ *  Do not modify following; it is automatically generated from the template
++ *  Engine.xdt in the ti.sdo.ce package and will be overwritten next time the
++ *  executable is configured
++ */
++#include <ti/sdo/ce/Engine.h>
++#include <ti/xdais/ialg.h>
++
++#include <ti/xdais/idma3.h>
++
++#include <ti/xdais/ires.h>
++
++/* type tables for algorithms */
++extern IALG_Fxns MPEG2VDEC_TI_IMPEG2VDEC;
++static String typeTab_MPEG2VDEC_TI_IMPEG2VDEC[] = {
++    "ti.sdo.ce.video2.IVIDDEC2",
++    NULL
++};
++
++extern IALG_Fxns MPEG2VENC_TI_IMPEG2VENC;
++static String typeTab_MPEG2VENC_TI_IMPEG2VENC[] = {
++    "ti.sdo.ce.video1.IVIDENC1",
++    NULL
++};
++
++extern IALG_Fxns H264VENC_TI_IH264VENC;
++static String typeTab_H264VENC_TI_IH264VENC[] = {
++    "ti.sdo.ce.video1.IVIDENC1",
++    NULL
++};
++
++extern IALG_Fxns JPEGDEC_TI_IJPEGDEC;
++static String typeTab_JPEGDEC_TI_IJPEGDEC[] = {
++    "ti.sdo.ce.image1.IIMGDEC1",
++    NULL
++};
++
++extern IALG_Fxns JPEGENC_TI_IJPEGENC;
++static String typeTab_JPEGENC_TI_IJPEGENC[] = {
++    "ti.sdo.ce.image1.IIMGENC1",
++    NULL
++};
++
++extern IALG_Fxns EAACPLUSENCODER_ITTIAM_IEAACPLUSENCODER;
++static String typeTab_EAACPLUSENCODER_ITTIAM_IEAACPLUSENCODER[] = {
++    "ti.sdo.ce.audio1.IAUDENC1",
++    NULL
++};
++
++extern IALG_Fxns H264VDEC_TI_IH264VDEC;
++static String typeTab_H264VDEC_TI_IH264VDEC[] = {
++    "ti.sdo.ce.video2.IVIDDEC2",
++    NULL
++};
++
++extern IALG_Fxns ENHAACPDECODER_ITTIAM_IENHAACPDECODER;
++static String typeTab_ENHAACPDECODER_ITTIAM_IENHAACPDECODER[] = {
++    "ti.sdo.ce.audio1.IAUDDEC1",
++    NULL
++};
++
++extern IALG_Fxns MPEG4VDEC_TI_IMPEG4VDEC;
++static String typeTab_MPEG4VDEC_TI_IMPEG4VDEC[] = {
++    "ti.sdo.ce.video2.IVIDDEC2",
++    NULL
++};
++
++extern IALG_Fxns MPEG4VENC_TI_IMPEG4VENC;
++static String typeTab_MPEG4VENC_TI_IMPEG4VENC[] = {
++    "ti.sdo.ce.video1.IVIDENC1",
++    NULL
++};
++
++
++/* tables of engine algorithms */
++extern IALG_Fxns MPEG4VDEC_TI_IMPEG4VDEC;
++extern IRES_Fxns MPEG4VDEC_TI_IRES;
++extern IALG_Fxns MPEG2VDEC_TI_IMPEG2VDEC;
++extern IRES_Fxns MPEG2VDEC_TI_IRES;
++extern IALG_Fxns H264VDEC_TI_IH264VDEC;
++extern IRES_Fxns H264VDEC_TI_IRES;
++extern IALG_Fxns ENHAACPDECODER_ITTIAM_IENHAACPDECODER;
++extern IRES_Fxns AUDCDC_ITTIAM_IRES;
++extern IALG_Fxns JPEGDEC_TI_IJPEGDEC;
++extern IRES_Fxns JPEGDEC_TI_IRES;
++extern IALG_Fxns MPEG4VENC_TI_IMPEG4VENC;
++extern IRES_Fxns MPEG4VENC_TI_IRES;
++extern IALG_Fxns MPEG2VENC_TI_IMPEG2VENC;
++extern IRES_Fxns MPEG2VENC_TI_IRES;
++extern IALG_Fxns H264VENC_TI_IH264VENC;
++extern IRES_Fxns H264VENC_TI_IRES;
++extern IALG_Fxns EAACPLUSENCODER_ITTIAM_IEAACPLUSENCODER;
++extern IRES_Fxns AUDCDC_ITTIAM_IRES;
++extern IALG_Fxns JPEGENC_TI_IJPEGENC;
++extern IRES_Fxns JPEGENC_TI_IRES;
++
++/* algorithm-specific stub/skeleton config data objects */
++extern struct ti_sdo_codecs_mpeg4dec_hdvicp_ce_MPEG4DEC_HDVICP_CodecClassConfig ti_sdo_codecs_mpeg4dec_hdvicp_ce_MPEG4DEC_HDVICP_codecClassConfig;
++extern struct ti_sdo_codecs_mpeg2dec_ce_MPEG2DEC_CodecClassConfig ti_sdo_codecs_mpeg2dec_ce_MPEG2DEC_codecClassConfig;
++extern struct ti_sdo_codecs_h264dec_ce_H264DEC_CodecClassConfig ti_sdo_codecs_h264dec_ce_H264DEC_codecClassConfig;
++extern struct ti_sdo_codecs_jpegdec_ce_JPEGDEC_CodecClassConfig ti_sdo_codecs_jpegdec_ce_JPEGDEC_codecClassConfig;
++extern struct ti_sdo_codecs_mpeg4enc_hdvicp_ce_MPEG4ENC_HDVICP_CodecClassConfig ti_sdo_codecs_mpeg4enc_hdvicp_ce_MPEG4ENC_HDVICP_codecClassConfig;
++extern struct ti_sdo_codecs_mpeg2enc_ce_MPEG2ENC_CodecClassConfig ti_sdo_codecs_mpeg2enc_ce_MPEG2ENC_codecClassConfig;
++extern struct ti_sdo_codecs_h264enc_ce_H264ENC_CodecClassConfig ti_sdo_codecs_h264enc_ce_H264ENC_codecClassConfig;
++extern struct ti_sdo_codecs_jpegenc_ce_JPEGENC_CodecClassConfig ti_sdo_codecs_jpegenc_ce_JPEGENC_codecClassConfig;
++
++static Engine_AlgDesc engineAlgs0[] = {
++    {
++        "mpeg4dec",       /* name */
++        {2798854612U},   /* uuid */
++        &MPEG4VDEC_TI_IMPEG4VDEC,             /* fxns */
++        NULL,        /* idma3Fxns */
++        typeTab_MPEG4VDEC_TI_IMPEG4VDEC,              /* typeTab */
++        TRUE,          /* isLocal */
++        0,        /* groupId */
++        0,      /* protocol */
++        &MPEG4VDEC_TI_IRES,         /* iresFxns */
++        &ti_sdo_codecs_mpeg4dec_hdvicp_ce_MPEG4DEC_HDVICP_codecClassConfig, /* stub/skel config params */
++        Engine_USECACHEDMEM_DEFAULT,    /* memType */
++        "ti.sdo.ce.video2.IVIDDEC2",
++    },
++    {
++        "mpeg2dec",       /* name */
++        {2974277761U},   /* uuid */
++        &MPEG2VDEC_TI_IMPEG2VDEC,             /* fxns */
++        NULL,        /* idma3Fxns */
++        typeTab_MPEG2VDEC_TI_IMPEG2VDEC,              /* typeTab */
++        TRUE,          /* isLocal */
++        2,        /* groupId */
++        0,      /* protocol */
++        &MPEG2VDEC_TI_IRES,         /* iresFxns */
++        &ti_sdo_codecs_mpeg2dec_ce_MPEG2DEC_codecClassConfig, /* stub/skel config params */
++        Engine_USECACHEDMEM_DEFAULT,    /* memType */
++        "ti.sdo.ce.video2.IVIDDEC2",
++    },
++    {
++        "h264dec",       /* name */
++        {2701911697U},   /* uuid */
++        &H264VDEC_TI_IH264VDEC,             /* fxns */
++        NULL,        /* idma3Fxns */
++        typeTab_H264VDEC_TI_IH264VDEC,              /* typeTab */
++        TRUE,          /* isLocal */
++        3,        /* groupId */
++        0,      /* protocol */
++        &H264VDEC_TI_IRES,         /* iresFxns */
++        &ti_sdo_codecs_h264dec_ce_H264DEC_codecClassConfig, /* stub/skel config params */
++        Engine_USECACHEDMEM_DEFAULT,    /* memType */
++        "ti.sdo.ce.video2.IVIDDEC2",
++    },
++    {
++        "aacdec",       /* name */
++        {1705744497U},   /* uuid */
++        &ENHAACPDECODER_ITTIAM_IENHAACPDECODER,             /* fxns */
++        NULL,        /* idma3Fxns */
++        typeTab_ENHAACPDECODER_ITTIAM_IENHAACPDECODER,              /* typeTab */
++        TRUE,          /* isLocal */
++        1,        /* groupId */
++        1,      /* protocol */
++        &AUDCDC_ITTIAM_IRES,         /* iresFxns */
++        NULL,               /* stub/skel config params  */
++        Engine_USECACHEDMEM_CACHED,    /* memType */
++        "ti.sdo.ce.audio1.IAUDDEC1",
++    },
++    {
++        "jpegdec",       /* name */
++        {1183555817U},   /* uuid */
++        &JPEGDEC_TI_IJPEGDEC,             /* fxns */
++        NULL,        /* idma3Fxns */
++        typeTab_JPEGDEC_TI_IJPEGDEC,              /* typeTab */
++        TRUE,          /* isLocal */
++        1,        /* groupId */
++        1,      /* protocol */
++        &JPEGDEC_TI_IRES,         /* iresFxns */
++        &ti_sdo_codecs_jpegdec_ce_JPEGDEC_codecClassConfig, /* stub/skel config params */
++        Engine_USECACHEDMEM_DEFAULT,    /* memType */
++        "ti.sdo.ce.image1.IIMGDEC1",
++    },
++    {
++        "mpeg4enc",       /* name */
++        {2805129948U},   /* uuid */
++        &MPEG4VENC_TI_IMPEG4VENC,             /* fxns */
++        NULL,        /* idma3Fxns */
++        typeTab_MPEG4VENC_TI_IMPEG4VENC,              /* typeTab */
++        TRUE,          /* isLocal */
++        4,        /* groupId */
++        0,      /* protocol */
++        &MPEG4VENC_TI_IRES,         /* iresFxns */
++        &ti_sdo_codecs_mpeg4enc_hdvicp_ce_MPEG4ENC_HDVICP_codecClassConfig, /* stub/skel config params */
++        Engine_USECACHEDMEM_DEFAULT,    /* memType */
++        "ti.sdo.ce.video1.IVIDENC1",
++    },
++    {
++        "mpeg2enc",       /* name */
++        {2779951992U},   /* uuid */
++        &MPEG2VENC_TI_IMPEG2VENC,             /* fxns */
++        NULL,        /* idma3Fxns */
++        typeTab_MPEG2VENC_TI_IMPEG2VENC,              /* typeTab */
++        TRUE,          /* isLocal */
++        5,        /* groupId */
++        0,      /* protocol */
++        &MPEG2VENC_TI_IRES,         /* iresFxns */
++        &ti_sdo_codecs_mpeg2enc_ce_MPEG2ENC_codecClassConfig, /* stub/skel config params */
++        Engine_USECACHEDMEM_DEFAULT,    /* memType */
++        "ti.sdo.ce.video1.IVIDENC1",
++    },
++    {
++        "h264enc",       /* name */
++        {972753848U},   /* uuid */
++        &H264VENC_TI_IH264VENC,             /* fxns */
++        NULL,        /* idma3Fxns */
++        typeTab_H264VENC_TI_IH264VENC,              /* typeTab */
++        TRUE,          /* isLocal */
++        6,        /* groupId */
++        0,      /* protocol */
++        &H264VENC_TI_IRES,         /* iresFxns */
++        &ti_sdo_codecs_h264enc_ce_H264ENC_codecClassConfig, /* stub/skel config params */
++        Engine_USECACHEDMEM_DEFAULT,    /* memType */
++        "ti.sdo.ce.video1.IVIDENC1",
++    },
++    {
++        "aaclcenc",       /* name */
++        {3082345429U},   /* uuid */
++        &EAACPLUSENCODER_ITTIAM_IEAACPLUSENCODER,             /* fxns */
++        NULL,        /* idma3Fxns */
++        typeTab_EAACPLUSENCODER_ITTIAM_IEAACPLUSENCODER,              /* typeTab */
++        TRUE,          /* isLocal */
++        1,        /* groupId */
++        1,      /* protocol */
++        &AUDCDC_ITTIAM_IRES,         /* iresFxns */
++        NULL,               /* stub/skel config params  */
++        Engine_USECACHEDMEM_CACHED,    /* memType */
++        "ti.sdo.ce.audio1.IAUDENC1",
++    },
++    {
++        "jpegenc",       /* name */
++        {3732622784U},   /* uuid */
++        &JPEGENC_TI_IJPEGENC,             /* fxns */
++        NULL,        /* idma3Fxns */
++        typeTab_JPEGENC_TI_IJPEGENC,              /* typeTab */
++        TRUE,          /* isLocal */
++        1,        /* groupId */
++        1,      /* protocol */
++        &JPEGENC_TI_IRES,         /* iresFxns */
++        &ti_sdo_codecs_jpegenc_ce_JPEGENC_codecClassConfig, /* stub/skel config params */
++        Engine_USECACHEDMEM_DEFAULT,    /* memType */
++        "ti.sdo.ce.image1.IIMGENC1",
++    },
++    {NULL},
++};
++static Engine_AlgDesc engineAlgs1[] = {
++    {NULL},
++};
++
++/* table of all engines available in this application */
++static Engine_Desc engineTab[] = {
++    {"codecServer",	/* engine name */
++      engineAlgs0,	/* alg table */
++      NULL,		/* (optional) server name */
++      NULL,        /* (optional) Link config ID */
++      10 /* number of algs in alg table */
++    },
++    {"local",	/* engine name */
++      engineAlgs1,	/* alg table */
++      NULL,		/* (optional) server name */
++      NULL,        /* (optional) Link config ID */
++      0 /* number of algs in alg table */
++    },
++    {NULL, NULL, NULL, 0}	/* NULL-terminate the engine table */
++};
++
++Engine_Config Engine_config = {
++    engineTab,		    /* table of all engines */
++    "local"   /* local RMS engine name */
++};
++
++Bool ti_sdo_ce_Engine_noCommName = FALSE;
++
++/*
++ * ======== ti.sdo.ce.CERuntime TEMPLATE ========
++ */
++
++
++#include <ti/sdo/ce/osal/Global.h>
++#include <ti/sdo/ce/ipc/Comm.h>
++#include <ti/sdo/ce/osal/Memory.h>
++#include <ti/sdo/ce/osal/Queue.h>
++#include <ti/sdo/ce/osal/Sem.h>
++#include <ti/sdo/ce/osal/SemMP.h>
++#include <ti/sdo/ce/osal/Thread.h>
++#include <ti/sdo/ce/ipc/Processor.h>
++#include <ti/sdo/ce/alg/Algorithm.h>
++#include <ti/sdo/ce/osal/Lock.h>
++#include <ti/sdo/ce/osal/LockMP.h>
++#include <ti/sdo/ce/Server.h>
++#include <ti/sdo/ce/Engine.h>
++#include <ti/sdo/ce/rms.h>
++#include <ti/sdo/ce/utils/xdm/XdmUtils.h>
++
++#include <ti/sdo/utils/trace/gt.h>
++
++/* This symbol is referenced by Server_init() */
++Int Global_useLinkArbiter = FALSE;
++
++/*
++ *  ======== CERuntime_init ========
++ */
++Void CERuntime_init(Void)
++{
++
++    GT_init();
++
++
++    /* if CE_DEBUG is set, turn on tracing and DSP auto trace collection */
++    if (Global_getenv("CE_DEBUG") != NULL) {
++        extern Bool   Engine_alwaysCollectDspTrace;
++        extern String Engine_ceDebugDspTraceMask;
++
++        Engine_alwaysCollectDspTrace = TRUE;
++
++
++
++        if (Global_getenv("CE_DEBUG")[0] == '1') {
++            GT_set("*+67,CE-3,GT_time=0,GT_prefix=1235");
++            Engine_ceDebugDspTraceMask = "*+67,GT_prefix=1235,GT_time=3";
++        }
++        else if (Global_getenv("CE_DEBUG")[0] == '2') {
++            GT_set(
++                "*+01234567,CE-3,ti.sdo.ce.osal.SemMP=67,OG=467,OM=4567,OC=67,GT_time=0,GT_prefix=1235");
++            Engine_ceDebugDspTraceMask =
++                "*+01234567,CR=67,ti.sdo.fc.dman3-2,ti.sdo.fc.dskt2-2,GT_prefix=1235,GT_time=3";
++        } else {
++            GT_set("*+01234567,CE-3,GT_time=0,GT_prefix=12345");
++            Engine_ceDebugDspTraceMask = "*+01234567,GT_prefix=12345,GT_time=3";
++        }
++    }
++
++    if (Global_getenv("CE_CHECK") != NULL) {
++        extern Bool VISA_checked;
++
++        /*
++         * Currently just change _this_ processor's value... perhaps we should
++         * enable remote processors as well?
++         */
++        if (Global_getenv("CE_CHECK")[0] == '1') {
++            VISA_checked = TRUE;
++            /* turn on all GT_7CLASS trace (errors) */
++            GT_set("*+7");
++        } else if (Global_getenv("CE_CHECK")[0] == '0') {
++            VISA_checked = FALSE;
++        } else {
++            /* leave it whatever it was... maybe we should drop a warning? */
++        }
++    }
++
++    /* allow user to over-ride via CE_TRACE. */
++    GT_set(Global_getenv("CE_TRACE"));
++    Global_init();
++
++    Sem_init();
++    SemMP_init();
++
++
++    Memory_init();
++    Queue_init();
++    Comm_init();
++    Thread_init();
++    Processor_init();
++    LockMP_init();  /* Must be called before DMAN3_init() */
++    Algorithm_init();
++    XdmUtils_init();
++    Lock_init();
++
++    Engine_init();
++    Server_init();
++
++}
++
++/*
++ *  ======== CERuntime_exit ========
++ */
++Void CERuntime_exit(Void)
++{
++    Global_exit();
++}
++
++/* for backward compatibility with xdc-m based tools */
++Void ti_sdo_ce_CERuntime_init__F(Void) {
++    CERuntime_init();
++}
++
++/*
++ * ======== ti.sdo.ce.Settings TEMPLATE ========
++ */
++
++/*
++ *  ======== ti.sdo.ce Settings Configuration ========
++ *  Do not modify following; it is automatically generated from the template
++ *  Settings.xdt in the ti.sdo.ce package and will be overwritten next time the
++ *  executable is configured
++ */
++Bool VISA_checked = FALSE;
++
++/*
++ * ======== ti.sdo.ce.video2.VIDDEC2Config TEMPLATE ========
++ */
++
++
++/* this data structure has codec-specific names and values, but class-specific
++ * fields -- it's indentical to struct IVIDDEC2_CodecClassConfig from viddec2.h.
++ * Its name doesn't matter, only that the address of data is captured in the
++ * "codecClassConfig" field of the algorithm description
++ */    
++struct ti_sdo_codecs_mpeg4dec_hdvicp_ce_MPEG4DEC_HDVICP_CodecClassConfig {
++    Bool manageInBufsCache     [ XDM_MAX_IO_BUFFERS ];  
++    Bool manageOutBufsCache    [ XDM_MAX_IO_BUFFERS ];  
++} ti_sdo_codecs_mpeg4dec_hdvicp_ce_MPEG4DEC_HDVICP_codecClassConfig = {
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE},
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE}
++};
++/* this data structure has codec-specific names and values, but class-specific
++ * fields -- it's indentical to struct IVIDDEC2_CodecClassConfig from viddec2.h.
++ * Its name doesn't matter, only that the address of data is captured in the
++ * "codecClassConfig" field of the algorithm description
++ */    
++struct ti_sdo_codecs_mpeg2dec_ce_MPEG2DEC_CodecClassConfig {
++    Bool manageInBufsCache     [ XDM_MAX_IO_BUFFERS ];  
++    Bool manageOutBufsCache    [ XDM_MAX_IO_BUFFERS ];  
++} ti_sdo_codecs_mpeg2dec_ce_MPEG2DEC_codecClassConfig = {
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE},
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE}
++};
++/* this data structure has codec-specific names and values, but class-specific
++ * fields -- it's indentical to struct IVIDDEC2_CodecClassConfig from viddec2.h.
++ * Its name doesn't matter, only that the address of data is captured in the
++ * "codecClassConfig" field of the algorithm description
++ */    
++struct ti_sdo_codecs_h264dec_ce_H264DEC_CodecClassConfig {
++    Bool manageInBufsCache     [ XDM_MAX_IO_BUFFERS ];  
++    Bool manageOutBufsCache    [ XDM_MAX_IO_BUFFERS ];  
++} ti_sdo_codecs_h264dec_ce_H264DEC_codecClassConfig = {
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE},
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE}
++};
++
++/*
++ * ======== ti.sdo.ce.image1.IMGDEC1Config TEMPLATE ========
++ */
++
++
++/*
++ * This data structure has codec-specific names and values, but class-specific
++ * fields -- it's indentical to struct IIMGDEC1_CodecClassConfig from imgdec1.h.
++ * Its name doesn't matter, only that the address of data is captured in the
++ * "codecClassConfig" field of the algorithm description
++ */    
++struct ti_sdo_codecs_jpegdec_ce_JPEGDEC_CodecClassConfig {
++    Bool manageInBufsCache   [ XDM_MAX_IO_BUFFERS ];  
++    Bool manageOutBufsCache  [ XDM_MAX_IO_BUFFERS ];  
++} ti_sdo_codecs_jpegdec_ce_JPEGDEC_codecClassConfig = {
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE},
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE}
++};
++
++/*
++ * ======== ti.sdo.ce.image1.IMGENC1Config TEMPLATE ========
++ */
++
++
++/* this data structure has codec-specific names and values, but class-specific
++ * fields -- it's indentical to struct IIMGENC1_CodecClassConfig from imgecn1.h.
++ * Its name doesn't matter, only that the address of data is captured in the
++ * "codecClassConfig" field of the algorithm description
++ */    
++struct ti_sdo_codecs_jpegenc_ce_JPEGENC_CodecClassConfig {
++    Bool manageInBufsCache   [ XDM_MAX_IO_BUFFERS ];  
++    Bool manageOutBufsCache  [ XDM_MAX_IO_BUFFERS ];  
++} ti_sdo_codecs_jpegenc_ce_JPEGENC_codecClassConfig = {
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE},
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE}
++};
++
++/*
++ * ======== ti.sdo.ce.video1.VIDENC1Config TEMPLATE ========
++ */
++
++
++/* this data structure has codec-specific names and values, but class-specific
++ * fields -- it's indentical to struct IVIDENC1_CodecClassConfig from videnc1.h.
++ * Its name doesn't matter, only that the address of data is captured in the
++ * "codecClassConfig" field of the algorithm description
++ */    
++struct ti_sdo_codecs_mpeg2enc_ce_MPEG2ENC_CodecClassConfig {
++    Bool manageInBufsCache   [ XDM_MAX_IO_BUFFERS ];  
++    Bool manageOutBufsCache  [ XDM_MAX_IO_BUFFERS ];  
++} ti_sdo_codecs_mpeg2enc_ce_MPEG2ENC_codecClassConfig = {
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE},
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE}
++};
++/* this data structure has codec-specific names and values, but class-specific
++ * fields -- it's indentical to struct IVIDENC1_CodecClassConfig from videnc1.h.
++ * Its name doesn't matter, only that the address of data is captured in the
++ * "codecClassConfig" field of the algorithm description
++ */    
++struct ti_sdo_codecs_mpeg4enc_hdvicp_ce_MPEG4ENC_HDVICP_CodecClassConfig {
++    Bool manageInBufsCache   [ XDM_MAX_IO_BUFFERS ];  
++    Bool manageOutBufsCache  [ XDM_MAX_IO_BUFFERS ];  
++} ti_sdo_codecs_mpeg4enc_hdvicp_ce_MPEG4ENC_HDVICP_codecClassConfig = {
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE},
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE}
++};
++/* this data structure has codec-specific names and values, but class-specific
++ * fields -- it's indentical to struct IVIDENC1_CodecClassConfig from videnc1.h.
++ * Its name doesn't matter, only that the address of data is captured in the
++ * "codecClassConfig" field of the algorithm description
++ */    
++struct ti_sdo_codecs_h264enc_ce_H264ENC_CodecClassConfig {
++    Bool manageInBufsCache   [ XDM_MAX_IO_BUFFERS ];  
++    Bool manageOutBufsCache  [ XDM_MAX_IO_BUFFERS ];  
++} ti_sdo_codecs_h264enc_ce_H264ENC_codecClassConfig = {
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE},
++    {TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE}
++};
++
++/*
++ * ======== ti.sdo.ce.video1.VIDDEC1Config TEMPLATE ========
++ */
++
++
++
++/*
++ * ======== ti.sdo.ce.alg.Settings TEMPLATE ========
++ */
++
++unsigned int ti_sdo_ce_alg_ALG_useHeap = FALSE;
++unsigned int ti_sdo_ce_alg_ALG_useCache = FALSE;
++
++unsigned int ti_sdo_ce_alg_ALG_maxGroups = 20; 
++
++UInt32 ti_sdo_ce_alg_ipcKey = 0x4f474c41;
++
++int _ALG_groupUsed[20] = {
++     1,
++     1,
++     1,
++     1,
++     1,
++     1,
++     1,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++};
++
++#include <ti/sdo/ce/osal/SemMP.h>
++#include <ti/xdais/ialg.h>
++
++SemMP_Handle _ALG_sems[20];
++int _ALG_groupRefCount[20] = {
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++     0,
++};
++
++IALG_Handle _Algorithm_lockOwner[20] = {
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++     NULL,
++};
++
++// No IDMA3 using algs in the system, and DMAN3 is not configured into the
++// system.  Stub out these fxn calls.
++Void DMAN3_CE_init()
++{
++}
++Void DMAN3_CE_exit()
++{
++}
++
++int DMAN3_grantDmaChannels(int groupId, void *algHandles, void *dmaFxns,
++        int numAlgs)
++{
++    /* TODO:M  Should assert(false) here.  Should never be called */
++    return (0);
++}
++
++int DMAN3_releaseDmaChannels(void *algHandles, void * dmaFxns, int numAlgs)
++{
++    /* TODO:M  Should assert(false) here.  Should never be called */
++    return (0);
++}
++
++
++/*
++ * ======== ti.sdo.ce.video.VIDENCConfig TEMPLATE ========
++ */
++
++
++
++/*
++ * ======== ti.sdo.ce.video.VIDDECConfig TEMPLATE ========
++ */
++
++
++
++/*
++ * ======== ti.sdo.ce.image.IMGDECConfig TEMPLATE ========
++ */
++
++
++
++/*
++ * ======== ti.sdo.ce.image.IMGENCConfig TEMPLATE ========
++ */
++
++
++
++/*
++ * ======== ti.sdo.fc.rman.RMAN TEMPLATE ========
++ */
++
++/* C code contribution from ti/sdo/fc/rman/RMAN.xdt */
++ 
++#include <ti/sdo/fc/rman/rman.h>
++
++
++        /* declaration of user-supplied RMAN.persistentAllocFxn */
++        extern Bool _ALG_allocMemory(IALG_MemRec *memTab, Int numRecs);
++        extern Void _ALG_freeMemory(IALG_MemRec *memTab, Int numRecs);
++
++/* Table of user-configured size to store the registration entries */ 
++__FAR__ IRESMAN_Fxns * RMAN_TABLE[11];
++
++/* Table of user-configured size to store the freed entries */ 
++__FAR__ short RMAN_FREE_ENTRIES[11];
++
++/*
++ * Number of entries statically configured for the Resource Registry table
++ */
++__FAR__ short RMAN_numRegistryEntries  = 0;
++ 
++/*
++ * Static configuration entries for the table
++ */
++__FAR__ IRESMAN_Fxns ** RMAN_registryEntries = NULL;
++ 
++/*
++ * Initialization arguments for the entries to be registered
++ */
++__FAR__ IRESMAN_Params ** RMAN_registryResmanArgs = NULL;
++
++/*
++ *   ========== RMAN_PARAMS ===========
++ *   Module configuration for RMAN implementation
++ *   It is set at design time by system integrator to adjust the behavior of 
++ *   module to be optimal for its execution environment
++ */
++RMAN_Params RMAN_PARAMS = {
++ 
++    /* size of the registry table */ 
++    11,
++
++    /* persistentAllocFxn */
++    _ALG_allocMemory,
++ 
++    /* persistentFreeFxn */
++    _ALG_freeMemory,
++  
++    /* yieldFxn */
++    NULL,
++
++    /* flag indicating if yield to same priority is allowed */
++    FALSE,
++};
++
++extern IRESMAN_Fxns * HDVICP_getIresmanFxns();
++extern IRESMAN_Params * HDVICP_getDefaultParams();
++extern IRESMAN_Fxns * VICP2_getIresmanFxns();
++extern IRESMAN_Params * VICP2_getDefaultParams();
++extern IRESMAN_Fxns * EDMA3CHAN_getIresmanFxns();
++extern IRESMAN_Params * EDMA3CHAN_getDefaultParams();
++extern IRESMAN_Fxns * ADDRSPACE_getIresmanFxns();
++extern IRESMAN_Params * ADDRSPACE_getDefaultParams();
++extern IRESMAN_Fxns * MEMTCM_getIresmanFxns();
++extern IRESMAN_Params * MEMTCM_getDefaultParams();
++extern IRESMAN_Fxns * GROUPUTILS_getIresmanFxns();
++extern IRESMAN_Params * GROUPUTILS_getDefaultParams();
++
++
++static __FAR__ IRESMAN_Fxns * _entries[6 + 1];
++static __FAR__ IRESMAN_Params * _params[6 + 1];
++
++IRES_Status RMAN_autoRegister()
++{
++    /* Populate the RMAN_registryEntries etc tables, to be able to do 
++       static registration of these arguments */ 
++    IRES_Status status = IRES_OK;
++    
++    RMAN_numRegistryEntries = 6;
++
++
++    _entries[0] = HDVICP_getIresmanFxns(); 
++    _params[0] = HDVICP_getDefaultParams(); 
++
++    _params[0]->allocFxn = RMAN_PARAMS.allocFxn;
++    _params[0]->freeFxn = RMAN_PARAMS.freeFxn;
++
++
++    _entries[1] = VICP2_getIresmanFxns(); 
++    _params[1] = VICP2_getDefaultParams(); 
++
++    _params[1]->allocFxn = RMAN_PARAMS.allocFxn;
++    _params[1]->freeFxn = RMAN_PARAMS.freeFxn;
++
++
++    _entries[2] = EDMA3CHAN_getIresmanFxns(); 
++    _params[2] = EDMA3CHAN_getDefaultParams(); 
++
++    _params[2]->allocFxn = RMAN_PARAMS.allocFxn;
++    _params[2]->freeFxn = RMAN_PARAMS.freeFxn;
++
++
++    _entries[3] = ADDRSPACE_getIresmanFxns(); 
++    _params[3] = ADDRSPACE_getDefaultParams(); 
++
++    _params[3]->allocFxn = RMAN_PARAMS.allocFxn;
++    _params[3]->freeFxn = RMAN_PARAMS.freeFxn;
++
++
++    _entries[4] = MEMTCM_getIresmanFxns(); 
++    _params[4] = MEMTCM_getDefaultParams(); 
++
++    _params[4]->allocFxn = RMAN_PARAMS.allocFxn;
++    _params[4]->freeFxn = RMAN_PARAMS.freeFxn;
++
++
++    _entries[5] = GROUPUTILS_getIresmanFxns(); 
++    _params[5] = GROUPUTILS_getDefaultParams(); 
++
++    _params[5]->allocFxn = RMAN_PARAMS.allocFxn;
++    _params[5]->freeFxn = RMAN_PARAMS.freeFxn;
++
++
++    RMAN_registryEntries = (IRESMAN_Fxns **)(&_entries);
++    RMAN_registryResmanArgs = (IRESMAN_Params **)(&_params);
++
++    return (status);
++}
++
++/*
++ * ======== ti.sdo.fc.vicpsync.VICPSYNC TEMPLATE ========
++ */
++
++ 
++
++/* Device is TMS320DM365 */
++Bool _VICPSYNC_dm355 = 0; 
++Bool _VICPSYNC_dm365 = 1; 
++
++/*
++ * ======== ti.sdo.fc.edma3.Settings TEMPLATE ========
++ */
++
++
++
++/* C code contribution from ti/sdo/fc/edma3/Settings.xdt */
++
++__FAR__ Uns ti_sdo_fc_edma3_EDMA3_physicalId = 0;
++
++
++#include <xdc/std.h>
++#include <ti/sdo/fc/rman/rman.h>
++#include <ti/sdo/fc/edma3/edma3_config.h>
++
++/*
++ * Declare alloc/Free functions before using them
++ */
++extern Bool _ALG_allocMemory(IALG_MemRec *memTab, Int numRecs);
++extern Void _ALG_freeMemory(IALG_MemRec *memTab, Int numRecs);
++
++/*
++ *  ======== EDMA3_PARAMS ========
++ *  EDMA3_PARAMS structure is created using the configured values
++ */
++EDMA3_Params EDMA3_PARAMS = {
++   1,
++    0,
++   _ALG_allocMemory,
++   _ALG_freeMemory,
++    NULL,
++    NULL,
++    0,
++   1,
++};
++
++/* Base key value for DMAN3 Linux IPC objects */
++UInt32 _EDMA3_ipcKeyBase = 0x33414d44;
++
++/*
++ * Maximum size of resource table used to store requests for each scratch grp. 
++ */
++__FAR__ Int ti_sdo_fc_edma3_EDMA3_MAXEDMAREQUESTS = 64;
++
++
++/*
++ * ======== ti.sdo.fc.ires.hdvicp.HDVICP TEMPLATE ========
++ */
++
++ 
++
++/* Generated code from the HDVICP module */
++unsigned int _HDVICP_REGBASEADDR = (unsigned int)31457280; 
++unsigned int _HDVICP_MEMBASEADDR = (unsigned int)32505856; 
++unsigned int _HDVICP_NUMRESOURCES = (unsigned int)1;
++
++#ifdef xdc_target__os_Linux
++/* Base key value for HDVICP Linux IPC objects */
++UInt32 _HDVICP_ipcKeyBase = 0x49564448;
++#endif
++
++
++/*
++ * ======== ti.sdo.fc.ires.vicp.VICP2 TEMPLATE ========
++ */
++
++
++
++/* Generated code from ti.sdo.fc.ires.vicp.VICP2.xdt */
++unsigned int _VICP2_imcopConfigBase = (unsigned int)30015488;
++
++/* Base key value for VICP2 Linux IPC objects */
++UInt32 _VICP2_ipcKeyBase = 0x50434956;
++
++/* Device is TMS320DM365 */
++Bool _VICP2_dm355 = 0;
++Bool _VICP2_dm365 = 1;
++
++/*
++ * ======== ti.sdo.fc.ires.edma3chan.EDMA3CHAN TEMPLATE ========
++ */
++
++ 
++
++/*
++ * ======== ti.sdo.fc.ires.addrspace.ADDRSPACE TEMPLATE ========
++ */
++
++    
++Bool ADDRSPACE_noTranslation = FALSE;
++
++/*
++ * ======== ti.sdo.fc.ires.memtcm.MEMTCM TEMPLATE ========
++ */
++
++/* Generated code from ti.sdo.fc.ires.memtcm.MEMTCM.xdt */
++UInt32 MEMTCM_blockId = 0;
++
++/* TODO, figure out if we shouldn't insmod CMEM from 0x0 */ 
++UInt32 MEMTCM_size = 0x7000; 
++
++/* Base key value for VICP2 Linux IPC objects */
++UInt32 MEMTCM_ipcKeyBase = 0x4d43544d;
++
++/*
++ * ======== ti.sdo.fc.global.Settings TEMPLATE ========
++ */
++
++Bool ti_sdo_fc_multiProcess = TRUE;
++
++/*
++ * ======== ti.sdo.fc.ires.grouputils.GROUPUTILS TEMPLATE ========
++ */
++
++
++
++/* Base key value for  GROUPUTILS Linux IPC objects */
++UInt32 _GROUPUTILS_ipcKeyBase = 0x534c4954;
++
++#include <ti/sdo/fc/ires/grouputils/ires_grouputils.h>
++
++
++ti_sdo_fc_ires_grouputils_LockFxn ti_sdo_fc_ires_grouputils_lockGroup = NULL; 
++        
++ti_sdo_fc_ires_grouputils_LockFxn ti_sdo_fc_ires_grouputils_unlockGroup = NULL; 
++
++
++/*
++ * Declare semaphore related functions before using them
++ */
++
++/* Need to declare these functions only if they haven't been declared before */
++
++#include <xdc/std.h>
++#include <ti/sdo/fc/rman/rman.h>
++
++typedef struct Sem_Obj *_GROUPUTILS_SemHandle;
++ 
++extern _GROUPUTILS_SemHandle Sem_create(Int key, Int count);
++extern Void Sem_delete(_GROUPUTILS_SemHandle sem);
++extern Int Sem_pend(_GROUPUTILS_SemHandle sem, UInt32 count);
++extern Void Sem_post(_GROUPUTILS_SemHandle sem);
++
++__FAR__ ti_sdo_fc_ires_grouputils_GROUPUTILS_SemCreateFxn 
++        ti_sdo_fc_ires_grouputils_GROUPUTILS_semCreateFxn = 
++        (ti_sdo_fc_ires_grouputils_GROUPUTILS_SemCreateFxn)Sem_create;
++__FAR__ ti_sdo_fc_ires_grouputils_GROUPUTILS_SemDeleteFxn 
++        ti_sdo_fc_ires_grouputils_GROUPUTILS_semDeleteFxn = 
++        (ti_sdo_fc_ires_grouputils_GROUPUTILS_SemDeleteFxn)Sem_delete;
++__FAR__ ti_sdo_fc_ires_grouputils_GROUPUTILS_SemPendFxn  
++        ti_sdo_fc_ires_grouputils_GROUPUTILS_semPendFxn = 
++        (ti_sdo_fc_ires_grouputils_GROUPUTILS_SemPendFxn)Sem_pend;
++__FAR__ ti_sdo_fc_ires_grouputils_GROUPUTILS_SemPostFxn 
++        ti_sdo_fc_ires_grouputils_GROUPUTILS_semPostFxn = 
++        (ti_sdo_fc_ires_grouputils_GROUPUTILS_SemPostFxn)Sem_post;
++
++
++/*
++ * ======== ti.sdo.utils.trace.GT TEMPLATE ========
++ */
++
++
++
++
++/*
++ * C code contribution from ti/sdo/utils/GT.xdt 
++ */
++#include <xdc/std.h>
++#include <ti/sdo/utils/trace/gt.h>
++
++extern Void GTConfig_tracePrintf(String fmt, ...); 
++extern Ptr GTConfig_libcMalloc(Int size);
++ 
++extern Int GTConfig_threadId(void);
++extern void GTConfig_error(String fmt, ...);
++extern void GTConfig_libcFree(Ptr, Int);
++extern UInt32 GTConfig_gettimeofday(void);
++extern Int GTConfig_pthreadLock(void);
++extern Int GTConfig_pthreadUnlock(void);
++extern Int GTConfig_posixInit(void);
++
++GT_Config _ti_sdo_utils_trace_GT_params = {
++    GTConfig_tracePrintf,
++    NULL,
++    GTConfig_threadId,
++    GTConfig_error,
++    GTConfig_libcMalloc,
++    GTConfig_libcFree,
++    GTConfig_gettimeofday,
++    GTConfig_pthreadLock,
++    GTConfig_pthreadUnlock,
++    GTConfig_posixInit    
++};
++
++GT_Config *GT = &_ti_sdo_utils_trace_GT_params;
++
++/*
++ * ======== ti.sdo.ce.ipc.linux.Ipc TEMPLATE ========
++ */
++
++
++
++Void IPC_generatedInit()
++{
++}
++
++/*
++ * ======== ti.sdo.ce.osal.linux.Settings TEMPLATE ========
++ */
++
++UInt32 ti_sdo_ce_osal_linux_SemMP_ipcKey = 0x4c41534f;
++
++UInt32 Memory_maxCbListSize = 100;
++
++
++/*
++ * ======== PROGRAM GLOBALS ========
++ */
++
++
++/*
++ * ======== CLINK DIRECTIVES ========
++ */
++
++#ifdef __ti__
++#define PRAGMA(x) _Pragma(#x)
++#define xdc__clink_constant(var) \
++PRAGMA(DATA_SECTION(var, ".const:" #var))  \
++asm("   .sect \".const:" #var "\"\n"  \
++  "   .clink\n"  \
++  "   .sect \"[0].const:" #var "\"\n"  \
++  "   .clink\n"  \
++  "   .sect \"[1].const:" #var "\"\n"  \
++  "   .clink")
++
++#endif
++
+-- 
+1.7.7.3
+
diff --git a/package/ti/gst-ti-plugin/gst-ti-plugin.mk b/package/ti/gst-ti-plugin/gst-ti-plugin.mk
new file mode 100644
index 0000000..fa6a1df
--- /dev/null
+++ b/package/ti/gst-ti-plugin/gst-ti-plugin.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# GStreamer plugins for TI DSP/ARM processors
+#
+# See https://gstreamer.ti.com/gf/project/gstreamer_ti/
+# and http://processors.wiki.ti.com/index.php/Category:DMAI_GStreamer_Plug-In
+#
+################################################################################
+
+GST_TI_PLUGIN_VERSION = 1.02.00
+GST_TI_PLUGIN_SITE = https://gstreamer.ti.com/gf/download/frsrelease/437/4107
+GST_TI_PLUGIN_SOURCE = gst-ti-plugin-minimal-$(GST_TI_PLUGIN_VERSION).tar.gz
+GST_TI_PLUGIN_DEPENDENCIES = ti-dsps-dmai ti-dsps-fc ti-dsps-codecs gstreamer gst-plugins-base
+GST_TI_PLUGIN_INSTALL_STAGING = YES
+GST_TI_PLUGIN_AUTORECONF = YES
+
+# Note: the order is important here to make sure the required object files are linked in.
+#GST_TI_PLUGIN_CODECS = g711_dec_prod g711_enc_prod h264venc_ti_arm926_debug vc1vdec_ti_arm926
+GST_TI_PLUGIN_CODECS += aac_dec_prod aaclc_enc_prod resource
+GST_TI_PLUGIN_CODECS += h264vdec_ti_arm926 h264venc_ti_arm926 h264v_ti_dma_dm365
+GST_TI_PLUGIN_CODECS += libjpgdec libjpgenc libimx
+GST_TI_PLUGIN_CODECS += libmp4dec libmp4enc mpeg4vdec_ti_arm926 mpeg4venc_ti_arm926
+GST_TI_PLUGIN_CODECS += mpeg2vdec_ti_arm926 mpeg2venc_ti_arm926 dma_ti_dm365
+GST_TI_PLUGIN_LINK_LIBS += $(foreach codec,$(GST_TI_PLUGIN_CODECS),$(STAGING_DIR)/usr/lib/codecs/$(codec).a)
+
+GST_TI_PLUGIN_LIBDEPS = dmai ce cmem fc edma vicp trace
+GST_TI_PLUGIN_LINK_LIBS += $(foreach lib,$(GST_TI_PLUGIN_LIBDEPS),$(STAGING_DIR)/usr/lib/lib$(lib).a)
+
+GST_TI_PLUGIN_MAKE_ENV = GST_TI_PLATFORM=$(TI_DSPS_PLATFORM)
+GST_TI_PLUGIN_MAKE_ENV += LINK_LIBS="$(GST_TI_PLUGIN_LINK_LIBS)"
+GST_TI_PLUGIN_CONF_ENV += CFLAGS="$$(TARGET_CFLAGS) -DPlatform_$(TI_DSPS_PLATFORM) -Dxdc_target_types__=gnu/targets/std.h -Dxdc_target_name__=MVArm9"
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/ti/ti-dsps-codec-engine/ti-dsps-codec-engine-001-Add-version.c.patch b/package/ti/ti-dsps-codec-engine/ti-dsps-codec-engine-001-Add-version.c.patch
new file mode 100644
index 0000000..36c204c
--- /dev/null
+++ b/package/ti/ti-dsps-codec-engine/ti-dsps-codec-engine-001-Add-version.c.patch
@@ -0,0 +1,27 @@
+From 3d72a7c0ef9907a0273eafb490d13467b3deacdd Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Wed, 7 Dec 2011 16:29:05 +0100
+Subject: [PATCH] Add version.c
+
+Engine.c uses the symbol ti_sdo_ce__versionString.  This is normally generated
+from utils/libvers.xdt by xdctools.  For buildroot, we'll create a .c file
+with the definition manually.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ packages/ti/sdo/ce/version.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+ create mode 100644 packages/ti/sdo/ce/version.c
+
+diff --git a/packages/ti/sdo/ce/version.c b/packages/ti/sdo/ce/version.c
+new file mode 100644
+index 0000000..a80f81a
+--- /dev/null
++++ b/packages/ti/sdo/ce/version.c
+@@ -0,0 +1,3 @@
++const char * ti_sdo_ce__versionString = "1, 0, 6";
++float ti_sdo_ce__versionNumArray[] = {1, 0, 6};
++const char * ti_sdo_ce__whatString = "@(#) ti.sdo.ce; version 1, 0, 6; buildroot; " __DATE__ " " __TIME__;
+-- 
+1.7.7.3
+
diff --git a/package/ti/ti-dsps-codec-engine/ti-dsps-codec-engine.mk b/package/ti/ti-dsps-codec-engine/ti-dsps-codec-engine.mk
new file mode 100644
index 0000000..bc86a3b
--- /dev/null
+++ b/package/ti/ti-dsps-codec-engine/ti-dsps-codec-engine.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# TI DSPs Codec Engine
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/
+#
+################################################################################
+
+TI_DSPS_CODEC_ENGINE_VERSION = 2_26_02_11
+TI_DSPS_CODEC_ENGINE_SITE = $(TI_SITE)/ce/$(TI_DSPS_CODEC_ENGINE_VERSION)/exports
+TI_DSPS_CODEC_ENGINE_SOURCE = codec_engine_$(TI_DSPS_CODEC_ENGINE_VERSION),lite.tar.gz
+TI_DSPS_CODEC_ENGINE_DEPENDENCIES = ti-dsps-linuxutils ti-dsps-fc ti-dsps-xdais xdctools
+TI_DSPS_CODEC_ENGINE_INSTALL_STAGING = YES
+TI_DSPS_CODEC_ENGINE_INSTALL_TARGET = NO
+
+TI_DSPS_CODEC_ENGINE_CE_TARGET = ce
+TI_DSPS_CODEC_ENGINE_CE_TARGET_TYPE = lib
+TI_DSPS_CODEC_ENGINE_CE_TOPDIR = packages
+TI_DSPS_CODEC_ENGINE_CE_SUBDIR = ti/sdo/ce
+TI_DSPS_CODEC_ENGINE_CE_HDRDIRS = osal ipc node audio audio1 image image1 speech speech1 video video1 video2 utils/xdm alg
+TI_DSPS_CODEC_ENGINE_CE_SRCDIRS = osal/linux ipc/linux
+TI_DSPS_CODEC_ENGINE_CE_RM_SOURCES_FILES = osal/linux/Memory_noOS.c alg/Algorithm_BIOS.c
+
+TI_DSPS_CODEC_ENGINE_EXTRA_CFLAGS=-I$(TI_DSPS_CODEC_ENGINE_CE_SUBDIR)/node
+
+$(eval $(call TITARGETS,TI_DSPS_CODEC_ENGINE,CE))
diff --git a/package/ti/ti-dsps-codecs/ti-dsps-codecs.mk b/package/ti/ti-dsps-codecs/ti-dsps-codecs.mk
new file mode 100644
index 0000000..d9be4e4
--- /dev/null
+++ b/package/ti/ti-dsps-codecs/ti-dsps-codecs.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# TI DSPs Codecs for DM365
+# http://software-dl.ti.com/dsps/dsps_public_sw/codecs/DM365/index_FDS.html
+#
+# Extracted from dvsdk_dm365-evm_4_02_00_06_setuplinux
+#
+################################################################################
+
+TI_DSPS_CODECS_SITE = http://mind.be/content
+TI_DSPS_CODECS_VERSION = 4.02.00
+# FIXME make platform configurable
+TI_DSPS_CODECS_SOURCE = ti-codecs-dm365-$(TI_DSPS_CODECS_VERSION).tar.bz2
+TI_DSPS_CODECS_INSTALL_STAGING = YES
+TI_DSPS_CODECS_INSTALL_TARGET = NO
+
+# This package doesn't contain any source files, just closed-source libraries.
+
+TI_DSPS_CODECS_TI_SUBDIR = packages/ti/sdo/codecs
+TI_DSPS_CODECS_TI_CODECS = h264dec h264enc jpegdec jpegenc mpeg2dec mpeg2enc mpeg4dec mpeg4dec_hdvicp mpeg4enc mpeg4enc_hdvicp vc1dec
+TI_DSPS_CODECS_TI_DIRS = $(patsubst %,$(TI_DSPS_CODECS_TI_SUBDIR)/%/lib,$(TI_DSPS_CODECS_TI_CODECS))
+
+TI_DSPS_CODECS_ITTIAM_SUBDIR = packages/ittiam/codecs
+TI_DSPS_CODECS_ITTIAM_CODECS = aac_dec aaclc_enc g711_dec g711_enc
+TI_DSPS_CODECS_ITTIAM_DIRS = $(patsubst %,$(TI_DSPS_CODECS_ITTIAM_SUBDIR)/%/lib_production,$(TI_DSPS_CODECS_ITTIAM_CODECS))
+
+# Note: some of the supporting libraries (libresource.a470MV, libimx.a, dma_ti_dm365.a) occur
+# several times. Even though the different instances are binary different,
+# they export the same symbols.  So let's assume that they are the same.
+# The duplicates will just be installed on top of each other.
+TI_DSPS_CODECS_LIBS = $(wildcard $(patsubst %,$(@D)/%/*.a,$(TI_DSPS_CODECS_TI_DIRS) $(TI_DSPS_CODECS_ITTIAM_DIRS)))
+TI_DSPS_CODECS_INSTALL_DIR = $(STAGING_DIR)/usr/lib/codecs
+
+# resource.a470MV is treated specially so we can rename it to resource.a
+define TI_DSPS_CODECS_INSTALL_STAGING_CMDS
+	mkdir -p $(TI_DSPS_CODECS_INSTALL_DIR)
+	@for lib in $(TI_DSPS_CODECS_LIBS); do \
+	  libbase=$$(basename $$lib); \
+	  echo "Install $$libbase"; \
+	  $(INSTALL) -m 0644 $$lib $(TI_DSPS_CODECS_INSTALL_DIR)/$$libbase; \
+	done
+	$(INSTALL) -m 0644 $(@D)/$(TI_DSPS_CODECS_ITTIAM_SUBDIR)/aac_dec/ce/lib/resource.a470MV $(TI_DSPS_CODECS_INSTALL_DIR)/resource.a
+endef
+
+define TI_DSPS_CODECS_UNINSTALL_STAGING_CMDS
+	$(RM) $(TI_DSPS_CODECS_INSTALL_DIR)/resource.a
+	@for lib in $(TI_DSPS_CODECS_LIBS); do \
+	  libbase=$$(basename $$lib); \
+	  echo "Uninstall $$libbase"; \
+	  $(RM) $(TI_DSPS_CODECS_INSTALL_DIR)/$$libbase; \
+	done
+	-rmdir $(TI_DSPS_CODECS_INSTALL_DIR)
+endef
+
+$(eval $(call GENTARGETS))
+
diff --git a/package/ti/ti-dsps-dm365mm/ti-dsps-dm365mm-0001-Fixes-for-Linux-2.6.26-and-up.patch b/package/ti/ti-dsps-dm365mm/ti-dsps-dm365mm-0001-Fixes-for-Linux-2.6.26-and-up.patch
new file mode 100644
index 0000000..5c869b4
--- /dev/null
+++ b/package/ti/ti-dsps-dm365mm/ti-dsps-dm365mm-0001-Fixes-for-Linux-2.6.26-and-up.patch
@@ -0,0 +1,122 @@
+From 40f5e3d295feb6c6148309179ea68d0100729123 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Thu, 8 Dec 2011 15:48:27 +0100
+Subject: [PATCH] Fixes for Linux 2.6.26 and up.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ module/dm365mmap.c |   67 +++++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 files changed, 64 insertions(+), 3 deletions(-)
+
+diff --git a/module/dm365mmap.c b/module/dm365mmap.c
+index 1522bff..e48af1a 100644
+--- a/module/dm365mmap.c
++++ b/module/dm365mmap.c
+@@ -48,6 +48,40 @@
+ /*#define ASQINT_ENABLE*/
+ /*#define MJCPCLK_ENABLE*/
+ 
++/*
++ * The following macros control version-dependent code:
++ * USE_CLASS_SIMPLE - #define if Linux version contains "class_simple*",
++ *    otherwise "class*" or "device*" is used (see USE_CLASS_DEVICE usage).
++ * USE_CLASS_DEVICE - #define if Linux version contains "class_device*",
++ *    otherwise "device*" or "class_simple*" is used (see USE_CLASS_SIMPLE
++ *    usage).
++ * If neither USE_CLASS_SIMPLE nor USE_CLASS_DEVICE is set, there is further
++ *    kernel version checking embedded in the module init & exit functions.
++ */
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26)
++
++#warning *** not a warning *** Note: LINUX_VERSION_CODE >= 2.6.26
++
++#undef USE_CLASS_DEVICE
++#undef USE_CLASS_SIMPLE
++
++#elif LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,18)
++
++#warning *** not a warning *** Note: 2.6.26 > LINUX_VERSION_CODE >= 2.6.18
++
++#define USE_CLASS_DEVICE
++#undef USE_CLASS_SIMPLE
++
++#else  /* LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,18) */
++
++#warning *** not a warning *** Note: LINUX_VERSION_CODE < 2.6.18
++
++#define USE_CLASS_SIMPLE
++#undef USE_CLASS_DEVICE
++
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,18) */
++
++
+ typedef struct _edma_params {
+     unsigned long src;
+     unsigned long dst;
+@@ -83,8 +117,12 @@ typedef struct _edma_params {
+ static int major = 0;
+ 
+ #if (USE_UDEV==1)
++#ifdef USE_CLASS_SIMPLE
++static struct class_simple *dm365mmap_class;
++#else
+ static struct class *dm365mmap_class;
+ #endif
++#endif
+ 
+ static DECLARE_MUTEX(dm365mmap_reply_mutex);
+ static struct completion edmacompletion;
+@@ -262,14 +300,29 @@ int __init dm365mmap_init(void)
+     __D("Allocated major number: %d\n", major);
+ 
+ #if (USE_UDEV==1)
++#ifdef USE_CLASS_SIMPLE
++    dm365mmap_class = class_simple_create(THIS_MODULE, "dm365mmap");
++#else
+     dm365mmap_class = class_create(THIS_MODULE, "dm365mmap");
++#endif
+     if (IS_ERR(dm365mmap_class)) {
+         __E("Error creating dm365mmap device class.\n");
+         return -EIO;
+     }
+-    class_device_create(dm365mmap_class, NULL, MKDEV(major, 0), NULL,
+-                        "dm365mmap");
+ 
++#ifdef USE_CLASS_SIMPLE
++    class_simple_device_add(dm365mmap_class, MKDEV(major, 0), NULL, "dm365mmap");
++#else
++#ifdef USE_CLASS_DEVICE
++    class_device_create(dm365mmap_class, NULL, MKDEV(major, 0), NULL, "dm365mmap");
++#else
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27)
++    device_create(dm365mmap_class, NULL, MKDEV(major, 0), NULL, "dm365mmap");
++#else
++    device_create(dm365mmap_class, NULL, MKDEV(major, 0), "dm365mmap");
++#endif // LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27)
++#endif // USE_CLASS_DEVICE
++#endif // USE_CLASS_SIMPLE
+ #endif
+     __D("Successfully initialized module\n");
+ 
+@@ -297,9 +350,17 @@ void __exit dm365mmap_exit(void)
+     __D("In dm365mmap_exit()\n");
+ 
+ #if (USE_UDEV==1)
++#ifdef USE_CLASS_SIMPLE
++    class_simple_device_remove(MKDEV(major, 0));
++    class_simple_destroy(dm365mmap_class);
++#else
++#ifdef USE_CLASS_DEVICE
+     class_device_destroy(dm365mmap_class, MKDEV(major, 0));
++#else
++    device_destroy(dm365mmap_class, MKDEV(major, 0));
++#endif // USE_CLASS_DEVICE
+     class_destroy(dm365mmap_class);
+-
++#endif // USE_CLASS_SIMPLE
+ #endif
+     __D("Unregistering character device dm365mmap\n");
+     unregister_chrdev(major, "dm365mmap");
+-- 
+1.7.7.3
+
diff --git a/package/ti/ti-dsps-dm365mm/ti-dsps-dm365mm.mk b/package/ti/ti-dsps-dm365mm/ti-dsps-dm365mm.mk
new file mode 100644
index 0000000..cf5b680
--- /dev/null
+++ b/package/ti/ti-dsps-dm365mm/ti-dsps-dm365mm.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# TI DSPs DM365 mmap module.
+#
+################################################################################
+
+# dm365mm is not distributed separately, but we can extract it from the DVSDK.
+TI_DSPS_DM365MM_VERSION = 01_00_03
+TI_DSPS_DM365MM_SITE = $(TI_SITE)/dvsdk/DVSDK_3_10/latest/exports
+TI_DSPS_DM365MM_SOURCE = dm365mm_$(TI_DSPS_DM365MM_VERSION).tar.gz
+TI_DSPS_DM365MM_DEPENDENCIES = linux
+
+# Only build the module, the interface is not used
+TI_DSPS_DM365MM_DM365MM_EXTRA_CFLAGS = -DUSE_UDEV=1 -DMAX_POOLS=128
+TI_DSPS_DM365MM_MODULE_DM365MM_DIR = module
+TI_DSPS_DM365MM_MODULE_DM365MM_MAKE_FLAGS = EXTRA_CFLAGS="$(TI_DSPS_DM365MM_DM365MM_EXTRA_CFLAGS)"
+
+$(eval $(call TITARGETS,TI_DSPS_DM365MM,,DM365MM))
diff --git a/package/ti/ti-dsps-dmai/Config.in b/package/ti/ti-dsps-dmai/Config.in
new file mode 100644
index 0000000..ab49e86
--- /dev/null
+++ b/package/ti/ti-dsps-dmai/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TI_DSPS_DMAI
+	bool "TI Davinci Multimedia Application Interface"
+	select BR2_PACKAGE_TI_DSPS_LINUXUTILS # Requires cmem
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  Multimedia application interface for the Texas Instruments DSPs: OMAP, DaVinci, ...
diff --git a/package/ti/ti-dsps-dmai/ti-dsps-dmai-0001-Remove-dependency-on-VIDIOC_S_YDOFST-ioctl.patch b/package/ti/ti-dsps-dmai/ti-dsps-dmai-0001-Remove-dependency-on-VIDIOC_S_YDOFST-ioctl.patch
new file mode 100644
index 0000000..41a1b0e
--- /dev/null
+++ b/package/ti/ti-dsps-dmai/ti-dsps-dmai-0001-Remove-dependency-on-VIDIOC_S_YDOFST-ioctl.patch
@@ -0,0 +1,74 @@
+From a1924a5c36542d50598fee97a2f7c9a4b90979cf Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Mon, 5 Dec 2011 12:39:37 +0100
+Subject: [PATCH 1/2] Remove dependency on VIDIOC_S_YDOFST ioctl
+
+The VIDIOC_S_YDOFST ioctl is added in TI's PSP kernel for Linux 2.6.32, but
+does not appear in other kernels for the DaVinci or OMAP architecture
+(not on kernel.org or on arago.org).  Therefore, check for the availability
+of this ioctl and only use it if available.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ .../ti/sdo/dmai/linux/dm365/Display_v4l2.c         |   42 ++++++++++++-------
+ 1 files changed, 26 insertions(+), 16 deletions(-)
+
+diff --git a/dmai/packages/ti/sdo/dmai/linux/dm365/Display_v4l2.c b/dmai/packages/ti/sdo/dmai/linux/dm365/Display_v4l2.c
+index 95c292d..5fb65e4 100644
+--- a/dmai/packages/ti/sdo/dmai/linux/dm365/Display_v4l2.c
++++ b/dmai/packages/ti/sdo/dmai/linux/dm365/Display_v4l2.c
+@@ -475,25 +475,35 @@ static Int _Display_v4l2_set_frame_offsets(Display_Handle hDisplay,
+         }
+     }
+ 
+-    /* If dim.y > 0, then there is padding at the top of the frame.  We call
+-     * VIDIOC_S_YDOFST with the size of the padding.  This will instruct the
+-     * display driver to start the display at the specified offset, which
+-     * should cause the padding to be cropped.
+-     *
+-     * This value must be aligned to a 64-byte boundary, so we might not always
+-     * hit the offset we're after dead-on.  However, in most cases we can get
+-     * close enough, as most displays crop a little of the edges anyway.
++    /* The YDOFST ioctl only appears in the TI PSP kernel.  If we use a
++     * different kernel, just error out.
+      */
+-    ydOffset = dim.y * dim.lineLength;
+-
+-    if (ydOffset & 0x3F) {
+-        Dmai_err1("ydOffset is not 64-byte aligned (%lu)\n", ydOffset);
+-        return Dmai_EFAIL;
+-    }
++    if (dim.y > 0) {
++        /* If dim.y > 0, then there is padding at the top of the frame.  We call
++        * VIDIOC_S_YDOFST with the size of the padding.  This will instruct the
++        * display driver to start the display at the specified offset, which
++        * should cause the padding to be cropped.
++        *
++        * This value must be aligned to a 64-byte boundary, so we might not always
++        * hit the offset we're after dead-on.  However, in most cases we can get
++        * close enough, as most displays crop a little of the edges anyway.
++        */
++        ydOffset = dim.y * dim.lineLength;
++
++        if (ydOffset & 0x3F) {
++            Dmai_err1("ydOffset is not 64-byte aligned (%lu)\n", ydOffset);
++            return Dmai_EFAIL;
++        }
+ 
+-    if (ioctl(hDisplay->fd, VIDIOC_S_YDOFST, &ydOffset) == -1) {
+-        Dmai_err1("VIDIOC_S_YDOFST failed (%s)\n", strerror(errno));
++#ifdef VIDIOC_S_YDOFST
++        if (ioctl(hDisplay->fd, VIDIOC_S_YDOFST, &ydOffset) == -1) {
++            Dmai_err1("VIDIOC_S_YDOFST failed (%s)\n", strerror(errno));
++            return Dmai_EFAIL;
++        }
++#else
++        Dmai_err1("ydOffset %lu > 0 but VIDIOC_S_YDOFST ioctl is not available\n", ydOffset);
+         return Dmai_EFAIL;
++#endif
+     }
+ 
+     return Dmai_EOK;
+-- 
+1.7.7.3
+
diff --git a/package/ti/ti-dsps-dmai/ti-dsps-dmai.mk b/package/ti/ti-dsps-dmai/ti-dsps-dmai.mk
new file mode 100644
index 0000000..38f3afc
--- /dev/null
+++ b/package/ti/ti-dsps-dmai/ti-dsps-dmai.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# TI Davinci Multimedia Application Interface
+# https://gforge.ti.com/gf/project/dmai/
+#
+################################################################################
+
+TI_DSPS_DMAI_TAG = 2_20_00_10
+TI_DSPS_DMAI_SITE = https://gforge.ti.com/svn/dmai/tags/TAG_$(TI_DSPS_DMAI_TAG)/davinci_multimedia_application_interface
+TI_DSPS_DMAI_SITE_METHOD = svn
+TI_DSPS_DMAI_SVN_OPTS = --username=anonymous --password='' --no-auth-cache --non-interactive
+TI_DSPS_DMAI_VERSION = HEAD
+TI_DSPS_DMAI_SOURCE = ti-dsps-dmai_$(TI_DSPS_DMAI_TAG).tar.gz
+TI_DSPS_DMAI_DEPENDENCIES = ti-dsps-linuxutils ti-dsps-codec-engine xdctools alsa-lib
+ifeq ($(TI_DSPS_PLATFORM),dm365)
+  TI_DSPS_DMAI_DEPENDENCIES += ti-dsps-dm365mm
+endif
+TI_DSPS_DMAI_INSTALL_STAGING = YES
+TI_DSPS_DMAI_INSTALL_TARGET = NO
+
+TI_DSPS_DMAI_DMAI_TARGET = dmai
+TI_DSPS_DMAI_DMAI_TARGET_TYPE = lib
+TI_DSPS_DMAI_DMAI_TOPDIR = dmai/packages
+TI_DSPS_DMAI_DMAI_SUBDIR = ti/sdo/dmai
+TI_DSPS_DMAI_DMAI_HDRDIRS = ce linux/$(TI_DSPS_PLATFORM)
+TI_DSPS_DMAI_DMAI_SRCDIRS = linux
+
+TI_DSPS_DMAI_EXTRA_CFLAGS=-I$(LINUX_DIR)/include -DDmai_Device_$(TI_DSPS_PLATFORM)=1
+
+$(eval $(call TITARGETS,TI_DSPS_DMAI,DMAI))
diff --git a/package/ti/ti-dsps-fc/ti-dsps-fc.mk b/package/ti/ti-dsps-fc/ti-dsps-fc.mk
new file mode 100644
index 0000000..513c56f
--- /dev/null
+++ b/package/ti/ti-dsps-fc/ti-dsps-fc.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# TI DSPs Framework Components
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc/
+#
+################################################################################
+
+TI_DSPS_FC_VERSION = 2_26_00_01
+TI_DSPS_FC_SITE = $(TI_SITE)/fc/$(TI_DSPS_FC_VERSION)/exports
+TI_DSPS_FC_SOURCE = framework_components_$(TI_DSPS_FC_VERSION),lite.tar.gz
+TI_DSPS_FC_DEPENDENCIES = ti-dsps-xdais xdctools
+TI_DSPS_FC_INSTALL_STAGING = YES
+TI_DSPS_FC_INSTALL_TARGET = NO
+
+TI_DSPS_FC_TRACE_TARGET = trace
+TI_DSPS_FC_TRACE_TARGET_TYPE = lib
+TI_DSPS_FC_TRACE_TOPDIR = packages
+TI_DSPS_FC_TRACE_SUBDIR = ti/sdo/utils/trace
+
+# FIXME should be split up into separate libraries (acpy3, ires, edma3, ...)
+TI_DSPS_FC_FC_TARGET = fc
+TI_DSPS_FC_FC_TARGET_TYPE = lib
+TI_DSPS_FC_FC_TOPDIR = packages
+TI_DSPS_FC_FC_SUBDIR = ti/sdo/fc
+TI_DSPS_FC_FC_HDRDIRS = acpy3 vicpsync ires ires/grouputils hdvicpsync edma3 utils rman dman3 memutils
+TI_DSPS_FC_FC_SRCDIRS = ires/vicp ires/memtcm \
+	ires/edma3chan ires/nullresource ires/hdvicp \
+	ires/memtcm ires/addrspace
+# Configure dma3 to allow multiple parallel processes
+TI_DSPS_FC_FC_EXTRA_CFLAGS += -D_MULTI_PROCESS_
+# dman3 and rman use <include> instead of "include" for local headers
+TI_DSPS_FC_FC_EXTRA_CFLAGS += -I$(TI_DSPS_FC_FC_SUBDIR)/dman3
+TI_DSPS_FC_FC_EXTRA_CFLAGS += -I$(TI_DSPS_FC_FC_SUBDIR)/rman
+
+TI_DSPS_FC_FC_RM_SOURCES_FILES += acpy3/acpy3.c acpy3/acpy3_start.c acpy3/acpy3_qdma.c acpy3/acpy3_wait.c acpy3/acpy3_waitlinked.c acpy3/acpy3_instr.c
+TI_DSPS_FC_FC_RM_SOURCES_FILES += edma3/edma3_config.c ires/edma3chan/iresman_edma3Chan.c rman/rman_yield.c
+TI_DSPS_FC_FC_RM_SOURCES_FILES += dman3/bios_rts.c dman3/dman3_externalRM_api.c dman3/dman3_externalRM_initImpl.c
+TI_DSPS_FC_FC_RM_SOURCES_FILES += memutils/memutils_bios.c memutils/memutils_std.c
+
+$(eval $(call TITARGETS,TI_DSPS_FC,TRACE FC))
+
diff --git a/package/ti/ti-dsps-linuxutils/Config.in b/package/ti/ti-dsps-linuxutils/Config.in
new file mode 100644
index 0000000..3277e03
--- /dev/null
+++ b/package/ti/ti-dsps-linuxutils/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TI_DSPS_LINUXUTILS
+	bool "TI DSPs Linux Utils"
+	help
+	  Linux Utils for the Texas Instruments DSPs: OMAP, DaVinci, ...
+
+	  These are mainly modules to access memory that is shared with
+	  the DSP peripherals.
+
+	  Currently only the cmemk module and interface library are supported.
diff --git a/package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils-0001-cmemk-add-definition-of-arm926_dma_map_area-and-its-.patch b/package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils-0001-cmemk-add-definition-of-arm926_dma_map_area-and-its-.patch
new file mode 100644
index 0000000..bfd2449
--- /dev/null
+++ b/package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils-0001-cmemk-add-definition-of-arm926_dma_map_area-and-its-.patch
@@ -0,0 +1,53 @@
+From 03b58d63c9e86959258e14f764fe5f1c0d84f1ef Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Wed, 30 Nov 2011 16:48:04 +0100
+Subject: [PATCH] cmemk: add definition of arm926_dma_map_area and its
+ dependencies.
+
+The symbol arm926_dma_map_area is used by the dmac_map_area,
+but that symbol is not exported (dmac_map_area is a macro that
+shouldn't be used outside of the kernel...).
+
+As a work-around, we just copy the definition here.
+
+See http://e2e.ti.com/support/embedded/f/354/p/84962/299161.aspx
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c |   13 ++++++++++---
+ 1 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c b/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c
+index 7558061..d56e931 100644
+--- a/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c
++++ b/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c
+@@ -2368,8 +2368,6 @@ MODULE_LICENSE("GPL");
+ module_init(cmem_init);
+ module_exit(cmem_exit);
+ 
+-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,34)
+-
+ /*
+  * The following assembly functions were taken from
+  *     arch/arm/mm/proc-arm926.S
+@@ -2473,7 +2471,16 @@ arm926_dma_flush_range:\n \
+         mov     pc, lr\n \
+ ");
+ 
+-#endif
++asm("\n \
++        .global arm926_dma_map_area\n \
++arm926_dma_map_area:\n \
++        add     r1, r1, r0\n \
++@        cmp     r2, #DMA_TO_DEVICE\n \
++        cmp     r2, #1\n \
++        beq     arm926_dma_clean_range\n \
++        bcs     arm926_dma_inv_range\n \
++        b       arm926_dma_flush_range\n \
++");
+ 
+ /*
+  *  @(#) ti.sdo.linuxutils.cmem; 2, 2, 0,1; 6-24-2011 16:00:37; /db/atree/library/trees/linuxutils/linuxutils.git/src/ linuxutils-i04
+-- 
+1.7.7.3
+
diff --git a/package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils-0002-irq-module-add-missing-include-linux-slab.h.patch b/package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils-0002-irq-module-add-missing-include-linux-slab.h.patch
new file mode 100644
index 0000000..a11c339
--- /dev/null
+++ b/package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils-0002-irq-module-add-missing-include-linux-slab.h.patch
@@ -0,0 +1,25 @@
+From 9da51ff6923006c47048bc65d0e6be90c5f2834d Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Wed, 7 Dec 2011 17:31:54 +0100
+Subject: [PATCH] irq module: added missing include linux/slab.h
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ packages/ti/sdo/linuxutils/irq/src/module/irqk.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/packages/ti/sdo/linuxutils/irq/src/module/irqk.c b/packages/ti/sdo/linuxutils/irq/src/module/irqk.c
+index 3e10eae..2c7a008 100644
+--- a/packages/ti/sdo/linuxutils/irq/src/module/irqk.c
++++ b/packages/ti/sdo/linuxutils/irq/src/module/irqk.c
+@@ -32,6 +32,7 @@
+ #include <linux/moduleparam.h>
+ #include <linux/cdev.h>
+ #include <linux/mm.h>
++#include <linux/slab.h>
+ #include <linux/interrupt.h>
+ 
+ #include <asm/io.h>
+-- 
+1.7.7.3
+
diff --git a/package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils.mk b/package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils.mk
new file mode 100644
index 0000000..92508a0
--- /dev/null
+++ b/package/ti/ti-dsps-linuxutils/ti-dsps-linuxutils.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# TI DSPs Linux Utils
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/linuxutils/
+#
+################################################################################
+
+TI_DSPS_LINUXUTILS_VERSION = 2_26_02_05
+TI_DSPS_LINUXUTILS_SITE = $(TI_SITE)/linuxutils/$(TI_DSPS_LINUXUTILS_VERSION)/exports
+TI_DSPS_LINUXUTILS_SOURCE = linuxutils_$(TI_DSPS_LINUXUTILS_VERSION).tar.gz
+TI_DSPS_LINUXUTILS_DEPENDENCIES = linux
+TI_DSPS_LINUXUTILS_INSTALL_STAGING = YES
+
+TI_DSPS_LINUXUTILS_CMEM_TARGET = cmem
+TI_DSPS_LINUXUTILS_CMEM_TARGET_TYPE = lib
+TI_DSPS_LINUXUTILS_CMEM_TOPDIR = packages
+TI_DSPS_LINUXUTILS_CMEM_SUBDIR = ti/sdo/linuxutils/cmem
+TI_DSPS_LINUXUTILS_CMEM_HDRDIRS = include
+TI_DSPS_LINUXUTILS_CMEM_SRCDIRS = src/interface
+# FIXME make these configurable
+TI_DSPS_LINUXUTILS_CMEM_EXTRA_CFLAGS = -DUSE_UDEV=1 -DMAX_POOLS=128 -I$(TI_DSPS_LINUXUTILS_CMEM_SUBDIR)/include
+#TI_DSPS_LINUXUTILS_CMEM_EXTRA_CFLAGS += -D__DEBUG
+
+TI_DSPS_LINUXUTILS_MODULE_CMEM_DIR = packages/ti/sdo/linuxutils/cmem/src/module
+TI_DSPS_LINUXUTILS_MODULE_CMEM_MAKE_FLAGS = EXTRA_CFLAGS="$(TI_DSPS_LINUXUTILS_CMEM_EXTRA_CFLAGS)"
+
+TI_DSPS_LINUXUTILS_EDMA_TARGET = edma
+TI_DSPS_LINUXUTILS_EDMA_TARGET_TYPE = lib
+TI_DSPS_LINUXUTILS_EDMA_TOPDIR = packages
+TI_DSPS_LINUXUTILS_EDMA_SUBDIR = ti/sdo/linuxutils/edma
+TI_DSPS_LINUXUTILS_EDMA_HDRDIRS = include
+TI_DSPS_LINUXUTILS_EDMA_SRCDIRS = src/interface
+
+TI_DSPS_LINUXUTILS_MODULE_EDMA_DIR = packages/ti/sdo/linuxutils/edma/src/module
+TI_DSPS_LINUXUTILS_MODULE_EDMA_MAKE_FLAGS = EXTRA_CFLAGS="$(TI_DSPS_LINUXUTILS_CMEM_EXTRA_CFLAGS)"
+
+TI_DSPS_LINUXUTILS_IRQ_TARGET = irq
+TI_DSPS_LINUXUTILS_IRQ_TARGET_TYPE = lib
+TI_DSPS_LINUXUTILS_IRQ_TOPDIR = packages/ti/sdo/linuxutils/irq/src/interface
+TI_DSPS_LINUXUTILS_IRQ_SUBDIR = .
+
+TI_DSPS_LINUXUTILS_MODULE_IRQ_DIR = packages/ti/sdo/linuxutils/irq/src/module
+TI_DSPS_LINUXUTILS_MODULE_IRQ_MAKE_FLAGS = EXTRA_CFLAGS="-DUSE_UDEV=1"
+
+TI_DSPS_LINUXUTILS_VICP_TARGET = vicp
+TI_DSPS_LINUXUTILS_VICP_TARGET_TYPE = lib
+TI_DSPS_LINUXUTILS_VICP_TOPDIR = packages
+TI_DSPS_LINUXUTILS_VICP_SUBDIR = ti/sdo/linuxutils/vicp
+TI_DSPS_LINUXUTILS_VICP_HDRDIRS = include
+TI_DSPS_LINUXUTILS_VICP_SRCDIRS = src/interface
+TI_DSPS_LINUXUTILS_VICP_EXTRA_CFLAGS = -Iti/sdo/linuxutils/irq/src/module
+
+$(eval $(call TITARGETS,TI_DSPS_LINUXUTILS,CMEM VICP EDMA,CMEM IRQ EDMA))
diff --git a/package/ti/ti-dsps-xdais/ti-dsps-xdais.mk b/package/ti/ti-dsps-xdais/ti-dsps-xdais.mk
new file mode 100644
index 0000000..f393832
--- /dev/null
+++ b/package/ti/ti-dsps-xdais/ti-dsps-xdais.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# TI eXpress DSP Algorithm Interoperability Standard
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais/index.html
+#
+################################################################################
+
+TI_DSPS_XDAIS_VERSION = 6_26_01_03
+TI_DSPS_XDAIS_SITE = $(TI_SITE)/xdais/$(TI_DSPS_XDAIS_VERSION)/exports
+TI_DSPS_XDAIS_SOURCE = xdais_$(TI_DSPS_XDAIS_VERSION).tar.gz
+TI_DSPS_XDAIS_DEPENDENCIES = xdctools
+TI_DSPS_XDAIS_INSTALL_STAGING = YES
+TI_DSPS_XDAIS_INSTALL_TARGET = NO
+
+TI_DSPS_XDAIS_XDAIS_TARGET = xdais
+TI_DSPS_XDAIS_XDAIS_TARGET_TYPE = lib
+TI_DSPS_XDAIS_XDAIS_TOPDIR = packages
+TI_DSPS_XDAIS_XDAIS_SUBDIR = ti/xdais
+TI_DSPS_XDAIS_XDAIS_HDRDIRS = dm
+
+$(eval $(call TITARGETS,TI_DSPS_XDAIS,XDAIS))
diff --git a/package/ti/ti.mk b/package/ti/ti.mk
new file mode 100644
index 0000000..95f3403
--- /dev/null
+++ b/package/ti/ti.mk
@@ -0,0 +1,92 @@
+# Some variables shared by the TI .mk files
+
+# FIXME how to refactor module build?
+MAKE_MODULE = $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) DEPMOD="$(HOST_DIR)/usr/sbin/depmod" -C $(LINUX_DIR)
+
+TI_MAKE = $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $($(PKG)_MAKE_FLAGS) INSTALL="$(INSTALL)" RM="$(RM)" -f $(TOPDIR)/package/ti/Makefile.ti
+TI_SITE = http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent
+TI_DEFINES = -Dxdc_target_types__=gnu/targets/std.h -Dxdc_target_name__=MVArm9 -DGT_TRACE=1 -DGT_ASSERT=1
+# FIXME make this configurable
+TI_DSPS_PLATFORM = dm365
+
+# Commands to make a Linux kernel module.
+# $1: module name.  The variable $(PKG)_MODULE_$1_DIR must be set to the module directory.
+# $2: make target and extra make options
+# The following make variables can be defined:
+# $(PKG)_MODULE_$(MODULE)_DIR: subdirectory where the module source resides
+# $(PKG)_MODULE_$(MODULE)_MAKE_FLAGS: extra make flags to pass along for this module
+define TI_MODULE_CMDS
+	$$(MAKE_MODULE) M=$$(@D)/$$($$(PKG)_MODULE_$(1)_DIR) $$($$(PKG)_MODULE_$(1)_MAKE_FLAGS) $(2)
+endef
+
+# Commands to make a TI subpackage.
+#  $1: subpackage name.
+#  $2: make target and extra make options.
+# The following make variables must be set (each variable has prefix $(PKG)_$(SUBPKG):
+#  _TARGET: basename of the target to make, e.g. foo -> libfoo.a
+#  _TARGET_TYPE: 'exe' or 'lib'
+#  _TOPDIR: top directory from which to run make
+#  _SUBDIR: common part of the source subdirectories
+#  _HDRDIRS (optional): subdirectories of _SUBDIR that contain headers to be installed, in addition to _SUBDIR itself
+#  _SRCDIRS (optional): subdirectories of _SUBDIR that contain sources, in addition to _HDRDIRS
+# In addition, $(PKG)_EXTRA_CFLAGS and $(PKG)_$(SUBPKG)_EXTRA_CFLAGS can be set for additional CFLAGS
+# Include paths for _TOPDIR and _SUBDIR are always added to CFLAGS
+define TI_SUBPACKAGE_CMDS
+	$(TI_MAKE) -C $$(@D)/$$($$(PKG)_$(1)_TOPDIR) \
+	  TARGET=$$($$(PKG)_$(1)_TARGET) \
+	  TARGET_TYPE=$$($$(PKG)_$(1)_TARGET_TYPE) \
+	  SRCDIRS="$$(foreach dir,. $$($$(PKG)_$(1)_HDRDIRS) $$($$(PKG)_$(1)_SRCDIRS),$$($$(PKG)_$(1)_SUBDIR)/$$(dir))" \
+	  HDRDIRS="$$(foreach dir,. $$($$(PKG)_$(1)_HDRDIRS),$$($$(PKG)_$(1)_SUBDIR)/$$(dir))" \
+	  CFLAGS="$$(TARGET_CFLAGS) $(TI_DEFINES) -I. -I$$($$(PKG)_$(1)_SUBDIR) $$($$(PKG)_EXTRA_CFLAGS) $$($$(PKG)_$(1)_EXTRA_CFLAGS)" \
+	  $(2)
+endef
+
+# FIXME redirect to _INNER like AUTOTARGETS
+# Equivalent of GENTARGETS for TI.
+#  $1: package name in uppercase
+#  $2: space-separated list of subpackages (for which variables $(PKG)_$(SUBPKG)_TOPDIR etc. are defined)
+#  $3: space-separated list of modules (for which variables $(PKG)_MODULE_$(MODULE)_DIR etc. are defined)
+define TITARGETS
+
+$(1)_RM_SOURCES_FILES = $(strip $(foreach subpkg,$(2),$(addprefix $($(1)_$(subpkg)_TOPDIR)/$($(1)_$(subpkg)_SUBDIR)/,$($(1)_$(subpkg)_RM_SOURCES_FILES))))
+ifneq ($$($(1)_RM_SOURCES_FILES),)
+define $(1)_RM_SOURCES
+	$(RM) $$(addprefix $$(@D)/,$$($(1)_RM_SOURCES_FILES))
+endef
+
+$(1)_POST_PATCH_HOOKS += $(1)_RM_SOURCES
+endif
+
+define $(1)_BUILD_CMDS
+	$(foreach subpkg,$(2),$(call TI_SUBPACKAGE_CMDS,$(subpkg),build)$(sep))
+	$(foreach module,$(3),$(call TI_MODULE_CMDS,$(module),modules)$(sep))
+endef
+
+define $(1)_CLEAN_CMDS
+	$(foreach subpkg,$(2),$(call TI_SUBPACKAGE_CMDS,$(subpkg),clean)$(sep))
+	$(foreach module,$(3),$(call TI_MODULE_CMDS,$(module),clean)$(sep))
+endef
+
+# No modules in staging
+define $(1)_INSTALL_STAGING_CMDS
+	$(foreach subpkg,$(2),$(call TI_SUBPACKAGE_CMDS,$(subpkg),DESTDIR=$$(STAGING_DIR) install)$(sep))
+endef
+
+define $(1)_UNINSTALL_STAGING_CMDS
+	$(foreach subpkg,$(2),$(call TI_SUBPACKAGE_CMDS,$(subpkg),DESTDIR=$$(STAGING_DIR) uninstall)$(sep))
+endef
+
+define $(1)_INSTALL_TARGET_CMDS
+	$(foreach subpkg,$(2),$(call TI_SUBPACKAGE_CMDS,$(subpkg),DESTDIR=$$(TARGET_DIR) install)$(sep))
+	$(foreach module,$(3),$(call TI_MODULE_CMDS,$(module),modules_install)$(sep))
+endef
+
+# modules_uninstall target doesn't exist :-(
+define $(1)_UNINSTALL_TARGET_CMDS
+	$(foreach subpkg,$(2),$(call TI_SUBPACKAGE_CMDS,$(subpkg),DESTDIR=$$(TARGET_DIR) uninstall)$(sep))
+endef
+
+$(call GENTARGETS)
+endef
+
+include package/ti/*/*.mk
\ No newline at end of file
diff --git a/package/ti/xdctools/xdctools.mk b/package/ti/xdctools/xdctools.mk
new file mode 100644
index 0000000..e64af08
--- /dev/null
+++ b/package/ti/xdctools/xdctools.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# XDCTools
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/
+#
+################################################################################
+
+XDCTOOLS_SITE = http://mind.be/content
+XDCTOOLS_VERSION = 3.16.03
+XDCTOOLS_SOURCE = ti-xdctools-$(XDCTOOLS_VERSION).tar.bz2
+XDCTOOLS_INSTALL_STAGING = YES
+XDCTOOLS_INSTALL_TARGET = NO
+
+# Only xdc itself is currently supported
+XDCTOOLS_XDC_TARGET = xdc
+XDCTOOLS_XDC_TARGET_TYPE = lib
+XDCTOOLS_XDC_TOPDIR = packages
+XDCTOOLS_XDC_SUBDIR = xdc
+XDCTOOLS_XDC_HDRDIRS = runtime runtime/package
+
+XDCTOOLS_TARGETS_TARGET = target
+XDCTOOLS_TARGETS_TARGET_TYPE = lib
+XDCTOOLS_TARGETS_TOPDIR = packages
+XDCTOOLS_TARGETS_SUBDIR = gnu/targets
+
+
+$(eval $(call TITARGETS,XDCTOOLS,XDC TARGETS))
+
-- 
1.7.8.3
