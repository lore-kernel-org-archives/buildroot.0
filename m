From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 11:28:41 +0200
Subject: [Buildroot] [git commit] package/micropython: drop patch
Message-ID: <20191018092554.48E778263D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7e75d4c920961c9179230d316dfefd444143c96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch and set GIT_DIR as suggested by upstream during review of an
upstreamable solution, see
https://github.com/micropython/micropython/pull/5002

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/0001-fix-version.patch | 22 ----------------------
 package/micropython/micropython.mk         | 11 ++++++++---
 2 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/package/micropython/0001-fix-version.patch b/package/micropython/0001-fix-version.patch
deleted file mode 100644
index 1bf2992169..0000000000
--- a/package/micropython/0001-fix-version.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Always use the fallback behaviour for determining the version number
-
-When built from within buildroot the micropython build process detects
-that it is inside a git repository and ends up using the buildroot
-version number instead of the correct micropython version number.
-
-Signed-off-by: Chris Packham <judge.packham@gmail.com>
----
-diff -Naur micropython-v1.4.5-old/py/makeversionhdr.py micropython-v1.4.5/py/makeversionhdr.py
---- micropython-v1.4.5-old/py/makeversionhdr.py	2015-08-12 00:42:30.000000000 +1200
-+++ micropython-v1.4.5/py/makeversionhdr.py	2015-09-16 10:21:06.698962836 +1200
-@@ -70,9 +70,7 @@
- 
- def make_version_header(filename):
-     # Get version info using git, with fallback to docs/conf.py
--    info = get_version_info_from_git()
--    if info is None:
--        info = get_version_info_from_docs_conf()
-+    info = get_version_info_from_docs_conf()
- 
-     git_tag, git_hash, ver = info
- 
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index d636d0e869..5824b4ab18 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -10,6 +10,11 @@ MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
 
+# Set GIT_DIR so package won't use buildroot's version number
+MICROPYTHON_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	GIT_DIR=.
+
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
 ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
@@ -22,15 +27,15 @@ MICROPYTHON_MAKE_OPTS = MICROPY_PY_BTREE=0
 MICROPYTHON_MAKE_OPTS += MICROPY_PY_USSL=0
 
 define MICROPYTHON_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
+	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
+	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
 		$(MICROPYTHON_MAKE_OPTS) \
 		CROSS_COMPILE=$(TARGET_CROSS) \
 		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS)
 endef
 
 define MICROPYTHON_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
+	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
 		$(MICROPYTHON_MAKE_OPTS) \
 		CROSS_COMPILE=$(TARGET_CROSS) \
 		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
