Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B5EC3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 18:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FE4C607ED;
	Tue, 16 Jul 2024 18:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_9ou6Tsx6tP; Tue, 16 Jul 2024 18:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39BB060ABE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39BB060ABE;
	Tue, 16 Jul 2024 18:34:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21CAA1BF3B5
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 18:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CAF081351
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 18:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6DHgWuN_gBj for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 18:34:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D05E28134E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D05E28134E
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D05E28134E
 for <buildroot@busybox.net>; Tue, 16 Jul 2024 18:34:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-427b8571820so11116505e9.0
 for <buildroot@busybox.net>; Tue, 16 Jul 2024 11:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721154875; x=1721759675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7vNkNOQLuMrbFrtL+sJfaSlL7GdhPc0RJNU/kAowRfg=;
 b=IZbusuzdrL7HvRE2zg+Y8wfYTmZhZNxq//VOJGwyo4Kd21vAXBhaQEVPXIacHSzOSk
 XeCgj0G4nSd2+SkEZhiS0w0HEUUU6jZH60DXNC/NkRIprh8REKNWzZKhy6+shkzMWpnB
 U3oNWxtBJhC23zdFYav9JbrIRxqocaSdkAHPf5mimCGhWmNzkM/jwy0gtRi3MTmdgNbB
 wmPJYnsq/mgBikb13lTfnOWR4bP5ostRy4DvofPj4qWKD3TO5mxr7LNcY+fZcUJbqD4t
 jx4F22rbVWPzIKJNFkqkeef2BVNKdvOaKDD1dlPIBNIXgtxgSA8gR3WYf6NkbcH3hD5r
 VO7g==
X-Gm-Message-State: AOJu0YyHFW0/q/S2V6Sj/8jn8kRDmalbSJUjOJXXopFY9yfSHpjYx3fW
 i5jYc7rv7TlLwXnY2AbSPpW8SC8Qi+Opx0P//VammWyd5TMNHGJE4SPQc6Ra3Y+uokmipTNbzho
 =
X-Google-Smtp-Source: AGHT+IEjm2n/iG0vqGFbxd5/QuRprFE6FJQFLirjZrreK4gM9c2iRPAeSM96sFXwXUpj76Ben0vXdg==
X-Received: by 2002:a05:600c:314a:b0:426:5fcf:5e89 with SMTP id
 5b1f17b1804b1-427ba72b1aamr19986565e9.33.1721154875275; 
 Tue, 16 Jul 2024 11:34:35 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368155f7891sm7444358f8f.52.2024.07.16.11.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:34:34 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 16 Jul 2024 20:34:29 +0200
Message-ID: <20240716183430.725788-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1721154875; x=1721759675; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7vNkNOQLuMrbFrtL+sJfaSlL7GdhPc0RJNU/kAowRfg=;
 b=Xdd7LceyBqcNAu8ndF65XcyyVuxog5o3pG6VT0h0VyTIztqKby9P3z3uPmGKC4HXhY
 vwMV60WyQtYzkzE79FYCMt57YD2Wk/HCrI8ZHUEBuCcD+nEwm1Hcr7sVE9WQGwppUc4G
 S8vWGoG+sY3oGG62U1AHM3HrnjN6wZ+sgQ/js8glCPQFzVHbNwEZo8nLqcyA+sBLOfJP
 YgpTpNDuTGJqfQMhSpJnTM9rirXweRHYSRYR0Z3kDXPGMTnlSYOUFWD5CFC2cu5DLYpG
 y8u5GMoRvCNwmOKRcWjq/Y/bpU9D1Ef5AKouf7MgeD9K7RbQXUg/Qmy74aKcPIfWAifP
 H1LA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Xdd7Lcey
Subject: [Buildroot] [PATCH] package/libfribidi: bump to version 1.0.15
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
 package/libfribidi/libfribidi.hash | 2 +-
 package/libfribidi/libfribidi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index b37fb9223..29948fbba 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  76ae204a7027652ac3981b9fa5817c083ba23114340284c58e756b259cd2259a  fribidi-1.0.14.tar.xz
+sha256  0bbc7ff633bfa208ae32d7e369cf5a7d20d5d2557a0b067c9aa98bcbf9967587  fribidi-1.0.15.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 7c6d32fb7..ab7fe7030 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.14
+LIBFRIBIDI_VERSION = 1.0.15
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
