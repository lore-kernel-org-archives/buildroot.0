From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  1 Jan 2018 08:09:44 -0500
Subject: [Buildroot] [PATCH v2 1/1] systemd: bump to 236, convert to meson
Message-ID: <20180101130944.12583-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd is no longer an autotools package, as such, it has now been converted
over to meson.

Even though systemd234 has meson support, it is broken with gcc7, as such
the revision bump and conversion to meson must be in a single patch.

Changes include:
  - Change systemd from an autotools package to a generic package
  - Changing all the options from --enable/disable to -Doption=true/false
  - Remove --without-python (no longer an option)
  - Remove all of the ac_cv_path_ variables, and move them into CONF_OPTS
    with the prefix -Doption-path=/path.
  - Add sha256sum's for the license files.
  - Remove 0002-build-check-for-ln-relative.patch and add
    0002-install-dont-use-ln-relative.patch in its place, the old patch relied on autotools and is no longer relevant.
  - Add 0004-add-false-option-for-tests.patch. With the conversion to meson,
    systemd no longer has the option to disable unit tests from being built.
    This patch re-adds the functionality. This prevents 381 files from being
    built, and prevents gcrypt from becoming a dependency.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
Changes v1 -> v2:
  - Added 0002-install-dont-use-ln-relative.patch to allow older systems to
    build. (Yann)
  - Added 0004-add-false-option-for-tests.patch to turn off building tests.
  - Added default paths for telinit, kill, kmod, kexec, sulogin, mount, 
    and umount. (Yann)
  - Added --libdir='/usr/lib' and -Drootlibdir='/usr/lib' to SYSTEMD_CONF_OPTS
    to prevent systemd from placing the libraries into the incorrect target
    directories. (Yann)
  - Removed -Drootprefix='/' and -Dsplit-user=true as the default settings where
    correct.
  - Removed "SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto" as it no longer
    applies.
  - Added -j$(PARALLEL_JOBS) to SYSTEMD_NINJA_OPTS (Yann)


 .../systemd/0002-build-check-for-ln-relative.patch |  98 --------
 .../0002-install-don-t-use-ln-relative.patch       |  76 +++++++
 .../systemd/0004-add-false-option-for-tests.patch  | 150 ++++++++++++
 package/systemd/systemd.hash                       |   5 +-
 package/systemd/systemd.mk                         | 252 +++++++++++----------
 5 files changed, 357 insertions(+), 224 deletions(-)
 delete mode 100644 package/systemd/0002-build-check-for-ln-relative.patch
 create mode 100644 package/systemd/0002-install-don-t-use-ln-relative.patch
 create mode 100644 package/systemd/0004-add-false-option-for-tests.patch

