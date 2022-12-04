Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7EBC4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 09:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C290160C13;
	Sun,  4 Dec 2022 09:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C290160C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDMrvqXkcS49; Sun,  4 Dec 2022 09:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 047C960BBD;
	Sun,  4 Dec 2022 09:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 047C960BBD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE2B31BF284
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 09:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9DA340492
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 09:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9DA340492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GmRvS0uzYDgy for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 09:10:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF930400CB
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF930400CB
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 09:10:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h12so14320397wrv.10
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 01:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iI0mGWep6GXiSLwVqqnBlHTj2aNCFMXZI3O0lbBCd3c=;
 b=bDOVZB+R2UQKahId4JnxRxA6PuHmX+7YIZbsprbOKxIkk2BSWec7D/4C4XKQjicNiy
 ubBAd91lvTi9hjmaMirsmibOMU/SSPOJPLoqVAfe5mgXxB+PtYUrPaTPEvGMGgsNEeMs
 2Dkn8EQ6/hAhgHJFy79XmW1iva+pZbEPLOFgkRJmZQNQTkodnm1u4iRc991Kb+dth4On
 NOCsEaa0utzotKK9HzhKVs+oguhRy6JiMuFXPjthEJ9YIzLWVtM2AyN288wWR/4j8clw
 mv8hhhe6I/qPNAI4L7muxECVcSvXwqFs4GHnM6fRMtFJiFfRnlrK2Stt34nFlTY/m6RF
 HFVQ==
X-Gm-Message-State: ANoB5pnuCr/lXq6PI0Jov2FB4ywu4Vq1DlJuooF6mMWxyl4uq6UNXN5b
 /KnHf3ve0+5HD1ZtCzb+hVUP5fsOWNw=
X-Google-Smtp-Source: AA0mqf7QdcS2f0lcn+YepJs+nTeVjJdfBkrxN3mV1O6U8KmsvSGXpqouhmx/3r08zEV/d6wk7imViA==
X-Received: by 2002:a05:6000:1b05:b0:242:4a6e:a8b2 with SMTP id
 f5-20020a0560001b0500b002424a6ea8b2mr4645024wrz.283.1670145042486; 
 Sun, 04 Dec 2022 01:10:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 z2-20020a05600c220200b003cfd10a33afsm16909142wml.11.2022.12.04.01.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 01:10:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Dec 2022 10:10:39 +0100
Message-Id: <20221204091039.4362-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iI0mGWep6GXiSLwVqqnBlHTj2aNCFMXZI3O0lbBCd3c=;
 b=JTSAqOvW6mnl0K8U34qiTc+E+aM0NNUFgUzkhu94wJet80SyPoJl+58CV8sDv2og1f
 JQiTc7oKvR1PGkdjimsi/cda99FzGvY1oJ2lvyAykGUHuS1Lu4VkNqTPuiYDd4liwmxl
 kR0xZosH/W47LISgAqJsdT8ST4c+Jir7jkJRwc9efVC0e2Tk3p+BJrAbAFjxfJtrCpXf
 W2fIX6xydfTKsKgd+grtnIKdmeXVjk7BPyjR0T4o+qSWO2rlqSUQgQWAiC2bkgBd49Wt
 oi9vfCGUBaGL4eg9yEgMNnLgeyHl+lHrAmTCYAQVDS+WHgnBFnpsmfNPaqFC4IGdpVKN
 fzqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JTSAqOvW
Subject: [Buildroot] [PATCH 1/1] package/optee-client: rename S30optee
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b1c4c18766e51ee55e8d2e3a7cb12cb2762b12ff forgot to rename
S30optee in optee-client.mk resulting in the following build failure:

/usr/bin/install -m 0755 -D package/optee-client//S30optee /home/autobuild/autobuild/instance-0/output-1/target/etc/init.d/S30optee
/usr/bin/install: cannot stat 'package/optee-client//S30optee': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/21fc165933e6d226de277b62d4ce99342cef0ffb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/optee-client/optee-client.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 252841ba10..3fbbe9484c 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -27,8 +27,8 @@ OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
 endif
 
 define OPTEE_CLIENT_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
-		$(TARGET_DIR)/etc/init.d/S30optee
+	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30tee-supplicant \
+		$(TARGET_DIR)/etc/init.d/S30tee-supplicant
 endef
 
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
