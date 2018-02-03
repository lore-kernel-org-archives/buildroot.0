From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Feb 2018 08:24:19 +0100
Subject: [Buildroot] [git commit] systemd: update to v237
Message-ID: <20180203072712.7F4DB882B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1efc0088f33274036cd2c1a3d0f5a1f021bb5649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also refresh patches and remove 0004-add-false-option-for-tests.patch as it has
been added upstream.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/0001-fix-getty-unit.patch          |   6 +-
 .../0002-install-don-t-use-ln-relative.patch       |  10 +-
 .../systemd/0004-add-false-option-for-tests.patch  | 150 ---------------------
 package/systemd/systemd.hash                       |   2 +-
 package/systemd/systemd.mk                         |   2 +-
 5 files changed, 10 insertions(+), 160 deletions(-)

diff --git a/package/systemd/0001-fix-getty-unit.patch b/package/systemd/0001-fix-getty-unit.patch
index 8b50353195..b6947626c5 100644
--- a/package/systemd/0001-fix-getty-unit.patch
+++ b/package/systemd/0001-fix-getty-unit.patch
@@ -7,7 +7,7 @@ Prefer getty to agetty in console setup systemd units
 
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-[Adam: Refresh for 234]
+[aduskett at gmail.com: Update for systemd v237]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  units/getty at .service.m4        | 5 +----
@@ -18,7 +18,7 @@ diff --git a/units/getty at .service.m4 b/units/getty at .service.m4
 index 2a84061..7ad588f 100644
 --- a/units/getty at .service.m4
 +++ b/units/getty at .service.m4
-@@ -33,10 +33,7 @@ ConditionPathExists=/dev/tty0
+@@ -35,10 +35,7 @@ ConditionPathExists=/dev/tty0
  
  [Service]
  # the VT is cleared by TTYVTDisallocate
@@ -34,7 +34,7 @@ diff --git a/units/serial-getty at .service.m4 b/units/serial-getty at .service.m4
 index b7caeaf..c663612 100644
 --- a/units/serial-getty at .service.m4
 +++ b/units/serial-getty at .service.m4
-@@ -31,7 +31,7 @@ Before=rescue.service
+@@ -33,7 +33,7 @@ Before=rescue.service
  # The '-o' option value tells agetty to replace 'login' arguments with an
  # option to preserve environment (-p), followed by '--' for safety, and then
  # the entered username.
diff --git a/package/systemd/0002-install-don-t-use-ln-relative.patch b/package/systemd/0002-install-don-t-use-ln-relative.patch
index e76ce4378a..5f34b56969 100644
--- a/package/systemd/0002-install-don-t-use-ln-relative.patch
+++ b/package/systemd/0002-install-don-t-use-ln-relative.patch
@@ -19,6 +19,7 @@ while we do :  /usr/sbin/foo -> ../../usr/bin/foo
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 [aduskett at gmail.com: Added meson.build section and dirname wrapper in add-wants]
+[aduskett at gmail.com: Update for systemd v237]
 Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
 ---
  meson.build                 | 2 +-
@@ -30,8 +31,7 @@ diff --git a/meson.build b/meson.build
 index ddc061c..614201a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -531,7 +531,7 @@ foreach prog : progs
- endforeach
+@@ -572,6 +572,6 @@ conf.set_quoted('TELINIT', get_option('telinit-path'))
  
  if run_command('ln', '--relative', '--help').returncode() != 0
 -        error('ln does not support --relative')
@@ -43,7 +43,7 @@ diff --git a/tools/meson-make-symlink.sh b/tools/meson-make-symlink.sh
 index 47a5e70..e9002ad 100755
 --- a/tools/meson-make-symlink.sh
 +++ b/tools/meson-make-symlink.sh
-@@ -7,5 +7,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
+@@ -8,5 +8,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
  if [ "$(dirname $1)" = . ]; then
          ln -vfs -T "$1" "${DESTDIR:-}$2"
  else
@@ -55,7 +55,7 @@ diff --git a/units/meson-add-wants.sh b/units/meson-add-wants.sh
 index dfd287e..8c08283 100755
 --- a/units/meson-add-wants.sh
 +++ b/units/meson-add-wants.sh
-@@ -13,7 +13,7 @@ case "$target" in
+@@ -14,7 +14,7 @@ case "$target" in
                  ;;
  esac
  
@@ -64,7 +64,7 @@ index dfd287e..8c08283 100755
  
  case "$target" in
          */)
-@@ -24,4 +24,5 @@ case "$target" in
+@@ -25,4 +25,5 @@ case "$target" in
                  ;;
  esac
  
