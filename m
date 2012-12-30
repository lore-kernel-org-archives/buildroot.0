From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Dec 2012 23:54:15 +0100
Subject: [Buildroot] [PATCH 8/8] manual: add host python2 dependency section
In-Reply-To: <cover.1356907750.git.s.martin49@gmail.com>
References: <cover.1356907750.git.s.martin49@gmail.com>
Message-ID: <8de478e5aa4b0f15008159ea3ad238605e5ffe0e.1356907750.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-tips.txt | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index acdee40..4a971cb 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -62,3 +62,41 @@ FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
 
 Note that the name of the tarball is the default +foo-1234567.tar.gz+
 so it is not necessary to specify it in the +.mk+ file.
+
+[[python2-and-package-build-env]]
+Host python2 dependency and package environment
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Some packages provide some python scripts as part of their
+build/install system.
+
+Unfortunately, those python scripts are not always python3-friendly.
+So, a python2 interpreter on the host system is a prerequisite for
+those packages. Besides, their build system may call them invoking
++python <some script> ...+ which have bad consequences if the +python+
+command does not exist or if it call a python3 interperter instead of
+a python2 one.
+
+Buildroot provides a way to handle this case, without requiring to
+patch anything in the package sources.
+
+* add +host-python2-if-needed+ to the +*_DEPENDENCIES+ list;
+* make sure the +PATH+ environment variable contains
+  +$(HOST_DIR)/usr/bin+.
+
+.Notes
+- This is automatic if the package relies on the _autotools_ or
+  _cmake_ infrastructure and does not need to override some of the
+  configure, build or install commands.
+- Otherwise (i.e. the package uses the _generic_ infrastructure or
+  overrides some of the configure, build or install commands), you
+  should ensure +PATH=$(HOST_PATH)+ or +PATH=$(TARGET_PATH)+ to
+  overridden commands.
+- The +PATH+ environment variable is correctly set in the variables
+  +TARGET_CONFIGURE_OPTS+ or +TARGET_MAKE_ENV+ as well as in their
+  +HOST+ variants.
+- For package relying on http://www.scons.org[Scons] build system,
+  it should depend on +host-scons+ and use the +$(SCONS)+ variable.
+  This will automatically take care of the host python2 dependency
+  since http://www.scons.org[Scons] does not support python3 yet
+  (see http://www.scons.org/doc/production/HTML/scons-user/c95.html#AEN102).
-- 
1.8.0.3
