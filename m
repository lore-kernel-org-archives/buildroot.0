From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue,  6 Aug 2019 14:02:03 +0300
Subject: [Buildroot] [PATCH v4 1/1] pkg-infra/show-info: dump
 install_{staging, target, images} info
Message-ID: <20190806110203.24423-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

provide info if the package will be installed to staging/target/images
destinations. Might be useful for analyzing the packages which
installed for target/staging/images.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---

v4:
    1) use "install_{target,staging,images}" property name format (suggested by Arnout Vandecappelle)

    2) add and use macro for YES/NO -> true/false conversion (suggested by Arnout Vandecappelle)

    3) add "install_images" property (suggested by Yann E. Morin)

v3:
    1) fix evaluation of true/false value via 'subst' (suggested by Yann E. Morin)

v2:
    1) use oneliner 'if' to dump install_{staging,target} properties

 package/pkg-utils.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b7280e930f..74ade437d9 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -62,6 +62,11 @@ $$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
 endif
 endef
 
+# $(1): YES or NO
+define yesno-to-bool
+	$(subst NO,false,$(subst YES,true,$(1)))
+endef
+
 # json-info -- return package or filesystem metadata formatted as an entry
 #              of a JSON dictionnary
 # $(1): upper-case package or filesystem name
@@ -94,6 +99,9 @@ endef
 define _json-info-pkg-details
 	"version": "$($(1)_DL_VERSION)",
 	"licenses": "$($(1)_LICENSE)",
+	"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET)),
+	"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING)),
+	"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES)),
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
 		{
-- 
2.17.1
