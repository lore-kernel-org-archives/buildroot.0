From: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
Date: Sun, 26 Apr 2015 20:45:55 -0400
Subject: [Buildroot] [PATCH v3 1/1] Makefile: add target to clean targetfs
In-Reply-To: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
Message-ID: <1430095555-8484-1-git-send-email-emeric.vigier@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you had some files added to the targetfs (fs-overlay, new packages,
...) and you no longer need them, buildroot does not offer a simple way
to remove these items from the output/target directory. The rule added
by this commit allows you to clean the targetfs. Issuing 'make'
afterward will generate a new and clean targetfs.

A section in the documentation is also added. It describes few examples
when developers could need it. 'make help' is also updated accordingly.
And full-rebuild section of the documentation is updated with content
and links.

Change-Id: I42b640e845bb4195fb7b160281b16ee40883f01f
Signed-off-by: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
---
Changes v2 -> v3
  - rename clean-target into target-clean (sugg. Jerome Oufella)
  - print a big fat warning at the end of target-clean (sugg. Arnout
    Vandecappelle)
  - mention the new rule in full-rebuild manual section (sugg. Ryan
    Barnett)

Changes v1 -> v2
  - remove non-existent .built and deprecated .stamp_installed
    references (suggested by Baruch Siach)
  - mention the new target in 'make help'
---
 Makefile                                | 13 +++++++++++
 docs/manual/advanced.txt                |  2 ++
 docs/manual/clean-target-filesystem.txt | 39 +++++++++++++++++++++++++++++++++
 docs/manual/rebuilding-packages.txt     | 29 ++++++++++++++----------
 4 files changed, 71 insertions(+), 12 deletions(-)
 create mode 100644 docs/manual/clean-target-filesystem.txt

diff --git a/Makefile b/Makefile
index 3983fce..b9db264 100644
--- a/Makefile
+++ b/Makefile
@@ -666,6 +666,18 @@ graph-depends: graph-depends-requirements
 	|tee $(GRAPHS_DIR)/$(@).dot \
 	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT)
 
+target-clean:
+	@echo "----------------------------------------------------------------"
+	@echo "WARNING! target-clean does not fix package dependencies for you."
+	@echo "Think twice about what you are attempting! For instance, if you "
+	@echo "remove openssl needed by git, and just run make target-clean "
+	@echo "without rebuilding git, your rootfs will embed a broken git. It "
+	@echo "will fail to execute because it is linked again +openssl+, and  "
+	@echo "this library is not present anymore on your target rootfs."
+	@echo "----------------------------------------------------------------"
+	rm -rf $(TARGET_DIR) $(STAGING_DIR) $(BUILD_DIR)/.root \
+		$(BUILD_DIR)/*/.stamp_target_installed $(BUILD_DIR)/*/.stamp_staging_installed
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -821,6 +833,7 @@ help:
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete all files created by build'
 	@echo '  distclean              - delete all non-source files (including .config)'
+	@echo '  target-clean           - delete targetfs and staging directories'
 	@echo
 	@echo 'Build:'
 	@echo '  all                    - make world'
diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
index b7bfc49..1cf0427 100644
--- a/docs/manual/advanced.txt
+++ b/docs/manual/advanced.txt
@@ -14,3 +14,5 @@ include::download-location.txt[]
 include::package-make-target.txt[]
 
 include::using-buildroot-development.txt[]
