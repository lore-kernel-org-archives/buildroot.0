From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Oct 2018 11:01:58 +0200
Subject: [Buildroot] [PATCH v3 6/9] package/libpjsip: add Asterisk patch set
In-Reply-To: <20181014090202.31122-1-bernd.kuhls@t-online.de>
References: <20181014090202.31122-1-bernd.kuhls@t-online.de>
Message-ID: <20181014090202.31122-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting https://wiki.asterisk.org/wiki/display/AST/PJSIP-pjproject

"Asterisk currently contains two SIP stacks: the original chan_sip SIP
 channel driver which is a complete standalone implementation, has been
 present in all previous releases of Asterisk and no longer receives
 core support, and the newer chan_pjsip SIP stack that is based on
 Teluu's "pjproject" SIP stack.
[...]
 The actual pjproject source code is NOT distributed with Asterisk.
 Instead the Asterisk build process downloads the official pjproject
 tarball then patches, configures and builds pjproject when you build
 Asterisk."

This patch allows to use a buildroot-build libpjsip with all patches,
except 0000-remove-third-party.patch, provided by Asterisk.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: initial revision

 package/libpjsip/libpjsip.hash | 12 ++++++++++++
 package/libpjsip/libpjsip.mk   | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index 36c2ea1289..1e8a0a7a17 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -4,3 +4,15 @@ md5	fa3f0bc098c4bff48ddd92db1c016a7a  pjproject-2.7.2.tar.bz2
 # Locally computed
 sha256	9c2c828abab7626edf18e04b041ef274bfaa86f99adf2c25ff56f1509e813772	pjproject-2.7.2.tar.bz2
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+
+# Locally computed for Asterisk patchset
+sha256	65abd65eb09d8ce43e3f2f5afa8275b40a5c85828b7001ab68d49f6b1a9cf7cf  0000-set_apps_initial_log_level.patch
+sha256	8a61aa29b2b09461f7b62bd3778be91cb798f7e057a51e174f7f57ead0bcf58c  0021-sip_parser-Fix-return-code-in-pjsip_find_msg-and-add.patch
+sha256	118829d2220c1749cec4505fef64e3b3fb608270d2478909793f0bc35d4f4e1d  0030-sip_transport-Destroy-transports-not-in-hash.patch
+sha256	1f552b71d7af313ab30e84e1fdfc57835a663f15a1fa89dc3d039e897df52bb9  0040-183_without_to_tag.patch
+sha256	ef296a93d981dc912610a516f527f3812ec3e30c00b8f295618f23c3fdbbf25b  0050-dont_terminate_session_early.patch
+sha256	2062dedb28e73f069750810abe9a91029f272a85d816224c6333fbf094d38493  0060-sip_msg-Prevent-crash-on-header-without-vptr.patch
+sha256	172ef6c87ede67a4dcfa15e3681dba6c8321e8986e9b65021d77777c7fe4a9dd  0070-os_core_unix-Set-mutex-NULL-in-atomic-destroy-and-ad.patch
+sha256	c1a74736bdb03bd996420ed78d65b7d480ee423509dac16b4d4c70030eb3dd07  0080-timer-Clean-up-usage-of-timer-heap.patch
+sha256	9915d30220687323459d6c9beb33ea0789bf246b11454390b62065b943a2d623  0090-sip_transaction-In-tsx_timer_callback-check-if-tsx-i.patch
+sha256	069b686f66b90d32b10d89dd413a17676ac6d1ac569af6f27aeb9a02c3539046  0100-sip_inv-Add-option-to-accept-updated-SDP-on-same-To-.patch
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index b3c439d51c..ab9fca5821 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -13,6 +13,19 @@ LIBPJSIP_LICENSE_FILES = COPYING
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
 
+# Asterisk patch set
+LIBPJSIP_PATCH = \
+	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0000-set_apps_initial_log_level.patch \
+	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0021-sip_parser-Fix-return-code-in-pjsip_find_msg-and-add.patch \
+	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0030-sip_transport-Destroy-transports-not-in-hash.patch \
+	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0040-183_without_to_tag.patch \
+	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0050-dont_terminate_session_early.patch \
+	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0060-sip_msg-Prevent-crash-on-header-without-vptr.patch \
+	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0070-os_core_unix-Set-mutex-NULL-in-atomic-destroy-and-ad.patch \
+	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0080-timer-Clean-up-usage-of-timer-heap.patch \
+	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0090-sip_transaction-In-tsx_timer_callback-check-if-tsx-i.patch \
+	https://github.com/asterisk/asterisk/raw/16.0/third-party/pjproject/patches/0100-sip_inv-Add-option-to-accept-updated-SDP-on-same-To-.patch
+
 LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
 
 # relocation truncated to fit: R_68K_GOT16O
-- 
2.19.1
