From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 18 Jul 2014 20:54:56 +0200
Subject: [Buildroot] [PATCH 3 of 3 v3] uclibc: update-config: preserve
 freshly configured settings
In-Reply-To: <patchbomb.1405709693@localhost>
References: <patchbomb.1405709693@localhost>
Message-ID: <f8c110cf3b83a4e29146.1405709696@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
v3:
- further clarification in the commit message
v2:
- use $(Q)touch iso touch (Arnout)
- update commit message to clarify stamp file choice (Arnout)

rfc->patch:
- rebase
- rename .stamp_config_file_fixed into .stamp_config_fixup_done
- add dependency on .config from .stamp_config_file_fixed (Arnout)
- remove explicit call to UCLIBC_FIXUP_DOT_CONFIG from configure commands,
  and instead depend on .stamp_config_fixup_done.

 package/uclibc/uclibc.mk |  12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff -r 29ba03b43b12 -r f8c110cf3b83 package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk	Sun Jun 22 10:37:22 2014 +0200
+++ b/package/uclibc/uclibc.mk	Mon Jun 16 20:18:23 2014 +0200
@@ -432,7 +432,6 @@
 endef
 
 define UCLIBC_CONFIGURE_CMDS
-	$(UCLIBC_FIXUP_DOT_CONFIG)
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
@@ -537,7 +536,11 @@
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
@@ -546,9 +549,10 @@
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
