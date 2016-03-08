From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:00:08 +0100
Subject: [Buildroot] [git commit] lttng-tools: fix musl build
Message-ID: <20160308200014.A837A7FCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a51f2d05ce69f57294f1e81ea156082e520d8e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two patches fixing musl build issues:

  * musl doesn't provide the __GLIBC_PREREQ macro

  * musl requires sys/types.h for mode_t

Fixes:
http://autobuild.buildroot.net/results/ac9/ac9aa3b6c468a0a6ba84758d3c9c8acc20d7fa00/
http://autobuild.buildroot.net/results/40f/40f11afb0512a89dcdad332d28ff1c5fcc435e7f/
http://autobuild.buildroot.net/results/3c6/3c66b5f05b482f33d1bc6eabe817f6d7aa21086d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ld-failure-when-__GLIBC_PREREQ-is-missing.patch | 55 ++++++++++++++++++++++
 .../0002-Fix-add-missing-sys-types.h-header.patch  | 29 ++++++++++++
 package/lttng-tools/lttng-tools.mk                 |  2 +
 3 files changed, 86 insertions(+)

diff --git a/package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch b/package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
new file mode 100644
index 0000000..2c01dea
--- /dev/null
+++ b/package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
@@ -0,0 +1,55 @@
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 8 Mar 2016 14:25:34 +0200
+Subject: [PATCH] Fix: build failure when __GLIBC_PREREQ is missing
+
+The musl C library does not provide the __GLIBC_PREREQ macro. Instead of
+relying on glibc version test, check directly for the availability of
+epoll_create1().
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: sent upstream rebased on master branch
+(http://lists.lttng.org/pipermail/lttng-dev/2016-March/025593.html)
+
+ configure.ac             | 2 +-
+ src/common/compat/poll.h | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 66d83b60b017..4fc1160c9a08 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,7 +70,7 @@ AC_CHECK_FUNCS([ \
+ 	gethostbyname gethostname getpagesize localtime_r memchr memset \
+ 	mkdir munmap putenv realpath rmdir socket strchr strcspn strdup \
+ 	strncasecmp strndup strpbrk strrchr strstr strtol strtoul \
+-	strtoull \
++	strtoull epoll_create1 \
+ ])
+ 
+ # Babeltrace viewer check
+diff --git a/src/common/compat/poll.h b/src/common/compat/poll.h
+index 699901848dc1..84f25d5c85aa 100644
+--- a/src/common/compat/poll.h
++++ b/src/common/compat/poll.h
+@@ -73,7 +73,7 @@ enum {
+ 	LPOLLNVAL = EPOLLHUP,
+ 	LPOLLRDHUP = EPOLLRDHUP,
+ 	/* Close on exec feature of epoll */
+-#if __GLIBC_PREREQ(2, 9)
++#if defined(HAVE_EPOLL_CREATE1) && defined(EPOLL_CLOEXEC)
+ 	LTTNG_CLOEXEC = EPOLL_CLOEXEC,
+ #else
+ 	/*
+@@ -127,7 +127,7 @@ extern int compat_epoll_create(struct lttng_poll_event *events,
+ #define lttng_poll_create(events, size, flags) \
+ 	compat_epoll_create(events, size, flags)
+ 
+-#if __GLIBC_PREREQ(2, 9)
++#if defined(HAVE_EPOLL_CREATE1) && defined(EPOLL_CLOEXEC)
+ static inline int compat_glibc_epoll_create(int size __attribute__((unused)),
+ 		int flags)
+ {
+-- 
+2.7.0
+
diff --git a/package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch b/package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch
new file mode 100644
index 0000000..5ce2da5
--- /dev/null
+++ b/package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch
@@ -0,0 +1,29 @@
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 8 Mar 2016 14:40:49 +0200
+Subject: [PATCH] Fix: add missing sys/types.h header
+
+The musl C library requires inclusion of sys/types.h for mode_t.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: sent upstream
+(http://lists.lttng.org/pipermail/lttng-dev/2016-March/025594.html)
+
+ src/common/runas.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/runas.h b/src/common/runas.h
+index 2c5565af3646..ac1143eecf84 100644
+--- a/src/common/runas.h
++++ b/src/common/runas.h
+@@ -19,6 +19,7 @@
+  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+  */
+ 
++#include <sys/types.h>
+ #include <unistd.h>
+ #include <pthread.h>
+ 
+-- 
+2.7.0
+
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index c33d6c2..e5b1207 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -10,6 +10,8 @@ LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+, LGPLv2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr
+# Patching configure.ac
+LTTNG_TOOLS_AUTORECONF = YES
 
 # The host-lttng-babeltrace technically isn't a required build
 # dependency. However, having the babeltrace utilities built for the
