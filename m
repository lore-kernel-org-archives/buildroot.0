From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 1 May 2019 15:38:34 +0200
Subject: [Buildroot] [git commit] package/systemd: fix build due to missing
 -lrt
Message-ID: <20190501133405.B672384614@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67cfbbd2eee6d2ef6c59a785837a87033bf63976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/a27d2e865ca620b6b2c6f39a07385f74fcfbb385

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...eson-drop-misplaced-Wl-undefined-argument.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/systemd/0004-meson-drop-misplaced-Wl-undefined-argument.patch b/package/systemd/0004-meson-drop-misplaced-Wl-undefined-argument.patch
new file mode 100644
index 0000000000..52ef811494
--- /dev/null
+++ b/package/systemd/0004-meson-drop-misplaced-Wl-undefined-argument.patch
@@ -0,0 +1,51 @@
+From 700805f6c546f2adb79059614f3747f7b5474325 Mon Sep 17 00:00:00 2001
+From: Jussi Pakkanen <jpakkane@gmail.com>
+Date: Sat, 6 Apr 2019 21:59:06 +0200
+Subject: [PATCH] meson: drop misplaced -Wl,--undefined argument
+
+Ld's man page says the following:
+
+  -u symbol
+  --undefined=symbol
+
+  Force symbol to be entered in the output file as an undefined symbol. Doing
+  this may, for example, trigger linking of additional modules from standard
+  libraries. -u may be repeated with different option arguments to enter
+  additional undefined symbols. This option is equivalent to the "EXTERN"
+  linker script command.
+
+  If this option is being used to force additional modules to be pulled into
+  the link, and if it is an error for the symbol to remain undefined, then the
+  option --require-defined should be used instead.
+
+This would imply that it always requires an argument, which this does not
+pass. Thus it will grab the next argument on the command line as its
+argument. Before it took one of the many -lrt args (presumably) and now it
+grabs something other random linker argument and things break.
+
+[zj: this line was added in the first version of the meson configuration back
+in 5c23128daba7236a6080383b2a5649033cfef85c. AFAICT, this was a mistake. No
+such flag appeared in Makefile.am at the time.]
+
+https://github.com/mesonbuild/meson/issues/5113
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/systemd/systemd/commit/700805f6c546f2adb79059614f3747f7b5474325]
+---
+ meson.build | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 287125f0107..79195c97484 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1606,8 +1606,7 @@ foreach tuple : [['myhostname', 'ENABLE_NSS_MYHOSTNAME'],
+                         # Note that we link NSS modules with '-z nodelete' so that mempools never get orphaned
+                         link_args : ['-Wl,-z,nodelete',
+                                      '-shared',
+-                                     '-Wl,--version-script=' + version_script_arg,
+-                                     '-Wl,--undefined'],
++                                     '-Wl,--version-script=' + version_script_arg],
+                         link_with : [libsystemd_static,
+                                      libbasic],
+                         dependencies : [threads,
