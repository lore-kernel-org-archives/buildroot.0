Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713AEC83F17
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C3DE82C91;
	Mon, 14 Jul 2025 20:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3Elo1QqA9bI; Mon, 14 Jul 2025 20:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 824CC82741
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824CC82741;
	Mon, 14 Jul 2025 20:26:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20573DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10499820DA;
 Mon, 14 Jul 2025 20:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJGzFmK_Ikft; Mon, 14 Jul 2025 20:26:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DCE6820BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DCE6820BE
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DCE6820BE
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45619d70c72so9461165e9.0
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524778; x=1753129578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eg0FF/byBt+E/r3kMagSlcptViex9hapDGqK/EFRKs4=;
 b=bfGvBRLs7aRycJMYxv5Hr2HguxBxcdNakZ0qbmreq3Tj5zEzErgxsLQz53oxKPzJnh
 3pO2l2vFrysCBYpGKvTufVG5Ht0rSVtUq9USOJdckKTitmnh/FK6GpTvN9BuUUDfxSEj
 nicTpkzv3OXtrt3AMjCPqGpVcVbhU1xvC0DCI2TzulyRty2LfsbOI8Flwx3yukWMpRsT
 9R7m9QWYow5OWKx5AZR3s8Ines+SXSEL1Rlv5pSviwHxRBvmgF8QUbQNhxwgAyNq49B5
 ++Ok2+B2EXOKvPjl0bBR2y/gjFZNEARhNdelgjLIwxBPSPMIc9jXNQu784YkElw868Z/
 acXQ==
X-Gm-Message-State: AOJu0YxoAz+va9Q2Nua3b9CXhuTCkw1q1WdfwUBQOrRQpw30vyOTibZw
 p2ecaVXGt3SdXHvN9QQu0LAwaqTe5xIx86xvN6RrAu0iGFoPEn1iVW2eCKT6hw==
X-Gm-Gg: ASbGncuQCEECVWZT/ERYiw6wPih5pkXluulhKmvOE9WZMXWNpp6NzCbrfL6KyTmdro3
 lBNkFlH8xq0AjHJaDZI0tlcRPcIp/48g/ShZx+u2px6M/aIvm5b0yNBe2DpIRbgN2XtaaNzr1Yb
 VPwzrhuBakOW7aIc0enS6Gzod4BtJWnNuvOBZvcRH0lAX7OAW+uoHGJx8tQmdbm7UmoMnACfelY
 KtZzMirBZrNz+pseKZtW+4P/U43XQzC+PLFfUe7Ufds/lPdwHZQ1WSs17uRft1uoolhCWW2mOxX
 +0hv/lkLhSXBpUDCqfFrucOE662WyXGs6+HJlM18ih0R/oYLrtE3gSwPjjQ+YcymsC0ZoHuoiMz
 30mKy0ik5rg3WpWSfk+tdptbsiBBiMDFc
X-Google-Smtp-Source: AGHT+IEpxOJbvvmsiHgPkgY7yyTOly657YuJvIV4zOlnL0eQrQEUe9HWmNzPILfAQ/STOBW0v6eg5Q==
X-Received: by 2002:a05:6000:26c9:b0:3b5:f151:207f with SMTP id
 ffacd0b85a97d-3b60952227emr701580f8f.3.1752524777930; 
 Mon, 14 Jul 2025 13:26:17 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2025 22:26:07 +0200
Message-ID: <29593e046424c4524ebd2c7c7c44c40ac1a71252.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524778; x=1753129578; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eg0FF/byBt+E/r3kMagSlcptViex9hapDGqK/EFRKs4=;
 b=ReA+81eZWq0VD67BJozNpO5NDMTpT3kZ67ZxZqWakR8dyxEVIcIgPOpu9qTXMWVCeP
 Vnsoa+fwvcZQVj/KcB2l709nxRxFwGfaBRHCdQwcSVC5TmsqHMYpD1VRuvNxZcl4XrBY
 Tzsctts/cEitLqvomzAgx5Bax6O7R0Eyr2Ijgps4jAlkDP2S72aQWBeIrqlC/ignGexF
 XauD4gYMm9ds8h0QYHXxQwI93fvMCOxp5yi95Dop5e0OPPa3gCmLW4LRJfJZcHpKD2TZ
 I5cYZB1AHbeH2CJ/SRIJJp3VBbfxHZMVuOEWKXcFpiRYV4j9eFnb9o/XYrKFI685GXve
 HViQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ReA+81eZ
Subject: [Buildroot] [PATCH 13/13] package/slirp4metms: bump to version 1.3.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/slirp4netns/slirp4netns.hash | 2 +-
 package/slirp4netns/slirp4netns.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slirp4netns/slirp4netns.hash b/package/slirp4netns/slirp4netns.hash
index 1751566185..cb9088e8e8 100644
--- a/package/slirp4netns/slirp4netns.hash
+++ b/package/slirp4netns/slirp4netns.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c98ef2679c7b8c96eed95409138a22904a0550494d191385637e953534d15c75  slirp4netns-1.3.2.tar.gz
+sha256  8d24539967850bada944d56459eb9e9167357d57b39e864d95ed7d6c0dd0298d  slirp4netns-1.3.3.tar.gz
 sha256  58db3cfabf8ec806bc060e54ab5466a31de4a3ae80fe4a8aa02fb6b1c053c93f  COPYING
diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
index 5923957c25..ab63120305 100644
--- a/package/slirp4netns/slirp4netns.mk
+++ b/package/slirp4netns/slirp4netns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLIRP4NETNS_VERSION = 1.3.2
+SLIRP4NETNS_VERSION = 1.3.3
 SLIRP4NETNS_SITE = $(call github,rootless-containers,slirp4netns,v$(SLIRP4NETNS_VERSION))
 SLIRP4NETNS_LICENSE = GPL-2.0
 SLIRP4NETNS_LICENSE_FILES = COPYING
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
