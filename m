From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Jun 2017 09:27:11 +0200
Subject: [Buildroot] [git commit] kmod: add patch to fix build failure with
	old gcc versions
Message-ID: <20170607073014.00157816A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72c77544bad2491c55db6268e464f2c0e63f0adc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building with old gcc versions (such as gcc 4.3), the current
version of kmod fails with:

shared/util.c:52: error: expected identifier or '(' before 'do'
shared/util.c:52: error: expected identifier or '(' before 'while'

This is due to a use of the internal assert_cc() macro outside of a
function, while this macro is defined for old gcc versions in a way that
cannot be used outside functions.

This wasn't noticed by the autobuilders because we don't have such old
target compilers. On the host side, we have some autobuilder instances
with such old gcc versions, but host-kmod is only used by the linux
package, which is never tested by the autobuilders.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ....c-assert_cc-can-only-be-used-inside-func.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/kmod/0002-shared-util.c-assert_cc-can-only-be-used-inside-func.patch b/package/kmod/0002-shared-util.c-assert_cc-can-only-be-used-inside-func.patch
new file mode 100644
index 0000000..09fe252
--- /dev/null
+++ b/package/kmod/0002-shared-util.c-assert_cc-can-only-be-used-inside-func.patch
@@ -0,0 +1,56 @@
+From 7cd698eb31059012305d8bb7516577c8cd383e32 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 3 Jun 2017 16:52:37 +0200
+Subject: [PATCH] shared/util.c: assert_cc() can only be used inside functions
+
+shared/macro.h has two versions of assert_cc, one that uses gcc
+_Static_assert(), which requires recent enough gcc versions, and one
+that uses a fake array to trigger a build error. The latter can only
+work inside functions, so assert_cc() should only be used inside
+functions.
+
+Fixes the following build failure when building kmod with old gcc
+versions such as gcc 4.3.x:
+
+shared/util.c:52: error: expected identifier or '(' before 'do'
+shared/util.c:52: error: expected identifier or '(' before 'while'
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ shared/util.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/shared/util.c b/shared/util.c
+index 9de080a..fd2028d 100644
+--- a/shared/util.c
++++ b/shared/util.c
+@@ -49,8 +49,6 @@ static const struct kmod_ext {
+ 	{ }
+ };
+ 
+-assert_cc(EAGAIN == EWOULDBLOCK);
+-
+ /* string handling functions and memory allocations                         */
+ /* ************************************************************************ */
+ 
+@@ -201,6 +199,8 @@ ssize_t read_str_safe(int fd, char *buf, size_t buflen)
+ 	size_t todo = buflen - 1;
+ 	size_t done = 0;
+ 
++	assert_cc(EAGAIN == EWOULDBLOCK);
++
+ 	do {
+ 		ssize_t r = read(fd, buf + done, todo);
+ 
+@@ -226,6 +226,8 @@ ssize_t write_str_safe(int fd, const char *buf, size_t buflen)
+ 	size_t todo = buflen;
+ 	size_t done = 0;
+ 
++	assert_cc(EAGAIN == EWOULDBLOCK);
++
+ 	do {
+ 		ssize_t r = write(fd, buf + done, todo);
+ 
+-- 
+2.7.4
+
