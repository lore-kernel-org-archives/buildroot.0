From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:43:37 +0200
Subject: [Buildroot] [git commit] uclibc: update-config: preserve freshly
	configured settings
Message-ID: <20140729214349.C4AE39CDCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b8a60cd52c6350e346f9783863d362eeccf82b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the sequence:

make uclibc-menuconfig
make uclibc-update-config

the freshly configured settings from the menuconfig are lost during the
update-config step. This is because update-config depends on the configure
step, which starts by copying the config file to the build directory.

Instead, stop depending on the configure step from update-config, and
introduce a new stamp file .stamp_config_fixup_done, which applies any
fixups on the .config file.
An alternative solution would be to add a call to UCLIBC_FIXUP_DOT_CONFIG to
the relevant targets instead of depending on a new stamp file. The advantage
of the stamp file, though, is that we avoid redoing the fixup unnecessarily.
Moreover, in the light of the plan to extract the kconfig-specific bits into
a separate kconfig-package infrastructure, the stamp file rules are more
easily moved into such an infrastructure, while the alternative solution
requires the package .mk file to explicitly call the FIXUP rules which may
more easily be forgotten.

No longer depending on the configure step has the added bonus that
'uclibc-update-config' no longer needs the toolchain to be available, which
makes:
    make clean uclibc-menuconfig uclibc-update-config
much faster and user-friendly.

Additionally, make sure that 'make clean uclibc-update-config' works
properly, by depending on .stamp_config_fixup_done so that the config file
is present and fixed.

Fixes bug #7154 https://bugs.busybox.net/show_bug.cgi?id=7154

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 83f68c3..4bc5ae1 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -432,7 +432,6 @@ define UCLIBC_FIXUP_DOT_CONFIG
 endef
 
 define UCLIBC_CONFIGURE_CMDS
-	$(UCLIBC_FIXUP_DOT_CONFIG)
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
@@ -537,7 +536,11 @@ $(eval $(generic-package))
 $(UCLIBC_DIR)/.config: $(UCLIBC_CONFIG_FILE) | uclibc-patch
 	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
 
-$(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.config
+$(UCLIBC_DIR)/.stamp_config_fixup_done: $(UCLIBC_DIR)/.config
+	$(UCLIBC_FIXUP_DOT_CONFIG)
+	$(Q)touch $@
+
+$(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.stamp_config_fixup_done
 
 uclibc-menuconfig: $(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
@@ -546,9 +549,10 @@ uclibc-menuconfig: $(UCLIBC_DIR)/.config
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(STAGING_DIR)/ \
 		menuconfig
-	rm -f $(UCLIBC_DIR)/.stamp_{configured,built,target_installed,staging_installed}
+	rm -f $(UCLIBC_DIR)/.stamp_{config_fixup_done,configured,built}
+	rm -f $(UCLIBC_DIR)/.stamp_{target,staging}_installed
 
-uclibc-update-config: $(UCLIBC_DIR)/.stamp_configured
+uclibc-update-config: $(UCLIBC_DIR)/.stamp_config_fixup_done
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 
 # Before uClibc is built, we must have the second stage cross-compiler
