From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2013 22:52:05 +0100
Subject: [Buildroot] [PATCH 3/3] toolchain/crostool-ng: use
	globally-exported CONFIG_FILE
In-Reply-To: <cover.1357595083.git.yann.morin.1998@free.fr>
References: <cover.1357595083.git.yann.morin.1998@free.fr>
Message-ID: <5151bbe6ca602dbc8d980535c42214870cf8a029.1357595083.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No need to recreate a path we already have.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 553c9ee..0559c4b 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -316,7 +316,7 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_D
 $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/libc.config
 
 # And here is how we get this uClibc's .config
-$(CTNG_DIR)/libc.config: $(CTNG_UCLIBC_CONFIG_FILE) $(CONFIG_DIR)/.config
+$(CTNG_DIR)/libc.config: $(CTNG_UCLIBC_CONFIG_FILE) $(BR2_CONFIG_FILE)
 	-$(Q)cp -a $@ $@.timestamp
 	$(Q)cp -f $< $@
 	$(call ctng-fix-dot-config,$@,$(CTNG_FIX_DOT_CONFIG_LIBC_SED))
@@ -372,7 +372,7 @@ $(CTNG_DIR)/.config: | host-crosstool-ng
 # can't do anything about it ) Ideally, this should go in oldconfig
 # itself, but it's much easier to handle here.
 
-$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(CONFIG_DIR)/.config
+$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(BR2_CONFIG_FILE)
 	$(Q)if [ ! -f $@ ]; then                                                        \
 	        mkdir -p "$(CTNG_DIR)";                                                 \
 	        libc="$$(awk -F '"' '$$1=="CT_LIBC=" { print $$2; }' "$<")";            \
-- 
1.7.2.5