diff --git a/package/systemd/0002-build-check-for-ln-relative.patch b/package/systemd/0002-build-check-for-ln-relative.patch
deleted file mode 100644
index 817ce5010a..0000000000
--- a/package/systemd/0002-build-check-for-ln-relative.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From b60e16cc2ef8c9b4c05c4348a980d3312f2e1cb4 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Fri, 28 Jul 2017 07:04:07 -0400
-Subject: [PATCH] build: check for ln --relative
-
-ln --relative is recent enough that not all distributions support it.
-This is especially the case for enterprise-grade distributions than can
-have a life-span of more than a decade.
-
-Detect if ln supports --relative and use it if so.
-
-If not supported, use a bit of sed magic to construct the ../ sequence,
-that leads back to / when appended to the destination directory.
-
-We introduce this as a macro that expands to a single command. To avoid
-complexity in the macro, we expect paths to be passed whitout the
-leading DESTDIR.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[Adam: Refresh for 234]
-Signed-off-by: Adam Duskett  <aduskett@gmail.com>
----
-Upstream-Status: Denied [No desire to support building on old distributions]
-    https://github.com/systemd/systemd/pull/5682
-
- Makefile.am  | 25 ++++++++++++++++++++++---
- configure.ac |  5 ++++-
- 2 files changed, 26 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index c16e622..bed097f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -305,6 +305,24 @@ install-busnames-target-wants-hook:
- 	what="$(BUSNAMES_TARGET_WANTS)" && wants=busnames.target && dir=$(systemunitdir) && $(add-wants)
- 	what="$(USER_BUSNAMES_TARGET_WANTS)" && wants=busnames.target && dir=$(userunitdir) && $(add-wants)
- 
-+# Macro to emulate ln --relative when needed
-+# $(1): options for ln, except --relative
-+# $(2): source file, absolute path without leading DESTDIR
-+# $(3): destination file, absolute path without leading DESTDIR
-+if HAVE_LN_RELATIVE
-+define ln-s-relative
-+	$(LN_S) --relative $(1) \
-+		$(DESTDIR)$(strip $(2)) \
-+		$(DESTDIR)$(strip $(3))
-+endef
-+else
-+define ln-s-relative
-+	$(LN_S) $(1) \
-+		`dirname $(strip $(3)) |sed -r -e 's:/+[^/]+:../:g; s:/$$::'`$(strip $(2)) \
-+		$(DESTDIR)$(strip $(3))
-+endef
-+endif
-+
- define add-wants
- 	[ -z "$$what" ] || ( \
- 	  dir=$(DESTDIR)$$dir/$$wants.wants && \
-@@ -318,8 +336,9 @@ install-directories-hook:
- 	$(MKDIR_P) $(addprefix $(DESTDIR),$(INSTALL_DIRS))
- 
- install-environment-conf-hook: install-directories-hook
--	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(sysconfdir)/environment \
--		$(DESTDIR)$(environmentdir)/99-environment.conf
-+	$(AM_V_LN)$(call ln-s-relative,-f,\
-+			$(sysconfdir)/environment,\
-+			$(environmentdir)/99-environment.conf)
- 
- install-aliases-hook:
- 	set -- $(SYSTEM_UNIT_ALIASES) && \
-@@ -342,7 +361,7 @@ define install-relative-aliases
- 	while [ -n "$$1" ]; do \
- 		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
- 		rm -f $(DESTDIR)$$dir/$$2 && \
--		$(LN_S) --relative $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
-+		$(call ln-s-relative,,$$1,$$dir/$$2) && \
- 		shift 2 || exit $$?; \
- 	done
- endef
-diff --git a/configure.ac b/configure.ac
-index c7537aa..9354441 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -109,7 +109,10 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
- AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
- AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
- 
--AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
-+AC_MSG_CHECKING([if ln supports --relative])
-+AS_IF([! ${LN_S} --relative --help > /dev/null 2>&1], [ln_relative=no], [ln_relative=yes])
-+AC_MSG_RESULT([$ln_relative])
-+AM_CONDITIONAL([HAVE_LN_RELATIVE], [test "x$ln_relative" = "xyes"])
- 
- M4_DEFINES=
- 
--- 
-2.13.3
-
diff --git a/package/systemd/0002-install-don-t-use-ln-relative.patch b/package/systemd/0002-install-don-t-use-ln-relative.patch
new file mode 100644
index 0000000000..e76ce4378a
--- /dev/null
+++ b/package/systemd/0002-install-don-t-use-ln-relative.patch
@@ -0,0 +1,76 @@
+From ecf3b9baaebda1d9182c22dc504e32ed275d4abb Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Sun, 31 Dec 2017 12:46:04 -0500
+Subject: [PATCH] install: don't use ln --relative
+
+Oldish enterprise-class distributions have too old versions of
+coreutils, with ln not supporting --relative.
+
+So we fake it.
+
+ln --relative would create minimalist relative paths, but they are not
+trivial to generate. Instead, we always create paths relative to the
+root, i.e.:
+
+    ln -s --relative /usr/bin/foo /usr/sbin/foo
+
+would create:  /usr/sbin/foo -> ../bin/foo
+while we do :  /usr/sbin/foo -> ../../usr/bin/foo
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[aduskett at gmail.com: Added meson.build section and dirname wrapper in add-wants]
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ meson.build                 | 2 +-
+ tools/meson-make-symlink.sh | 3 ++-
+ units/meson-add-wants.sh    | 5 +++--
+ 3 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index ddc061c..614201a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -531,7 +531,7 @@ foreach prog : progs
+ endforeach
+ 
+ if run_command('ln', '--relative', '--help').returncode() != 0
+-        error('ln does not support --relative')
++        message('ln does not support --relative')
+ endif
+ 
+ ############################################################
+diff --git a/tools/meson-make-symlink.sh b/tools/meson-make-symlink.sh
+index 47a5e70..e9002ad 100755
+--- a/tools/meson-make-symlink.sh
++++ b/tools/meson-make-symlink.sh
+@@ -7,5 +7,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
+ if [ "$(dirname $1)" = . ]; then
+         ln -vfs -T "$1" "${DESTDIR:-}$2"
+ else
+-        ln -vfs -T --relative "${DESTDIR:-}$1" "${DESTDIR:-}$2"
++        dds="$( dirname "$2" |sed -r -e 's:/+[^/]+:../:g; s:/$::' )"
++        ln -vfs -T "${dds}$1" "${DESTDIR:-}$2"
+ fi
+diff --git a/units/meson-add-wants.sh b/units/meson-add-wants.sh
+index dfd287e..8c08283 100755
+--- a/units/meson-add-wants.sh
++++ b/units/meson-add-wants.sh
+@@ -13,7 +13,7 @@ case "$target" in
+                 ;;
+ esac
+ 
+-unitpath="${DESTDIR:-}${unitdir}/${unit}"
++unitpath="${unitdir}/${unit}"
+ 
+ case "$target" in
+         */)
+@@ -24,4 +24,5 @@ case "$target" in
+                 ;;
+ esac
+ 
+-ln -vfs --relative "$unitpath" "$dir"
++dds="$( dirname `printf "%s" "${dir#${DESTDIR:-}}" |sed -r -e 's:/+[^/]+:../:g; s:/$::'` )"
++ln -vfs "$dds$unitpath" "$dir"
+-- 
+2.14.3
+
diff --git a/package/systemd/0004-add-false-option-for-tests.patch b/package/systemd/0004-add-false-option-for-tests.patch
new file mode 100644
index 0000000000..1796ee9be6
--- /dev/null
+++ b/package/systemd/0004-add-false-option-for-tests.patch
@@ -0,0 +1,150 @@
+From ebeb780df4ca5a8e5a43da1b38492964d8817455 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Mon, 1 Jan 2018 08:01:01 -0500
+Subject: [PATCH] add false option for tests
+
+Currently there is no way to not build tests. This introduces two problems:
+
+1) It adds a extra 381 files to compile.
+2) One of these tests explicitly requires libgcrypt to be built even if systemd
+   is not using it.
+
+This patch adds the option "false" to tests, adds a check around the
+foreach loop that compiles the tests to see if tests is set to false,
+and adds a check around finding g++ as it's only used for tests and
+is not needed.
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ meson.build       | 91 +++++++++++++++++++++++++++++--------------------------
+ meson_options.txt |  2 +-
+ 2 files changed, 49 insertions(+), 44 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index ddc061c..4dcdd41 100644
+--- a/meson.build
++++ b/meson.build
+@@ -260,10 +260,12 @@ cc = meson.get_compiler('c')
+ pkgconfig = import('pkgconfig')
+ check_compilation_sh = find_program('tools/meson-check-compilation.sh')
+ 
+-cxx = find_program('c++', required : false)
+-if cxx.found()
+-        #  Used only for tests
+-        add_languages('cpp')
++if get_option('tests') != 'false'
++	cxx = find_program('c++', required : false)
++	if cxx.found()
++            #  Used only for tests
++            add_languages('cpp')
++    endif
+ endif
+ 
+ foreach arg : ['-Wextra',
+@@ -2388,48 +2390,51 @@ executable('systemd-sulogin-shell',
+            install_dir : rootlibexecdir)
+ 
+ ############################################################
++if want_tests == 'false'
++        message('Not compiling because tests is set to false')
++else
++        foreach tuple : tests
++                sources = tuple[0]
++                link_with = tuple[1].length() > 0 ? tuple[1] : [libshared]
++                dependencies = tuple[2]
++                condition = tuple.length() >= 4 ? tuple[3] : ''
++                type = tuple.length() >= 5 ? tuple[4] : ''
++                defs = tuple.length() >= 6 ? tuple[5] : []
++                incs = tuple.length() >= 7 ? tuple[6] : includes
++                timeout = 30
++
++                name = sources[0].split('/')[-1].split('.')[0]
++                if type.startswith('timeout=')
++                        timeout = type.split('=')[1].to_int()
++                        type = ''
++                endif
+ 
+-foreach tuple : tests
+-        sources = tuple[0]
+-        link_with = tuple[1].length() > 0 ? tuple[1] : [libshared]
+-        dependencies = tuple[2]
+-        condition = tuple.length() >= 4 ? tuple[3] : ''
+-        type = tuple.length() >= 5 ? tuple[4] : ''
+-        defs = tuple.length() >= 6 ? tuple[5] : []
+-        incs = tuple.length() >= 7 ? tuple[6] : includes
+-        timeout = 30
+-
+-        name = sources[0].split('/')[-1].split('.')[0]
+-        if type.startswith('timeout=')
+-                timeout = type.split('=')[1].to_int()
+-                type = ''
+-        endif
+-
+-        if condition == '' or conf.get(condition) == 1
+-                exe = executable(
+-                        name,
+-                        sources,
+-                        include_directories : incs,
+-                        link_with : link_with,
+-                        dependencies : dependencies,
+-                        c_args : defs,
+-                        install_rpath : rootlibexecdir,
+-                        install : install_tests,
+-                        install_dir : join_paths(testsdir, type))
+-
+-                if type == 'manual'
+-                        message('@0@ is a manual test'.format(name))
+-                elif type == 'unsafe' and want_tests != 'unsafe'
+-                        message('@0@ is an unsafe test'.format(name))
++                if condition == '' or conf.get(condition) == 1
++                        exe = executable(
++                                name,
++                                sources,
++                                include_directories : incs,
++                                link_with : link_with,
++                                dependencies : dependencies,
++                                c_args : defs,
++                                install_rpath : rootlibexecdir,
++                                install : install_tests,
++                                install_dir : join_paths(testsdir, type))
++
++                        if type == 'manual'
++                                message('@0@ is a manual test'.format(name))
++                        elif type == 'unsafe' and want_tests != 'unsafe'
++                                message('@0@ is an unsafe test'.format(name))
++                        else
++                                test(name, exe,
++                                     env : test_env,
++                                     timeout : timeout)
++                        endif
+                 else
+-                        test(name, exe,
+-                             env : test_env,
+-                             timeout : timeout)
++                        message('Not compiling @0@ because @1@ is not true'.format(name, condition))
+                 endif
+-        else
+-                message('Not compiling @0@ because @1@ is not true'.format(name, condition))
+-        endif
+-endforeach
++        endforeach
++endif
+ 
+ test_libsystemd_sym = executable(
+         'test-libsystemd-sym',
+diff --git a/meson_options.txt b/meson_options.txt
+index f0c0506..0caba0c 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -284,7 +284,7 @@ option('bashcompletiondir', type : 'string',
+ option('zshcompletiondir', type : 'string',
+        description : 'directory for zsh completion scripts ["no" disables]')
+ 
+-option('tests', type : 'combo', choices : ['true', 'unsafe'],
++option('tests', type : 'combo', choices : ['true', 'unsafe', 'false'],
+        description : 'enable extra tests with =unsafe')
+ option('slow-tests', type : 'boolean', value : 'false',
+        description : 'run the slow tests by default')
+-- 
+2.14.3
+
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 9a1f926e4d..d8f6365c9c 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,5 @@
 # sha256 locally computed
-sha256 da3e69d10aa1c983d33833372ad4929037b411ac421fb085c8cee79ae1d80b6a  systemd-234.tar.gz
+sha256	0cadccfa7109232ec2a469d41ca595d5595b83b648b534ea669c15dbca904c43	systemd-236.tar.gz
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
+sha256	f6a739f5ee7f10df6467021066038297c0150ff680db9a4b9f60da53b11aa560	README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9f286fd54b..ef31a0f6c6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,20 +4,20 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 234
+SYSTEMD_VERSION = 236
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
+	host-gperf \
 	host-intltool \
-	libcap \
-	util-linux \
+	host-meson \
 	kmod \
-	host-gperf
+	libcap \
+	util-linux
 
 SYSTEMD_PROVIDES = udev
-SYSTEMD_AUTORECONF = YES
 
 # Make sure that systemd will always be built after busybox so that we have
 # a consistent init setup between two builds
@@ -26,268 +26,249 @@ SYSTEMD_DEPENDENCIES += busybox
 endif
 
 SYSTEMD_CONF_OPTS += \
-	--with-rootprefix= \
-	--enable-blkid \
-	--enable-static=no \
-	--disable-manpages \
-	--disable-ima \
-	--disable-libcryptsetup \
-	--disable-efi \
-	--disable-gnuefi \
-	--disable-ldconfig \
-	--disable-tests \
-	--disable-coverage \
-	--with-default-dnssec=no \
-	--without-python
-
-SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
-
-# Override paths to a few utilities needed at runtime, to
-# avoid finding those we would install in $(HOST_DIR).
-SYSTEMD_CONF_ENV = \
-	CFLAGS="$(SYSTEMD_CFLAGS)" \
-	ac_cv_path_KILL=/usr/bin/kill \
-	ac_cv_path_KMOD=/usr/bin/kmod \
-	ac_cv_path_KEXEC=/usr/sbin/kexec \
-	ac_cv_path_SULOGIN=/usr/sbin/sulogin \
-	ac_cv_path_MOUNT_PATH=/usr/bin/mount \
-	ac_cv_path_UMOUNT_PATH=/usr/bin/umount
-
-define SYSTEMD_RUN_INTLTOOLIZE
-	cd $(@D) && $(HOST_DIR)/bin/intltoolize --force --automake
-endef
-SYSTEMD_PRE_CONFIGURE_HOOKS += SYSTEMD_RUN_INTLTOOLIZE
+	--prefix=/usr \
+	--libdir='/usr/lib' \
+	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
+	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf \
+	-Drootlibdir='/usr/lib' \
+	-Dblkid=true \
+	-Dman=false \
+	-Dima=false \
+	-Dlibcryptsetup=false \
+	-Defi=false \
+	-Dgnu-efi=false \
+	-Dldconfig=false \
+	-Ddefault-dnssec=no \
+	-Dtests=false \
+	-Dtelinit-path=$(TARGET_DIR)/sbin/telinit \
+	-Dkill-path=/usr/bin/kill \
+	-Dkmod-path=/usr/bin/kmod \
+	-Dkexec-path=/usr/sbin/kexec \
+	-Dsulogin-path=/usr/sbin/sulogin \
+	-Dmount-path=/usr/bin/mount \
+	-Dumount-path=/usr/bin/umount
 
 ifeq ($(BR2_PACKAGE_ACL),y)
-SYSTEMD_CONF_OPTS += --enable-acl
 SYSTEMD_DEPENDENCIES += acl
+SYSTEMD_CONF_OPTS += -Dacl=true
 else
-SYSTEMD_CONF_OPTS += --disable-acl
+SYSTEMD_CONF_OPTS += -Dacl=false
 endif
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
-SYSTEMD_CONF_OPTS += --enable-audit
 SYSTEMD_DEPENDENCIES += audit
+SYSTEMD_CONF_OPTS += -Daudit=true
 else
-SYSTEMD_CONF_OPTS += --disable-audit
+SYSTEMD_CONF_OPTS += -Daudit=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIDN),y)
-SYSTEMD_CONF_OPTS += --enable-libidn
 SYSTEMD_DEPENDENCIES += libidn
+SYSTEMD_CONF_OPTS += -Dlibidn=true
 else
-SYSTEMD_CONF_OPTS += --disable-libidn
+SYSTEMD_CONF_OPTS += -Dlibidn=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-SYSTEMD_CONF_OPTS += --enable-seccomp
 SYSTEMD_DEPENDENCIES += libseccomp
+SYSTEMD_CONF_OPTS += -Dseccomp=true
 else
-SYSTEMD_CONF_OPTS += --disable-seccomp
+SYSTEMD_CONF_OPTS += -Dseccomp=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
-SYSTEMD_CONF_OPTS += --enable-xkbcommon
 SYSTEMD_DEPENDENCIES += libxkbcommon
+SYSTEMD_CONF_OPTS += -Dxkbcommon=true
 else
-SYSTEMD_CONF_OPTS += --disable-xkbcommon
+SYSTEMD_CONF_OPTS += -Dxkbcommon=false
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 SYSTEMD_DEPENDENCIES += bzip2
-SYSTEMD_CONF_OPTS += --enable-bzip2
+SYSTEMD_CONF_OPTS += -Dbzip2=true
 else
-SYSTEMD_CONF_OPTS += --disable-bzip2
+SYSTEMD_CONF_OPTS += -Dbzip2=false
 endif
 
 ifeq ($(BR2_PACKAGE_LZ4),y)
 SYSTEMD_DEPENDENCIES += lz4
-SYSTEMD_CONF_OPTS += --enable-lz4
+SYSTEMD_CONF_OPTS += -Dlz4=true
 else
-SYSTEMD_CONF_OPTS += --disable-lz4
+SYSTEMD_CONF_OPTS += -Dlz4=false
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 SYSTEMD_DEPENDENCIES += linux-pam
-SYSTEMD_CONF_OPTS += --enable-pam
+SYSTEMD_CONF_OPTS += -Dpam=true
 else
-SYSTEMD_CONF_OPTS += --disable-pam
+SYSTEMD_CONF_OPTS += -Dpam=false
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
 SYSTEMD_DEPENDENCIES += xz
-SYSTEMD_CONF_OPTS += --enable-xz
+SYSTEMD_CONF_OPTS += -Dxz=true
 else
-SYSTEMD_CONF_OPTS += --disable-xz
+SYSTEMD_CONF_OPTS += -Dxz=false
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 SYSTEMD_DEPENDENCIES += zlib
-SYSTEMD_CONF_OPTS += --enable-zlib
+SYSTEMD_CONF_OPTS += -Dzlib=true
 else
-SYSTEMD_CONF_OPTS += --disable-zlib
+SYSTEMD_CONF_OPTS += -Dzlib=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 SYSTEMD_DEPENDENCIES += libcurl
-SYSTEMD_CONF_OPTS += --enable-libcurl
+SYSTEMD_CONF_OPTS += -Dlibcurl=true
 else
-SYSTEMD_CONF_OPTS += --disable-libcurl
+SYSTEMD_CONF_OPTS += -Dlibcurl=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
-SYSTEMD_CONF_OPTS += \
-	--enable-gcrypt \
-	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
-	--with-libgpg-error-prefix=$(STAGING_DIR)/usr
+SYSTEMD_CONF_OPTS += -Dgcrypt=true
 else
-SYSTEMD_CONF_OPTS += --disable-gcrypt
+SYSTEMD_CONF_OPTS += -Dgcrypt=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
-SYSTEMD_CONF_OPTS += --enable-microhttpd
+SYSTEMD_CONF_OPTS += -Dmicrohttpd=true
 ifeq ($(BR2_PACKAGE_LIBQRENCODE),y)
-SYSTEMD_CONF_OPTS += --enable-qrencode
+SYSTEMD_CONF_OPTS += -Dqrencode=true
 SYSTEMD_DEPENDENCIES += libqrencode
 else
-SYSTEMD_CONF_OPTS += --disable-qrencode
+SYSTEMD_CONF_OPTS += -Dqrencode=false
 endif
 else
-SYSTEMD_CONF_OPTS += --disable-microhttpd --disable-qrencode
+SYSTEMD_CONF_OPTS += -Dmicrohttpd=false -Dqrencode=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 SYSTEMD_DEPENDENCIES += libselinux
-SYSTEMD_CONF_OPTS += --enable-selinux
+SYSTEMD_CONF_OPTS += -Dselinux=true
 else
-SYSTEMD_CONF_OPTS += --disable-selinux
+SYSTEMD_CONF_OPTS += -Dselinux=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
-SYSTEMD_CONF_OPTS += --enable-hwdb
+SYSTEMD_CONF_OPTS += -Dhwdb=true
 else
-SYSTEMD_CONF_OPTS += --disable-hwdb
+SYSTEMD_CONF_OPTS += -Dhwdb=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_BINFMT),y)
-SYSTEMD_CONF_OPTS += --enable-binfmt
+SYSTEMD_CONF_OPTS += -Dbinfmt=true
 else
