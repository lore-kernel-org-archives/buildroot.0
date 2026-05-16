Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6D6CD343F
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 02:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A83942085;
	Sat, 16 May 2026 02:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gqHgJ5fOmqG; Sat, 16 May 2026 02:03:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3300042082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778897007;
	bh=CRBOg6nYFuo8cZUwWxvTpexxjigkYnK6p6/SnZKQsN4=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mOL/nx8F4Xcqsa9l2aJ0tDp1aFgF8NODphJ96Uz0mATrS/3vugnAdUTbzwVhy4pHM
	 PPWp1xPp8JL6ZlS3DiX1r1EvvObvgp6l+phQFUvUfm6Um45rjo7mJg9JuR7z1wmLcI
	 s+7QdLTMZRUVvHGO6TUgsb5lk90De/l+B4Fl6cXJtGGxlR1O6YZxUId/DyN8u5tDsf
	 4e5eMycm+pwvO/hnqmJNRSAJOshnMKIJRIIEia9sHj/tp5jm0f0Xyw6UznAEGR4iAe
	 JILnAAZ7bNvKROOyC9x2heDR4cLVAAoH/lrMt3zorNjBUuMcHduYtY0DgFPvoeSFZ2
	 mF/f4HGtMGniQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3300042082;
	Sat, 16 May 2026 02:03:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D88C206
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E4CB40FA5
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3tgZ3joKCU5 for <buildroot@buildroot.org>;
 Sat, 16 May 2026 02:03:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BCCE04005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCCE04005B
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCCE04005B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:24 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2baca4df358so2860315ad.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 19:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778897004; x=1779501804;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YmblmMHmImJHKTp5f89vahgfu39VWmitu48TAWfN3xY=;
 b=CNmsGy0Aa2zW8wXqX3Gzi7Ly9KEFmA/ARK6fvOSqtm0rcU0PaLjiHhLJoQQ3C8xyjT
 fVXTGMLsfvXU0SajsLdBc/EvVgTZY1Vh/gD0uDFSSVtdlCvJtEEM0Prasq2tTwelZXZG
 apTJRBTR7CKpP74/DnPu5dIleFdSUgWH2LUnpdGhnq19spoKtfPDsIL+T+37YJNq7WfN
 4vEXWBDQP0uHI1H+tJRF1LLti3/ssODHHbk6DdSlDLrrlYJ5N85S4XAK7edqGDtQayax
 bkWMPo8UQO31DEXsBMc/VIZzofbk5rx5DfHK9efwvgtzpT0lBact6LqQh9A7Xz9Kj6al
 LygA==
X-Gm-Message-State: AOJu0YzKMG2dmmjrs6QMvnFv7ARut4ASlBwqk+gjeyNRpvclhuH7tavb
 aTB5PvcNOpQtE/jTMxnLhIjoOYGAhVXAce9DCxS12PYExmEm1sGi5GIY
X-Gm-Gg: Acq92OEANYluQxGyZpQJqjyre+d4GN2ooLSQow5KIzw5TrLKWcW0N+cojFPIJncItjH
 ktLqlyBnsLTYzX7qkeNCagDO/D5/mrr94c76EsK507+65y2pkVzwFlxPaXvUI2jNII3uV2UFo+4
 no9QiVOvIf8oObuNNAc5S5CeBX+tSIDJIGU/SrdBOYJ2YwRQrDvxqX/NyL66Em0Bh1mEPW9lCZE
 xMLFEKMveb28M02Dso3b4hmILxtEVVeQApbjx3Hyfn3/zEIWgaR8hmBeZ6EE/c91LanPEgzusz5
 T67NfR5AvJ4/NnYt3+HgrENY+bP8rmPLiyPrSTAomMckycVUksY+K0IO2vURKM2ApOfPv7kjyEr
 YfSHaOjcYWdC78Jo0PzLJyn2WwcZ5vCM7j1nRSkl4nNei/rGQ4Es9lLh6+psmwDd0qDEsH1y78F
 CnBjpLv/+WW5GA+QZDD3nGRhJMlD+jN4hZc1o=
X-Received: by 2002:a17:903:1b6e:b0:2ae:803e:6c12 with SMTP id
 d9443c01a7336-2bd7e8ae6f6mr76239125ad.6.1778897003789; 
 Fri, 15 May 2026 19:03:23 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c16ac4asm68201375ad.33.2026.05.15.19.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 19:03:22 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 19:03:10 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v7-1-1f1814b65ccd@gmail.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
In-Reply-To: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778897001; l=1975;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=WMAuSWca9SEDhA67iNOrpOeKaUGdE9HaUwq/sp6JGJE=;
 b=aihooQysxIwJP6QB7cnQlYLq4j1shlhehVSE6F8sAmyfB6gyehH/I500QXuWWEuAvZ4t6aQIk
 Z3b9jWUQQUqCu3CtUCjlDpbxPqEZ4XUxoE+hn8DRjMugKdAeDD9kbN2
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778897004; x=1779501804; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YmblmMHmImJHKTp5f89vahgfu39VWmitu48TAWfN3xY=;
 b=djKmKl+fY7Mxa/Q8YpNFj8vg6lYrpePEoD99BBfvo1jcdWk/7XfE7jao78dNZxjJFN
 Q80Kn8uq3M/maLM4XXJ7ECmxhcfC8o6qdOskLuYSkHBU//QIfchG5UpaNUpWr9ghFUM+
 Pmq6ObDNuqzgmZ6FNR9NzBe5+5qGbpWBRMpbZEEClEsZrWQkLPqG1//iDXJ9H/RwzlzR
 Snq33Vh8ToTj7Iz9veYxLtPSPSbzB3KRcz/mjxbdTyW9n9vm4cxJjF+lgIjrsBtsq9IO
 hXHUl/Rtkrl1C3rjmrF6Ct0+plExscylnOPBRjPGFcaCj7aPQvABtFGbzAsP97dbMzWi
 Q4xQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=djKmKl+f
Subject: [Buildroot] [PATCH v7 1/8] package/weston: add EGL dependency for
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
