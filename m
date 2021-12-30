Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4342BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA35E402D0;
	Thu, 30 Dec 2021 20:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1R361IVDxEJ; Thu, 30 Dec 2021 20:41:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1C09405C5;
	Thu, 30 Dec 2021 20:41:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4990E1BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 330DF60C11
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u97trpjUN8we for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7827460BCB
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E20C382DF3; Thu, 30 Dec 2021 20:35:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:33:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 467917e2da4d211230eb2cda2978e8eb9fe29c8c
X-Git-Newrev: 78afad17bf576dcd469bfb51dcc4f9539612b69b
X-Patchwork-Hint: ignore
Message-Id: <20211230203553.E20C382DF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils: generate proper JSON
 strings where they are emitted
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=78afad17bf576dcd469bfb51dcc4f9539612b69b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, our clean-json macro does two things:
  - remove excessive commas before a closing list or dictionary;
  - escape the backslash.

We are going to need the comma-drop feature of clean-json, but on a
JSON blurb where all the characters, backslash included, are already
all properly escaped, so that we do not need further escape.

So, we drop the backslash escaping from clean-json, and use the newly
introduced mk-json-str helper in every locations where we turn a
Makefile variable into a JSON string.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 53 +++++++++++++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 15e3e14e1b..0b0ff77419 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -96,7 +96,7 @@ endef
 # $(1): upper-case package or filesystem name
 define json-info
 	"$($(1)_NAME)": {
-		"type": "$($(1)_TYPE)",
+		"type": $(call mk-json-str,$($(1)_TYPE)),
 		$(if $(filter rootfs,$($(1)_TYPE)), \
 			$(call _json-info-fs,$(1)), \
 			$(call _json-info-pkg,$(1)), \
@@ -107,47 +107,59 @@ endef
 # _json-info-pkg, _json-info-pkg-details, _json-info-fs: private helpers
 # for json-info, above
 define _json-info-pkg
-	"name": "$($(1)_RAWNAME)",
+	"name": $(call mk-json-str,$($(1)_RAWNAME)),
 	$(if $($(1)_IS_VIRTUAL), \
 		"virtual": true$(comma),
 		"virtual": false$(comma)
 		$(call _json-info-pkg-details,$(1)) \
 	)
-	"build_dir": "$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))",
+	"build_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))),
 	$(if $(filter target,$($(1)_TYPE)), \
 		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
 		"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING))$(comma) \
 		"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES))$(comma) \
 	)
 	"dependencies": [
-		$(call make-dq-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
+		$(call make-comma-list, \
+			$(foreach dep,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)), \
+				$(call mk-json-str,$(dep)) \
+			) \
+		)
 	],
 	"reverse_dependencies": [
-		$(call make-dq-comma-list,$(sort $($(1)_RDEPENDENCIES)))
+		$(call make-comma-list, \
+			$(foreach dep,$(sort $($(1)_RDEPENDENCIES)), \
+				$(call mk-json-str,$(dep)) \
+			) \
+		)
 	]
 	$(if $($(1)_CPE_ID_VALID), \
-		$(comma) "cpe-id": "$($(1)_CPE_ID)" \
+		$(comma) "cpe-id": $(call mk-json-str,$($(1)_CPE_ID)) \
 	)
 	$(if $($(1)_IGNORE_CVES),
 		$(comma) "ignore_cves": [
-			$(call make-dq-comma-list,$(sort $($(1)_IGNORE_CVES)))
+			$(call make-comma-list, \
+				$(foreach cve,$(sort $($(1)_IGNORE_CVES)), \
+					$(call mk-json-str,$(cve)) \
+				) \
+			)
 		]
 	)
 endef
 
 define _json-info-pkg-details
-	"version": "$($(1)_DL_VERSION)",
-	"licenses": "$($(1)_LICENSE)",
-	"dl_dir": "$($(1)_DL_SUBDIR)",
+	"version": $(call mk-json-str,$($(1)_DL_VERSION)),
+	"licenses": $(call mk-json-str,$($(1)_LICENSE)),
+	"dl_dir": $(call mk-json-str,$($(1)_DL_SUBDIR)),
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
 		{
-			"source": "$(notdir $(dl))",
+			"source": $(call mk-json-str,$(notdir $(dl))),
 			"uris": [
-				$(call make-dq-comma-list,
-					$(subst \|,|,
-						$(call DOWNLOAD_URIS,$(dl),$(1))
-					)
+				$(call make-comma-list, \
+					$(foreach uri,$(call DOWNLOAD_URIS,$(dl),$(1)), \
+						$(call mk-json-str,$(subst \|,|,$(uri))) \
+					) \
 				)
 			]
 		},
@@ -157,11 +169,15 @@ endef
 
 define _json-info-fs
 	"image_name": $(if $($(1)_FINAL_IMAGE_NAME), \
-				"$($(1)_FINAL_IMAGE_NAME)", \
+				$(call mk-json-str,$($(1)_FINAL_IMAGE_NAME)), \
 				null \
 			),
 	"dependencies": [
-		$(call make-dq-comma-list,$(sort $($(1)_DEPENDENCIES)))
+		$(call make-comma-list, \
+			$(foreach dep,$(sort $($(1)_DEPENDENCIES)), \
+				$(call mk-json-str,$(dep)) \
+			) \
+		)
 	]
 endef
 
@@ -171,9 +187,8 @@ endef
 clean-json = $(strip \
 	$(subst $(comma)},}, $(subst $(comma)$(space)},$(space)}, \
 	$(subst $(comma)],], $(subst $(comma)$(space)],$(space)], \
-	$(subst \,\\, \
 		$(strip $(1)) \
-	))))) \
+	)))) \
 )
 
 # mk-json-str -- escape and double-quote a string to make it a valid json string
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
