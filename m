Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBBCCD343F
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 01:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64C7C849FD;
	Sat, 16 May 2026 01:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHsBo1dsPgLe; Sat, 16 May 2026 01:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AADC849F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778895837;
	bh=CRBOg6nYFuo8cZUwWxvTpexxjigkYnK6p6/SnZKQsN4=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+fjsIba8wYk+S52c72E5Wauq3/QVSfT6Li81Q8LELjX1kjoa/L2Im+9zr0YgNsLb
	 b6ql9Tmg4ll8Ah2Oudh/0s05uPuirI9HdEdjBty5nEzMzMCMxrZoTTvqeNrE62GhX9
	 fvR3p4A5HP546jDM5SnbH4pE8+1khpoKKC1vNbNbV1PO1mTWAZze1/iKYzergKr3TL
	 Z1KPfIG7HGvWgdQnDLhE6WBLd2PSm+YCuSQDfMZPJyfA4EnghSgFIxGPEoSUxLbN01
	 ftdrssbGBA11brttsrUm93VTHALjV9WTQnxCX/eBynZK+reB3QZei1SyuzgEMDk3N+
	 emRdMdJNMA2KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AADC849F5;
	Sat, 16 May 2026 01:43:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F45545B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1102F616FB
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECOassXSD6Y3 for <buildroot@buildroot.org>;
 Sat, 16 May 2026 01:43:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 131CB61754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 131CB61754
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 131CB61754
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:52 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-8379e010b01so209611b3a.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 18:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778895832; x=1779500632;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YmblmMHmImJHKTp5f89vahgfu39VWmitu48TAWfN3xY=;
 b=UpBunpy3to5AUcYTtHy0XjvzZz4zUdR25DzsNpJjVQefr0Z23lg0We7k7IA3o8/dRW
 5WYSYCFbY+v63JjaggSEN5fc7v7cWyO61xjyt67ni2KV4ku79eGX3lQMcOVHkmtTMBA1
 rGmwnmu1a6F1p664Om/d4mn/L4jICa64r3jBjnDCygxxgNVHzpY0l8D+nzTuYyshHtqw
 aVFPu/AN+d/G+3TkdjbgwUNwjDs4ifN1mJlwDEWM/HZeDAiyM+PF8O10aihf7XIuN+O7
 PCXONa5OWWNAP2YfYsILPOal/hYmtXS08jKZ5ZwkcvGdCQD1P3ovTYXuNoCN8TbPIk/X
 HAbQ==
X-Gm-Message-State: AOJu0Ywecdq9n0Z7wgV3C+dE9VgtKbWg0JEhuZkyrnKxRu9+FXehkwv0
 8zgBdDRqEUXtBl9Zaxk9BsS7hLqjl1SKxWoY0qUYyxyOYyXOeR7kzzl2
X-Gm-Gg: Acq92OGsL9PQDGcia3e77NP7qXCdf1NUBZXfq7U7kscf7QTr8zsVPqNqJutNgwfAVKu
 uIeloWsQ2vK3G9a6XdtSvfOfs9g/O9AkXzEnIiI3mCQYNwEKNhQCZ1TZUOU8TM9svlJR2qouc/L
 xX8kT6EhQTcYiJ1NLGytSAp0WOa3AZavVZkODS7BetqbgCPHG+ijCbaZ5bmCoW59b8vfVMuLNG2
 ULqAlIpmIlok0Bbsoevq38J87wYD/qAhRp1aoukcblaKowcrOhcSKPVDxr9yg+nFIwkA8kkytQ+
 5+ZaISg4yO246SfTdd6P3sfHtNeDbAzlwC5zZz5DWp9PdL+QIaAK0sI26GAXOguW5P8fPfUUZI6
 sVEgcyfKZea16UH5gUkdKeo7zcAdyme3bNuxXdP2JsxE/DKGapY5z56D0IvefF3E+PWMvv54/yR
 IBoGKqj44cWHfLlPqcuArSY+G3+0lXvPnD7oQ=
X-Received: by 2002:a05:6a00:4489:b0:82c:daa4:ce29 with SMTP id
 d2e1a72fcca58-83f33f39293mr6937026b3a.47.1778895832271; 
 Fri, 15 May 2026 18:43:52 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19c5ceb3sm7227670b3a.34.2026.05.15.18.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 18:43:51 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 18:43:32 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v6-1-d9081c13baf9@gmail.com>
References: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
In-Reply-To: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778895830; l=1975;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=WMAuSWca9SEDhA67iNOrpOeKaUGdE9HaUwq/sp6JGJE=;
 b=FtBtn5fZU4RG8wAIgqat1PO3QAf9HpuyEymOrV3RVcm8a8jfF7wxde2bTpc6g3VS75LN1KTT9
 QqhtakIMaa1Dp5S72HD5QhVeTwmYnoaZliW9EboCoUSQeCACOJ0npLz
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778895832; x=1779500632; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YmblmMHmImJHKTp5f89vahgfu39VWmitu48TAWfN3xY=;
 b=FkQyMhLT9CUb5Y4YXxK/2GOCOXVfEe/72lR+QVb/WdOyrU6ZPwIhQVw7QRYBgTFEW/
 gzfIuMaLhV+eOBDY5uqTxzPhhHElsq7k1/Ihv08ej9lj3KUK4pFxsizrJv/U6AsDfLKL
 BJ0MX45H80X8fVlGSS9xWzwSEeAPpYLaqvnnnlrpFGZiczWAC9qO8NDMfCjb1JvOlsjW
 Q9vBZR+daEKtGcP8M6jxtb8pzUiruFYL+w6deeQgs5UXgfzigpycV7zPKH3CYyyWV+dp
 kDhvmxH3k5/IfKOn3ju2HGDY0RqjmDNCvOKyfl6QQFTSbrooBD7IBtm4NvyEhf01Nw94
 vfLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FkQyMhLT
Subject: [Buildroot] [PATCH v6 1/8] package/weston: add EGL dependency for
 XWayland
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_WESTON_XWAYLAND currently depends on BR2_PACKAGE_LIBEPOXY,
which implicitly requires either libGL or libEGL. However, the XWayland
glamor support uses libepoxy with EGL, so express that dependency
directly.

This avoids relying on libepoxy's package-level dependencies to provide
the EGL backend.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/weston/Config.in           | 6 ++++--
 package/x11r7/xwayland/xwayland.mk | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 774b75d5fb..6f61c3c561 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -123,6 +123,7 @@ comment "X11 (nested) compositor needs X.org enabled"
 
 config BR2_PACKAGE_WESTON_XWAYLAND
 	bool "XWayland support"
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_LIBEPOXY
 	depends on BR2_PACKAGE_XORG7 # xwayland
 	depends on BR2_USE_MMU # xwayland
@@ -136,8 +137,9 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XWAYLAND
 
-comment "XWayland support needs libepoxy and X.org enabled"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
+comment "XWayland support needs libepoxy w/ EGL and X.org enabled"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_XORG7 || \
+		!BR2_PACKAGE_LIBEPOXY
 
 comment "XWayland support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 8fa5260f47..5902f85d4f 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -30,7 +30,7 @@ XWAYLAND_CONF_OPTS = \
 	-Ddtrace=false \
 	-Ddocs=false
 
-ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_LIBEPOXY),yy)
 XWAYLAND_CONF_OPTS += -Dglamor=true
 XWAYLAND_DEPENDENCIES += libepoxy
 else

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
