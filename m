From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 27 Aug 2014 21:40:11 +0200
Subject: [Buildroot] [PATCH 2 of 2 for 2014.08] manual/user
 guide/customization: add section with recommended dir structure
In-Reply-To: <patchbomb.1409168409@localhost>
References: <patchbomb.1409168409@localhost>
Message-ID: <f69e39b1184abd0c487a.1409168411@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although the user is free to choose where to put project-specific files, the
presentation 'Using Buildroot for real projects' [1] first described a
certain recommendation.
This patch briefly describes this recommendation in the form of a directory
structure overview, the details will be added in subsequent patches.

Since the section on BR2_EXTERNAL is logically connected to the directory
structure, this section is moved right after it.

[1] http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/customize-directory-structure.txt |  58 +++++++++++++++++++
 docs/manual/customize.txt                     |   6 +-
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
new file mode 100644
--- /dev/null
+++ b/docs/manual/customize-directory-structure.txt
@@ -0,0 +1,58 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Recommended directory structure
+
+When customizing Buildroot for your project, you will be creating one or
+more project-specific files that need to be stored somewhere. While most
+of these files could be placed in _any_ location as their path is to be
+specified in the Buildroot configuration, the Buildroot developers
+recommend a specific directory structure which is described in this
+section.
+
+Orthogonal to this directory structure, you can choose _where_ you place
+this structure itself: either inside the Buildroot tree, or outside of
+it using +BR2_EXTERNAL+. Both options are valid, the choice is up to you.
+
+-----
++-- board/
+|   +-- <company>/
+|       +-- <boardname>/
+|           +-- linux.config
+|           +-- busybox.config
+|           +-- <other configuration files>
+|           +-- post_build.sh
+|           +-- post_image.sh
+|           +-- rootfs_overlay/
+|           |   +-- etc/
+|           |   +-- <some file>
+|           +-- patches/
+|               +-- foo/
+|               |   +-- <some patch>
+|               +-- libbar/
+|                   +-- <some other patches>
+|
++-- configs/
+|   +-- <boardname>_defconfig
+|
++-- package/
+|   +-- <company>/
+|       +-- Config.in (if not using BR2_EXTERNAL)
+|       +-- <company>.mk (if not using BR2_EXTERNAL)
+|       +-- <boardname>/
+|           +-- package1/
+|           |    +-- Config.in
+|           |    +-- package1.mk
+|           +-- package2/
+|               +-- Config.in
+|               +-- package2.mk
+|
++-- Config.in (if using BR2_EXTERNAL)
++-- external.mk (if using BR2_EXTERNAL)
+------
+
+Details on the files shown above are given further in this chapter.
+
+Note: if you choose to place this structure outside of the Buildroot
+tree using +BR2_EXTERNAL+, the <company> and possibly <boardname>
+components may be superfluous and can be left out.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -26,10 +26,12 @@
 following the recommended strategy, you can even use the same Buildroot
 tree to build multiple distinct projects!
 
+include::customize-directory-structure.txt[]
+
+include::customize-outside-br.txt[]
+
 include::customize-rootfs.txt[]
 
 include::customize-store.txt[]
 
 include::customize-packages.txt[]
-
-include::customize-outside-br.txt[]