-SYSTEMD_CONF_OPTS += --disable-binfmt
+SYSTEMD_CONF_OPTS += -Dbinfmt=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_VCONSOLE),y)
-SYSTEMD_CONF_OPTS += --enable-vconsole
+SYSTEMD_CONF_OPTS += -Dvconsole=true
 else
-SYSTEMD_CONF_OPTS += --disable-vconsole
+SYSTEMD_CONF_OPTS += -Dvconsole=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_QUOTACHECK),y)
-SYSTEMD_CONF_OPTS += --enable-quotacheck
-SYSTEMD_CONF_ENV += \
-	ac_cv_path_QUOTAON=/usr/sbin/quotaon \
-	ac_cv_path_QUOTACHECK=/usr/sbin/quotacheck
+SYSTEMD_CONF_OPTS += -Dquotacheck=true
 else
-SYSTEMD_CONF_OPTS += --disable-quotacheck
-SYSTEMD_CONF_ENV += \
-	ac_cv_path_QUOTAON=/.missing \
-	ac_cv_path_QUOTACHECK=/.missing
+SYSTEMD_CONF_OPTS += -Dquotacheck=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
-SYSTEMD_CONF_OPTS += --enable-tmpfiles
+SYSTEMD_CONF_OPTS += -Dtmpfiles=true
 else
