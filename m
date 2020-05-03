From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 May 2020 15:10:01 +0200
Subject: [Buildroot] [PATCH 3/3 v2] package/lmod: add compression support
 for the host variant
In-Reply-To: <cover.1588511382.git.yann.morin.1998@free.fr>
References: <cover.1588511382.git.yann.morin.1998@free.fr>
Message-ID: <d66d07fe82ae1c515eb9a010f1df2cbcc10f1a87.1588511382.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The kernel may install compressed modules. At the end of the buid, we
then run depmod, to generate modules.dep and a few assorted files, so
that loadign modules works properly on the target (loading by alias,
loading dependencies...)

However, depmod needs support for compressed modules, or it would
generate empty modules.dep et al.

Systematically adding support for gz and xz, and the required deps, was
deemed too much of a burden [0], so we add too options to enable either
or both compression.

[0] http://lists.busybox.net/pipermail/buildroot/2018-April/218410.html

Yegor Yefremov <yegorslists@googlemail.com>
Cc: Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Lucian Buga <lucianbuga@gmail.com>

---
Changes v1 -> v2:
  - make compression support optional  (Thomas)
---
 package/kmod/Config.in.host | 10 ++++++++++
 package/kmod/kmod.mk        | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/kmod/Config.in.host b/package/kmod/Config.in.host
index ea99a790f6..810fac3156 100644
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
+	bool "support gzip-compresed modules"
+
+config BR2_PACKAGE_HOST_KMOD_XZ
+	bool "support xz-compresed modules"
+
+endif
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index cdbfc5a469..979c3e87e6 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -75,6 +75,20 @@ else
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
-- 
2.20.1
