From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 23:19:36 +0200
Subject: [Buildroot] [git commit] toolchain: check the SSP option is known
Message-ID: <20190803211932.1F40583EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebc391a718617ac20b16d8aef4b2915b04e46f5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/helpers.mk                                   | 8 ++++++++
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 03355f56dd..86d945a5b1 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -433,6 +433,7 @@ check_unusable_toolchain = \
 # Check if the toolchain has SSP (stack smashing protector) support
 #
 # $1: cross-gcc path
+# $2: gcc ssp option
 #
 check_toolchain_ssp = \
 	__CROSS_CC=$(strip $1) ; \
@@ -445,6 +446,13 @@ check_toolchain_ssp = \
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
index 894e76ee32..c3ddff263f 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -556,7 +556,7 @@ define $(2)_CONFIGURE_CMDS
 	else \
 		$$(call check_glibc,$$$${SYSROOT_DIR}) ; \
 	fi
-	$$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC))
+	$$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC),$(BR2_SSP_OPTION))
 endef
 
 $(2)_TOOLCHAIN_WRAPPER_ARGS += $$(TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS)
