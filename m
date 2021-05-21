From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 12:02:48 +0200
Subject: [Buildroot] [git commit branch/next] package/libselinux: bump to
 version 3.2
Message-ID: <20210521093436.F1867817D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7ff47516ea01436c53b4d1e2b7a5b595ef3ed80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also drop upstream patch
0003-libselinux-rename-gettid-to-something-which-never-conflicts.patch

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Matthew Weber <matthew.weber@collins.com>
Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...PYCEXT-and-rely-on-the-installed-file-nam.patch |  2 +-
 ...gettid-to-something-which-never-conflicts.patch | 71 ----------------------
 package/libselinux/libselinux.hash                 |  2 +-
 package/libselinux/libselinux.mk                   |  4 +-
 4 files changed, 4 insertions(+), 75 deletions(-)

diff --git a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
index cbd98a61ad..18c79b3b4d 100644
--- a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
+++ b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
@@ -36,7 +36,7 @@ index 190016e2af34..7ee22fd35da3 100644
  RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + RbConfig::CONFIG["rubyarchhdrdir"] + " -I" + RbConfig::CONFIG["rubyhdrdir"]')
  RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
  RUBYINSTALL ?= $(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
-@@ -176,7 +175,7 @@ install: all
+@@ -184,7 +183,7 @@ install: all
  install-pywrap: pywrap
  	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)` $(PYTHON_SETUP_ARGS)
  	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
diff --git a/package/libselinux/0003-libselinux-rename-gettid-to-something-which-never-conflicts.patch b/package/libselinux/0003-libselinux-rename-gettid-to-something-which-never-conflicts.patch
deleted file mode 100644
index 2a23e98f9b..0000000000
--- a/package/libselinux/0003-libselinux-rename-gettid-to-something-which-never-conflicts.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 398d2ceef92cb1baac18e6b34a1a8e1bf41296cd Mon Sep 17 00:00:00 2001
-From: Nicolas Iooss <nicolas.iooss@m4x.org>
-Date: Tue, 16 Feb 2021 22:13:28 +0100
-Subject: [PATCH] libselinux: rename gettid() to something which never
- conflicts with the libc
-
-Musl recently added a wrapper for gettid() syscall. There is no way to
-detect this new version in a reliable way, so rename our gettid()
-wrapper to a non-conflicting name.
-
-Introduce a new function which, when using a libc known to provide a
-wrapper for gettid(), calls it, and which, otherwise, performs the
-syscall directly.
-
-Anyway this function is only used on systems where /proc/thread-self
-does not exist, which are therefore running Linux<3.17.
-
-Fixes: https://github.com/SELinuxProject/selinux/issues/282
-Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
-Acked-by: Petr Lautrbach <plautrba@redhat.com>
-[Retrieved from:
-https://github.com/SELinuxProject/selinux/commit/398d2ceef92cb1baac18e6b34a1a8e1bf41296cd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/procattr.c | 18 ++++++++++--------
- 1 file changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/src/procattr.c b/src/procattr.c
-index 1aa67ac53..840570525 100644
---- a/src/procattr.c
-+++ b/src/procattr.c
-@@ -25,21 +25,23 @@ static __thread char destructor_initialized;
- /* Bionic and glibc >= 2.30 declare gettid() system call wrapper in unistd.h and
-  * has a definition for it */
- #ifdef __BIONIC__
--  #define OVERRIDE_GETTID 0
-+  #define HAVE_GETTID 1
- #elif !defined(__GLIBC_PREREQ)
--  #define OVERRIDE_GETTID 1
-+  #define HAVE_GETTID 0
- #elif !__GLIBC_PREREQ(2,30)
--  #define OVERRIDE_GETTID 1
-+  #define HAVE_GETTID 0
- #else
--  #define OVERRIDE_GETTID 0
-+  #define HAVE_GETTID 1
- #endif
- 
--#if OVERRIDE_GETTID
--static pid_t gettid(void)
-+static pid_t selinux_gettid(void)
- {
-+#if HAVE_GETTID
-+	return gettid();
-+#else
- 	return syscall(__NR_gettid);
--}
- #endif
-+}
- 
- static void procattr_thread_destructor(void __attribute__((unused)) *unused)
- {
-@@ -94,7 +96,7 @@ static int openattr(pid_t pid, const char *attr, int flags)
- 		if (fd >= 0 || errno != ENOENT)
- 			goto out;
- 		free(path);
--		tid = gettid();
-+		tid = selinux_gettid();
- 		rc = asprintf(&path, "/proc/self/task/%d/attr/%s", tid, attr);
- 	} else {
- 		errno = EINVAL;
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 1101b40501..797b978ee1 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 ea5dcbb4d859e3f999c26a13c630da2f16dff9462e3cc8cb7b458ac157d112e7 libselinux-3.1.tar.gz
+sha256 df758ef1d9d4811051dd901ea6b029ae334ffd7c671c128beb16bce1e25ac161 libselinux-3.2.tar.gz
 
 # Hash for license file
 sha256 86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364 LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index fdd13aa942..0f36db1cfd 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.1
-LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
+LIBSELINUX_VERSION = 3.2
+LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 LIBSELINUX_CPE_ID_VENDOR = selinuxproject
