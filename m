Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6510BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:36:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0632661002
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0632661002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B106240227;
	Mon, 25 Oct 2021 07:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgqC0V7jRkYe; Mon, 25 Oct 2021 07:36:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E16E400F2;
	Mon, 25 Oct 2021 07:36:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 309BF1BF2CC
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 650FA80DE5
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1QK2FiXVdbZj for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 07:35:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 931AD80DEE
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 07:35:09 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w15so7420021wra.3
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 00:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=i7r5pObt+9af/WCbVFh+gG6TcnEZJ4AQy/b1QnmNY5I=;
 b=vahWIgkLx9ZH1tsgDrs+jqDBnga1yUDKh9YBDbgND+wdNDZz/L5Wk6NVOM/Zd6M4oD
 VDTscqMQAbacHT9El+NVajQNMIycBYl+H6F17dWz1RolWPvCyRVvu/rJxZXm268TZwyA
 a4qtbVe/2pGDacWn1WkBxmvqR2Ij4UphB4zUNrNpasOGUUnf8KmHOOf7zL4n2Lwl5XQh
 q46hE1g+dAN9RqVo304S5gykwZA5DuPyOfNMGA63yYc+kV3NPBblVIn4SSkvVDSkYXSw
 9LeDaWYJP9fSCCFG/ZmdUk+BoYpjdgXSXeQmCwjeK7jwsm+4oAorrAlVR+2VoVEY6blA
 el3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=i7r5pObt+9af/WCbVFh+gG6TcnEZJ4AQy/b1QnmNY5I=;
 b=LHcNuktEY7qfS13OmQ8L8Y7S8Lf4lIEDNWPwV5tsmZBEWdkfkHgVoWJ3LPoIYkckvc
 iltep07xkCob3WS/nfcwC4pYEBBImiUOZEl0rPPm3XepQgics6jq1SsiDMp1mviOtqks
 QulOFrBJRfguqQfAgUZHyXgTs/U0Lqeh0sWZasFjdEFUnhG85K2U6OXgnYU1f5Md/UUV
 5Ky6ixo9GvmIl4Wzt21t99XZRLt1KZc5G5pFDDLzRHYQiTl9+xmB4PTThriMuL+u7Z6r
 yC8wh7QIfkgxRtKQJMKWOEvMD4bj4vDcEEnls88H11298+8CwKfCoD50JXrTGRPcPm97
 fDGA==
X-Gm-Message-State: AOAM53273ZT8nh7u/0hptHB8TYi8ol7fTi1kfWMzssMAFBNrjCbJPBFW
 T1apThGFGEp90Pvav8bEtBwyy/GAMkPhBw==
X-Google-Smtp-Source: ABdhPJzNqCJhj+QMeqPSwO28DlmFKnrtMb73uHjr1bGCkxDuq2wwr3D2/iK/cdVQ1ftAY7FI8MS3RQ==
X-Received: by 2002:adf:9c02:: with SMTP id f2mr21762459wrc.201.1635147307690; 
 Mon, 25 Oct 2021 00:35:07 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:1002:3347:f8bd:7b81:c866:9456])
 by smtp.gmail.com with ESMTPSA id k10sm17984194wmr.32.2021.10.25.00.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:35:07 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 09:34:58 +0200
Message-Id: <20211025073458.8576-7-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025073458.8576-1-etienne.carriere@linaro.org>
References: <20211025073458.8576-1-etienne.carriere@linaro.org>
Subject: [Buildroot] [PATCH 7/7] package/optee-client: allow disabling RPMB
 emulation
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add configuration switch BR2_PACKAGE_OPTEE_CLIENT_RPMB_EMU to define
whether RPMB emulation is enabled or not. It is default enabled for
backward compatibility.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-client/Config.in       | 6 ++++++
 package/optee-client/optee-client.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index 2547fc0ce3..4e46b0ba6c 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -24,6 +24,12 @@ config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
 	  normal world OS providing the actual storage via
 	  tee-supplicant.
 
+config BR2_PACKAGE_OPTEE_CLIENT_RPMB_EMU
+	bool "Enable RPMB emulation"
+	default y
+	help
+	  Enable RPMB device emulation in tee-supplicant.
+
 config BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS
 	bool "Enable TEE supplicant plugins"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 9a73a8a761..dda9a2855d 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -14,6 +14,12 @@ OPTEE_CLIENT_CONF_OPTS = \
 	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
 	-DCFG_WERROR=OFF
 
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_RPMB_EMU),y)
+OPTEE_CLIENT_CONF_OPTS += -DRPMB_EMU=ON
+else
+OPTEE_CLIENT_CONF_OPTS += -DRPMB_EMU=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS),y)
 OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=ON
 else
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
