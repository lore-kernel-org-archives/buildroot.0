From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 23:24:26 +0200
Subject: [Buildroot] [git commit] CHANGES: update for 2017.08-rc1
Message-ID: <20170801212140.BF0EA80466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ce80b6a6e609a29a9930626d625f545968d9bb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 137 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 127 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index ce3ea23..f647953 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,7 +1,9 @@
 2017.08-rc1, To be released
 
-	Major revamp of the gettext handling, with user-visible
-	effect:
+	Infrastructure:
+
+	- Major revamp of the gettext handling, with user-visible
+	  effect:
 
 	  - prior to this revamp, when BR2_ENABLE_LOCALE=y, each
 	    package could decide to enable or not NLS support. When
@@ -9,21 +11,136 @@
 	    by passing --disable-nls to packages.
 
 	  - after this revamp, a new BR2_SYSTEM_ENABLE_NLS option
-            controls whether NLS support should be enabled or not in
-            packages. This option defaults to disabled, which means
-            that now, NLS support is by default disabled in all
-            packages.
-
-	Therefore, if you need NLS support in packages, you must now
-	explicitly enable the BR2_SYSTEM_ENABLE_NLS option.
+	    controls whether NLS support should be enabled or not in
+	    packages. This option defaults to disabled, which means
+	    that now, NLS support is by default disabled in all
+	    packages.
 
-	Infrastructure:
+	  Therefore, if you need NLS support in packages, you must now
+	  explicitly enable the BR2_SYSTEM_ENABLE_NLS option.
 
 	- The host directory no longer has a usr/ component. This
 	  makes it much more natural to use that directory as an
 	  externally used toolchain. For compatibility with existing
 	  scripts, a link usr -> . is still added.
 
+	- Hashes are now checked on tarballs by Buildroot when a
+	  package is sourced from a Git repository.
+
+	- Patches are no longer being downloaded from Github, since
+	  auto-generated patches could change over time, and break
+	  hashes. All patches that were downloaded from Github are now
+	  stored in their respective package directories.
+
+	- Hash files in packages can now contain hashes for the
+	  license files contained in the package source code. This
+	  allows to detect changes in such license files.
+
+	- Binaries in $(TARGET_DIR) are now cleaned up from invalid
+	  RPATHs at the end of the build.
+
+	- A new "make sdk" target prepares $(HOST_DIR) to be
+	  relocatable: turns RPATHs in host binaries into relocatable
+	  ones, removes bogus RPATHs from staging binaries/libraries,
+	  and provides a relocate-sdk script that can be executed to
+	  relocate the SDK after installation.
+
+	- Addition of utils/genrandconfig which generates a random
+	  configuration based on a set of pre-defined toolchain
+	  configurations (support/config-fragments/autobuild/) and a
+	  random selection of packages. It is now used by the
+	  autobuilders to generate the random configurations.
+
+	Filesystems:
+
+	- ext2/3/4 filesystems are now generated using mkfs.ext from
+	  e2fsprogs instead of using genext2fs.
+
+	Architecture:
+
+	- Addition of support for ARM big.LITTLE variants
+	- Improved MIPS support, with options to select NaN encoding
+	  and FP32 mode.
+
+	Toolchain:
+
+	- Switch to gcc 6.x as the default gcc version, add support
+	  for gcc 7.x, remove support for gcc 4.8
+	- Support added for gdb 8.0
+	- uClibc-ng bumped to 1.0.26
+	- CodeSourcery toolchains for x86 and SuperH have been
+	  removed, they were using a too old glibc version
+	  (2.17). External toolchains with glibc 2.17 or earlier are
+	  no longer supported.
+	- The version selection in the glibc package has been
+	  removed. Like musl and uClibc-ng, we now use the latest
+	  glibc version.
+	- Improved support for Xtensa toolchain overlays, which can
+	  now be downloaded.
+
+	Tools:
+
+	- Numerous improvements to the runtime test infrastructure
+	- Tests are now executed by Gitlab CI on a regular basis
+	- Tools that are directly useful to the user have been moved
+	  from support/scripts/ to utils/: brmake, check-package,
+	  get-developers, scancpan, scanpipy, size-stats-compare,
+	  test-pkg.
+
+	New defconfigs: A13 Olinuxino, Engicam platforms (i.CoreM6
+	Solo/Dual/DualLite/Quad, RQS SOM, GEAM6UL SOM, Is.IoT MX6UL
+	SOM), Nano Pi M1 (Plus), OrangePi Zero and Plus.
+
+	New packages: azure-iot-sdk-c, cracklib, dt-utils, easy-rsa,
+	erlang-jiffy, erlang-p1-oauth2, erlang-p1-xmpp,
+	ifupdown-scripts, irrlicht, kodi-inputstream-adaptive,
+	kodi-inputstream-rtmp, kvazaar, let-me-create, libloki,
+	libpwquality, libressl, libspatialindex, libva-utils,
+	linuxconsoletools, linuxptp, luaossl, lua-sdl2, lua-stdlib,
+	lsscsi, paxtest, pcre2, pixz, python-asn1crypto,
+	python-backports-shutil-get-terminal-size, python-bcrypt,
+	python-cheroot, python-h2, python-hpack, python-hyperframe,
+	python-hyperlink, python-ipython-genutils, python-pathlib2,
+	python-pickleshare, python-priority, python-portend,
+	python-scandir, python-systemd, python-tempora,
+	python-traitlets, python-typepy, qt5virtualkeyboard,
+	ratpoison, rauc, refpolicy, rhash, sdl2_mixer, sdl2_net,
+	xr819-xradio, zstd
+
+	Removed packages: input-tools, mke2img
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9341: avahi-utils does not compile with uClibc +  libglib2
+	#9441: Link BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY to
+	       BR2_ENABLE_DEBUG
+	#9746: ext4 image generated by Buildroot is not working
+	       properly with U-Boot
+	#9886: Build fails with "unexpected EOF while looking for
+	       matching `"'" if PATH contains a newline
+	#9891: parted 3.1 => 3.2?
+	#9911: qt5 does not build on sparc
+	#9916: qt5 does not build on
+	       arm-buildroot-linux-uclibcgnueabihf for ARMv8 cores
+	#9936: Host QEMU does not build with SDL support because of
+	       pkg-config
+	#9941: nodejs option disappears for arm
+	#9951: SCANCPAN failure
+	#9966: util-linux-2.30/.stamp_built' failed
+	#9976: License file for package 'rtl8821au' incorrect
+	#9991: SGX Error implicit declaration of function
+	       ???dmac_map_area???
+	#10011: wget does not work from Buildroot
+	#10036: Buildroot builds Raspbian Jessie headless image
+		presenting incorrect prompt
+	#10051: make: *** No rule to make target
+		'raspberrpi3_defconfig'. Stop reported with Buildroot
+		v2017.05.1
+	#10056: No .config file was produced in /buildroot folder
+	#10061: gcc5.4 buildroot toolchain for powerpc libsanitizer
+		failure
+	#10076: Makefile:4113: recipe for target 'all-gcc'  failed
+
 2017.05.2, Released July 27th, 2017
 
 	Important / security related fixes.
