From: yann.morin at orange.com <yann.morin@orange.com>
Date: Mon, 11 Mar 2019 07:48:18 +0100
Subject: [Buildroot] [PATCH 1/4] toolchain: set the ssp gcc option in kconfig
In-Reply-To: <cover.1552286891.git.yann.morin@orange.com>
References: <cover.1552286891.git.yann.morin@orange.com>
Message-ID: <8928_1552286905_5C8604B9_8928_92_1_1b5ea6bb-0d36-4857-888c-c65dd93bff8b@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin@orange.com>

Currently, we repeat all the SSP level selection deep down to the
toolchain wrapper itself, where we eventually translate it to the
actual SSP option to use. This is a bit redundant.

Additionally, we will want to check that the toolchain actually
supports that option (for those toolchain where it was backported).

So, move the translation into kconfig.

Since that new option does have neither a prompt, nor a default
value for SSP_NONE, it will not be set unless it actually contains
a non-empty string, so it will never be "" and we can skip the usual
qstrip-then-quote-anyway dance.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Config.in                      |  6 ++++++
 toolchain/toolchain-wrapper.c  | 10 ++--------
 toolchain/toolchain-wrapper.mk |  8 ++------
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/Config.in b/Config.in
index d58d8dc04a..757ad1ca40 100644
--- a/Config.in
+++ b/Config.in
@@ -764,6 +764,12 @@ config BR2_SSP_ALL
 
 endchoice
 
+config BR2_SSP_OPTION
+	string
+	default "-fstack-protector"        if BR2_SSP_REGULAR
+	default "-fstack-protector-strong" if BR2_SSP_STRONG
+	default "-fstack-protector-all"    if BR2_SSP_ALL
+
 comment "Stack Smashing Protection needs a toolchain w/ SSP"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index e9c5cd9d32..d605a7d648 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -98,14 +98,8 @@ static char *predef_args[] = {
 #if defined(BR_MIPS_TARGET_BIG_ENDIAN) || defined(BR_ARC_TARGET_BIG_ENDIAN)
 	"-EB",
 #endif
-#ifdef BR_SSP_REGULAR
-	"-fstack-protector",
-#endif
-#ifdef BR_SSP_STRONG
-	"-fstack-protector-strong",
-#endif
-#ifdef BR_SSP_ALL
-	"-fstack-protector-all",
+#ifdef BR_SSP_OPTION
+	BR_SSP_OPTION,
 #endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 613f5f6c56..e48e765a8e 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -51,12 +51,8 @@ else ifeq ($(BR2_RELRO_FULL),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_FULL
 endif
 
-ifeq ($(BR2_SSP_REGULAR),y)
-TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_REGULAR
-else ifeq ($(BR2_SSP_STRONG),y)
-TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_STRONG
-else ifeq ($(BR2_SSP_ALL),y)
-TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_ALL
+ifneq ($(BR2_SSP_OPTION),)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_OPTION='$(BR2_SSP_OPTION)'
 endif
 
 define TOOLCHAIN_WRAPPER_BUILD
-- 
2.17.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