-SYSTEMD_CONF_OPTS += --disable-tmpfiles
+SYSTEMD_CONF_OPTS += -Dtmpfiles=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
-SYSTEMD_CONF_OPTS += --enable-sysusers
+SYSTEMD_CONF_OPTS += -Dsysusers=true
 else
-SYSTEMD_CONF_OPTS += --disable-sysusers
+SYSTEMD_CONF_OPTS += -Dsysusers=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_FIRSTBOOT),y)
-SYSTEMD_CONF_OPTS += --enable-firstboot
+SYSTEMD_CONF_OPTS += -Dfirstboot=true
 else
-SYSTEMD_CONF_OPTS += --disable-firstboot
+SYSTEMD_CONF_OPTS += -Dfirstboot=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_RANDOMSEED),y)
-SYSTEMD_CONF_OPTS += --enable-randomseed
+SYSTEMD_CONF_OPTS += -Drandomseed=true
 else
-SYSTEMD_CONF_OPTS += --disable-randomseed
+SYSTEMD_CONF_OPTS += -Drandomseed=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_BACKLIGHT),y)
-SYSTEMD_CONF_OPTS += --enable-backlight
+SYSTEMD_CONF_OPTS += -Dbacklight=true
 else
-SYSTEMD_CONF_OPTS += --disable-backlight
+SYSTEMD_CONF_OPTS += -Dbacklight=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_RFKILL),y)
-SYSTEMD_CONF_OPTS += --enable-rfkill
+SYSTEMD_CONF_OPTS += -Drfkill=true
 else
