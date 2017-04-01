From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 12:25:09 +0200
Subject: [Buildroot] [git commit] python: re-add patch mistakenly removed
Message-ID: <20170401102747.103C48220D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f349933ba41a2f74ef5eb17ab866b7997a6c5ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed by Andr?? Hentschel <nerv@dawncrow.de>, commit
652076293235276e2f978fe377322a6cbd615455 ("python: move to Git formatted
patches") mistakenly removed 018-fix-add-gcc-paths-logic.patch.

This causes bug #7971 to re-appear. To fix this, we re-introduce the
missing patch.

Reported-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...stem-locale-and-set-to-default-when-addin.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/python/0034-Override-system-locale-and-set-to-default-when-addin.patch b/package/python/0034-Override-system-locale-and-set-to-default-when-addin.patch
new file mode 100644
index 0000000..8fe722b
--- /dev/null
+++ b/package/python/0034-Override-system-locale-and-set-to-default-when-addin.patch
@@ -0,0 +1,37 @@
+From d2bfa8805206db8c57c182094396d20a9d94bd8f Mon Sep 17 00:00:00 2001
+From: Samuel Cabrero <samuelcabrero@gmail.com>
+Date: Sat, 1 Apr 2017 09:31:52 +0200
+Subject: [PATCH] Override system locale and set to default when adding gcc
+ paths
+
+Forces the use of the default locale in the function
+add_gcc_paths, which is called when cross compiling to add the
+include and library paths. This is necessary because otherwise
+the gcc output is localized and the output parsing fails, which
+results in no paths added and detect_modules not able to find
+any system library (eg. libz, libssl, etc.)
+
+[Thomas: patch taken from https://bugs.python.org/issue23767.]
+
+Signed-off-by: Samuel Cabrero <samuelcabrero@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 8045a9b..c14f4ab 100644
+--- a/setup.py
++++ b/setup.py
+@@ -430,7 +430,7 @@ class PyBuildExt(build_ext):
+         tmpfile = os.path.join(self.build_temp, 'gccpaths')
+         if not os.path.exists(self.build_temp):
+             os.makedirs(self.build_temp)
+-        ret = os.system('%s -E -v - </dev/null 2>%s 1>/dev/null' % (gcc, tmpfile))
++        ret = os.system('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (gcc, tmpfile))
+         is_gcc = False
+         in_incdirs = False
+         inc_dirs = []
+-- 
+2.7.4
+
