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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07BBC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:17:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 841D660F39
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 841D660F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34AC883B5E;
	Sun,  1 Aug 2021 13:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2AKp_08um07; Sun,  1 Aug 2021 13:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD8083A77;
	Sun,  1 Aug 2021 13:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AD051BF35E
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 672D46073D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oHeXWmP-k-tx for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 13:17:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 278986072D
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 13:17:12 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so9366557wmg.4
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pjCToYKAxBlAPGefVN85FTLJCfOCmGcXP030+jd4kSU=;
 b=mxbPQlhyWc7x5JNC+dURETYWW6J5V4nM0AmFQQ0Rw/7pSEtc/IHF41jmtCCSghYhYz
 rw0+kdmiHr8Cu9nJrRKVcjW9gYuzoZCpDKZEx1681htndtTspLqevIGrb8/c/sfM1Xgz
 zUXZXfVWNhzdjhelZHJHQHsO5foHrSGBmVEaf+2vmcb9kfTKTaSBEel5cuD7Iv3oXSKx
 1IBHeUgsJoIL+E16KIlwV6+C0CAW2PwT0aUFoRWLgGa+7tKSxgDF0UObrNmmjX8rNR1q
 IUfUKt6D5H5wjux+KuZviBBa02SIoiRHhShxr96Ft93/IfgU5G3prE+44/PdK1HQnE5R
 R2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pjCToYKAxBlAPGefVN85FTLJCfOCmGcXP030+jd4kSU=;
 b=lj86qGLTTAWfqjOuazO9TBBMrbKP9AiKfC5jS2HDu3/NXQze+aBPgMpgRGw7YUP+G9
 2AwO+ARZrGPqm/jJROs9UEyJC4L60GiP8Un2Lxfxi2/oA3cpFCfYqUVXHZwlxhyuwkpL
 YoDm5nabBhMpIO3goS/FqQ/gAJkmSrVKN1bUcRIp6l5nzjpyJbtsyakUykjlDyvdEOJS
 PXT8ElV4zeS4rUElUKVq90Rai/oR2lsZg0NQ1LsGxwZpV7eVciFeWYgVbWA3x5BoeyLK
 hXVmv5mFkO7+lvegqFWIOBU4UiZtsEecHnc/GdMZu4ZQYKr3lUI1F1QBrw3sNwnpjTKB
 O4Cw==
X-Gm-Message-State: AOAM532rxgG2dygZZ4MCHvkx35o1O2/LwBR8zNvirYvfKHrHg/rwxqft
 TWCue0e2+rYRMA5yv7KKKQJmJvfY+tQQgA==
X-Google-Smtp-Source: ABdhPJxfotQcNUyr2zD731y1FjQi3HFVzDJzh8t6+Wlo6ekLtT+FcIvrqyLktcM8xmPGKR2v1ojTAQ==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr4359928wmc.83.1627823829968;
 Sun, 01 Aug 2021 06:17:09 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id t15sm5108732wrw.48.2021.08.01.06.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 06:17:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 15:16:59 +0200
Message-Id: <20210801131659.3589489-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 4.8.1
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- [High] OCSP verification issue when response is for a certificate with
  no relation to the chain in question BUT that response contains the
  NoCheck extension which effectively disables ALL verification of that
  one cert.
- [Low] OCSP request/response verification issue. In the case that the
  serial number in the OCSP request differs from the serial number in
  the OCSP response the error from the comparison was not resulting in a
  failed verification.
- [Low] CVE-2021-24116: Side-Channel cache look up vulnerability in
  base64 PEM decoding for versions of wolfSSL 4.5.0 and earlier.
  Versions 4.6.0 and up contain a fix and do not need to be updated for
  this report.

https://github.com/wolfSSL/wolfssl/blob/v4.8.1-stable/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 05fee25b6b..9896713ca7 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  b0e740b31d4d877d540ad50cc539a8873fc41af02bd3091c4357b403f7106e31  wolfssl-4.7.0-stable.tar.gz
+sha256  50db45f348f47e00c93dd244c24108220120cb3cc9d01434789229c32937c444  wolfssl-4.8.1-stable.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index fe21ddcd4f..d3dce0a401 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.7.0-stable
+WOLFSSL_VERSION = 4.8.1-stable
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION))
 WOLFSSL_INSTALL_STAGING = YES
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