-SYSTEMD_CONF_OPTS += --disable-rfkill
+SYSTEMD_CONF_OPTS += -Drfkill=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
-SYSTEMD_CONF_OPTS += --enable-logind
+SYSTEMD_CONF_OPTS += -Dlogind=true
 else
-SYSTEMD_CONF_OPTS += --disable-logind
+SYSTEMD_CONF_OPTS += -Dlogind=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
-SYSTEMD_CONF_OPTS += --enable-machined
+SYSTEMD_CONF_OPTS += -Dmachined=true
 else
-SYSTEMD_CONF_OPTS += --disable-machined
+SYSTEMD_CONF_OPTS += -Dmachined=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_IMPORTD),y)
-SYSTEMD_CONF_OPTS += --enable-importd
+SYSTEMD_CONF_OPTS += -Dimportd=true
 else
-SYSTEMD_CONF_OPTS += --disable-importd
+SYSTEMD_CONF_OPTS += -Dimportd=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_HOSTNAMED),y)
-SYSTEMD_CONF_OPTS += --enable-hostnamed
+SYSTEMD_CONF_OPTS += -Dhostnamed=true
 else
-SYSTEMD_CONF_OPTS += --disable-hostnamed
+SYSTEMD_CONF_OPTS += -Dhostnamed=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_MYHOSTNAME),y)
-SYSTEMD_CONF_OPTS += --enable-myhostname
+SYSTEMD_CONF_OPTS += -Dmyhostname=true
 else
