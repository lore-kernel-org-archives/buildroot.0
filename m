From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:28:32 +0200
Subject: [Buildroot] [git commit] package/pkg-utils: add install_{staging,
 target, images} details in show-info
Message-ID: <20190806202821.905248E4DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffc6da9537cf289f8ce02fa835fbc80a8c3ced51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit extends the show-info/<pkg>-show-info logic to include in
the JSON output details about whether the package installs files to
target, staging and/or images.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
