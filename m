From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 22:20:05 +0200
Subject: [Buildroot] [git commit branch/next] package/ctorrent: fix
	compilation under musl.
Message-ID: <20150808105650.1CA497FD56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5ba8d60f73fce1e839be784db912d9527e2f974
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/2c9/2c9ef771d146ce5b9df82735fdeb62926c84bd9f/

Build failed due to use of ssize_t without including <unistd.h>.

Patch submitted upstream (note: project appears dormant).

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ctorrent/0001-fix-musl-build.patch |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/ctorrent/0001-fix-musl-build.patch b/package/ctorrent/0001-fix-musl-build.patch
new file mode 100644
index 0000000..3ba80be
--- /dev/null
+++ b/package/ctorrent/0001-fix-musl-build.patch
@@ -0,0 +1,20 @@
+[PATCH] Fix compilation on musl
+
+Using the ssize_t typedef requires including <unistd.h>. 
+
+See : https://sourceforge.net/p/dtorrent/patches/3/
+
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+Upstream-status: submitted
+---
+diff -Nur a/compat.c b/compat.c
+--- a/compat.c	2015-07-29 18:22:24.658415171 +0100
++++ b/compat.c	2015-07-29 18:36:21.752576311 +0100
+@@ -63,6 +63,7 @@
+ 
+ #ifndef HAVE_STRNSTR
+ #include <string.h>
++#include <unistd.h>
+ /* FUNCTION PROGRAMER: Siberiaic Sang */
+ char *strnstr(const char *haystack, const char *needle, size_t haystacklen)
+ {
