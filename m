From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:16:04 +0200
Subject: [Buildroot] [git commit] dhcpcd: correct ccache-fixing patch for
	Xtensa
Message-ID: <20140629141608.B917F9D106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a50b0811988ec1f3f08b13613d374bfcbad379b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Xtensa gcc does not seem to like output on /dev/null. The applied patch
on dhcpcd is thus unusable, and a more verbose version involving a temporary
file is needed.

Reported-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch |   28 ++++++++++++++-----
 1 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch b/package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch
index c162306..4b56e27 100644
--- a/package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch
+++ b/package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch
@@ -9,23 +9,35 @@ This patch changes the check 'type $CC' with a compile test.
 
 Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 
-Upstream status: another implementation was submitted, modified by
-maintainer Roy, then simplified based on my suggestion. This patch is a fold
-of the two upstream patches:
+Upstream status: backport of
 http://roy.marples.name/projects/dhcpcd/info/5f4bf91142fceac502c478886aeb5079a184bb43
-http://roy.marples.name/projects/dhcpcd/info/26bc10be2405659bdf31d690a72d377d6b67ebd4
+
+Note: a simplification of this patch was accepted upstream, but turns out to be
+non-usable by the Xtensa architecture. This was also reported upstream and
+should normally be reverted soon.
 
 diff -r 66c8bdc88858 configure
 --- a/configure	Sat Jun 21 16:54:30 2014 +0200
-+++ b/configure	Sun Jun 22 15:20:25 2014 +0200
-@@ -272,8 +272,9 @@
++++ b/configure	Sun Jun 29 15:42:08 2014 +0200
+@@ -272,8 +272,20 @@
  fi
  
  echo "Using compiler .. $CC"
 -if ! type "$CC" >/dev/null 2>&1; then
 -	echo "$CC is not an executable"
-+if ! echo "int main(void) { return 0; }" | $CC -x c -o /dev/null - 2>/dev/null
-+then
++cat <<EOF >_test.c
++int main(void) {
++	return 0;
++}
++EOF
++_CC=true
++if $CC _test.c -o _test >/dev/null 2>&1; then
++	[ -x _test ] || _CC=false
++else
++	_CC=false
++fi
++rm -f _test.c _test
++if ! $_CC; then
 +	echo "$CC does not create executables"
  	exit 1
  fi
