From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/dahdi-linux: new package
Message-ID: <20170923171327.DB8258103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d959966b41bd88a36664c733a8a8d2b6809e4fc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dahdi-linux provides kernel modules to drive a variety of telephony
cards, ranging from low-end one-channel to higher-end multi-channel
cards. It also provides headers for userland to talk to those cards.

With a bit of love, dahdi-linux can use our kernel-module
infrastructure. Wee! :-)

Still, there are a few specificities about dahdi-linux.

First, it needs to install a few binary firmware blobs, which it wants
to download at install time. Since we do want to be able to do
completely off-line builds, we need to downlaod them manually. So we
have the full list of firmware blobs (even if some can only be used on
an i386/x86_64 target, we still uconditionally download them), for which
we have locally-computed sha256 (no hash provided by upstream for the
blobs).

Second, the install procedure for the firmware blobs needs to have
access to the Linux kernel .config file, so it can decide whether to
install the blobs or not. We can force not to install them, but we can't
force to install them... :-/ And anyway, we'd have to do the same check
as is already done by dahdi-linux, so no need to duplicate that.

Finally, the licensing is relatively weird. Although it is obvious and
straightforward for the most part of dahdi-linux, consisting of mostly
GPLv2 and a few LGPLv2.1, there is one gotcha.

Of the firmware blobs, one is provided as a .o file, with no licensing
information whatsoever, without any source available from upstream, but
is directly linked to a GPLv2 file.

This is very concerning, but there is not much we can do about it,
except delegate to the legal reviewer whether that is acceptable or not.

AS an aside, dahdi-linux drivers do not build with a kernel 4.0 or
later, as it uses internals that have been removed in linux-4.0. There
has been no update upstream dahdi-linux to fix that. There's not much we
can do, except warn the user in the help text.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout: use SPDX license names and add hashes for license files]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                    |  1 +
 package/dahdi-linux/Config.in        | 19 ++++++++
 package/dahdi-linux/dahdi-linux.hash | 27 +++++++++++
 package/dahdi-linux/dahdi-linux.mk   | 88 ++++++++++++++++++++++++++++++++++++
 4 files changed, 135 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b3511f4..ac7d25c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -383,6 +383,7 @@ endmenu
 	source "package/cdrkit/Config.in"
 	source "package/cryptsetup/Config.in"
 	source "package/cwiid/Config.in"
+	source "package/dahdi-linux/Config.in"
 	source "package/dbus/Config.in"
 	source "package/dbus-cpp/Config.in"
 	source "package/dbus-glib/Config.in"
