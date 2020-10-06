From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 21:45:37 +0200
Subject: [Buildroot] [git commit] package/kmod: add compression support for
 the host variant
Message-ID: <20201006193503.357BC817AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49547ea2ab173e60c274f2cf8fba3fc49158df1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel may install compressed modules. At the end of the build, we
then run depmod, to generate modules.dep and a few assorted files, so
that loading modules works properly on the target (loading by alias,
loading dependencies...)

However, depmod needs support for compressed modules, or it would
generate empty modules.dep et al.

Uconditionally adding support for gz and xz, and the required deps,
was deemed too much of a burden [0], so we add options to enable
either or both compression.

[0] http://lists.busybox.net/pipermail/buildroot/2018-April/218410.html

Yegor Yefremov <yegorslists@googlemail.com>
Cc: Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Lucian Buga <lucianbuga@gmail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmod/Config.in.host | 10 ++++++++++
 package/kmod/kmod.mk        | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/kmod/Config.in.host b/package/kmod/Config.in.host
index ea99a790f6..9dbbcea782 100644
--- a/package/kmod/Config.in.host
+++ b/package/kmod/Config.in.host
@@ -4,3 +4,13 @@ config BR2_PACKAGE_HOST_KMOD
 	  kmod is a set of tools to handle common tasks with Linux
 	  kernel modules like insert, remove, list, check properties,
 	  resolve dependencies and aliases.
+
+if BR2_PACKAGE_HOST_KMOD
+
+config BR2_PACKAGE_HOST_KMOD_GZ
+	bool "support gzip-compressed modules"
+
+config BR2_PACKAGE_HOST_KMOD_XZ
+	bool "support xz-compressed modules"
+
+endif
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index b27447192c..69615452cf 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -82,6 +82,20 @@ else
 KMOD_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_KMOD_GZ),y)
+HOST_KMOD_DEPENDENCIES += host-zlib
+HOST_KMOD_CONF_OPTS += --with-zlib
+else
+HOST_KMOD_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_HOST_KMOD_XZ),y)
+HOST_KMOD_DEPENDENCIES += host-xz
+HOST_KMOD_CONF_OPTS += --with-xz
+else
+HOST_KMOD_CONF_OPTS += --without-xz
+endif
+
 # We only install depmod, since that's the only tool used for the
 # host.
 define HOST_KMOD_INSTALL_TOOLS
