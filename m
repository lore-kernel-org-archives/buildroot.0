From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 12 Mar 2019 13:09:34 +0100
Subject: [Buildroot] [PATCH 3/5 v2] toolchain: check the SSP option is known
In-Reply-To: <cover.1552392456.git.yann.morin@orange.com>
References: <cover.1552392456.git.yann.morin@orange.com>
Message-ID: <6137_1552392583_5C87A187_6137_470_1_3090e77d-fd75-49ec-8643-3a89ee5ea133@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin@orange.com>

Some toolchain vendors may have backported those options to older gcc
versions, and we have no way to know, so we have to check that the
user's selection is acceptable.

Extend the macro that currently checks for SSP in the toolchain, with
a new test that the actual SSP option is recognised and accepted.

Note that the SSP option is either totaly empty, or an already-quoted
string, so we can safely and easily assign it to a shell variable to
test and use it.

Note that we do not introduce BR2_TOOLCHAIN_HAS_SSP_STRONG, because:

  - our internal toolchain infra only supports gcc >= 4.9, so it has
    SSP strong;

  - of the external pre-built toolchains, only the codesourcery-arm
    one has a gcc-4.8 which lacks SSP strong, all the others have a
    gcc >= 4.9;

  - we'd still have to do the actual check for custom external
    toolchains anyway.

So, we're not adding BR2_TOOLCHAIN_HAS_SSP_STRONG just for a single
case.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - expand the commit log to explain why we're not adding
    BR2_TOOLCHAIN_HAS_SSP_STRONG  (Arnout)
---
 toolchain/helpers.mk                                   | 8 ++++++++
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index e5520c00c3..ba097e83cf 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -415,6 +415,7 @@ check_unusable_toolchain = \
 # Check if the toolchain has SSP (stack smashing protector) support
 #
 # $1: cross-gcc path
+# $2: gcc ssp option
 #
 check_toolchain_ssp = \
 	__CROSS_CC=$(strip $1) ; \
@@ -427,6 +428,13 @@ check_toolchain_ssp = \
 		echo "SSP support not available in this toolchain, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
 		exit 1 ; \
 	fi ; \
+	__SSP_OPTION=$(2); \
+	if [ -n "$${__SSP_OPTION}" ] ; then \
+		if ! echo 'void main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
+			echo "SSP option $${__SSP_OPTION} not available in this toolchain, please select another SSP level" ; \
+			exit 1 ; \
+		fi; \
+	fi; \
 	rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*
 
 #
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index db3570d96f..00cbd7b17a 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -549,7 +549,7 @@ define $(2)_CONFIGURE_CMDS
 	else \
 		$$(call check_glibc,$$$${SYSROOT_DIR}) ; \
 	fi
-	$$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC))
+	$$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC),$(BR2_SSP_OPTION))
 endef
 
 $(2)_TOOLCHAIN_WRAPPER_ARGS += $$(TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS)
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
