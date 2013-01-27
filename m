From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Jan 2013 17:22:35 +0100
Subject: [Buildroot] [git commit] olsr: rework build and install procedure
Message-ID: <20130127162359.9C5229A82E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f8fa1afeb72a89eac9508fcae1ea6e3a42b10ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit reworks the build and install steps of the olsr package,
to fix a number of problems and do minor improvements:

 1. The build step was doing "make <foo>" for each
    plugin. Unfortunately, inside olsr build system, doing "make
    <foo>" for a plugin triggers a clean of the plugin directory, a
    build, and then an installation of the plugin. This installation
    fails because DESTDIR is not passed at the install step. This
    leads to build issues like
    http://autobuild.buildroot.org/results/a9fed78cd0b3991763a797c38387edd4157fbdb9/build-end.log. To
    fix this, we call make in each plugin's directory, which is what
    "make <foo>" was doing internally.

 2. The install step was manually installing the olsrd binary. We now
    instead use the install_bin make target that comes in olsr's build
    system.

 3. The install step was manually installing the olsr plugins. We now
    instead use the install make target available in each plugin's
    makefile.

 4. We use 'install' to install the init script, which avoids the
    manual creation of /etc/init.d.

 5. We use 'install' to install the sample configuration file.

 6. We remove the useless strip commands.

 7. We add a patch that allows us to pass LDCONFIG=/bin/true to avoid
    ldconfig being called during the installation process.

 8. We remove commands from the clean step that were in fact
    uninstallation commands. We don't bother re-adding those commands
    in an uninstallation step, since it is now generally accepted that
    the uninstall step is quite useless and should be deprecated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/olsr/olsr-configurable-ldconfig.patch |   30 +++++++++++++++++++++++++
 package/olsr/olsr.mk                          |   26 +++++++++------------
 2 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/package/olsr/olsr-configurable-ldconfig.patch b/package/olsr/olsr-configurable-ldconfig.patch
new file mode 100644
index 0000000..09e34f1
--- /dev/null
+++ b/package/olsr/olsr-configurable-ldconfig.patch
@@ -0,0 +1,30 @@
+Make ldconfig configurable
+
+In a cross-compilation set up, running /sbin/ldconfig is useless, so
+we make the path to ldconfig configurable through the environment/make
+command line. This allows to pass LDCONFIG=/bin/true when doing
+cross-compilation.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/make/Makefile.linux
+===================================================================
+--- a/make/Makefile.linux
++++ b/make/Makefile.linux
+@@ -3,6 +3,7 @@
+ #
+ 
+ ARCH := $(shell uname -m)
++LDCONFIG ?= /sbin/ldconfig
+ DESTDIR ?=
+ LIBDIR =	$(DESTDIR)$(shell if [ "$(ARCH)" = "x86_64" -a -d "/usr/lib64" ]; then echo "/usr/lib64"; else echo "/usr/lib"; fi)
+ 
+@@ -14,7 +15,7 @@
+ 
+ PLUGIN_FULLNAME ?= $(PLUGIN_NAME).so.$(PLUGIN_VER)
+ INSTALL_LIB =	install -D -m 755 $(PLUGIN_FULLNAME) $(LIBDIR)/$(PLUGIN_FULLNAME); \
+-		/sbin/ldconfig -n $(LIBDIR)
++		$(LDCONFIG) -n $(LIBDIR)
+ 
+ ifdef OLSRD_PLUGIN
+ GENERATE_PIC = true
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index a93312e..be1ae1e 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -9,32 +9,28 @@ OLSR_VERSION_MINOR = 6
 OLSR_VERSION = $(OLSR_VERSION_MAJOR).$(OLSR_VERSION_MINOR)
 OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
-OLSR_BINARY = olsrd
-OLSR_TARGET_BINARY = usr/sbin/olsrd
 #OLSR_PLUGINS=httpinfo tas dot_draw nameservice dyn_gw dyn_gw_plain pgraph bmf quagga secure
 OLSR_PLUGINS = dot_draw dyn_gw secure
-OLSR_TARGET_PLUGIN = usr/lib/
 
 define OLSR_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd $(OLSR_PLUGINS)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd
+	for p in $(OLSR_PLUGINS) ; do \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D)/lib/$$p ; \
+	done
 endef
 
 define OLSR_INSTALL_TARGET_CMDS
-	cp -dpf $(@D)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
-	cp -R $(@D)/lib/*/olsrd_*.so* $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
-	mkdir -p $(TARGET_DIR)/etc/init.d
-	cp -dpf package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install_bin
+	for p in $(OLSR_PLUGINS) ; do \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/$$p \
+			LDCONFIG=/bin/true DESTDIR=$(TARGET_DIR) install ; \
+	done
+	$(INSTALL) -D -m 0755 package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/S50olsr
 	test -r $(TARGET_DIR)/etc/olsrd.conf || \
-		cp -dpf $(@D)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so*
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
+		$(INSTALL) -D -m 0644 $(@D)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
 endef
 
 define OLSR_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY) \
-		$(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so* \
-		$(TARGET_DIR)/etc/init.d/S50olsr \
-		$(TARGET_DIR)/etc/olsrd.conf
 	-$(MAKE) -C $(@D) clean
 endef
 
