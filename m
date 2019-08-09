From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Aug 2019 09:04:28 +0200
Subject: [Buildroot] [git commit] Update for 2019.08-rc1
Message-ID: <20190809070208.8417E8E5AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b9abb0dd03114347d10d09131ad4e96f5583514
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 89 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 +--
 docs/website/download.html | 22 ++++++------
 docs/website/news.html     | 23 ++++++++++++
 4 files changed, 125 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 586195cc20..4a6e42e8fd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,92 @@
+2019.08-rc1, released August 9th, 2019
+
+	Fixes all over the tree and new features.
+
+	toolchain: ARC toolchain updated to 2019.03 (binutils 2.32.51
+	/ GCC 8.3.1 / glibc 2.29), ARM AAarch64/ARM toolchains updated
+	to 2019.03. Add GCC 9.1.0, remove GCC 4.9 and 6.5, add GDB
+	8.3, remove GDB 7.12 and 8.0.1, default to GDB 8.2, GCC
+	8.3.0. Musl updated to 1.1.23, bringing support for RISC-V 64.
+
+	Architectures: Internal toolchain support for C-SKY, support
+	for ARC HS48 v3.1 and HS38 with Quad MAC & FPU, support for
+	ARM A76,  A76/A55 big.LITTLE, emag, neoverse-N1, phecda and
+	tsv110.
+
+	Filesystems: Pass extra pax options to tar for binary
+	reproducibility. Build host-cpio for the --reproducible option
+	support when BR2_REPRODUCIBLE is enabled. Genimage updated to
+	version 11, bringing GPT support.
+
+	Br2-external: Add support for injecting additional options to
+	the list of preconfigured external toolchains and libjpeg and
+	openssl providers using files under provides/. See the manual
+	for details.
+
+	Ensure custom <pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS are
+	passed before the standard exclusions so they are not ignored
+	by rsync when using override-srcdir.
+
+	Gnuconfig updated to 2019-05-28, adding C-SKY support.
+
+	test-pkg: Correct long option handling and clean output dir
+	after a successful build to save disk space.
+
+	support/testing: Emulate a machine with 256MB RAM to fix
+	issues with certain tests running out of memory, use
+	virtio-rng to provide needed entrophy.
+
+	pkg-stats: support outputting in JSON format with --json for
+	easier post processing. The classic HTML output is still
+	available with --html. Parallelize access to
+	release-monitoring.org to speed up runtime.
+
+	Drop non-conventional version prefix/suffix/separators for
+	packages for better compatibility with release-monitoring.org
+
+	Packages:
+	Init systems: Add basic openrc support and
+	<pkg>_INSTALL_INIT_OPENRC variable in the infrastructure to
+	install openrc service scripts if enabled.
+
+	busybox: Build each applet as a separate binary when SELinux
+	is enabled for more finegrained policy control. Use daemon
+	mode for mdev rather than legacy hotplug.
+
+	linux: Workaround -Werror related build failure on powerpc,
+	by forcing CONFIG_PPC_DISABLE_WERROR on.
+
+	Defconfigs: QEMU: use 'rootwait' kernel option to ensure root
+	partition is available before mounting.
+
+	New defconfigs: HiFive Unleashed, I.MX8MM EVK and Pico, Nanopi
+	m4 and neo4, Nanopc t4, Olimex A33 olinuxino, Pine64
+	Rockpro64, PowerPC mac99, QEMU C-SKY 610/807/810/860 virt,
+	Raspberry Pi 4, Raxda rock pi4, Solidrun Clearfog GT-8K
+
+	Removed defconfigs: Odroid C2
+
+	New packages: bitcoin, c-capnproto, fatcat, ifmetric, jack1,
+	jailhouse, libubootenv, luasyslog, mender-grubenv,
+	murata-cyw-fw, openrc, piglit, python-colorama, python-cycler,
+	python-hiredis, python-ifaddr, python-inflection,
+	python-iptables, python-matplotlib, python-periphery,
+	python-pycairo, python-redis, python-termcolor,
+	python-tinyrpc, python-txdbus, skeleton-init-openrc, spdlog,
+	sshguard, stellarium, zziplib
+
+	Removed packages: xapp_mkfontdir
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11096: Upgrade from glibc 2.26 to 2.27 broke some locales...
+	#11271: utils/check-package fails with exception depending on..
+	#11991: [numpy] segfault when compiling for RPi3 64bits
+	#12016: Grub fails to boot bzImage after upgrade to 2019.05
+	#12046: Can???t login as root user after upgrading to buildroot..
+	#12051: package/dhcp installs libtool wrapper scripts on tar...
+	#12076: Patchelf can link against an incompatible libc++ ver...
+
 2019.05.1, Released July 7th, 2019
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index f76d86a976..406efd1ab6 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.08-git
+export BR2_VERSION := 2019.08-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1559462000
+BR2_VERSION_EPOCH = 1565334000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index f88af00a0f..ef3583eebe 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2019.05.1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2019.05-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2019.08-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.05-rc3.tar.gz">buildroot-2019.05-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.05-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.08-rc1.tar.gz">buildroot-2019.08-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.08-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.05-rc3.tar.bz2">buildroot-2019.05-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.05-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.08-rc1.tar.bz2">buildroot-2019.08-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.08-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index ba7030048a..88819e1d99 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,29 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.08-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 August 2019</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the
+	  tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.08-rc1">CHANGES</a>
+	  file for details.
+	</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.08-rc1.tar.bz2">2019.08-rc1
+	    release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
