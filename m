From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 16:11:11 +0200
Subject: [Buildroot] [PATCH 2/4] config: Add support for xconfig
In-Reply-To: <cover.1248703870.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248703870.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b0df9df39ad76bdf89d1f58996cd4a1c2632b47c.1248703870.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alper Yildirim <ayildirim@aselsan.com>

It involved:

 * Modifying the top-level Makefile to create the xconfig target, and
   the $(CONFIG)/qconf target to compile the qconf utility

 * Modifying the package/config/Makefile magic so that C++ files and
   binaries gets linked properly, re-using the
   package/config/Makefile.kconfig logic inherited from the kernel

 * Hacking a little bit package/config/Makefile.kconfig in a way
   similar to the modifications done for the mconf (menuconfig
   interface)

Signed-off-by: Alper Yildirim <ayildirim@aselsan.com>
---
 Makefile                                   |   22 +++++++++++++++++++---
 package/config/Makefile                    |    9 +++++++++
 package/config/Makefile.kconfig            |    4 ++++
 package/config/kconfig-to-buildroot2.patch |   14 +++++++++++---
 4 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 76dd2cd..71a1ce5 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@ CONFIG_DEFCONFIG=.defconfig
 CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
 
-noconfig_targets:=menuconfig config oldconfig randconfig \
+noconfig_targets:=menuconfig xconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release tags \
 	source-check help
 
@@ -431,13 +431,29 @@ $(CONFIG)/conf:
 	- at if [ ! -f .config ]; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
 	fi
+
 $(CONFIG)/mconf:
 	@mkdir -p $(CONFIG)/buildroot-config
-	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) conf mconf
+	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) mconf
+	- at if [ ! -f .config ]; then \
+		cp $(CONFIG_DEFCONFIG) .config; \
+	fi
+
+$(CONFIG)/qconf:
+	@mkdir -p $(CONFIG)/buildroot-config
+	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) qconf
 	- at if [ ! -f .config ]; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
 	fi
 
+xconfig: $(CONFIG)/qconf
+	@mkdir -p $(CONFIG)/buildroot-config
+	@if ! KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
+		$(CONFIG)/qconf $(CONFIG_CONFIG_IN); then \
+		test -f .config.cmd || rm -f .config; \
+	fi
+
 menuconfig: $(CONFIG)/mconf
 	@mkdir -p $(CONFIG)/buildroot-config
 	@if ! KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
@@ -559,5 +575,5 @@ release: distclean
 	rm -rf $$OUT
 
 .PHONY: dummy subdirs release distclean clean config oldconfig \
-	menuconfig tags check test depend defconfig help
+	menuconfig xconfig tags check test depend defconfig help
 
diff --git a/package/config/Makefile b/package/config/Makefile
index 3af4bd8..a2184fa 100644
--- a/package/config/Makefile
+++ b/package/config/Makefile
@@ -14,7 +14,10 @@ __hostprogs := $(sort $(hostprogs-y) $(hostprogs-m))
 host-csingle := $(foreach m,$(__hostprogs),$(if $($(m)-objs),,$(m)))
 host-cmulti := $(foreach m,$(__hostprogs),\
            $(if $($(m)-cxxobjs),,$(if $($(m)-objs),$(m))))
+host-cxxmulti := $(foreach m,$(__hostprogs),\
+           $(if $($(m)-cxxobjs),$(m),$(if $($(m)-objs),)))
 host-cobjs := $(sort $(foreach m,$(__hostprogs),$($(m)-objs)))
+host-cxxobjs := $(sort $(foreach m,$(__hostprogs),$($(m)-cxxobjs)))
 
 $(host-csingle): %: %.c
 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< $(HOST_LOADLIBES) -o $@
@@ -22,9 +25,15 @@ $(host-csingle): %: %.c
 $(host-cmulti): %: $(host-cobjs) $(host-cshlib)
 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $($@-objs) $(HOST_LOADLIBES) -o $@
 
+$(host-cxxmulti): %: $(host-cxxobjs) $(host-cobjs) $(host-cshlib)
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $($@-objs) $($@-cxxobjs) $(HOSTLOADLIBES_$@) -o $@
+
 $(host-cobjs): %.o: %.c
 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) -c $< -o $@
 
+$(host-cxxobjs): %.o: %.cc
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) -c $< -o $@
+
 $(obj)/%:: $(src)/%_shipped
 	$(Q)cat $< > $@
 
diff --git a/package/config/Makefile.kconfig b/package/config/Makefile.kconfig
index 747f23d..6974cc3 100644
--- a/package/config/Makefile.kconfig
+++ b/package/config/Makefile.kconfig
@@ -131,6 +131,10 @@ endif
 ifeq ($(MAKECMDGOALS),xconfig)
 	qconf-target := 1
 endif
+ifeq ($(findstring qconf,$(MAKECMDGOALS)),qconf)
+	qconf-target := 1
+endif
+
 ifeq ($(MAKECMDGOALS),gconfig)
 	gconf-target := 1
 endif
diff --git a/package/config/kconfig-to-buildroot2.patch b/package/config/kconfig-to-buildroot2.patch
index e89046b..8e7ce42 100644
--- a/package/config/kconfig-to-buildroot2.patch
+++ b/package/config/kconfig-to-buildroot2.patch
@@ -1,5 +1,5 @@
 ---
- Makefile            |    3 +
+ Makefile            |    7 +++
  README.buildroot2   |   22 ++++++++++
  conf.c              |   13 ++----
  confdata.c          |  101 ++++++++++++++++++++++++++------------------------
@@ -10,13 +10,13 @@
  util.c              |  105 +++++++++++++++++++++++++++++++++++++++++++++++++++-
  zconf.tab.c_shipped |    2 
  zconf.y             |    2 
- 11 files changed, 234 insertions(+), 101 deletions(-)
+ 11 files changed, 238 insertions(+), 101 deletions(-)
 
 Index: config/Makefile
 ===================================================================
 --- config.orig/Makefile
 +++ config/Makefile
-@@ -124,6 +124,9 @@
+@@ -124,10 +124,17 @@
  ifeq ($(MAKECMDGOALS),menuconfig)
  	hostprogs-y += mconf
  endif
@@ -26,6 +26,14 @@ Index: config/Makefile
  
  ifeq ($(MAKECMDGOALS),xconfig)
  	qconf-target := 1
+ endif
++ifeq ($(findstring qconf,$(MAKECMDGOALS)),qconf)
++	qconf-target := 1
++endif
++
+ ifeq ($(MAKECMDGOALS),gconfig)
+ 	gconf-target := 1
+ endif
 Index: config/README.buildroot2
 ===================================================================
 --- /dev/null
-- 
1.6.0.4
