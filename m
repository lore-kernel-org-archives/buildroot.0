Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA23C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:27:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28680610FC
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28680610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEDAB83C51;
	Tue, 19 Oct 2021 17:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtN2RZ_CUKyP; Tue, 19 Oct 2021 17:27:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5690A838AF;
	Tue, 19 Oct 2021 17:27:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CEBF1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F101640680
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAZTyVLU2MPz for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:27:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 040F34067F
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:27:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id v127so13223053wme.5
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 10:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lkf/IUIWAMw3oqeeiXhOaVx9f3E/SH/CjB7ZTyq+P2Q=;
 b=J+v+iV1Gbj0fvpycYQpL/0m73CeqRXl8e5ZIP3Ha1rIvpVFQDstUxBZBTlIcBDergk
 aIZsZwrdQ452AuEq3gSsc9pW7bNree9jPYMCokPerZJdEaO4amnjsGWW/Zz22r+PZ5Yx
 uLrsbZ1RaQnpoer+Heu44wEJXgKZ3c85S9ZW+NSnHwuC04hG9e36se6LI97elEDMtr9O
 w6DGsFleWTdw8WtmUYh9X+Oxf1K9sV1feefvrHEYRaVylAGQqW2GACumvjhBeYgRquZA
 7tKmcTqZqEYogR+uoWadzKVERBhgT4yZBnLitSX10CzNc57AGUGbkE2/+eTytes7EK09
 ZLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lkf/IUIWAMw3oqeeiXhOaVx9f3E/SH/CjB7ZTyq+P2Q=;
 b=YW15mUIx908DGm/XSjFbC29s3cPkheoFHeKcN8njV8DsnX/Nj20sWPD77P8ig9iPWg
 EZGEVVKEcMV8VkZRiFve88/ii/2FFBXc6zmg6iRw/DcKPCBLKGI1M7MxiRViokxrUsBx
 2qDR2HcNsh8g2HenpiX0DN2OXIzotOrnXWbNRwZllrEH++YyethoXQQTaDcGok7kojFA
 XjSiNxWD3Tt/UqW0SsVwqIq8WrKs4/zSv1zgkNwKXS4dIkgjNCwPu+DCQVvdDCFKJLWe
 OUS0NP8q7TRPDYsEzKwyW1jH2p6HRYtYMZ8u0G8RXlDk+V25wV8ZIB51FLseQzeygsdt
 2LYA==
X-Gm-Message-State: AOAM532kUBvePW2u6j2V1ZVcvRvQwMTCLlUOlLo4LKcMev//+heIyRa4
 zpEy7k3uHHhjl+gms3+UnMAroSUYjEc=
X-Google-Smtp-Source: ABdhPJxrhr3ZMgBQTDoYsChxgBTxLdF+3h1y/8h33oIAszKJMGOlTHREKFF9doWSDzd5dnsIbhyWHA==
X-Received: by 2002:adf:a319:: with SMTP id c25mr46454729wrb.307.1634664418994; 
 Tue, 19 Oct 2021 10:26:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id f184sm2749076wmf.22.2021.10.19.10.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 10:26:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 19:25:31 +0200
Message-Id: <20211019172532.3431240-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019172532.3431240-1-fontaine.fabrice@gmail.com>
References: <20211019172532.3431240-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/heimdal: install compile_et
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

compile_et is not installed anymore by heimdal since version 7.0.1 and
https://github.com/heimdal/heimdal/commit/e40ef47b57f3c62f94c4056f02ced3af2ed083ca

So remove the broken symlink and install it manually as it is needed for
samba4 because compile_et provided by e2fsprogs raises a build failure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/heimdal/heimdal.mk | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 9a1a68f046..ce509c7afa 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -28,19 +28,26 @@ HOST_HEIMDAL_CONF_OPTS = \
 	--disable-ndbm-db \
 	--disable-heimdal-documentation
 
-HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
+# Don't use compile_et from e2fsprogs as it raises a build failure with samba4
+HOST_HEIMDAL_CONF_ENV = ac_cv_prog_COMPILE_ET=no MAKEINFO=true
 HEIMDAL_LICENSE = BSD-3-Clause
 HEIMDAL_LICENSE_FILES = LICENSE
 HEIMDAL_CPE_ID_VENDOR = heimdal_project
 
+# We need compile_et for samba4
+define HOST_HEIMDAL_INSTALL_COMPILE_ET
+	$(INSTALL) -m 0755 $(@D)/lib/com_err/compile_et \
+		$(HOST_DIR)/bin/compile_et
+endef
+
 # We need asn1_compile in the PATH for samba4
 define HOST_HEIMDAL_MAKE_SYMLINK
 	ln -sf $(HOST_DIR)/libexec/heimdal/asn1_compile \
 		$(HOST_DIR)/bin/asn1_compile
-	ln -sf $(HOST_DIR)/bin/compile_et \
-		$(HOST_DIR)/libexec/heimdal/compile_et
 endef
 
-HOST_HEIMDAL_POST_INSTALL_HOOKS += HOST_HEIMDAL_MAKE_SYMLINK
+HOST_HEIMDAL_POST_INSTALL_HOOKS += \
+	HOST_HEIMDAL_INSTALL_COMPILE_ET \
+	HOST_HEIMDAL_MAKE_SYMLINK
 
 $(eval $(host-autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
