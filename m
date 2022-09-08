Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83328C38145
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 15:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED92D61201;
	Thu,  8 Sep 2022 15:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED92D61201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOtvMmHj0swi; Thu,  8 Sep 2022 15:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F9C60BDE;
	Thu,  8 Sep 2022 15:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F9C60BDE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B6591BF2B7
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 15:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4441683DF7
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 15:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4441683DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErZiNUOzlcrJ for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 15:23:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 653E983DF5
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 653E983DF5
 for <buildroot@buildroot.org>; Thu,  8 Sep 2022 15:23:46 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id j1so13450488qvv.8
 for <buildroot@buildroot.org>; Thu, 08 Sep 2022 08:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=CmNlxucncSPl3U1Ds+LigFvKKWHzuTSjEPFe0EyW/nY=;
 b=xZVCJKpyHsSsRuxp3qIjj1nYKEsB/hDgdc8ZAHzEBcPrvC5OiYj6wa0D/dsXnVQ2OY
 h1OqiRlMA/GXbDwF2I/hW3zLCp6dkdV/9CoNTDAYKu8EFUYQHfo1HtGstSmPM/dBu701
 uVnVeVK0JR1fprflX4Iu6ow3i8yw0w/+gZ7xA1rU/YGQ6IeeaBPvIJ8tdF3FUPh5djQu
 lWdwgYO/EHVkaWPNi1/uq6MwBTxbD3HArddxg078D93Qxf8bt/w8rFQUhVUHnnIpHWSq
 0trHHl/4GHjo6UNI0RFuu6an3QWrp0NFITls7t4dymSLxBG0kzpRhnzqFycwZhCpecb+
 B+Xw==
X-Gm-Message-State: ACgBeo1caY/wm3Yaolhd9+EXEbzkosrE6rIyOZEQ1dGlfX2x1HRZtSAx
 pZtCpH+dC/Cic1/A1uJe0E2mP+b8vsWiPA==
X-Google-Smtp-Source: AA6agR6i8wx4RXea34YdinY+tHqObVqcF+JMzabmWkaiLyUZVfF1COSt7OImAqg4z1nq6G3J8MQxQQ==
X-Received: by 2002:a05:6214:21c5:b0:49c:a4ba:8da7 with SMTP id
 d5-20020a05621421c500b0049ca4ba8da7mr7933112qvh.30.1662650621841; 
 Thu, 08 Sep 2022 08:23:41 -0700 (PDT)
Received: from lyra.shivnet (205-201-16-55.starry-inc.net. [205.201.16.55])
 by smtp.gmail.com with ESMTPSA id
 dm53-20020a05620a1d7500b006b9815a05easm18153248qkb.26.2022.09.08.08.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 08:23:40 -0700 (PDT)
From: jwood+buildroot@starry.com
To: buildroot@buildroot.org
Date: Thu,  8 Sep 2022 11:23:30 -0400
Message-Id: <20220908152330.2588951-1-jwood+buildroot@starry.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=CmNlxucncSPl3U1Ds+LigFvKKWHzuTSjEPFe0EyW/nY=;
 b=rcGoqX+gjprSahjhWca2qjtY7DTqc8LnFgw4ATyuHxyNrIFEVW6FdkO8ml7TRRS4T8
 hFB3leaL1rwLnrlkCO5D9EywFjsBwKm/R9rIJe9MOWr5rn3RplnUbhXywtK7oTihR8RE
 VcbQAnRu2P8ookUnIknYHZd3JAN7v3x/Pj2/U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=starry.com header.i=@starry.com
 header.a=rsa-sha256 header.s=google header.b=rcGoqX+g
Subject: [Buildroot] [PATCH 1/1] package/pkg-download: add per package
 download fallback disable
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
Cc: Justin Wood <jwood+buildroot@starry.com>, Justin Wood <jwood@starry.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Justin Wood <jwood+buildroot@starry.com>

This is useful in cases where a package is added without hashes (e.g. private packages)
and you do not want to risk MITM attacks of the package itself.  While still allowing
download of packages that are third party with hashes, from unreliable upstreams.

This adds a new ${PKG}_DISABLE_FALLBACK_DOWNLOAD that is checked when DOWNLOAD would be
called to not include URIs from the backup site.

Additionally we use the new backup URIs if the new variable is unset in the json data
URI list to ensure consistency for consumers who do not use this feature.

Signed-off-by: Justin Wood <jwood@starry.com>
---
 package/pkg-download.mk | 9 +++++++--
 package/pkg-utils.mk    | 5 +++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0718f21aad..af5855230c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -74,8 +74,12 @@ export BR_NO_CHECK_HASH_FOR =
 # DOWNLOAD_URIS - List the candidates URIs where to get the package from:
 # 1) BR2_PRIMARY_SITE if enabled
 # 2) Download site, unless BR2_PRIMARY_SITE_ONLY is set
-# 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
 #
+# BACKUP_DOWNLOAD_URIS - List the backup candidate URIs where to get packages from:
+# 1) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
+#    and unless ${PKG}_DISABLE_DOWNLOAD_FALLBACK is set
+#
+# In both vars above:
 # Argument 1 is the source location
 # Argument 2 is the upper-case package name
 #
@@ -91,7 +95,7 @@ ifeq ($(BR2_PRIMARY_SITE_ONLY),)
 DOWNLOAD_URIS += \
 	$(patsubst %/,%,$(dir $(call qstrip,$(1))))
 ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
-DOWNLOAD_URIS += \
+BACKUP_DOWNLOAD_URIS += \
 	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(2)_DL_SUBDIR)),urlencode) \
 	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)),urlencode)
 endif
@@ -122,6 +126,7 @@ define DOWNLOAD
 		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(if $($(2)_GIT_LFS),-l) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
+		$(if( $($(PKG)_DISABLE_DOWNLOAD_FALLBACK),,$(foreach uri,$(call BACKUP_DOWNLOAD_URIS,$(1),$(2)),-u $(uri))) \
 		$(3) \
 		$(QUIET) \
 		-- \
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 6ece27baa2..a279a41df8 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -167,6 +167,11 @@ define _json-info-pkg-details
 					$(foreach uri,$(call DOWNLOAD_URIS,$(dl),$(1)), \
 						$(call mk-json-str,$(subst \|,|,$(uri))) \
 					) \
+                                        $(if $($(PKG)_DISABLE_DOWNLOAD_FALLBACK),,\
+						$(foreach uri,$(call BACKUP_DOWNLOAD_URIS,$(dl),$(1)), \
+							$(call mk-json-str,$(subst \|,|,$(uri))) \
+						) \
+					) \
 				)
 			]
 		},
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