-SYSTEMD_CONF_OPTS += --disable-myhostname
+SYSTEMD_CONF_OPTS += -Dmyhostname=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMEDATED),y)
-SYSTEMD_CONF_OPTS += --enable-timedated
+SYSTEMD_CONF_OPTS += -Dtimedated=true
 else
-SYSTEMD_CONF_OPTS += --disable-timedated
+SYSTEMD_CONF_OPTS += -Dtimedated=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_LOCALED),y)
-SYSTEMD_CONF_OPTS += --enable-localed
+SYSTEMD_CONF_OPTS += -Dlocaled=true
 else
-SYSTEMD_CONF_OPTS += --disable-localed
+SYSTEMD_CONF_OPTS += -Dlocaled=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
-SYSTEMD_CONF_OPTS += --enable-coredump
+SYSTEMD_CONF_OPTS += -Dcoredump=true
 SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
 else
-SYSTEMD_CONF_OPTS += --disable-coredump
+SYSTEMD_CONF_OPTS += -Dcoredump=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
-SYSTEMD_CONF_OPTS += --enable-polkit
+SYSTEMD_CONF_OPTS += -Dpolkit=true
 else
-SYSTEMD_CONF_OPTS += --disable-polkit
+SYSTEMD_CONF_OPTS += -Dpolkit=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
-SYSTEMD_CONF_OPTS += --enable-networkd
+SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - Network Manager
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 	ln -sf ../run/systemd/resolve/resolv.conf \
@@ -302,18 +283,18 @@ define SYSTEMD_INSTALL_NETWORK_CONFS
 endef
 endif
 else
