From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 12 Mar 2019 13:09:36 +0100
Subject: [Buildroot] [PATCH 5/5 v2] toolchain: allow PIC/PIE without RELRO
In-Reply-To: <cover.1552392456.git.yann.morin@orange.com>
References: <cover.1552392456.git.yann.morin@orange.com>
Message-ID: <16391_1552392582_5C87A186_16391_281_1_704ea354-404e-4e6b-af91-9e63897e78c9@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin@orange.com>

In commit 7484c1c3b806 (toolchain/toolchain-wrapper: add BR2_RELRO_),
we added the PIC/PIE flags, but based on the RELRO_FULL condition.

It is however totally possible to do a PIC/PIE executable without
RELRO_FULL, as it is also valid to do a PIC/PIE build with RELRO_PARTIAL.

Add a new option that now governs the PIC/PIE flags.

Note: it is unknown if RELRO_FULL really needs PIC/PIE or not, so we
keep the current situation, where RELRO-FULL forces PIC/PIE compilation.
Decoupling can come later from an interested party.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Config.in                      | 8 ++++++++
 toolchain/toolchain-wrapper.c  | 2 +-
 toolchain/toolchain-wrapper.mk | 4 ++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index d5a0460f98..31fea3ab34 100644
--- a/Config.in
+++ b/Config.in
@@ -712,6 +712,13 @@ endmenu
 
 comment "Security Hardening Options"
 
+config BR2_PIC_PIE
+	bool "Build code with PIC/PIE"
+	depends on BR2_SHARED_LIBS
+	help
+	  Generate Position-Independent Code (PIC) and link
+	  Position-Independent Executables (PIE).
+
 choice
 	bool "Stack Smashing Protection"
 	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
@@ -794,6 +801,7 @@ config BR2_RELRO_PARTIAL
 
 config BR2_RELRO_FULL
 	bool "Full"
+	select BR2_PIC_PIE
 	help
 	  This option includes the partial configuration, but also marks
 	  the GOT as read-only at the cost of initialization time during
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index c73a0cc079..7a4b9c4007 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -367,7 +367,7 @@ int main(int argc, char **argv)
 		*cur++ = "-Wno-builtin-macro-redefined";
 	}
 
-#ifdef BR2_RELRO_FULL
+#ifdef BR2_PIC_PIE
 	/* Patterned after Fedora/Gentoo hardening approaches.
 	 * https://fedoraproject.org/wiki/Changes/Harden_All_Packages
 	 * https://wiki.gentoo.org/wiki/Hardened/Toolchain#Position_Independent_Executables_.28PIEs.29
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index ca66fa7ba4..3c42146cea 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -48,6 +48,10 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
 
+ifeq ($(BR2_PIC_PIE),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR2_PIC_PIE
+endif
+
 ifeq ($(BR2_RELRO_PARTIAL),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_PARTIAL
 else ifeq ($(BR2_RELRO_FULL),y)
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
