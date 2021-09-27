Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B990C433FE
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:44:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01EB7608FE
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01EB7608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E21DB608EE;
	Mon, 27 Sep 2021 16:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LpRciKtmvqGT; Mon, 27 Sep 2021 16:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C416089E;
	Mon, 27 Sep 2021 16:43:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 307AF1BF955
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20953818C2
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZaRBoBMrG3x for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 16:43:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A1B7817D3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 16:43:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u18so53101787wrg.5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 09:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjyErbjcLrLINcsb4OtcnqRAJ7B30Lee6WxS+gZXlYo=;
 b=owpNEnY+2rZo0gbAnoMvok1udng9peax6ghfUHkXLOJUZT9zzGooGNIK3aXDCxMrpN
 zoAvD5YY+u4mxK15RYAjVQaWvB1hncbpbO3bpPD1OFfgxid3v8i5xuytyb/MkLXFvQbf
 ZcaC94rsWRI65ex+d2AOkpwjuFmOkDE5U2bmBZ39s+crqtaYeopm09/H4RiLYpzLbL3M
 B3wPFv5lB3zeTvlvoL4MpxxN5LNvomeQsoo6PZMayODeFGmJ8QSGWsbwK84KZFnUoS7X
 KLT1if3Yg1ToS99pfLRI7QWJ0cve0ini5DRrPNwDanqmh348Z2kdMCFBGZMNFL965SDA
 hhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjyErbjcLrLINcsb4OtcnqRAJ7B30Lee6WxS+gZXlYo=;
 b=HIai6Wibk5dOumtzEFNOtvxOAGLadrOby03J/ghves+qZul48Om4zS2wpamMEA/kTL
 OftIKNaQmZCdcKG0Cx/KpC/jtSuvFPsD+L1SjimICoVNm8HxYG3uXN5wacwgBjgYlIXQ
 03aKjzW5TR+dSbXgZCL9B4kJZ/7OfkEyPzw7wf9UWCEvg3Qyg0iU7/xmjcezM25ag8Ce
 4aZH7haz5MJ0qQw/LJhyWabo9P8yhx6jCBHqkJoZNGdIKKhrkh/nkirn+rrKRHSZdsgT
 QmgEA4vt1TB9k+AGVYpHBRwGvirGNp/iIenADpFj71Y+w2SotcLQIaRRWfkoidcHxG3R
 dHJA==
X-Gm-Message-State: AOAM533Ol3RIR9yG5dxvrXSNqCL1LvIeDlm8X9TJE7Mofhv2GhmVYXc8
 HdUnxxDplIYXV0sID4cWx1AbtW/mfb0=
X-Google-Smtp-Source: ABdhPJw8Iczk4EAjdbMJYdDX8USsp1WM3wNfzbtxFLJTW1h4HsKLkSpEUigwPL67/dgN290jm2VvPw==
X-Received: by 2002:adf:f507:: with SMTP id q7mr972689wro.7.1632761021196;
 Mon, 27 Sep 2021 09:43:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id o1sm17296774wru.91.2021.09.27.09.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:43:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 18:43:05 +0200
Message-Id: <20210927164306.1488012-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927164306.1488012-1-fontaine.fabrice@gmail.com>
References: <20210927164306.1488012-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/automake: bump to version 1.16.4
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://git.savannah.gnu.org/cgit/automake.git/tree/NEWS?h=v1.16.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/automake/automake.hash | 4 ++--
 package/automake/automake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/automake/automake.hash b/package/automake/automake.hash
index b194c3c2bc..e8112e0c48 100644
--- a/package/automake/automake.hash
+++ b/package/automake/automake.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 af6ba39142220687c500f79b4aa2f181d9b24e4f8d8ec497cea4ba26c64bedaf  automake-1.15.1.tar.xz
+sha256  80facc09885a57e6d49d06972c0ae1089c5fa8f4d4c7cfe5baea58e5085f136d  automake-1.16.4.tar.xz
 # License files, locally calculated
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index ad8f0f474d..470a0bd46e 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOMAKE_VERSION = 1.15.1
+AUTOMAKE_VERSION = 1.16.4
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