diff --git a/package/systemd/0004-add-false-option-for-tests.patch b/package/systemd/0004-add-false-option-for-tests.patch
deleted file mode 100644
index 1796ee9be6..0000000000
--- a/package/systemd/0004-add-false-option-for-tests.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From ebeb780df4ca5a8e5a43da1b38492964d8817455 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Adamduskett@outlook.com>
-Date: Mon, 1 Jan 2018 08:01:01 -0500
-Subject: [PATCH] add false option for tests
-
-Currently there is no way to not build tests. This introduces two problems:
-
-1) It adds a extra 381 files to compile.
-2) One of these tests explicitly requires libgcrypt to be built even if systemd
-   is not using it.
-
-This patch adds the option "false" to tests, adds a check around the
-foreach loop that compiles the tests to see if tests is set to false,
-and adds a check around finding g++ as it's only used for tests and
-is not needed.
-
-Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
----
- meson.build       | 91 +++++++++++++++++++++++++++++--------------------------
- meson_options.txt |  2 +-
- 2 files changed, 49 insertions(+), 44 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index ddc061c..4dcdd41 100644
---- a/meson.build
-+++ b/meson.build
-@@ -260,10 +260,12 @@ cc = meson.get_compiler('c')
- pkgconfig = import('pkgconfig')
- check_compilation_sh = find_program('tools/meson-check-compilation.sh')
- 
--cxx = find_program('c++', required : false)
--if cxx.found()
--        #  Used only for tests
--        add_languages('cpp')
-+if get_option('tests') != 'false'
-+	cxx = find_program('c++', required : false)
-+	if cxx.found()
-+            #  Used only for tests
-+            add_languages('cpp')
-+    endif
- endif
- 
- foreach arg : ['-Wextra',
-@@ -2388,48 +2390,51 @@ executable('systemd-sulogin-shell',
-            install_dir : rootlibexecdir)
- 
- ############################################################
-+if want_tests == 'false'
-+        message('Not compiling because tests is set to false')
-+else
-+        foreach tuple : tests
-+                sources = tuple[0]
-+                link_with = tuple[1].length() > 0 ? tuple[1] : [libshared]
-+                dependencies = tuple[2]
-+                condition = tuple.length() >= 4 ? tuple[3] : ''
-+                type = tuple.length() >= 5 ? tuple[4] : ''
-+                defs = tuple.length() >= 6 ? tuple[5] : []
-+                incs = tuple.length() >= 7 ? tuple[6] : includes
-+                timeout = 30
-+
-+                name = sources[0].split('/')[-1].split('.')[0]
-+                if type.startswith('timeout=')
-+                        timeout = type.split('=')[1].to_int()
-+                        type = ''
-+                endif
- 
--foreach tuple : tests
--        sources = tuple[0]
--        link_with = tuple[1].length() > 0 ? tuple[1] : [libshared]
--        dependencies = tuple[2]
--        condition = tuple.length() >= 4 ? tuple[3] : ''
--        type = tuple.length() >= 5 ? tuple[4] : ''
--        defs = tuple.length() >= 6 ? tuple[5] : []
--        incs = tuple.length() >= 7 ? tuple[6] : includes
--        timeout = 30
--
--        name = sources[0].split('/')[-1].split('.')[0]
--        if type.startswith('timeout=')
--                timeout = type.split('=')[1].to_int()
--                type = ''
--        endif
--
--        if condition == '' or conf.get(condition) == 1
--                exe = executable(
--                        name,
--                        sources,
--                        include_directories : incs,
--                        link_with : link_with,
--                        dependencies : dependencies,
--                        c_args : defs,
--                        install_rpath : rootlibexecdir,
--                        install : install_tests,
--                        install_dir : join_paths(testsdir, type))
--
--                if type == 'manual'
--                        message('@0@ is a manual test'.format(name))
--                elif type == 'unsafe' and want_tests != 'unsafe'
--                        message('@0@ is an unsafe test'.format(name))
-+                if condition == '' or conf.get(condition) == 1
-+                        exe = executable(
-+                                name,
-+                                sources,
-+                                include_directories : incs,
-+                                link_with : link_with,
-+                                dependencies : dependencies,
-+                                c_args : defs,
-+                                install_rpath : rootlibexecdir,
-+                                install : install_tests,
-+                                install_dir : join_paths(testsdir, type))
-+
-+                        if type == 'manual'
-+                                message('@0@ is a manual test'.format(name))
-+                        elif type == 'unsafe' and want_tests != 'unsafe'
-+                                message('@0@ is an unsafe test'.format(name))
-+                        else
-+                                test(name, exe,
-+                                     env : test_env,
-+                                     timeout : timeout)
-+                        endif
-                 else
--                        test(name, exe,
--                             env : test_env,
--                             timeout : timeout)
-+                        message('Not compiling @0@ because @1@ is not true'.format(name, condition))
-                 endif
--        else
--                message('Not compiling @0@ because @1@ is not true'.format(name, condition))
--        endif
--endforeach
-+        endforeach
-+endif
- 
- test_libsystemd_sym = executable(
-         'test-libsystemd-sym',
-diff --git a/meson_options.txt b/meson_options.txt
-index f0c0506..0caba0c 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -284,7 +284,7 @@ option('bashcompletiondir', type : 'string',
- option('zshcompletiondir', type : 'string',
-        description : 'directory for zsh completion scripts ["no" disables]')
- 
--option('tests', type : 'combo', choices : ['true', 'unsafe'],
-+option('tests', type : 'combo', choices : ['true', 'unsafe', 'false'],
-        description : 'enable extra tests with =unsafe')
- option('slow-tests', type : 'boolean', value : 'false',
-        description : 'run the slow tests by default')
--- 
-2.14.3
-
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index d8f6365c9c..74cc5dd825 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256	0cadccfa7109232ec2a469d41ca595d5595b83b648b534ea669c15dbca904c43	systemd-236.tar.gz
+sha256	c83dabbe1c9de6b9db1dafdb7e04140c7d0535705c68842f6c0768653ba4913c	systemd-237.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
 sha256	f6a739f5ee7f10df6467021066038297c0150ff680db9a4b9f60da53b11aa560	README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index f58e037943..1c31ebb34c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 236
+SYSTEMD_VERSION = 237
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