+
+include::clean-target-filesystem.txt[]
diff --git a/docs/manual/clean-target-filesystem.txt b/docs/manual/clean-target-filesystem.txt
new file mode 100644
index 0000000..3e8181e
--- /dev/null
+++ b/docs/manual/clean-target-filesystem.txt
@@ -0,0 +1,39 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[clean-target-filesystem]]
+==== Clean target filesystem
+
+There are various cases where you would like to clean the target
+filesystem. Especially once you understood that buildroot does not
+have rules to uninstall files. Let's take some examples:
+
+1. You enabled +PACKAGE_OPENSSH+ to have a SSH server running on your
+   board. But you figure out that +sshd+ does not run well on your
+   target's architecture. Thus you decide to disable +PACKAGE_OPENSSH+
+   and enable +PACKAGE_DROPBEAR+ instead. You run +make+: +dropbear+
+   gets built and installed, fine. But +openssh+ files are still present
+   in +output/target+!
+
+2. You enabled +PACKAGE_NTPD+ and set the local timezone to
+   +America/Montreal+ with +BR2_TARGET_LOCALTIME+ config. Then you find
+   out that +Montreal+ local has been replaced by +Toronto+ (French
+   looks like a rogue language). You enter +make menuconfig+, make the
+   change, save, and run +make+ again. Problem:
+   +output/target/etc/timezone+ still has +America/Montreal+ content!
+
+Solution to this is either to identify which package to reconfigure, or
+remove files manually, or destroy the target filesystem and recreate it.
+This latter option is convenient: you don't have to care about which
+packages to rebuild, and it is quite fast. Here is how to recreate your
+target filesystem, and get rid of filesystem _stains_:
+
+------------------
+make target-clean
+make
+------------------
+
++target-clean+ removes +output/target+. That tells buildroot to recreate
+the target skeleton, and install each package again. This is a
+convenient way to rebuild your target filesystem cleanly without
+rebuilding everything.
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 6faa67a..82385ae 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -39,17 +39,22 @@ can help you understand how to work with Buildroot:
    you would like to have SSL support in +ctorrent+, so you enable the
    +openssl+ package in Buildroot configuration and restart the
    build. Buildroot will detect that +openssl+ should be built and
-   will be build it, but it will not detect that +ctorrent+ should be
-   rebuilt to benefit from +openssl+ to add OpenSSL support. You will
-   either have to do a full rebuild, or rebuild +ctorrent+ itself.
+   will build it, but it will not detect that +ctorrent+ should be
+   rebuilt to benefit from +openssl+ support. You will either have to
+   do a full rebuild, or rebuild +ctorrent+ itself.
 
  * When a package is removed from the configuration, Buildroot does
    not do anything special. It does not remove the files installed by
    this package from the target root filesystem or from the toolchain
-   _sysroot_. A full rebuild is needed to get rid of this
-   package. However, generally you don't necessarily need this package
-   to be removed right now: you can wait for the next lunch break to
-   restart the build from scratch.
+   _sysroot_. To make sure that the target filesystem and _sysroot_
+   reflects your changes, you can use +make target-clean+ as described
+   in xref:clean-target-filesystem[]. Warning! +target-clean+
+   does not fix package dependencies for you. You still have to think
+   twice about what you are attempting. For instance, if you remove
+   +openssl+ needed by +git+, and just +target-clean+ without
+   rebuilding +git+, your rootfs will embed a broken +git+. It will
+   fail to work because it is linked again +openssl+, but this library
+   is not present anymore on your target rootfs.
 
  * When the sub-options of a package are changed, the package is not
    automatically rebuilt. After making such changes, rebuilding only
@@ -59,11 +64,11 @@ can help you understand how to work with Buildroot:
    not track when a package should be rebuilt: once a package has been
    built, it is never rebuilt unless explicitly told to do so.
 
- * When a change to the root filesystem skeleton is made, a full
-   rebuild is needed. However, when changes to the root filesystem
-   overlay, a post-build script or a post-image script are made,
-   there is no need for a full rebuild: a simple +make+ invocation
-   will take the changes into account.
+ * When a change to the root filesystem skeleton is made, clean the
+   target filesystem (xref:clean-target-filesystem[]). However, when
+   changes to the root filesystem overlay, a post-build script or a
+   post-image script are made, this is not needed: a simple +make+
+   invocation will take the changes into account.
 
 Generally speaking, when you're facing a build error and you're unsure
 of the potential consequences of the configuration changes you've
-- 
1.9.1
