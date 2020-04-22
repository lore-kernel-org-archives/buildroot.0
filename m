From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2020 21:29:55 +0200
Subject: [Buildroot] [git commit] packageJopenjdk: add support for building
 the full jdk
Message-ID: <20200422191617.D2BE68FBB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b48a1a650f2b76e43b7ec056167ff1c37d2ddcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some users may require the full JDK on the target to debug their programs.
This change is relatively trivial to add.

While the full JDK does have programs used for compiling on a target,
which is against Buildroot policy, the JDK also has several utilities used for
debugging purposes, which the JRE target does not build, and Buildroot supports
applications used for debugging purposes such as GDB.

As such, JDK support should be available for debugging purposes, and a note in
the Config.in file has been added under the JDK section, which informs the user
that JDK support is for debugging purposes only and that developing on a
target is not supported by Buildroot.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Tested-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - s/OPENJDK_INSTALL_DIR/OPENJDK_VARIANT/
  - slightly rewrap help text
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openjdk/Config.in  | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 package/openjdk/openjdk.mk | 21 ++++++++++++++++--
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index df769bbb35..47585c87ea 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -48,6 +48,60 @@ config BR2_PACKAGE_OPENJDK
 
 if BR2_PACKAGE_OPENJDK
 
+config BR2_PACKAGE_OPENJDK_FULL_JDK
+	bool "Build the full JDK"
+	help
+	  Install the full JDK instead of just the run time.
+	  The full JDK includes several packages used for debugging and
+	  development. Some useful tools included with the JDK are:
+	    - javaws
+	      Command line tool for launching Java Web Start and setting
+	      various options.
+
+	    - jcmd:
+	      JVM Diagnostic Commands tool: Sends diagnostic command
+	      requests to a running Java Virtual Machine.
+
+	    - jinfo
+	      Configuration Info for Java: Prints configuration
+	      information for a given process or core file or a remote
+	      debug server.
+
+	    - jmap
+	      Memory Map for Java: Prints shared object memory maps or
+	      heap memory details of a given process or core file or a
+	      remote debug server.
+
+	    - jsadebugd
+	      Serviceability Agent Debug Daemon for Java: Attaches to a
+	      process or core file and acts as a debug server.
+
+	    - jstack
+	      Stack Trace for Java - Prints a stack trace of threads for
+	      a given process or core file or remote debug server.
+
+	    - jstat
+	      JVM Statistics Monitoring Tool: Attaches to an
+	      instrumented HotSpot Java virtual machine and collects and
+	      logs performance statistics as specified by the command
+	      line options.
+
+	    - jstatd
+	      JVM jstat Daemon - Launches an RMI server application that
+	      monitors for the creation and termination of instrumented
+	      HotSpot Java virtual machines and provides an interface to
+	      allow remote monitoring tools to attach to Java virtual
+	      machines running on the local system.
+
+	  Note:
+	  While the JDK also comes with several tools which can be used
+	  for developing java applications on a target, Buildroot does
+	  not support development on a target. Building the full JDK is
+	  supported for debugging purposes only.
+
+	  Selecting this option increases the file system by
+	  approximately 110M.
+
 choice
 	prompt "openjdk variant"
 	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !BR2_powerpc
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index ffa62dd10d..70e21feb32 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -46,6 +46,14 @@ OPENJDK_JVM_VARIANT = zero
 OPENJDK_DEPENDENCIES += libffi
 endif
 
+ifeq ($(BR2_PACKAGE_OPENJDK_FULL_JDK),y)
+OPENJDK_VARIANT = jdk
+OPENJDK_MAKE_TARGET = jdk-image
+else
+OPENJDK_VARIANT = jre
+OPENJDK_MAKE_TARGET = legacy-jre-image
+endif
+
 # OpenJDK installs a file named 'modules' in jre/lib, which gets installed as
 # /usr/lib/modules. However, with a merged /usr, this conflicts with the
 # directory named 'modules' installed by the kernel. If OpenJDK gets built
@@ -116,16 +124,25 @@ endef
 # Make -jn is unsupported. Instead, set the "--with-jobs=" configure option,
 # and use $(MAKE1).
 define OPENJDK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) legacy-jre-image
+	$(TARGET_MAKE_ENV) $(OPENJDK_CONF_ENV) $(MAKE1) -C $(@D) $(OPENJDK_MAKE_TARGET)
 endef
 
 # Calling make install always builds and installs the JDK instead of the JRE,
 # which makes manual installation necessary.
 define OPENJDK_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)
-	cp -dpfr $(@D)/build/linux-*-release/images/jre/* \
+	cp -dpfr $(@D)/build/linux-*-release/images/$(OPENJDK_VARIANT)/* \
 		$(TARGET_DIR)$(OPENJDK_INSTALL_BASE)/
 	cd $(TARGET_DIR)/usr/bin && ln -snf ../..$(OPENJDK_INSTALL_BASE)/bin/* .
 endef
 
+# Demos and includes are not needed on the target
+ifeq ($(BR2_PACKAGE_OPENJDK_FULL_JDK),y)
+define OPENJDK_REMOVE_UNEEDED_JDK_DIRECTORIES
+	$(RM) -r $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)/include/
+	$(RM) -r $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)/demo/
+endef
+OPENJDK_TARGET_FINALIZE_HOOKS += OPENJDK_REMOVE_UNEEDED_JDK_DIRECTORIES
+endif
+
 $(eval $(generic-package))
