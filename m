Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063B3C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C312840156;
	Mon, 22 Jul 2024 12:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szqLWKJe80-K; Mon, 22 Jul 2024 12:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92624403E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92624403E4;
	Mon, 22 Jul 2024 12:45:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 247891BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1286380597
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gw4n1K39qY9 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F317801EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F317801EA
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F317801EA
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:45:12 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-36858357bb7so2126216f8f.2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 05:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721652309; x=1722257109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fkuATyVZO9xD+zlB+jhvwvXXVG+62acIFFJui95PKOc=;
 b=Mzfbns7V8Wc34FbQmOmrTmXEkR02K9PQR+lnLlTS4XlAtMjOaCoPb2Lze7fOjFJZPx
 bPjn1Ymo4lmtDrlrJJdcBpJ+kO0H6gfbPTWlTUC9oWhkkwupkgZo/sVEDvQIImDlm1RA
 qttkc8U+BktHS62voAAss5HacxApMDXFo/8uiSMwaC52nCYi38d2OYAHFqSngp3ak23I
 qm2LpNYtMC1IYfnl9kL2TJP4iofUAoqIvg1kquEf1y+fL2y/VX++43GZwoIB1GcoNif1
 uLAuVmKC8oO/XElLmOocszfu8b00KnTwqbmTby+IhXtFt8PDwdmwSTStuT02u9bBYGyE
 YBDQ==
X-Gm-Message-State: AOJu0YwZJwVeI9pG3rRaCo5YWr2SSzU3lL5Dzmv3Bgz+OG3s3TrrB50l
 e/HMyuCX123Ghp2rtasTjyqOk+lpARIYiznPAjFjnJzyqoF4Yiokl+VLWw==
X-Google-Smtp-Source: AGHT+IFyEZb4bGUtQYdWuKj1nQ6Wv9xoOf9sYg1W1Jif8O2pOlKHZHlY9hMMBSqznOJcdZcyDT+MqA==
X-Received: by 2002:a5d:64ca:0:b0:362:5816:f134 with SMTP id
 ffacd0b85a97d-369bbbb300cmr5243235f8f.13.1721652309265; 
 Mon, 22 Jul 2024 05:45:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ceda0sm8421060f8f.87.2024.07.22.05.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 05:45:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:45:07 +0200
Message-ID: <20240722124507.248444-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721652309; x=1722257109; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fkuATyVZO9xD+zlB+jhvwvXXVG+62acIFFJui95PKOc=;
 b=Nl6dZYoV5qIP51QUkyXgXhPdfpUlitnP2yQTsdQ9uvMWaF7j5KQZdc+ToBQxakZAmP
 936ajwgH6o7eYGSv6ZiZtvBxQbhxOSOFDHP5yN3lq3A1NgkDHTGUyTm9+WW8/DnREzYP
 U6YBVMzyjAseuwCY+P1zxG/wRGuv23vPe7QUWO0AHQudNYPexnCwXVyfL+Dhl49N99MK
 ok5nuaCWMEW5iqloIeabdNCn2oxRoFqmrJC317h3dLMaTJOpfrxezfrs4E5QC4s0hvjf
 WLfdKf5Tgcrzz0k1nL4aPramGQhRIrZo2zEU4s1lvkeo5ZlVcHS4LrVbuwqGQoitm3GB
 qw1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Nl6dZYoV
Subject: [Buildroot] [PATCH 1/1] package/gnutls: add tpm2-tss comment
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

As suggested by Thomas Petazzoni, add a comment about tpm2-tss
dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnutls/gnutls.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index cf2f02cc9d..7a79612102 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -14,6 +14,7 @@ GNUTLS_LICENSE_FILES = doc/COPYING.LESSER
 
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 libunistring nettle
 GNUTLS_CPE_ID_VENDOR = gnu
+# Don't add tpm2-tss optional dependency as it creates a circular dependency
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
 	--disable-libdane \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
