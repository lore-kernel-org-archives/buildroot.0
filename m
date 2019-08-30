From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 22:36:13 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python3: fix
 configure issue for musl/uclibc GCC 8+ toolchains on powerpc
Message-ID: <20190830203211.A1C31888A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a02325adf45e9f695a85bc6aa861e2ecfa14b008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
http://autobuild.buildroot.net/results/cb4/cb49c539501342e45cbe5ade82e588fcdf51f05b

GCC commit 6834b83784dcf0364eb820e8 (multiarch support for non-glibc linux
systems), which is part of GCC 8+, changed the multiarch logic to use
$arch-linux-musl / $arch-linux-uclibc rather than $arch-linux-gnu.

This then causes the python3 configure script to error out:

checking for the platform triplet based on compiler characteristics... powerpc-linux-gnu
configure: error: internal configure error for the platform triplet, please file a bug report

http://autobuild.buildroot.net/results/cb4/cb49c539501342e45cbe5ade82e588fcdf51f05b

As it requires that the --print-multiarch output (if not empty) matches the
deduced triplet (which always uses -linux-gnu).

It isn't quite clear why --print-multiarch returns something for a
non-multiarch toolchain on some architectures (E.G.  PowerPC), but as a
workaround, add a patch to rewrite the --print-multiarch output to match
older GCC versions to keep the configure script happy.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 38b28e48d8d89fc3696fa4c77fa2e2a5c1e88ac7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-fixup-CC-print-multiarch-output-for-mus.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
new file mode 100644
index 0000000000..19a0f23e7b
--- /dev/null
+++ b/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -0,0 +1,48 @@
+From e1a2c27bcb9091f851ef7a9c7d59822a125a0b8e Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Fri, 2 Aug 2019 15:53:16 +0200
+Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
+ musl/uclibc GCC 8+ toolchains
+
+GCC commit 6834b83784dcf0364eb820e8 (multiarch support for non-glibc linux
+systems), which is part of GCC 8+, changed the multiarch logic to use
+$arch-linux-musl / $arch-linux-uclibc rather than $arch-linux-gnu.
+
+This then causes the python3 configure script to error out:
+
+checking for the platform triplet based on compiler characteristics... powerpc-linux-gnu
+configure: error: internal configure error for the platform triplet, please file a bug report
+
+http://autobuild.buildroot.net/results/cb4/cb49c539501342e45cbe5ade82e588fcdf51f05b
+
+As it requires that the --print-multiarch output (if not empty) matches the
+deduced triplet (which always uses -linux-gnu).
+
+It isn't quite clear why --print-multiarch returns something for a
+non-multiarch toolchain on some architectures (E.G.  PowerPC), but as a
+workaround, rewrite the --print-multiarch output to match older GCC versions
+to keep the configure script happy.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e5fb7e7b0b..9c64f960d6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -724,7 +724,9 @@ then
+ fi
+ 
+ 
+-MULTIARCH=$($CC --print-multiarch 2>/dev/null)
++# GCC 8+ returns $arch-linux-{musl,uclibc} for musl/uClibc based
++# toolchains confusing python. Fix that up
++MULTIARCH=$($CC --print-multiarch 2>/dev/null | sed -E 's/-linux-(musl|uclibc)*$/-linux-gnu/')
+ AC_SUBST(MULTIARCH)
+ 
+ AC_MSG_CHECKING([for the platform triplet based on compiler characteristics])
+-- 
+2.11.0
+
