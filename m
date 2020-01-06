From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:44:00 +0100
Subject: [Buildroot] [git commit] package/systemd: add dependency on
 host-coreutils
Message-ID: <20200106203440.17CC180E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0d94ad5ad90669bda7edc951106e433b02bb068
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed as systemd has gained a dependency on realpath(1) which
was introduced in coreutils too recently for our supported distro to
have it (Ubuntu 14.04 does not have it from coreutils, although there is
a dedicated package for it).

This also means that we now have a ln that understands --relative, so we
can drop our workaround, that upstream said they would never accept
anyway [0].

[0] https://github.com/systemd/systemd/pull/5682

Fixes:
    http://autobuild.buildroot.org/results/a9a/a9a285e482285d062892bab0d1a2e2f89928c92d/
    http://autobuild.buildroot.org/results/6f5/6f5b1065859d866af6fa719f611c3ea7f4b88760/
    ...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-install-don-t-use-ln-relative.patch       | 80 ----------------------
 package/systemd/systemd.mk                         |  2 +
 2 files changed, 2 insertions(+), 80 deletions(-)

diff --git a/package/systemd/0001-install-don-t-use-ln-relative.patch b/package/systemd/0001-install-don-t-use-ln-relative.patch
deleted file mode 100644
index 9201724da1..0000000000
--- a/package/systemd/0001-install-don-t-use-ln-relative.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 006b1d65fd5ea6555fcb72054ecc20234f4175db Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Sun, 31 Dec 2017 12:46:04 -0500
-Subject: [PATCH] install: don't use ln --relative
-
-Oldish enterprise-class distributions have too old versions of
-coreutils, with ln not supporting --relative.
-
-So we fake it.
-
-ln --relative would create minimalist relative paths, but they are not
-trivial to generate. Instead, we always create paths relative to the
-root, i.e.:
-
-    ln -s --relative /usr/bin/foo /usr/sbin/foo
-
-would create:  /usr/sbin/foo -> ../bin/foo
-while we do :  /usr/sbin/foo -> ../../usr/bin/foo
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[aduskett at gmail.com: Added meson.build section and dirname wrapper in add-wants]
-[aduskett at gmail.com: Update for systemd v237]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[tpiepho at impinj.com: Fix add-wants wrapper]
-Signed-off-by: Trent Piepho <tpiepho@impinj.com>
----
- meson.build                 | 2 +-
- tools/meson-make-symlink.sh | 3 ++-
- units/meson-add-wants.sh    | 6 ++++--
- 3 files changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index e5ceb1e169..9d3c746da4 100644
---- a/meson.build
-+++ b/meson.build
-@@ -591,7 +591,7 @@ endforeach
- conf.set_quoted('TELINIT', get_option('telinit-path'))
- 
- if run_command('ln', '--relative', '--help').returncode() != 0
--        error('ln does not support --relative (added in coreutils 8.16)')
-+        message('ln does not support --relative (added in coreutils 8.16)')
- endif
- 
- ############################################################
-diff --git a/tools/meson-make-symlink.sh b/tools/meson-make-symlink.sh
-index da0d13a341..4917eff7d1 100755
---- a/tools/meson-make-symlink.sh
-+++ b/tools/meson-make-symlink.sh
-@@ -8,5 +8,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
- if [ "$(dirname $1)" = . ]; then
-     ln -vfs -T "$1" "${DESTDIR:-}$2"
- else
--    ln -vfs -T --relative "${DESTDIR:-}$1" "${DESTDIR:-}$2"
-+    dds="$( dirname "$2" |sed -r -e 's:/+[^/]+:../:g; s:/$::' )"
-+    ln -vfs -T "${dds}$1" "${DESTDIR:-}$2"
- fi
-diff --git a/units/meson-add-wants.sh b/units/meson-add-wants.sh
-index a483d75b86..4642673d98 100755
---- a/units/meson-add-wants.sh
-+++ b/units/meson-add-wants.sh
-@@ -14,7 +14,7 @@ case "$target" in
-         ;;
- esac
- 
--unitpath="${DESTDIR:-}${unitdir}/${unit}"
-+unitpath="${unitdir}/${unit}"
- 
- case "$target" in
-     */)
-@@ -25,4 +25,6 @@ case "$target" in
-         ;;
- esac
- 
--ln -vfs --relative "$unitpath" "$dir"
-+[ ! -d "${dir}" ] && linkdir=`dirname "${dir}"` || linkdir="${dir}"
-+dds="$(printf "%s" "${linkdir#${DESTDIR:-}}" |sed -r -e 's:/+[^/]+:../:g; s:/$::')"
-+ln -vfs "$dds$unitpath" "$dir"
--- 
-2.20.1
-
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c9fd8c6f04..791e770ca1 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -10,6 +10,7 @@ SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, s
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
+	$(BR2_COREUTILS_HOST_DEPENDENCY) \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	host-gperf \
 	kmod \
@@ -553,6 +554,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dsysvinit-path=''
 
 HOST_SYSTEMD_DEPENDENCIES = \
+	$(BR2_COREUTILS_HOST_DEPENDENCY) \
 	host-util-linux \
 	host-patchelf \
 	host-libcap \
