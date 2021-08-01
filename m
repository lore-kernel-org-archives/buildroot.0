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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32E3C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:21:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D16461042
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D16461042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 493484041E;
	Sun,  1 Aug 2021 22:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pE0m3QB-6KWG; Sun,  1 Aug 2021 22:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFCFF4035B;
	Sun,  1 Aug 2021 22:21:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEB871BF855
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABAE540339
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOyRU-JelFir for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 22:21:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C07CF40337
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 22:21:14 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so9864497wmb.5
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 15:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O71L2znYNhSz6vT3rsBeo5uX5R0beGrgHtWCQaRVvXY=;
 b=cZwVxRWnsk2Cpj21ztszF9Ll/d6kI5dFdozgLc/mcSaOr4qubpcJY0rL07J1HBtc1x
 hqzoJCCkikQKZUSI1LuzyZGthZz8AsBDT9E86QEEqfyinA2umzg5Cqa/AHbKtp9eXhnF
 6ucEB7MuQnsxCZP9fdLaliSo/3M5XCUVn8u/vp1STgeGqBY8OgetC3XyWDhNGV+6/7zF
 qeplg60hzfnsCcxJsnIVEM9vq2Tb945+3m0mvdWrwEkh4Z26S63rAfJBvHErree+Zai+
 oUfALhE0ttzN5nM1KFP2DIhM906dHrFZmwYmZvK1hVJSwn8hbFRYQX7UV0+jBMbZ4LE2
 fHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O71L2znYNhSz6vT3rsBeo5uX5R0beGrgHtWCQaRVvXY=;
 b=QtrjsWH5IvmR3sCoUko42hutNsXeQrjDyIRu39/2e0b2JkehKxROVDNBiH5h/0p8y5
 DOoEawle5Ux5uFmHGQxvTdUwL+zHsT4EpLbLca7HRB7rvbUefthiMkv8jCzs0omerfiC
 jdyvs3Vq5Sj4CF04jn3MlFR4tJoqs23jicHL5/CyT10TCUp0h4dO1Ca2hPGQ+Xv/TudE
 GNvH6fxfXqu9AcTJaqYfDvEtD0vsn/lyj8SxVSB/owwq7wbwS5qbMVCDpmMicFNXPNbx
 FPhTkjUSrCdYoodG2r+5/vjqA3n8sRLW0UVgXU97PoO/7r6jgHnqCzUVfbzZjHfaC9kr
 jqrw==
X-Gm-Message-State: AOAM533uo4Utb8GLcRljJ1YdlDPWG6Ue5/NL6AEBkU1PIW1z8+H4ZaxC
 e+zIGevrjJBmVcqU/NUEEvbJ6JDSEBR17Q==
X-Google-Smtp-Source: ABdhPJzflt900twKdU1FqYL5ou4YNEW1c4BGf2iqdh0iOo/X8hPrig+hD9ydy+fKqqKwcMnbab7t1w==
X-Received: by 2002:a05:600c:1c13:: with SMTP id
 j19mr11864536wms.164.1627856472839; 
 Sun, 01 Aug 2021 15:21:12 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id g11sm2255537wrd.97.2021.08.01.15.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 15:21:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 00:21:01 +0200
Message-Id: <20210801222102.1244919-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210801222102.1244919-1-fontaine.fabrice@gmail.com>
References: <20210801222102.1244919-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/tpm2-totp: add SELinux module
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

Support for tpm2-totp is added by the services/tpm2 module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tpm2-totp/tpm2-totp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm2-totp/tpm2-totp.mk b/package/tpm2-totp/tpm2-totp.mk
index 250a016a50..42607c0b73 100644
--- a/package/tpm2-totp/tpm2-totp.mk
+++ b/package/tpm2-totp/tpm2-totp.mk
@@ -8,6 +8,7 @@ TPM2_TOTP_VERSION = 0.2.1
 TPM2_TOTP_SITE = https://github.com/tpm2-software/tpm2-totp/releases/download/v$(TPM2_TOTP_VERSION)
 TPM2_TOTP_LICENSE = BSD-3-Clause
 TPM2_TOTP_LICENSE_FILES = LICENSE
+TPM2_TOTP_SELINUX_MODULES = tpm2
 TPM2_TOTP_DEPENDENCIES = libqrencode tpm2-tss host-pkgconf
 TPM2_TOTP_CONF_OPTS = \
 	--disable-defaultflags \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
