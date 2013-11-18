From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 18 Nov 2013 10:56:46 +0000
Subject: [Buildroot] [PATCH] Apply upstream patch to set correct linkage on
	MIPS64
Message-ID: <1384772206-57234-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libtool/libtool-mips64-n64-linking.patch |   47 ++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 package/libtool/libtool-mips64-n64-linking.patch

diff --git a/package/libtool/libtool-mips64-n64-linking.patch b/package/libtool/libtool-mips64-n64-linking.patch
new file mode 100644
index 0000000..1de8ab6
--- /dev/null
+++ b/package/libtool/libtool-mips64-n64-linking.patch
@@ -0,0 +1,47 @@
+This patch sets the correct linker ABI flags on MIPS64
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
-- 
1.7.1
