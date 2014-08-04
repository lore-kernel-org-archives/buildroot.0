From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:08:42 +0200
Subject: [Buildroot] [git commit] dhcpcd: security bump to version 6.4.3
Message-ID: <20140804180920.76F499D389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac53822bb4b40161842f986faba3d5c9c9f99858
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Issue and CVE req: http://seclists.org/oss-sec/2014/q3/261
Patch upstreamed in a subtly different way.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch |   44 --------------------
 package/dhcpcd/dhcpcd.mk                           |    2 +-
 2 files changed, 1 insertions(+), 45 deletions(-)

diff --git a/package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch b/package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch
deleted file mode 100644
index 4b56e27..0000000
--- a/package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-configure: support builds using ccache
-
-The configure script checks whether CC is executable by means of a check
-'type $CC'. However, when using ccache, CC is normally set to "ccache gcc"
-(using the appropriate paths). Such a compound string is not recognized by
-type, however, and thus configure bails out.
-
-This patch changes the check 'type $CC' with a compile test.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-
-Upstream status: backport of
-http://roy.marples.name/projects/dhcpcd/info/5f4bf91142fceac502c478886aeb5079a184bb43
-
-Note: a simplification of this patch was accepted upstream, but turns out to be
-non-usable by the Xtensa architecture. This was also reported upstream and
-should normally be reverted soon.
-
-diff -r 66c8bdc88858 configure
---- a/configure	Sat Jun 21 16:54:30 2014 +0200
-+++ b/configure	Sun Jun 29 15:42:08 2014 +0200
-@@ -272,8 +272,20 @@
- fi
- 
- echo "Using compiler .. $CC"
--if ! type "$CC" >/dev/null 2>&1; then
--	echo "$CC is not an executable"
-+cat <<EOF >_test.c
-+int main(void) {
-+	return 0;
-+}
-+EOF
-+_CC=true
-+if $CC _test.c -o _test >/dev/null 2>&1; then
-+	[ -x _test ] || _CC=false
-+else
-+	_CC=false
-+fi
-+rm -f _test.c _test
-+if ! $_CC; then
-+	echo "$CC does not create executables"
- 	exit 1
- fi
- [ "$CC" != cc ] && echo "CC=	$CC" >>$CONFIG_MK
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 7a16f52..813a6cf 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.4.0
+DHCPCD_VERSION = 6.4.3
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
