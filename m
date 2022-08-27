Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A663ECAAD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 20:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4376B82681;
	Sat, 27 Aug 2022 20:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4376B82681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kk-0Z6zvSjaz; Sat, 27 Aug 2022 20:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54E9582422;
	Sat, 27 Aug 2022 20:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54E9582422
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8467D1BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B4A660BF9
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B4A660BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2s2g756zmeHE for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 20:25:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3957E60B5C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3957E60B5C
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 20:25:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e20so5582529wri.13
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 13:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=yvVHKucwNNJjMwtVLGgFasGUHNsxUIwJDXeRC1ZSIbc=;
 b=gfcBrCD5aqYI0M3aFLzjuOc+OYda2PVUhZTqVf+I8H6ulpFXAAfHx3k5gHt0DZi/FT
 1n+Ej5D88FyBEy1nrd4Ff4AZ2/kj0GGt9iRj31IDSssbUn0j1VTqovPBczV2630rckOy
 UUIV8fabJyz5Cxp4YCFPwr5kthHWAxLjRO51U1cBjdIf4ceQREmf6ocMW9+eybiSCa/G
 mUlz6ZAJfa8z7k2QnbApnE62CHvX/kaUPQNcaSz9D/nsjJYW+NjWEw236b+xKYkbweLn
 LUjkcA/Dg0vmRAJe2PlIzuEm+fohn4smkkU6H1L2/B6ihia7Kc7A1ks1n/PD1LzUQiGx
 32eA==
X-Gm-Message-State: ACgBeo1QfvOcPUJr/3ZDpR0rpNE2rnNUyhRUUIWfvc1iA1E63QGGYkTV
 HA1BgKLfP530SJbCe5+cH/sYBhT/9qU=
X-Google-Smtp-Source: AA6agR5XfMMiQZRQ3/0O7391iDgg3RIo/5epU+paI0GXH8b1+zEYFZlxLZhs9/gAOrjvnVI3pVOWrw==
X-Received: by 2002:a5d:4d83:0:b0:226:d08d:35c8 with SMTP id
 b3-20020a5d4d83000000b00226d08d35c8mr2740496wru.4.1661631927990; 
 Sat, 27 Aug 2022 13:25:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b003a682354f63sm4132794wms.11.2022.08.27.13.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 13:25:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 22:25:14 +0200
Message-Id: <20220827202514.265143-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=yvVHKucwNNJjMwtVLGgFasGUHNsxUIwJDXeRC1ZSIbc=;
 b=ET2IzdA8/tRcmOsRSA/YJ30YVzuGcxj9+YpLVVix7GqUC5HpNCynTdRFlPEdHCNnSN
 tvhHpXtg/rTdWrEbljDg+hjOOcfXgQE0XWo6nknWE5sFA5AdyP526p7jkU1OQYlxf1Sk
 3kC4rSJvfO3fwHtKWuLnBa6qOVltwgc5cg2vB+W9t3jHcgdQis+aMkNsciiWLxnJJAe0
 gMgAOuR34haEzu1oQ69KKQnddwn23hfmW11kZkdDxPKHHAQqvyKypwr9pi00cm6A/TgJ
 aYhfWPvMsGflGNn1FurNOqmDZtp/CkvdV9bN3uRMSuJyDfIo2E1UzKPurQ6GZMAr31+j
 yOXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ET2IzdA8
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: correctly set
 krb5-config
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo added by commit 84d32e53657db32784608c1130ec5290667a652f:

configure: error: invalid variable name: `ac_cv_path_krb5-config'

Fixes:
 - http://autobuild.buildroot.org/results/5a0e5023c274223b5eb7623165395549e7f446bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-server/freeradius-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index f77413a170..ebd459341d 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -87,7 +87,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
 FREERADIUS_SERVER_CONF_OPTS += \
-	ac_cv_path_krb5-config=$(STAGING_DIR)/usr/bin/krb5-config \
+	ac_cv_path_krb5_config=$(STAGING_DIR)/usr/bin/krb5-config \
 	--with-rlm_krb5
 FREERADIUS_SERVER_DEPENDENCIES += libkrb5
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
