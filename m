From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:26:53 +0100
Subject: [Buildroot] [git commit] kconfig/lxdialog: get ncurses CFLAGS with
	pkg-config
Message-ID: <20150107212806.C1E467FCBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=886805126201b62865c31596746d3824edd43234
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes "make menuconfig" also work on systems where ncurses is not
installed in a standard location (such as on NixOS).

This patch changes ccflags() so that it tries pkg-config first, and only
if pkg-config fails does it go back to the fallback/manual checks. This
is the same algorithm that ldflags() already uses.

[This patch is already applied upstream (is part of linux v3.18):
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=be8af2d54a66911693eddc556e4f7a866670082b

I'm adding this instead of doing a full upstream kconfig sync because
there was a conflict in one of the Buildroot kconfig patches (against
linux 3.18-rc1), which I was unable to resolve. Just drop this patch next time
Buildroot kconfig is synced against upstream.
]

Signed-off-by: Bj??rn Forsman <bjorn.forsman@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/kconfig/lxdialog/check-lxdialog.sh         |    6 ++-
 ...dialog-get-ncurses-CFLAGS-with-pkg-config.patch |   50 ++++++++++++++++++++
 support/kconfig/patches/series                     |    1 +
 3 files changed, 56 insertions(+), 1 deletions(-)

diff --git a/support/kconfig/lxdialog/check-lxdialog.sh b/support/kconfig/lxdialog/check-lxdialog.sh
old mode 100644
new mode 100755
index 4789b72..3ce0a23
--- a/support/kconfig/lxdialog/check-lxdialog.sh
+++ b/support/kconfig/lxdialog/check-lxdialog.sh
@@ -21,7 +21,11 @@ ldflags()
 # Where is ncurses.h?
 ccflags()
 {
-	if [ -f /usr/include/ncursesw/curses.h ]; then
+	if pkg-config --cflags ncursesw 2>/dev/null; then
+		echo '-DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1'
+	elif pkg-config --cflags ncurses 2>/dev/null; then
+		echo '-DCURSES_LOC="<ncurses.h>"'
+	elif [ -f /usr/include/ncursesw/curses.h ]; then
 		echo '-I/usr/include/ncursesw -DCURSES_LOC="<curses.h>"'
 		echo ' -DNCURSES_WIDECHAR=1'
 	elif [ -f /usr/include/ncurses/ncurses.h ]; then
diff --git a/support/kconfig/patches/17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch b/support/kconfig/patches/17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch
new file mode 100644
index 0000000..1eb48ef
--- /dev/null
+++ b/support/kconfig/patches/17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch
@@ -0,0 +1,50 @@
+From be8af2d54a66911693eddc556e4f7a866670082b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
+Date: Sun, 14 Sep 2014 12:57:50 +0200
+Subject: [PATCH] kconfig/lxdialog: get ncurses CFLAGS with pkg-config
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This makes "make menuconfig" also work on systems where ncurses is not
+installed in a standard location (such as on NixOS).
+
+This patch changes ccflags() so that it tries pkg-config first, and only
+if pkg-config fails does it go back to the fallback/manual checks. This
+is the same algorithm that ldflags() already uses.
+
+Signed-off-by: Bj??rn Forsman <bjorn.forsman@gmail.com>
+Signed-off-by: Michal Marek <mmarek@suse.cz>
+---
+[This patch is already applied upstream (is part of linux v3.18):
+https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=be8af2d54a66911693eddc556e4f7a866670082b
+
+I'm adding this instead of doing a full upstream kconfig sync because
+there was a conflict in one of the Buildroot kconfig patches (against
+linux 3.18-rc1), which I was unable to resolve. Just drop this patch next time
+Buildroot kconfig is synced against upstream.
+]
+
+ scripts/kconfig/lxdialog/check-lxdialog.sh | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
+index 9d2a4c5..5075ebf 100755
+--- a/lxdialog/check-lxdialog.sh
++++ b/lxdialog/check-lxdialog.sh
+@@ -21,7 +21,11 @@ ldflags()
+ # Where is ncurses.h?
+ ccflags()
+ {
+-	if [ -f /usr/include/ncursesw/curses.h ]; then
++	if pkg-config --cflags ncursesw 2>/dev/null; then
++		echo '-DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1'
++	elif pkg-config --cflags ncurses 2>/dev/null; then
++		echo '-DCURSES_LOC="<ncurses.h>"'
++	elif [ -f /usr/include/ncursesw/curses.h ]; then
+ 		echo '-I/usr/include/ncursesw -DCURSES_LOC="<curses.h>"'
+ 		echo ' -DNCURSES_WIDECHAR=1'
+ 	elif [ -f /usr/include/ncurses/ncurses.h ]; then
+-- 
+2.1.3
+
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index 9154d83..e25375e 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -6,3 +6,4 @@
 14-support-out-of-tree-config.patch
 15-fix-qconf-moc-rule.patch
 16-fix-space-to-de-select-options.patch
+17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch
