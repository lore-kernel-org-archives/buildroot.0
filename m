Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3F4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 22:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F0BA80FF8;
	Mon, 22 Nov 2021 22:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqLO2TWP66Ls; Mon, 22 Nov 2021 22:31:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9158D80F87;
	Mon, 22 Nov 2021 22:31:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 360301BF951
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 311D860605
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUwFcy-16Cpo for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 22:31:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FEAA605E1
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 22:31:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so449173wmj.5
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 14:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tvHufMy4NtDWc27G41SX6/yevrQ19OhagNo9/XWhY5E=;
 b=bNbZUr9U/GMtfGQLDTE42xa8EUj1n+hnzeJzgtA4eufFnidl28tUCOx1JmSZhbRm+Q
 Uwek4oyXImJIuf9nlHhybZtuKPFm5nxnVgLWB/zIU3C7hYVy/OCKYo/dK0BcfyidLMRM
 POi9yiEIp/sRhoOlBFum2FUJOyBz/N2mgTwSNjynncpHQaf0E2DKHk0Np87qOwckEaaV
 uotWBQyJOiFmdymp2IjklcTbR8DkZPUbf1P3oM1DEO9U7NQlBzEEITYoyis7KkjGJXwm
 P1eyCDavSwXPhNQAd/rM1YnE2DNtArljmjZeW2aWJa6/rRRDlJK5Ayx87v5afkhdBo2q
 0Usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tvHufMy4NtDWc27G41SX6/yevrQ19OhagNo9/XWhY5E=;
 b=dbPdcuygK1Y4QEEuakgG2+gFZrI9pAjoKaKr6ovA30XyWQJ/9zqP7+i+LkVtHfH26p
 YHK7+MgfM9XEAfJE5VG8SN6gEkJo/BtNqRmKFyjx5QtPozZe4Ldzixb/yOl34zNrSY0h
 U3/1Jo8dyZflO/RtpWzuHoKY0tC4a8tpT/+eHJsa5n/MUEmtCJlLYSOpf7tU1GZHzV5Z
 dIQ9Ozjml1yWndqoRzo5o6GDjTjclu8ZWCmAopXav7wfgmTInLUAjnKivxNtn4mlipG+
 /gc8QepTygtmM+VRFcXPWpwMrxxITCv9zzl+0Amb2Ed6+HJxrviF/ZvIE4DAi49FTt1P
 +7Vw==
X-Gm-Message-State: AOAM532YDXS4UhfJe+rKvBxNTF8FVIptorIXscv6XA0u2a8b7gBEm7BS
 302NhJfttlWuUYvfTnTLRh6ZYEIapQ4=
X-Google-Smtp-Source: ABdhPJye6qAWPJyfT+UW+HY26s9IMIDGefZaTOkCeykpffDVo6cz64o9vW3SDJgiuPmWwnl9SIIIgA==
X-Received: by 2002:a1c:2d5:: with SMTP id 204mr34869356wmc.47.1637620301629; 
 Mon, 22 Nov 2021 14:31:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id u23sm10847285wru.21.2021.11.22.14.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 14:31:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 23:29:19 +0100
Message-Id: <20211122222919.3539928-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xtables-addons: rename
 XTABLES_DISABLE_GEOIP_HELPERS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xtables-addons/xtables-addons.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index feed054e88..b3d1bf2d44 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -17,10 +17,10 @@ XTABLES_ADDONS_CONF_OPTS = \
 	--with-xtlibdir="/usr/lib/xtables"
 
 # geoip helpers need perl with modules and unzip so disable
-define XTABLES_DISABLE_GEOIP_HELPERS
+define XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
 	$(SED) 's/ geoip//' $(@D)/Makefile.in
 endef
-XTABLES_ADDONS_POST_PATCH_HOOKS += XTABLES_DISABLE_GEOIP_HELPERS
+XTABLES_ADDONS_POST_PATCH_HOOKS += XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
 
 define XTABLES_ADDONS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
