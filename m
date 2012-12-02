From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 01 Dec 2012 18:27:21 -0800
Subject: [Buildroot] [git commit] pkg-infra: introduce errors for legacy
	API
In-Reply-To: <20121201174909.1d52aad3@skate> (Thomas Petazzoni's message of
 "Sat, 1 Dec 2012 17:49:09 +0100")
References: <20121130201152.E2AE89940D@busybox.osuosl.org>
 <20121201174909.1d52aad3@skate>
Message-ID: <87hao56vee.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> As discussed in the BR developer days, we want to be more strict about API
 >> changes in buildroot. I.e., we want to make it less likely that a user's
 >> customizations break down after upgrading buildroot.
 >> 
 >> A first step is to make sure that the user is warned about API changes.
 >> This patch introduces Makefile.legacy and Config.in.legacy, which will
 >> issue clear error messages for such situations.
 >> 
 >> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 >> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

 Thomas> This doesn't really work well with randpackageconfig, and therefore
 Thomas> breaks the autobuilders badly.

 Thomas> For example, randpackageconfig can enable BR2_PACKAGE_GETTEXT_STATIC,
 Thomas> because it matches BR2_PACKAGE_<foo>, this will select BR2_LEGACY,
 Thomas> which will abort the build.

 Thomas> Should it be fixed just in the autobuilders scripts, or do we consider
 Thomas> the fact that "make randpackageconfig" generates un-buildable
 Thomas> configuration is a bug by itself?

I would call it a bug. I've fixed it like this:

[PATCH] {rand,allyes}packageconfig: ensure legacy test options don't
 get enabled

The legacy BR2_PACKAGE_* options in Config.in.legacy are not supposed to
be user selectable, so {rand,allyes}packageconfig shouldn't enable them.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index d3f9b40..b394fd5 100644
--- a/Makefile
+++ b/Makefile
@@ -619,6 +619,9 @@ allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
+	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
+		while read config pkg; do \
+		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
 	@$(COMMON_CONFIG_ENV) \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --randconfig $(CONFIG_CONFIG_IN)
@@ -627,6 +630,9 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
+	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
+		while read config pkg; do \
+		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
 	@$(COMMON_CONFIG_ENV) \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --allyesconfig $(CONFIG_CONFIG_IN)

-- 
Bye, Peter Korsgaard
