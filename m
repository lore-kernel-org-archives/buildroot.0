From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Nov 2013 09:03:07 +0100
Subject: [Buildroot] [git commit] libtool: Apply upstream patch to set
	correct linkage on MIPS64
Message-ID: <20131130080744.58B489BE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4268d3967e2d691c151d6b5629e4051deb077b9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This libtool change ensures that ld uses the right machine emulation file,
which will allow to fix several MIPS64 n64 link failures, such as the one
currently visible on the libiscsi package.  Packages affected by this
problem will have to use <pkg>_AUTORECONF = YES to benefit from this libtool
fix, until they are fixed upstream.

Acked-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libtool/libtool-0001-mips64-n64-linking.patch  |   47 ++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/libtool/libtool-0001-mips64-n64-linking.patch b/package/libtool/libtool-0001-mips64-n64-linking.patch
new file mode 100644
index 0000000..ef9084d
--- /dev/null
+++ b/package/libtool/libtool-0001-mips64-n64-linking.patch
@@ -0,0 +1,47 @@
+sets correct linker ABI flags on MIPS64
+http://git.savannah.gnu.org/cgit/libtool.git/commit/?id=5f7f7d9615bf650cf99d581a33b3e18357f79951
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -ru libtool-2.4.2.orig/libltdl/m4/libtool.m4 libtool-2.4.2/libltdl/m4/libtool.m4
+--- libtool-2.4.2.orig/libltdl/m4/libtool.m4	2013-11-11 11:44:30.419396295 +0000
++++ libtool-2.4.2/libltdl/m4/libtool.m4	2013-11-11 11:44:07.055032308 +0000
+@@ -1312,6 +1312,38 @@
+   rm -rf conftest*
+   ;;
+ 
++mips64*-*linux*)
++  # Find out what ABI is being produced by ac_compile, and set linker
++  # options accordingly.
++  echo '[#]line '$LINENO' "configure"' > conftest.$ac_ext
++  if AC_TRY_EVAL(ac_compile); then
++    emul=elf
++    case `/usr/bin/file conftest.$ac_objext` in
++      *32-bit*)
++      emul="${emul}32"
++      ;;
++      *64-bit*)
++      emul="${emul}64"
++      ;;
++    esac
++    case `/usr/bin/file conftest.$ac_objext` in
++      *MSB*)
++      emul="${emul}btsmip"
++      ;;
++      *LSB*)
++      emul="${emul}ltsmip"
++      ;;
++    esac
++    case `/usr/bin/file conftest.$ac_objext` in
++      *N32*)
++      emul="${emul}n32"
++      ;;
++    esac
++    LD="${LD-ld} -m $emul"
++    fi
++  rm -rf conftest*
++  ;;
++
+ x86_64-*kfreebsd*-gnu|x86_64-*linux*|ppc*-*linux*|powerpc*-*linux*| \
+ s390*-*linux*|s390*-*tpf*|sparc*-*linux*)
+   # Find out which ABI we are using.
