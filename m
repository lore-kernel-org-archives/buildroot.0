From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 21:48:40 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] Config.in: security
 hardening: disable FORTIFY_SOURCE for gcc < 6
Message-ID: <20181125204534.0B0D78830A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25589148f7fccc8937439efac50b1e7ac3ea723f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

As reported in the bug report [1], gcc < 6 doesn't build when
FORTIFY_SOURCE is set to 1 or 2. The issue is related to the
upstream bug report [2] but the patch fixing the issue for gcc 6
has not been backported to earlier gcc versions.

Add a dependency on gcc at least version 6 to BR2_FORTIFY_SOURCE_1
and BR2_FORTIFY_SOURCE_2.

[1] https://bugs.busybox.net/show_bug.cgi?id=11476
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61164
[3] https://github.com/gcc-mirror/gcc/commit/55f12fce4ccf77513644a247f9c401a5b1fa2402

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
[Peter: only limit for internal toolchain as suggested by Matthew]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit a75ee0e8124023185f4a05e95b2fcd29fa9449d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index 584a1f087f..102c8010e5 100644
--- a/Config.in
+++ b/Config.in
@@ -798,6 +798,8 @@ config BR2_FORTIFY_SOURCE_NONE
 
 config BR2_FORTIFY_SOURCE_1
 	bool "Conservative"
+	# gcc bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61164
+	depends on !BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
 	  This option sets _FORTIFY_SOURCE to 1 and only introduces
 	  checks that shouldn't change the behavior of conforming
@@ -805,6 +807,8 @@ config BR2_FORTIFY_SOURCE_1
 
 config BR2_FORTIFY_SOURCE_2
 	bool "Aggressive"
+	# gcc bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61164
+	depends on !BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
 	  This option sets _FORTIFY_SOURCES to 2 and some more
 	  checking is added, but some conforming programs might fail.
