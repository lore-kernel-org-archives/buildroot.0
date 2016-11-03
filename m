From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:54:20 +0100
Subject: [Buildroot] [git commit] CHANGES: extend 2016.11-rc1 changelog
Message-ID: <20161103215717.18523817BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7158a6d6c9a1495f703695a84eef5c338a01826b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Longer explanation of multi-BR2_EXTERNAL
- Mention nobody UID 99 -> 65534 change
- Mention removal of BR2_DEPRECATED
- Mention use of system cmake
- Mention new dependency on ExtUtils::MakeMaker. The other perl
  dependencies are not mentioned since they only apply if mpv is built.
- Mention the $(STAGING_DIR)/$(O) check.
- Mention unsafe path detection in -isystem etc.
- Mention linux-tools split.
- Mention changes in legal-info.
- Mention that pseudo is used instead of fakeroot.
- Correct the info of toolchainfile.cmake: it still sets cflags but it
  doesn't force them anymore (doesn't append).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 57 +++++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index db27bc7..a4ff045 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,25 +2,61 @@
 
 	Fixes all over the tree and new features.
 
+	It is now possible to specify multiple BR2_EXTERNAL
+	directories. The required files in a BR2_EXTERNAL directory
+	have changed to accomodate this feature. Refer to the
+	documentation for details of how to update them. External
+	trees now have a name and a description. Also, it is possible
+	to override a defconfig in the external tree.
+
+	The default skeleton now uses UID 65534 for the "nobody"
+	user instead of UID 99, like most distros do. See
+	https://lwn.net/Articles/695478/ for a complete discussion.
+	Programs and configuration files that explicitly refer to UID
+	99 will have to be updated.
+
+	When the build environment already has a suitable cmake version
+	(3.1 or later), that one will be used instead of building
+	host-cmake. This can speed up the build significantly.
+
+	The ExtUtils::MakeMaker perl module is now required in the
+	build environment.
+
+	An additional check is done during the build that files are
+	not installed in the output directory within the output
+	directory. This happens e.g. when the target directory is
+	contained both in --prefix and in DESTDIR. The build will
+	terminate with an error message that specifies which package
+	and which file caused the failure.
+
+	The concept of "deprecated packages" and the BR2_DEPRECATED
+	option have been removed. Instead, packages are removed
+	immediately. Packages are only removed when they don't work
+	for some reason. If you still need a removed package and
+	you have a solution for the problem(s) that caused the
+	removal, please contribute it.
+
 	Architecture: support for sh64 removed, improved support for
-	MIPS core selection,
+	MIPS core selection.
 
 	Toolchain: support for musl powerpc64le, mips64 and mipsr6
 	toolchains, ARC toolchain components updates, gcc 6.x series
 	bumped to 6.2.0, default binutils version switched to 2.26,
 	default gcc version switched to gcc 5.x, Linaro toolchains
-	updated, uclibc-ng bumped to 1.0.19.
-
-	Core infrastructure: support for multiple BR2_EXTERNAL
-	directories.
+	updated, uclibc-ng bumped to 1.0.19. GCC is now always built
+	with TLS support. Checking of unsafe compiler options (that
+	point to host directories) has been extended with -isystem,
+	-idirafter and -iquote.
 
 	Package infrastructure: new variable $(PKG)_DL_OPTS, addition
 	of <pkg>-show-rdepends to list reverse dependencies, and
-	<pkg>-graph-rdepends to graph reverse dependencies.
+	<pkg>-graph-rdepends to graph reverse dependencies. Linux tools
+	are now in a separate linux-tools package instead of in the
+	kernel build. Fakeroot has been replaced by pseudo.
 
 	CMake support: the toolchainfile.cmake file now provides a
 	definition of the CMAKE_BUILD_TYPE variable. The
-	toolchainfile.cmake also no longer passes the compiler/linker
+	toolchainfile.cmake also no longer forces the compiler/linker
 	flags defined by Buildroot.
 
 	New defconfigs: WaRP7, Solidrun's MX6 Cubox/Hummingboard,
@@ -40,11 +76,16 @@
 
 	Removed packages: binutils 2.24, gcc 4.7, ipkg,
 	kodi-addon-xvdr, libgail, sstrip, torsmo, webkit, webkitgtk24,
-	wvdial, wvstreams,
+	wvdial, wvstreams.
 
 	Documentation: the list of packages that was present in the
 	Buildroot manual has been removed.
 
+	Legal info: the "licenses.txt" file that concatenates all
+	license texts is no longer generated - it was not considered
+	useful. The manifest.csv contains an empty cell instead of
+	"not saved" when no license file is available.
+
 	Other: addition of a DEVELOPERS file listing developers taking
 	care of packages or architectures.
 
