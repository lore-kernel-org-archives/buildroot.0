From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Mar 2013 23:03:03 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: do not depend on the
	top-level Buildroot's .config
Message-ID: <1363644183-29242-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously, the crosstool-NG backend did depend on the top-level
Buildroot's .config to detect changes in the toolchain options,
using a tentatively-clever heuristic, which also included the full
Buildroot's version string to push down to set the components' versions
strings.

In doing so, any commit in the Buildroot tree would imply a complete
rebuild of the toolchain, even in the case the toolchain options did
not change, thus being a large annoyance (to say the least).

As Buildroot never guaranteed that toolchain options would be detected,
even less handled, and that the internal backend does neither detect nor
act on toolchain options changes, and delegate that to the user, there
is no point in individualising the crosstool-NG backend's behaviour.

This reasoning also applies to the depdency on the crosstool-NG's bundled
.config file, too.

So, just drop the not-so-clever heuristic, and just build the toolchain
once, leaving to the user the responsibility to explictly ask Buildroot
to rebuild the toolchain.

Reported-by: "Przemyslaw Wrzos" <przemyslaw.wrzos@calyptech.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Przemyslaw Wrzos" <przemyslaw.wrzos@calyptech.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - properly use $(CTNG_CONFIG_FILE)  (Przemyslaw)
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 6554982..59f18c7 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -362,32 +362,28 @@ endef
 $(CTNG_DIR)/.config: | host-crosstool-ng
 
 # Default configuration
-# Depends on top-level .config because it has options we have to shoe-horn
-# into crosstool-NG's .config
 # Only copy the original .config file if we don't have one already.
 # Check that given config file matches selected C library.
 # We need to call oldconfig twice in a row to ensure the options
 # are correctly set ( eg. if an option is new, then the initial sed
 # can't do anything about it ) Ideally, this should go in oldconfig
 # itself, but it's much easier to handle here.
-
-$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(BUILDROOT_CONFIG)
+$(CTNG_DIR)/.config:
 	$(Q)if [ ! -f $@ ]; then                                                        \
 	        mkdir -p "$(CTNG_DIR)";                                                 \
-	        libc="$$(awk -F '"' '$$1=="CT_LIBC=" { print $$2; }' "$<")";            \
+	        libc="$$(awk -F '"' '$$1=="CT_LIBC=" { print $$2; }'                    \
+	                        "$(CTNG_CONFIG_FILE)"                                   \
+	                )";                                                             \
 	        if [ "$${libc}" != "$(BR2_TOOLCHAIN_CTNG_LIBC)" ]; then                 \
-	            echo "* Inconsistency in crosstool-NG config file '$<'";            \
+	            echo "* Inconsistency in crosstool-NG config file '$(CTNG_CONFIG_FILE)'"; \
 	            echo "* - buildroot configured for '$(BR2_TOOLCHAIN_CTNG_LIBC)'";   \
 	            echo "* - given config file for '$${libc}'";                        \
 	            exit 1;                                                             \
 	        fi;                                                                     \
-	        cp -f $< $@;                                                            \
+	        cp -f $(CTNG_CONFIG_FILE) $@;                                                            \
 	    fi
-	$(Q)cp -a $@ $@.timestamp
 	$(call ctng-oldconfig,$@)
 	$(call ctng-oldconfig,$@)
-	$(call ctng-check-config-changed,$@,$@.timestamp)
-	$(Q)rm -f $@.timestamp
 
 # Manual configuration
 ctng-menuconfig: $(CTNG_DIR)/.config
-- 
1.7.2.5
