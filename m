Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8866C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:30:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71EB160F70
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71EB160F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45AD3405DB;
	Sat, 13 Nov 2021 13:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPt9R4wsaSbe; Sat, 13 Nov 2021 13:30:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CDE8405DA;
	Sat, 13 Nov 2021 13:30:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47D891BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36EDB605AD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YYiBfaPcOkML for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4518E60594
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d27so20646824wrb.6
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E0BjKL88KniDiRhQLSpHNNzztWzb5dE6juSeAB3A6Ag=;
 b=mkOpHxue+OTOkUw0OnYkTKIcfHL4A04QXAgEt1NfEe61QG07Ti/wiUmp9IUyPdGfUt
 XlbrhxB/d9sW7tKktw/sg3A9OrKso6LvnIXtOSSl+p0KClknsmgBepC8Vzi9iIUUxhZ9
 rCB1rBOUkpff0i5KuBmUjT0pllMUdY1Nw7ZNvjW3bhBmAAFQQih2KCm6Br7FUYT8ZwiM
 AW92wtcru8RtLhBGOAKYMHzioX9usFzhGOVtRM8ip+NMAkGf7TdO93ZGSpqwQEpq2Wr2
 Gm/crE4uDhZY39QipQrRhEL2NeXfj2VImXQRMvQLvG9buLXymEl0EQYsbihdznQLSUL5
 M2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E0BjKL88KniDiRhQLSpHNNzztWzb5dE6juSeAB3A6Ag=;
 b=lp4p7q0BZQFtUJTD+E5pEVWsM/AxjfZRB7XpqMqM15Dpwp6HKiN8+fjTuFlpbSKZsj
 JGVrIfhRL32U7DQtaBQbF6mNBBQ9hT5qtkkrw19nF4qng+uZ5k4nwQWYu009F82eVkZ9
 8l9W8uOpvqZCJ3935iLe7XtCxsSzoZffWbpFGgAOBND/zxUdbUX0uP9qgeZq/m7vfejg
 pYVOUKOU6OezY6+aJiyWHlEMFQijRqdOdXlOwaCzinrTDlBWmDL1X0cyWFjJRm51QKYR
 C6Cjm63gXk13lcb36pYKW0rPRp3bCVIreCCqI/JeXtMGHw4Fw3+TyuZ+klQy2hOXv1OR
 zkmA==
X-Gm-Message-State: AOAM531+C4Ezy/LaWiYFHNsKqua98cyWp8GBuvhnIKuROWbkpgl8RU3E
 lmhYglpYcrv2c9t3bNDaeNAu3McuEegjew==
X-Google-Smtp-Source: ABdhPJyHkuJ0IPblNQ1uwBmITqxHlI1lXpVM4aCaY2zp43EmRhAqCCQH6fXFvIj6yD+jKU8WL561Tw==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr29263514wrn.247.1636810116568; 
 Sat, 13 Nov 2021 05:28:36 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:36 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:23 +0100
Message-Id: <57e124aa10e9242c88e6c2b934c68bf5c8cf0af4.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 12/16 v2] package/pkg-utils: generate proper
 JSON strings where they are emitted
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 package/pkg-utils.mk | 53 ++++++++++++++++++++++++++++----------------
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
