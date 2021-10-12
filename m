Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484B6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 16:49:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD6B060C4A
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 16:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD6B060C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B469060B95;
	Tue, 12 Oct 2021 16:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlZD3djciPwn; Tue, 12 Oct 2021 16:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3186860808;
	Tue, 12 Oct 2021 16:48:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40D311BF9B6
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 16:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E1A281002
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 16:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wStau5BBmiCO for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 16:48:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10FC680F81
 for <buildroot@busybox.net>; Tue, 12 Oct 2021 16:48:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r7so68862343wrc.10
 for <buildroot@busybox.net>; Tue, 12 Oct 2021 09:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vhdTfb6CiFeGDgUifOdvVxsBKeqb9KLhaH/lXMiGX7g=;
 b=G97NRz9tovAJaRX51QwWP8aTdRcpaDKeuMp8zXTz6xiDLrXUrLknh1UtSugW6wHtPL
 CHBpAGGWe3xtdC08llqbllMvg9dh97NjKYIF12WPq7O/vTW+2bOJv7oOiI4EOgn/z3rZ
 4+WJDaHmpBqWd/6M5CwZsXSrjWbEuIKX+Sp5Ah3arZygl6BBKOkyOnNSQ86a3mmXcVAl
 ML2JhRAAIStNOtHpJerdB/ejpW/knH7sDtHXbnfUewINV5R1cMi2CV6IPiJ8kXAf8uU/
 xtUSXhCLzeNefPeWqlhkJaSictBNPu/bCzP37BdnadtclzQguVGPDynjtY4TVXhUKTbT
 1WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vhdTfb6CiFeGDgUifOdvVxsBKeqb9KLhaH/lXMiGX7g=;
 b=2fTJ6MtFxuXEHTSqsBlEVVesv10/gjCOnOUafv52TfX1S8oYil8ZWouS/sPed9Z6V7
 UmFzWVZUi28JCItH1sbennZLzNiuiyrue3faZIG9JzYAi1Xmp9zTMT+NS4p/2JHF2tSz
 N4j93eVY28Vymm6ibXv2aNe979tAx7Wwg2txyzXl2OcDMgsKXNzZqc2JWpTcvbU4y148
 KKTlH+cCSbWhTZy0vvCw5wM19jwAqBmLzAlMk79S9tQLkd0JkLb4vHY6ZFCxsMsVZ/Go
 gU35cUdAeKljseQDJOxwQaYbuPPTmb/IRrOMyYMOme0vu+16MU8/DHjXoHdv0W+JLe/N
 y5UQ==
X-Gm-Message-State: AOAM531WrjwLOmWMFCoDx4AE9LwDbrJtFiAFl8/OvBkgW0KRM07ngb4y
 0INUuK9v7W3rtoWgmDHCWKNodeDRKV8=
X-Google-Smtp-Source: ABdhPJwwpGqhWoaywer+hChhGRT7pmEddxkRvkEMHT0VSF11ccWQLzvlUjb+Zft1YTBm3nNF9S45uA==
X-Received: by 2002:a5d:6484:: with SMTP id o4mr22755069wri.337.1634057333380; 
 Tue, 12 Oct 2021 09:48:53 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d142sm3103659wmd.21.2021.10.12.09.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:48:53 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Oct 2021 18:48:47 +0200
Message-Id: <20211012164847.234070-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lighttpd: bump to version 1.4.60
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index cc192f1a9..b13c75ba3 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.59.sha256sum
-sha256  fb953db273daef08edb6e202556cae8a3d07eed6081c96bd9903db957d1084d5  lighttpd-1.4.59.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.60.sha256sum
+sha256  4bb1dd859e541a3131e5be101557d2e1195b4129d3a849a3a6fbd21fe1c946f0  lighttpd-1.4.60.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index fbbca00b0..1d9fc1ba8 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).59
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).60
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
