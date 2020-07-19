From: Dick Olsson <hi@senzilla.io>
Date: Sun, 19 Jul 2020 19:03:01 +0000
Subject: [Buildroot] [PATCH 1/1] boot/optee-os: Depend on host-python3
Message-ID: <20200719190244.30172-1-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent versions of OP-TEE depend on Python 3. Currently, OP-TEE is building with
the Python interpreter provided by the user. This patch includes an upstream
patch that makes the interpreter configurable, and makes use of this
configuration with host-python3.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 ...e-ta-Configurable-Python-interpreter.patch | 222 ++++++++++++++++++
 boot/optee-os/Config.in                       |   1 +
 boot/optee-os/optee-os.mk                     |   5 +-
 3 files changed, 226 insertions(+), 2 deletions(-)
 create mode 100644 boot/optee-os/0003-mk-core-ta-Configurable-Python-interpreter.patch

diff --git a/boot/optee-os/0003-mk-core-ta-Configurable-Python-interpreter.patch b/boot/optee-os/0003-mk-core-ta-Configurable-Python-interpreter.patch
new file mode 100644
index 0000000000..155ee89c64
--- /dev/null
+++ b/boot/optee-os/0003-mk-core-ta-Configurable-Python-interpreter.patch
@@ -0,0 +1,222 @@
+From b267decbe19b88adaea32946bd67ea40de9f612b Mon Sep 17 00:00:00 2001
+From: Dick Olsson <hi@senzilla.io>
+Date: Mon, 13 Jul 2020 16:57:12 +0200
+Subject: [PATCH 3/3] mk: core: ta: Configurable Python interpreter
+
+Build systems that manage multiple different python interpreters need explicit
+control over which version of the interpreter to use. This patch enables one to
+override the default interpreter with the path to a specific one.
+
+Signed-off-by: Dick Olsson <hi@senzilla.io>
+---
+ core/arch/arm/kernel/link.mk | 22 +++++++++++-----------
+ core/sub.mk                  | 10 +++++-----
+ mk/config.mk                 |  6 ++++++
+ mk/lib.mk                    |  2 +-
+ ta/arch/arm/link.mk          |  2 +-
+ ta/arch/arm/link_shlib.mk    |  2 +-
+ ta/ta.mk                     |  2 +-
+ 7 files changed, 26 insertions(+), 20 deletions(-)
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index 1b89b895..b6d047b5 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -62,13 +62,13 @@ cleanfiles += $(link-out-dir)/text_unpaged.ld.S
+ $(link-out-dir)/text_unpaged.ld.S: $(link-out-dir)/unpaged.o
+ 	@$(cmd-echo-silent) '  GEN     $@'
+ 	$(q)$(READELFcore) -S -W $< | \
+-		./scripts/gen_ld_sects.py .text. > $@
++		$(CFG_PYTHON) ./scripts/gen_ld_sects.py .text. > $@
+ 
+ cleanfiles += $(link-out-dir)/rodata_unpaged.ld.S
+ $(link-out-dir)/rodata_unpaged.ld.S: $(link-out-dir)/unpaged.o
+ 	@$(cmd-echo-silent) '  GEN     $@'
+ 	$(q)$(READELFcore) -S -W $< | \
+-		./scripts/gen_ld_sects.py .rodata. > $@
++		$(CFG_PYTHON) ./scripts/gen_ld_sects.py .rodata. > $@
+ 
+ 
+ cleanfiles += $(link-out-dir)/init_entries.txt
+@@ -92,12 +92,12 @@ cleanfiles += $(link-out-dir)/text_init.ld.S
+ $(link-out-dir)/text_init.ld.S: $(link-out-dir)/init.o
+ 	@$(cmd-echo-silent) '  GEN     $@'
+ 	$(q)$(READELFcore) -S -W $< | \
+-		./scripts/gen_ld_sects.py .text. > $@
++		$(CFG_PYTHON) ./scripts/gen_ld_sects.py .text. > $@
+ 
+ cleanfiles += $(link-out-dir)/rodata_init.ld.S
+ $(link-out-dir)/rodata_init.ld.S: $(link-out-dir)/init.o
+ 	@$(cmd-echo-silent) '  GEN     $@'
+-	$(q)$(READELFcore) -S -W $< | ./scripts/gen_ld_sects.py .rodata. > $@
++	$(q)$(READELFcore) -S -W $< | $(CFG_PYTHON) ./scripts/gen_ld_sects.py .rodata. > $@
+ 
+ -include $(link-script-dep)
+ 
+@@ -176,39 +176,39 @@ cleanfiles += $(link-out-dir)/tee-pager.bin
+ $(link-out-dir)/tee-pager.bin: $(link-out-dir)/tee.elf scripts/gen_tee_bin.py
+ 	@echo Warning: $@ is deprecated
+ 	@$(cmd-echo-silent) '  GEN     $@'
+-	$(q)scripts/gen_tee_bin.py --input $< --out_tee_pager_bin $@
++	$(q)$(CFG_PYTHON) scripts/gen_tee_bin.py --input $< --out_tee_pager_bin $@
+ 
+ cleanfiles += $(link-out-dir)/tee-pageable.bin
+ $(link-out-dir)/tee-pageable.bin: $(link-out-dir)/tee.elf scripts/gen_tee_bin.py
+ 	@echo Warning: $@ is deprecated
+ 	@$(cmd-echo-silent) '  GEN     $@'
+-	$(q)scripts/gen_tee_bin.py --input $< --out_tee_pageable_bin $@
++	$(q)$(CFG_PYTHON) scripts/gen_tee_bin.py --input $< --out_tee_pageable_bin $@
+ 
+ all: $(link-out-dir)/tee.bin
+ cleanfiles += $(link-out-dir)/tee.bin
+ $(link-out-dir)/tee.bin: $(link-out-dir)/tee.elf scripts/gen_tee_bin.py
+ 	@$(cmd-echo-silent) '  GEN     $@'
+-	$(q)scripts/gen_tee_bin.py --input $< --out_tee_bin $@
++	$(q)$(CFG_PYTHON) scripts/gen_tee_bin.py --input $< --out_tee_bin $@
+ 
+ all: $(link-out-dir)/tee-header_v2.bin
+ cleanfiles += $(link-out-dir)/tee-header_v2.bin
+ $(link-out-dir)/tee-header_v2.bin: $(link-out-dir)/tee.elf \
+ 				   scripts/gen_tee_bin.py
+ 	@$(cmd-echo-silent) '  GEN     $@'
+-	$(q)scripts/gen_tee_bin.py --input $< --out_header_v2 $@
++	$(q)$(CFG_PYTHON) scripts/gen_tee_bin.py --input $< --out_header_v2 $@
+ 
+ all: $(link-out-dir)/tee-pager_v2.bin
+ cleanfiles += $(link-out-dir)/tee-pager_v2.bin
+ $(link-out-dir)/tee-pager_v2.bin: $(link-out-dir)/tee.elf scripts/gen_tee_bin.py
+ 	@$(cmd-echo-silent) '  GEN     $@'
+-	$(q)scripts/gen_tee_bin.py --input $< --out_pager_v2 $@
++	$(q)$(CFG_PYTHON) scripts/gen_tee_bin.py --input $< --out_pager_v2 $@
+ 
+ all: $(link-out-dir)/tee-pageable_v2.bin
+ cleanfiles += $(link-out-dir)/tee-pageable_v2.bin
+ $(link-out-dir)/tee-pageable_v2.bin: $(link-out-dir)/tee.elf \
+ 				     scripts/gen_tee_bin.py
+ 	@$(cmd-echo-silent) '  GEN     $@'
+-	$(q)scripts/gen_tee_bin.py --input $< --out_pageable_v2 $@
++	$(q)$(CFG_PYTHON) scripts/gen_tee_bin.py --input $< --out_pageable_v2 $@
+ 
+ all: $(link-out-dir)/tee.symb_sizes
+ cleanfiles += $(link-out-dir)/tee.symb_sizes
+@@ -222,5 +222,5 @@ mem_usage: $(link-out-dir)/tee.mem_usage
+ 
+ $(link-out-dir)/tee.mem_usage: $(link-out-dir)/tee.elf
+ 	@$(cmd-echo-silent) '  GEN     $@'
+-	$(q)./scripts/mem_usage.py $< > $@
++	$(q)$(CFG_PYTHON) ./scripts/mem_usage.py $< > $@
+ endif
+diff --git a/core/sub.mk b/core/sub.mk
+index 03cc6bc7..51772b04 100644
+--- a/core/sub.mk
++++ b/core/sub.mk
+@@ -9,13 +9,13 @@ ifeq ($(CFG_WITH_USER_TA),y)
+ gensrcs-y += ta_pub_key
+ produce-ta_pub_key = ta_pub_key.c
+ depends-ta_pub_key = $(TA_SIGN_KEY) scripts/pem_to_pub_c.py
+-recipe-ta_pub_key = scripts/pem_to_pub_c.py --prefix ta_pub_key \
++recipe-ta_pub_key = $(CFG_PYTHON) scripts/pem_to_pub_c.py --prefix ta_pub_key \
+ 		--key $(TA_SIGN_KEY) --out $(sub-dir-out)/ta_pub_key.c
+ 
+ gensrcs-y += ldelf
+ produce-ldelf = ldelf_hex.c
+ depends-ldelf = scripts/gen_ldelf_hex.py $(out-dir)/ldelf/ldelf.elf
+-recipe-ldelf = scripts/gen_ldelf_hex.py --input $(out-dir)/ldelf/ldelf.elf \
++recipe-ldelf = $(CFG_PYTHON) scripts/gen_ldelf_hex.py --input $(out-dir)/ldelf/ldelf.elf \
+ 			--output $(sub-dir-out)/ldelf_hex.c
+ endif
+ 
+@@ -25,7 +25,7 @@ early-ta-$1-uuid := $(firstword $(subst ., ,$(notdir $1)))
+ gensrcs-y += early-ta-$1
+ produce-early-ta-$1 = early_ta_$$(early-ta-$1-uuid).c
+ depends-early-ta-$1 = $1 scripts/ta_bin_to_c.py
+-recipe-early-ta-$1 = scripts/ta_bin_to_c.py --compress --ta $1 \
++recipe-early-ta-$1 = $(CFG_PYTHON) scripts/ta_bin_to_c.py --compress --ta $1 \
+ 		--out $(sub-dir-out)/early_ta_$$(early-ta-$1-uuid).c
+ endef
+ $(foreach f, $(EARLY_TA_PATHS), $(eval $(call process_early_ta,$(f))))
+@@ -40,7 +40,7 @@ core-embed-fdt-c = $(out-dir)/$(arch-dir)/dts/$(CFG_EMBED_DTB_SOURCE_FILE:.dts=.
+ gensrcs-y += embedded_secure_dtb
+ produce-embedded_secure_dtb = arch/$(ARCH)/dts/$(CFG_EMBED_DTB_SOURCE_FILE:.dts=.c)
+ depends-embedded_secure_dtb = $(core-embed-fdt-dtb) scripts/bin_to_c.py
+-recipe-embedded_secure_dtb = scripts/bin_to_c.py \
++recipe-embedded_secure_dtb = $(CFG_PYTHON) scripts/bin_to_c.py \
+ 				--bin $(core-embed-fdt-dtb) \
+ 				--vname embedded_secure_dtb \
+ 				--out $(core-embed-fdt-c)
+@@ -58,7 +58,7 @@ $(conf-mk-xz-base64): $(conf-mk-file)
+ gensrcs-y += conf_str
+ produce-conf_str = conf.mk.xz.base64.c
+ depends-conf_str = $(conf-mk-xz-base64)
+-recipe-conf_str = scripts/bin_to_c.py --text --bin $(conf-mk-xz-base64) \
++recipe-conf_str = $(CFG_PYTHON) scripts/bin_to_c.py --text --bin $(conf-mk-xz-base64) \
+ 			--out $(sub-dir-out)/conf.mk.xz.base64.c \
+ 			--vname conf_str
+ endif
+diff --git a/mk/config.mk b/mk/config.mk
+index 70732c4d..cf73f16a 100644
+--- a/mk/config.mk
++++ b/mk/config.mk
+@@ -582,3 +582,9 @@ CFG_SCMI_MSG_DRIVERS ?= n
+ CFG_SCMI_MSG_CLOCK ?= n
+ CFG_SCMI_MSG_RESET_DOMAIN ?= n
+ CFG_SCMI_MSG_SMT ?= n
++
++# Path to the Python interpreter used by the build system.
++# By default the interpreter is defined by the system through /usr/bin/env.
++# Build environments that require more explicit control can configure which
++# interpreter to use through this environment variable.
++CFG_PYTHON ?= python3
+diff --git a/mk/lib.mk b/mk/lib.mk
+index 6e890893..cea2cda1 100644
+--- a/mk/lib.mk
++++ b/mk/lib.mk
+@@ -72,7 +72,7 @@ $(lib-shlibstrippedfile): $(lib-shlibfile)
+ 
+ $(lib-shlibtafile): $(lib-shlibstrippedfile) $(TA_SIGN_KEY)
+ 	@$(cmd-echo-silent) '  SIGN    $$@'
+-	$$(q)$$(SIGN) --key $(TA_SIGN_KEY) --uuid $(libuuid) --in $$< --out $$@
++	$$(q)$$(CFG_PYTHON) $$(SIGN) --key $(TA_SIGN_KEY) --uuid $(libuuid) --in $$< --out $$@
+ 
+ $(lib-libuuidln): $(lib-shlibfile)
+ 	@$(cmd-echo-silent) '  LN      $$@'
+diff --git a/ta/arch/arm/link.mk b/ta/arch/arm/link.mk
+index db7d0b9a..12cd24d2 100644
+--- a/ta/arch/arm/link.mk
++++ b/ta/arch/arm/link.mk
+@@ -2,7 +2,7 @@ link-script$(sm) = $(ta-dev-kit-dir$(sm))/src/ta.ld.S
+ link-script-pp$(sm) = $(link-out-dir$(sm))/ta.lds
+ link-script-dep$(sm) = $(link-out-dir$(sm))/.ta.ld.d
+ 
+-SIGN_ENC ?= $(ta-dev-kit-dir$(sm))/scripts/sign_encrypt.py
++SIGN_ENC ?= $(CFG_PYTHON) $(ta-dev-kit-dir$(sm))/scripts/sign_encrypt.py
+ TA_SIGN_KEY ?= $(ta-dev-kit-dir$(sm))/keys/default_ta.pem
+ 
+ ifeq ($(CFG_ENCRYPT_TA),y)
+diff --git a/ta/arch/arm/link_shlib.mk b/ta/arch/arm/link_shlib.mk
+index ed81e59a..2b6db7b8 100644
+--- a/ta/arch/arm/link_shlib.mk
++++ b/ta/arch/arm/link_shlib.mk
+@@ -47,5 +47,5 @@ $(link-out-dir)/$(shlibuuid).elf: $(link-out-dir)/$(shlibname).so
+ $(link-out-dir)/$(shlibuuid).ta: $(link-out-dir)/$(shlibname).stripped.so \
+ 				$(TA_SIGN_KEY)
+ 	@$(cmd-echo-silent) '  SIGN    $@'
+-	$(q)$(SIGN) --key $(TA_SIGN_KEY) --uuid $(shlibuuid) \
++	$(q)$(CFG_PYTHON) $(SIGN) --key $(TA_SIGN_KEY) --uuid $(shlibuuid) \
+ 		--in $< --out $@
+diff --git a/ta/ta.mk b/ta/ta.mk
+index 918880f4..1efb4082 100644
+--- a/ta/ta.mk
++++ b/ta/ta.mk
+@@ -67,7 +67,7 @@ $$(arm32-user-sysregs-out)/$$(arm32-user-sysregs-$(1)-h): \
+ 		$(1) scripts/arm32_sysreg.py
+ 	@$(cmd-echo-silent) '  GEN     $$@'
+ 	$(q)mkdir -p $$(dir $$@)
+-	$(q)scripts/arm32_sysreg.py --guard __$$(arm32-user-sysregs-$(1)-h) \
++	$(q)$(CFG_PYTHON) scripts/arm32_sysreg.py --guard __$$(arm32-user-sysregs-$(1)-h) \
+ 		< $$< > $$@
+ 
+ endef #process-arm32-user-sysreg
+-- 
+2.20.1
+
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 5a786833ef..20ff053767 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -1,6 +1,7 @@
 config BR2_TARGET_OPTEE_OS
 	bool "optee_os"
 	depends on BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A
+	select BR2_PACKAGE_PYTHON3
 	help
 	  OP-TEE OS provides the secure world boot image and the trust
 	  application development kit of the OP-TEE project. OP-TEE OS
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index c6d1bbd48a..e397e4b26e 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -21,7 +21,7 @@ else
 OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
 endif
 
-OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycryptodomex host-python-pyelftools
+OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pycryptodomex host-python-pyelftools
 
 # On 64bit targets, OP-TEE OS can be built in 32bit mode, or
 # can be built in 64bit mode and support 32bit and 64bit
@@ -32,7 +32,8 @@ OPTEE_OS_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	CROSS_COMPILE_core="$(TARGET_CROSS)" \
 	CROSS_COMPILE_ta_arm64="$(TARGET_CROSS)" \
-	CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)"
+	CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)" \
+	CFG_PYTHON="$(HOST_DIR)/bin/python"
 
 ifeq ($(BR2_aarch64),y)
 OPTEE_OS_MAKE_OPTS += \
-- 
2.20.1
