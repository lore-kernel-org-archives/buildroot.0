From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 12 Mar 2019 13:09:32 +0100
Subject: [Buildroot] [PATCH 1/5 v2] toolchain: prepare to pass more
 additional CFLAGS via the wrapper
In-Reply-To: <cover.1552392456.git.yann.morin@orange.com>
References: <cover.1552392456.git.yann.morin@orange.com>
Message-ID: <17089_1552392582_5C87A186_17089_129_1_a5ce0b38-3ef0-45ac-a336-7985a6490f2b@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin@orange.com>

Currently, we pass the user-supplied so-called target optimisation flags
to the wrapper.

We're going to have additional such CFLAGS to pass, so push-back the
formatting loop to quote the options at the last moment.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 toolchain/toolchain-wrapper.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 613f5f6c56..c9e6fd3f3d 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -16,11 +16,13 @@ endif
 TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
+TOOLCHAIN_WRAPPER_OPTS = \
+	$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
+
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
 # separate argument when used in execv() by the toolchain wrapper.
-TOOLCHAIN_WRAPPER_OPTS = \
-	$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)"$(comma))
-TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(TOOLCHAIN_WRAPPER_OPTS)'
+TOOLCHAIN_WRAPPER_ARGS += \
+	-DBR_ADDITIONAL_CFLAGS='$(foreach f,$(TOOLCHAIN_WRAPPER_OPTS),"$(f)"$(comma))'
 
 ifeq ($(BR2_CCACHE),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
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
