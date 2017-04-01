From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Apr 2017 19:38:13 +0200
Subject: [Buildroot] [PATCH] package/systemd: better patch to avoid ln
	--relative
Message-ID: <20170401173813.23665-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently have two patches that address the ln --relative issue
differently. The first one changes the behaviour to generate absolute
symlinks, which is incorrect; the second provides an ad-hoc solution
for a single case.

Replace both of them with a single patch that mimics ln --relative when
the host ln does not support it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 .../systemd/0002-build-check-for-ln-relative.patch | 96 ++++++++++++++++++++++
 ...uild-sys-revert-use-of-ln-relative-option.patch | 72 ----------------
 .../0004-install-don-t-use-ln-relative.patch       | 40 ---------
 3 files changed, 96 insertions(+), 112 deletions(-)
 create mode 100644 package/systemd/0002-build-check-for-ln-relative.patch
 delete mode 100644 package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
 delete mode 100644 package/systemd/0004-install-don-t-use-ln-relative.patch

diff --git a/package/systemd/0002-build-check-for-ln-relative.patch b/package/systemd/0002-build-check-for-ln-relative.patch
new file mode 100644
index 0000000..1547f62
--- /dev/null
+++ b/package/systemd/0002-build-check-for-ln-relative.patch
@@ -0,0 +1,96 @@
+From c78fa2b40cb8b810d06ef225e30f12a7ed44ffa2 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 1 Apr 2017 11:26:29 +0200
+Subject: [PATCH] build: check for ln --relative
+
+ln --relative is recent enough that not all distributions support it.
+This is especially the case for enterprise-grade distributions than can
+have a life-span of more than a decade.
+
+Detect if ln supports --relative and use it if so.
+
+If not supported, use a bit of sed magic to construct the ../ sequence,
+that leads back to / when appended to the destination directory.
+
+We introduce this as a macro that expands to a single command. To avoid
+complexity in the macro, we expect paths to be passed whitout the
+leading DESTDIR.
+
+---
+Upstream status: submitted, disputed:
+    https://github.com/systemd/systemd/pull/5682
+
+---
+ Makefile.am  | 25 ++++++++++++++++++++++---
+ configure.ac |  5 ++++-
+ 2 files changed, 26 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1cc657a..ec503f2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -300,6 +300,24 @@ install-busnames-target-wants-hook:
+ 	what="$(BUSNAMES_TARGET_WANTS)" && wants=busnames.target && dir=$(systemunitdir) && $(add-wants)
+ 	what="$(USER_BUSNAMES_TARGET_WANTS)" && wants=busnames.target && dir=$(userunitdir) && $(add-wants)
+ 
++# Macro to emulate ln --relative when needed
++# $(1): options for ln, except --relative
++# $(2): source file, absolute path without leading DESTDIR
++# $(3): destination file, absolute path without leading DESTDIR
++if HAVE_LN_RELATIVE
++define ln-s-relative
++	$(LN_S) --relative $(1) \
++		$(DESTDIR)$(strip $(2)) \
++		$(DESTDIR)$(strip $(3))
++endef
++else
++define ln-s-relative
++	$(LN_S) $(1) \
++		`dirname $(strip $(3)) |sed -r -e 's:/+[^/]+:../:g; s:/$$::'`$(strip $(2)) \
++		$(DESTDIR)$(strip $(3))
++endef
++endif
++
+ define add-wants
+ 	[ -z "$$what" ] || ( \
+ 	  dir=$(DESTDIR)$$dir/$$wants.wants && \
+@@ -313,8 +331,9 @@ install-directories-hook:
+ 	$(MKDIR_P) $(addprefix $(DESTDIR),$(INSTALL_DIRS))
+ 
+ install-environment-conf-hook: install-directories-hook
+-	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(sysconfdir)/environment \
+-		$(DESTDIR)$(environmentdir)/99-environment.conf
++	$(AM_V_LN)$(call ln-s-relative,-f,\
++			$(sysconfdir)/environment,\
++			$(environmentdir)/99-environment.conf)
+ 
+ install-aliases-hook:
+ 	set -- $(SYSTEM_UNIT_ALIASES) && \
+@@ -337,7 +356,7 @@ define install-relative-aliases
+ 	while [ -n "$$1" ]; do \
+ 		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
+ 		rm -f $(DESTDIR)$$dir/$$2 && \
+-		$(LN_S) --relative $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
++		$(call ln-s-relative,,$$1,$$dir/$$2) && \
+ 		shift 2 || exit $$?; \
+ 	done
+ endef
+diff --git a/configure.ac b/configure.ac
+index cf37ca6..d586fc4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -108,7 +108,10 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
+ 
+-AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
++AC_MSG_CHECKING([if ln supports --relative])
++AS_IF([! ${LN_S} --relative --help > /dev/null 2>&1], [ln_relative=no], [ln_relative=yes])
++AC_MSG_RESULT([$ln_relative])
++AM_CONDITIONAL([HAVE_LN_RELATIVE], [test "x$ln_relative" = "xyes"])
+ 
+ M4_DEFINES=
+ 
+-- 
+2.9.3
+
diff --git a/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch b/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
deleted file mode 100644
index 2c1d929..0000000
--- a/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 32b6c22006767f0762edfa116b8b0f7be0c5c121 Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Wed, 27 Jul 2016 15:43:16 +0200
-Subject: [PATCH] build-sys: revert use of ln relative option.
-
-Systemd build system now uses the `--relative` option from `ln(1)`.
-
-This option was added to GNU coreutils 8.16, which is not widely
-deployed yet by GNU/Linux distributions (not available in Debian Wheezy
-for example).
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-[Maxime: refresh the patch]
-[Vincent:
-  refresh the patch, move-to-rootlibdir removed by:
-  https://github.com/systemd/systemd/commit/082210c7a837063fd8b520b18c221b42059d7eff
-]
-Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- Makefile.am  | 11 ++---------
- configure.ac |  2 --
- 2 files changed, 2 insertions(+), 11 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 0c27f81..4de1595 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -312,9 +312,9 @@ install-aliases-hook:
- 	set -- $(SYSTEM_UNIT_ALIASES) && \
- 		dir=$(systemunitdir) && $(install-aliases)
- 	set -- $(USER_UNIT_ALIASES) && \
--		dir=$(userunitdir) && $(install-relative-aliases)
-+		dir=$(userunitdir) && $(install-aliases)
- 	set -- $(GENERAL_ALIASES) && \
--		dir= && $(install-relative-aliases)
-+		dir= && $(install-aliases)
-
- define install-aliases
- 	while [ -n "$$1" ]; do \
-@@ -325,15 +325,6 @@ define install-aliases
- 	done
- endef
-
--define install-relative-aliases
--	while [ -n "$$1" ]; do \
--		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
--		rm -f $(DESTDIR)$$dir/$$2 && \
--		$(LN_S) --relative $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
--		shift 2 || exit $$?; \
--	done
--endef
--
- install-touch-usr-hook:
- 	touch -c $(DESTDIR)/$(prefix)
-
-diff --git a/configure.ac b/configure.ac
-index cf595e6..d58f303 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
- AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
- AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
-
--AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
--
- M4_DEFINES=
-
- AC_CHECK_TOOL(OBJCOPY, objcopy)
---
-2.8.1
-
diff --git a/package/systemd/0004-install-don-t-use-ln-relative.patch b/package/systemd/0004-install-don-t-use-ln-relative.patch
deleted file mode 100644
index 2d8cf53..0000000
--- a/package/systemd/0004-install-don-t-use-ln-relative.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From cdb52b24436f0926fd6c56e129c843f49f9b1ed0 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Fri, 31 Mar 2017 23:15:09 +0200
-Subject: [PATCH] install: don't use ln --relative
-
-ln --relative is too recent to be available in most distros, so it
-breaks the build.
-
-Fix that with a bit of sed magic, that turns constituents of the
-destination directory each into ../ , which when appended to the
-destination directory leads back straight to / .
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-The problem is even more visible when doing cross-compilation in
-professional build farms, which are often stuck to years-to-decade-old
-enterprise-grade distributions (because, IT), even if the target system
-is top-notch up-to-date.
----
- Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 1cc657a..ef11e93 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -314,7 +314,8 @@ install-directories-hook:
- 	$(MKDIR_P) $(addprefix $(DESTDIR),$(INSTALL_DIRS))
- 
- install-environment-conf-hook: install-directories-hook
--	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(sysconfdir)/environment \
-+	dir=$(shell echo $(environmentdir) |sed -r -e 's:/+[^/]+:../:g'); \
-+	$(AM_V_LN)$(LN_S) -f $${dir}$(sysconfdir)/environment \
- 		$(DESTDIR)$(environmentdir)/99-environment.conf
- 
- install-aliases-hook:
--- 
-2.9.3
-
-- 
2.9.3
