From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:53:23 +0200
Subject: [Buildroot] [git commit] package/patchelf: new host package
Message-ID: <20140731215349.E78EB9D359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f570cd765d52da56b4cebd4e5149ab8ebceec7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In some situations, users may want to tweak the dynamic section of the
binaries (for example to add/set the RPATH to $ORIGIN/../lib).

Because it is not trivial to do it properly from the Buildroot
infrastructure, allow those users to use patchelf (e.g. from a
post-build script) to tweak binaries.

patchelf is able to:
  - modify an existing DT_RUNPATH tags
  - add a DT_RUNPATH tag if not already present
  - do the above to the DT_RPATH tag, too
  - set the path to the interpreter
  - remove DT_NEEDED tags
  - query a binary for the DT_RUNPATH/DT_RPATH tag, or for the
    interpreter path

Does not really fix #7172, but this is an appropriate workaround.

[Thomas: change license to GPLv3+, as mentionned in the project's
README file.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Mike Zick <minimod@morethan.org>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host          |    1 +
 package/patchelf/Config.in.host |    7 +++++++
 package/patchelf/patchelf.mk    |   12 ++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 062c6c9..e05bbfa 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ menu "Host utilities"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/parted/Config.in.host"
+	source "package/patchelf/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
diff --git a/package/patchelf/Config.in.host b/package/patchelf/Config.in.host
new file mode 100644
index 0000000..d1c8375
--- /dev/null
+++ b/package/patchelf/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PATCHELF
+	bool "host patchelf"
+	help
+	  PatchELF is a small utility to modify the dynamic linker
+	  and RPATH of ELF executables.
+
+	  http://nixos.org/patchelf.html
diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
new file mode 100644
index 0000000..b6b9e05
--- /dev/null
+++ b/package/patchelf/patchelf.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# patchelf
+#
+################################################################################
+
+PATCHELF_VERSION = 0.8
+PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-0.8/
+PATCHELF_LICENSE = GPLv3+
+PATCHELF_LICENSE_FILES = COPYING
+
+$(eval $(host-autotools-package))