diff --git a/package/dahdi-linux/Config.in b/package/dahdi-linux/Config.in
new file mode 100644
index 0000000..f2a3709
--- /dev/null
+++ b/package/dahdi-linux/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_DAHDI_LINUX
+	bool "dhadi-linux"
+	depends on BR2_LINUX_KERNEL
+	help
+	  DAHDI (Digium/Asterisk Hardware Device Interface) is the open
+	  source device interface technology used to control Digium and
+	  other legacy telephony interface cards.
+
+	  DAHDI Linux is the open source device driver framework used to
+	  interface Asterisk with telephony hardware.
+
+	  http://www.asterisk.org/downloads/dahdi
+
+	  Note: DAHDI Linux drivers won't build on a kernel v4.0 or more
+	  recent, because they use internals that have been removed in
+	  v4.0.
+
+comment "dahdi-linux needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/dahdi-linux/dahdi-linux.hash b/package/dahdi-linux/dahdi-linux.hash
new file mode 100644
index 0000000..c362f8e
--- /dev/null
+++ b/package/dahdi-linux/dahdi-linux.hash
@@ -0,0 +1,27 @@
+# sha1 from: http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases
+# sha256 locally computed
+sha1    8cbd55b8611c6ed80bcdf84d537566b4934f3def  dahdi-linux-2.11.1.tar.gz
+sha256  f59f382365118205e77d2874f1c0e1546e936247bcc45f07a43bc21778bee9df  dahdi-linux-2.11.1.tar.gz
+
+# Firmware files have no upstream hash, so sha56 locally computed
+sha256  3ff26cf80555fd7470b43a87c51d03c1db2a75abcd4561d79f69b6c48298e4a1  dahdi-fwload-vpmadt032-1.25.0.tar.gz
+sha256  d5b6ab6851e431afcfec2ecc39d95fa88fe3939ffdb2e3d4f28a43cabf30e95b  dahdi-fw-a4a-a0017.tar.gz
+sha256  e039af8bec36407b74e1dd9ebdd49ba077469eda79d4e6093721ed2836d4536f  dahdi-fw-a4b-d001e.tar.gz
+sha256  5064f9877b8aec99b19fd57988216fe1a9c0b7c07853dd3b32b5a55ab7b418e6  dahdi-fw-a8a-1d0017.tar.gz
+sha256  09a8992786309e025aa60b400a2c7d21226ac9bb6f1b66f562a5e7e9dc892b03  dahdi-fw-a8b-1f001e.tar.gz
+sha256  449ab3fd03d55d808e999efb7677cd04de202b92c9fcb039539a7e48a39a80f5  dahdi-fw-hx8-2.06.tar.gz
+sha256  7a006073202d67e45f1d5ff1e9c6e8663e6056cef9dc4c5abae86a1018db349c  dahdi-fw-oct6114-032-1.05.01.tar.gz
+sha256  56bac1f2024c76ecf9b6f40992eeea29a1fbee676bb2a37a058179bacfbb1c91  dahdi-fw-oct6114-064-1.05.01.tar.gz
+sha256  e1146749d205c41603b9b76852c3f8104dac233d0025d700db24504d10c99775  dahdi-fw-oct6114-128-1.05.01.tar.gz
+sha256  5fe5036a2766cf0e8a968b0c58b700507d86e1cde9296ca437170cc626a9c79c  dahdi-fw-oct6114-256-1.05.01.tar.gz
+sha256  11dd8d009809e41fc9a3a36766f59ff73d29075eede5b8724331d9a6e5259774  dahdi-fw-tc400m-MR6.12.tar.gz
+sha256  511c1966295a20df673bb87af30245f0ad165efd6ccb92b4d8ed535ca7f5ac65  dahdi-fw-te133-7a001e.tar.gz
+sha256  99f7c410bf47d2a5ae687d717e51448ce5b52aca902830bf39bffe683150fa2d  dahdi-fw-te134-780017.tar.gz
+sha256  c8f55d57cc0bf332e8d96cdf9ff6dd0e322f33581e1efc24c2b9a0e0c5eb7ee4  dahdi-fw-te435-13001e.tar.gz
+sha256  0980f4a8d191c6872aa27d971758046f0e7827ac161549f2cc1b0eeab0ae9333  dahdi-fw-te436-10017.tar.gz
+sha256  5b823e25828e2c1c6548886ad408b2e31dbc8cd17170c52592792d9c754a199c  dahdi-fw-te820-1.76.tar.gz
+sha256  6b199cf836f150f9cb35f763f0f502fb52cfa2724a449b500429c746973904ad  dahdi-fw-vpmoct032-1.12.0.tar.gz
+
+# License files, locally computed
+sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
+sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  LICENSE.LGPL
diff --git a/package/dahdi-linux/dahdi-linux.mk b/package/dahdi-linux/dahdi-linux.mk
new file mode 100644
index 0000000..c042a14
--- /dev/null
+++ b/package/dahdi-linux/dahdi-linux.mk
@@ -0,0 +1,88 @@
+################################################################################
+#
+# dahdi-linux
+#
+################################################################################
+
+DAHDI_LINUX_VERSION = 2.11.1
+DAHDI_LINUX_SITE = http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases
+
+# We need to download all thoe firmware blobs ourselves, otherwise
+# dahdi-linux will try to download them at install time.
+DAHDI_LINUX_FW_SITE = http://downloads.digium.com/pub/telephony/firmware/releases
+DAHDI_LINUX_FW_FILES = \
+	dahdi-fwload-vpmadt032-1.25.0.tar.gz \
+	dahdi-fw-oct6114-032-1.05.01.tar.gz \
+	dahdi-fw-oct6114-064-1.05.01.tar.gz \
+	dahdi-fw-oct6114-128-1.05.01.tar.gz \
+	dahdi-fw-oct6114-256-1.05.01.tar.gz \
+	dahdi-fw-tc400m-MR6.12.tar.gz \
+	dahdi-fw-hx8-2.06.tar.gz \
+	dahdi-fw-vpmoct032-1.12.0.tar.gz \
+	dahdi-fw-te820-1.76.tar.gz \
+	dahdi-fw-te133-7a001e.tar.gz \
+	dahdi-fw-te134-780017.tar.gz \
+	dahdi-fw-a8b-1f001e.tar.gz \
+	dahdi-fw-a8a-1d0017.tar.gz \
+	dahdi-fw-a4b-d001e.tar.gz \
+	dahdi-fw-a4a-a0017.tar.gz \
+	dahdi-fw-te435-13001e.tar.gz \
+	dahdi-fw-te436-10017.tar.gz
+
+DAHDI_LINUX_EXTRA_DOWNLOADS = \
+	$(patsubst %,$(DAHDI_LINUX_FW_SITE)/%,$(DAHDI_LINUX_FW_FILES))
+
+# dahdi-linux claims to be GPLv2 with parts LGPLv2.1 (not 'or later'),
+# but there are the so-called firmware files (downloaded above) for
+# which the license is unclear: the header claims to be GPLv2, the
+# 'loader-wrapper' claims to be GPLv2, but there are two so-called
+# 'firmware' binary-only .o blobs for which the license is not
+# explicited, which look like they end up as part of a kernel module,
+# and for which the source is nowhere to be found on the upstream site
+# (they are only for x86/x86_64, but we still list them unconditionally).
+DAHDI_LINUX_LICENSE = GPL-2.0, LGPL-2.1, unknown (firmware files)
+DAHDI_LINUX_LICENSE_FILES = LICENSE LICENSE.LGPL
+
+DAHDI_LINUX_INSTALL_STAGING = YES
+
+DAHDI_LINUX_MODULE_SUBDIRS = drivers/dahdi
+
+DAHDI_LINUX_MODULE_MAKE_OPTS = \
+	KSRC=$(LINUX_DIR) \
+	KVERS=$(LINUX_VERSION_PROBED) \
+	DAHDI_BUILD_ALL=m \
+	DAHDI_INCLUDE=$(@D)/include \
+	INSTALL_MOD_DIR=dahdi
+
+define DAHDI_LINUX_EXTRACT_FW
+	$(foreach f,$(DAHDI_LINUX_FW_FILES),\
+		cp $(BR2_DL_DIR)/$(f) $(@D)/drivers/dahdi/firmware/$(f)$(sep))
+endef
+DAHDI_LINUX_POST_EXTRACT_HOOKS += DAHDI_LINUX_EXTRACT_FW
+
+# Need to pass the same options as for building the modules, because
+# it wants to scan Linux' .config file to check whether some options
+# are set or not (like CONFIG_FW_LOADER).
+define DAHDI_LINUX_CONFIGURE_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(DAHDI_LINUX_MODULE_MAKE_OPTS) \
+		prereq
+endef
+
+define DAHDI_LINUX_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(DAHDI_LINUX_MODULE_MAKE_OPTS) \
+		DESTDIR=$(STAGING_DIR) \
+		install-include
+endef
+
+define DAHDI_LINUX_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(DAHDI_LINUX_MODULE_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		install-firmware \
+		install-xpp-firm
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
