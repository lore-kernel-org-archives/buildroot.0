From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Sep 2020 23:05:49 +0200
Subject: [Buildroot] [git commit] package/altera-stapl: new package
Message-ID: <20200914205758.1E1F588629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=644e85d66046a6c61f7dd3b484c37e6e6d25ad86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Alteras Jam STAPL Bytecode Player with 64-bit support.
This is a user-space port of the altera-stapl driver from the linux kernel.
The source released by Altera wasn't 64-bit compatible.
Additionally, the linux version is much cleaner and old cruft was removed.

Signed-off-by: Jochen Baltes <jochen.baltes@gmail.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998 at free.fr: use the latest HEAD of the repository]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                             |  3 +++
 package/Config.in                      |  1 +
 package/altera-stapl/Config.in         |  8 ++++++++
 package/altera-stapl/altera-stapl.hash |  2 ++
 package/altera-stapl/altera-stapl.mk   | 21 +++++++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f754a6f341..d59d538e42 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1315,6 +1315,9 @@ N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
 F:	configs/snps_aarch64_vdk_defconfig
 
+N:	Jochen Baltes <jochen.baltes@gmail.com>
+F:	package/altera-stapl
+
 N:	Joel Carlson <JoelsonCarl@gmail.com>
 F:	package/c-capnproto/
 F:	package/capnproto/
diff --git a/package/Config.in b/package/Config.in
index 7d6ac1b33c..1cf36fa28a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -418,6 +418,7 @@ endmenu
 	source "package/acpid/Config.in"
 	source "package/acpitool/Config.in"
 	source "package/aer-inject/Config.in"
+	source "package/altera-stapl/Config.in"
 	source "package/am335x-pru-package/Config.in"
 	source "package/apcupsd/Config.in"
 	source "package/avrdude/Config.in"
diff --git a/package/altera-stapl/Config.in b/package/altera-stapl/Config.in
new file mode 100644
index 0000000000..ff7d23f841
--- /dev/null
+++ b/package/altera-stapl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ALTERA_STAPL
+	bool "altera-stapl"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8 # libgpiod
+	select BR2_PACKAGE_LIBGPIOD
+	help
+	  Altera Jam STAPL Bytecode Player.
+
+	  https://github.com/kontron/altera-stapl
diff --git a/package/altera-stapl/altera-stapl.hash b/package/altera-stapl/altera-stapl.hash
new file mode 100644
index 0000000000..29e62b9d44
--- /dev/null
+++ b/package/altera-stapl/altera-stapl.hash
@@ -0,0 +1,2 @@
+sha256  7f72c234f2fd0181140b6f1f09fc272eae07f20622cec7f26e3b3499ff69825a  altera-stapl-7044a63b7d1a3fc6840cd3130ec984454f1559c0.tar.gz
+sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
diff --git a/package/altera-stapl/altera-stapl.mk b/package/altera-stapl/altera-stapl.mk
new file mode 100644
index 0000000000..189b6c4ced
--- /dev/null
+++ b/package/altera-stapl/altera-stapl.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# altera-stapl
+#
+################################################################################
+
+ALTERA_STAPL_VERSION = 7044a63b7d1a3fc6840cd3130ec984454f1559c0
+ALTERA_STAPL_SITE = $(call github,kontron,altera-stapl,$(ALTERA_STAPL_VERSION))
+ALTERA_STAPL_LICENSE = GPLv2+
+ALTERA_STAPL_LICENSE_FILES = COPYING
+ALTERA_STAPL_DEPENDENCIES = libgpiod
+
+define ALTERA_STAPL_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define ALTERA_STAPL_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