-SYSTEMD_CONF_OPTS += --disable-networkd
+SYSTEMD_CONF_OPTS += -Dnetworkd=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
-SYSTEMD_CONF_OPTS += --enable-resolved
+SYSTEMD_CONF_OPTS += -Dresolved=true
 SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
 else
-SYSTEMD_CONF_OPTS += --disable-resolved
+SYSTEMD_CONF_OPTS += -Dresolved=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
-SYSTEMD_CONF_OPTS += --enable-timesyncd
+SYSTEMD_CONF_OPTS += -Dtimesyncd=true
 SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
 define SYSTEMD_INSTALL_SERVICE_TIMESYNC
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
@@ -321,19 +302,19 @@ define SYSTEMD_INSTALL_SERVICE_TIMESYNC
 		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service
 endef
 else
-SYSTEMD_CONF_OPTS += --disable-timesyncd
+SYSTEMD_CONF_OPTS += -Dtimesyncd=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT),y)
-SYSTEMD_CONF_OPTS += --enable-smack
+SYSTEMD_CONF_OPTS += -Dsmack=true
 else
-SYSTEMD_CONF_OPTS += --disable-smack
+SYSTEMD_CONF_OPTS += -Dsmack=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_HIBERNATE),y)
-SYSTEMD_CONF_OPTS += --enable-hibernate
+SYSTEMD_CONF_OPTS += -Dhibernate=true
 else
