From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jan 2011 12:09:42 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: handle long
	term support kernels, bump 2.6.35
Message-ID: <20110126112159.005478D348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=30366440498292065a16865784c859d1f25dcb7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

2.6.34 was (erroneously) already updated earlier.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    2 +-
 toolchain/kernel-headers/kernel-headers.mk         |    9 +++++++++
 ...types-for-headers-exported-to-user-space.patch} |    0
 3 files changed, 10 insertions(+), 1 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.35.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.35.10-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 70b2ce0..6710098 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -45,7 +45,7 @@ config BR2_DEFAULT_KERNEL_VERSION
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.34.8"	if BR2_KERNEL_HEADERS_2_6_34
-	default "2.6.35.9"	if BR2_KERNEL_HEADERS_2_6_35
+	default "2.6.35.10"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.3"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 34a75e7..7d2e45b 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -32,6 +32,15 @@ LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOLCHAIN_DIR)/linux
 
+# long term support kernels are stored in a longterm/v2.6.x subdir
+ifeq ($(BR2_KERNEL_HEADERS_2_6_34)$(BR2_KERNEL_HEADERS_2_6_35),y)
+DEFAULT_KERNEL_HEADERS_MAJOR := \
+	$(shell echo $(DEFAULT_KERNEL_HEADERS) | sed 's/\.[0-9]*$$//')
+# += adds a space between
+LINUX_HEADERS_SITE:= \
+	$(LINUX_HEADERS_SITE)longterm/v$(DEFAULT_KERNEL_HEADERS_MAJOR)/
+endif
+
 LINUX_HEADERS_DEPENDS:=
 
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
diff --git a/toolchain/kernel-headers/linux-2.6.35.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.35.10-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.35.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.35.10-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.3.4
