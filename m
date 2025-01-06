Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67838E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 04:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D5A60819;
	Mon,  6 Jan 2025 04:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1YHi4jZmoBT; Mon,  6 Jan 2025 04:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3794860824
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3794860824;
	Mon,  6 Jan 2025 04:28:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AD816B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 04:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 185EE4060C
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 04:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRWep1_hYuaV for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 04:28:27 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=jeremy@jeremypeper.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A800040462
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A800040462
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A800040462
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 04:28:26 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a8c7b02d68so112765935ab.3
 for <buildroot@buildroot.org>; Sun, 05 Jan 2025 20:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736137705; x=1736742505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gpksG6UC3N4S1DIHiyR4ceX/23C3RTJkqjOSc/DysRc=;
 b=uln+T9AubmFWPETPnZ7K5mR4p+0VPClis2JCX841QRlsBTi3/IgnMxla+WJ7fK33KE
 c7z9MYKoI1dU+6Uj6jKtGn2ro6OA6+BVMfE2fvLaRlpqyhGDOQ7vT8nd6oUn2VLm1DFl
 cvUh1UK27DE/T+6uZMVPDJ0Lz4GCVmO/y919dhI8DUG/RKjfCxFZAuPsnZrFoAEVsUKX
 ZKaIKu36TcUbjJkfU2yny89p5WPqXShKQzeEYzQR4vITqYZcc3XT8oSt94+kCvz7JJj/
 5524uI1sjCaf6eJcwRHhyNU88VNB0LfoZSDvGqeozH1rabN8kiSPEdscbOMJBWZj42Vi
 bvTw==
X-Gm-Message-State: AOJu0Yx8w6wt5EPgf+V/+6BwOCdABFvoGG8AtWt9sr6jg8kf2wPRagXh
 JCu43iUvFLR1nd7xfLhUe4kyP/BppANmgLSjfHP6d7BXk6D3UKY4rx11/oxET3MMtkc2W3t5RlQ
 =
X-Gm-Gg: ASbGncsWdT1JMV5Yzbf9Zw5YyK11v2dncMAp+UHxzsQy7nuSpEQcoc3nntnCC+V5oGB
 Yfn73GcJ9qlMUO9XZj0UGKPrlr0KFUs2Z1p0nJ5933N431e7c2H+xwiZ1UKD8UkRHOnp24nEcJM
 jgoteU+qBtcE9upwX+90n12Iv6tiZpAAoKGwWNomuzKOMF2hZ9o4aXEQixN+QqMAiOZvRZbSbIU
 CMbCNNlsbw9+r2jUTL14Jc3zTsUZ1mt5W/HJP3Afh+wChZSe/oLbmfijTADDtqtNg==
X-Google-Smtp-Source: AGHT+IF6THUZAo26zn2cqT6M2mVCW9o/BKgTY8n68tLWcP9uCdAtp6WOj8cRrse7LAyOiTo1m0r63w==
X-Received: by 2002:a05:6e02:19ca:b0:3a7:e7bd:9f09 with SMTP id
 e9e14a558f8ab-3c2d1e7df64mr446191845ab.5.1736137705187; 
 Sun, 05 Jan 2025 20:28:25 -0800 (PST)
Received: from earth (97-127-37-139.mpls.qwest.net. [97.127.37.139])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c22477fsm8864665173.159.2025.01.05.20.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 20:28:24 -0800 (PST)
Received: by earth (Postfix, from userid 1000)
 id 72531106D6E3; Sun,  5 Jan 2025 22:28:23 -0600 (CST)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org
Cc: "Jeremy J . Peper" <jeremy@jeremypeper.com>
Date: Sun,  5 Jan 2025 22:27:44 -0600
Message-Id: <20250106042753.1562163-1-jeremy@jeremypeper.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jeremypeper-com.20230601.gappssmtp.com; s=20230601; t=1736137705;
 x=1736742505; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gpksG6UC3N4S1DIHiyR4ceX/23C3RTJkqjOSc/DysRc=;
 b=2/fuUbl1u6+rZKZfm9NVhX7Hd0UvwvMUkcRK2Cr+9zR88Lrhnf7fB1VQo1P5vFdqHT
 mXT6FYopVGhRLz4sHfhgj0nZekepfov5rRBNPfY37ndCNYX5vs2Tdx+b7JYSLGAqhkLC
 Z2z/qZjBjf4Xh+nGSPPuxNtggpaWBesPRqIPUCC6md2ypJTnIjfYMyIGZFbgwcs9sanE
 Coizqv5OYoRuLxV8WKwMCbh5aYC5GNClQvLyZS+DDSbjEUwrp07tgqPZxb5YI9Pk9lkm
 Q5lVIXLPDfhNQUssOTMaDPHzJ6V9C7gDW1F3qsnpXGF72Q0eV8bXqvVoM98QBgIVlWLR
 AQ+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jeremypeper-com.20230601.gappssmtp.com
 header.i=@jeremypeper-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=2/fuUbl1
Subject: [Buildroot] [PATCH] package/mdadm: install generate systemd service
 files when systemd configured as the init system
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

From: "Jeremy J. Peper" <1000001101000>

call mdadm's install-systemd target via MDADM_INSTALL_INIT_SYSTEMD. This installs the service files timers etc needed for mdmonitor and other standard mdadm functions to work on systems using systemd.

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
---
 package/mdadm/mdadm.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 421f06d6..2a95b3a8 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -36,6 +36,10 @@ else
 MDADM_CXFLAGS += -DNO_LIBUDEV
 endif
 
+define MDADM_INSTALL_INIT_SYSTEMD
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-systemd
+endef
+
 define MDADM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(MDADM_BUILD_OPTS) mdadm mdmon
 endef
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
