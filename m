Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209CBC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:21:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBFB861042
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBFB861042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A151C836F6;
	Sun,  1 Aug 2021 22:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r67Tv199DeUl; Sun,  1 Aug 2021 22:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A966836A5;
	Sun,  1 Aug 2021 22:21:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFD621BF855
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE04E400CF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4V_oXZqW2gMS for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 22:21:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4A92400BD
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 22:21:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c16so19115274wrp.13
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 15:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZpYRwxjL+m9Vb/2l5ueHTAf1YhakPFSFmKengylQ+w=;
 b=g8I4IqhnWu+2tPSCDpRO2pTWaGNIj+3sAOvSuTyIRGZLk2LHVYUj3UggyqkdBu4bYx
 CKXY0WvcxKVfQh4/NVpJpohqx7eQ3Tfv1qNZvTRDLHDy1eultcUZDSVApzlMMm+wSCoD
 IICB3HumxuU4hlyOUBVmD6AXY0rfl4iu2virLZzSz/27nT0vdrMaU4ol6MtIToWlWIS3
 xaQJyj12avvP45NB7FaNfSnukYrmS8Obh3l3nk0BCXJAOGklswwe+CRE+ApoGVTlkxbZ
 1s5f+prE/f5iC5X202zU3FDCTmZZrEEY20BpvUfkZwPi8z5ckhSA90COMMyMWccYi7/K
 D8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sZpYRwxjL+m9Vb/2l5ueHTAf1YhakPFSFmKengylQ+w=;
 b=a34LtzfyWRIfogH6QatYkaaAhuFNoQCcP9x2k3Wi2HA35Bf9jX7oyL0TyJzmukqA3j
 U3aNGbk45IykrjVUpt0GFcXb++sisHjh5de1BRWJU2cfXWTMI+z9eQjDJFgld0SEfNbT
 BrobTcYfD20IZq8U1i+flOah4WmXgLpguzrDP8WeGirCkq9+qaebzW77MvwZ9o/LBIzI
 koHDLAroZPIlXxn6AdAqkG0zq+NV1pCwkCBENUV0Im1waUccvHLnQOxWukIT/BXcinRB
 GXF3TpXQokYyTaHS22aXM4XupFI4DCPgfFIlPRqrwgZqwhSr1DFBfU+YBUS6zsDj4equ
 eWNg==
X-Gm-Message-State: AOAM531Nfe9qSRRkXPYZECv6OmWH5OJvSg4aTfss2cPenpDs2A0+EwVQ
 P2HOhgF2R3uonMnI20vNClWPORG1FjNv2A==
X-Google-Smtp-Source: ABdhPJwWRcobGFO5Vy7yRs/z1hzLIQc+ccfllSVFdSFz4GaCgC6bJzrorqKeauWcw0FaaYG8nX0yeg==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr14612695wru.304.1627856474649; 
 Sun, 01 Aug 2021 15:21:14 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id g11sm2255537wrd.97.2021.08.01.15.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 15:21:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 00:21:02 +0200
Message-Id: <20210801222102.1244919-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210801222102.1244919-1-fontaine.fabrice@gmail.com>
References: <20210801222102.1244919-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/tpm2-tools: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for tpm2-tools is added by the services/tpm2 module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tpm2-tools/tpm2-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 584b4edb54..981a89a737 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -9,6 +9,7 @@ TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
 TPM2_TOOLS_CPE_ID_VENDOR = tpm2-tools_project
+TPM2_TOOLS_SELINUX_MODULES = tpm2
 TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf util-linux
 
 # -fstack-protector-all and FORTIFY_SOURCE=2 is used by
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