-SYSTEMD_CONF_OPTS += --disable-hibernate
+SYSTEMD_CONF_OPTS += -Dhibernate=false
 endif
 
 define SYSTEMD_INSTALL_INIT_HOOK
@@ -341,7 +322,6 @@ define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
-
 	ln -fs ../../../lib/systemd/system/multi-user.target \
 		$(TARGET_DIR)/etc/systemd/system/default.target
 endef
@@ -398,4 +378,26 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_INSTALL_NETWORK_CONFS)
 endef
 
-$(eval $(autotools-package))
+SYSTEMD_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
+
+define SYSTEMD_CONFIGURE_CMDS
+	rm -rf $(@D)/build
+	mkdir -p $(@D)/build
+	$(TARGET_MAKE_ENV) meson $(SYSTEMD_CONF_OPTS) $(@D) $(@D)/build
+endef
+
+define SYSTEMD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) ninja $(SYSTEMD_NINJA_OPTS) -C $(@D)/build
+endef
+
+define SYSTEMD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja $(SYSTEMD_NINJA_OPTS) \
+		-C $(@D)/build install
+endef
+
+define SYSTEMD_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) ninja $(SYSTEMD_NINJA_OPTS) \
+		-C $(@D)/build install
+endef
+
+$(eval $(generic-package))
-- 
2.14.3
