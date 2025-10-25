Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E785ECCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 14:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97F0340952;
	Sat, 25 Oct 2025 14:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svcXVGxPa8G3; Sat, 25 Oct 2025 14:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D213940977
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D213940977;
	Sat, 25 Oct 2025 14:35:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91F43D7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75C1E4018D
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGjnQLZRg2C2 for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 14:35:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.49;
 helo=mail-ed1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64D5E400B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64D5E400B1
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64D5E400B1
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:35:18 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-63c12ff0c5eso6214796a12.0
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 07:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761402916; x=1762007716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IrfPZb6Mx4IoWHBfQ3Uod96KtJBjdQCQ5IGK4nc5fyI=;
 b=g1SwV404Jugxqd6N2co4hqa4rdTEFbV1OeM7xGMNauyQGhKsr5HSa6aAZ3LjSbYHYy
 GRjTHQePEXhciFKojazt8v+GkMzjkDDO7+47DaoZx6ZwdqoRZ8KUj4odC2YY75x+lE3H
 HchFtz0b8MskuRd3cCJxgp5QeL18ov6dpxz1pvTZO/QetFoCacmQJy4lgBEqW7Agt5vn
 AGZnCyWZkq/xrawIrlavwd9nse48m95Sldcbb1Y++IsbdwodHBKEIkTCpb3oX3J/oFcR
 OELwChQDqMGNFBBwrU1Uhjk9/7s0oe0C6ANoDusq+z/wCrsz8A5ftMCQY/SF+MbERnhY
 O43Q==
X-Gm-Message-State: AOJu0YwsPwqLVScU/zf684ZN6pODwt8wH2AKQ6mJiPbWFoiv34MlhdxP
 z42zoJGO0Blx9XPkXXFT2yKm6jbZjoBvtOrH7dspZfo88e0SuAuahXWeUc/QBQ==
X-Gm-Gg: ASbGncvPPS5kxhVubX8SEt+SYtDmVPdf2FA/ynw2BVHNm5fkFEb1QrH+5fobccN6MAH
 TSsoYGVISb6EFrhSMRhkuBbDEWuKGCq+W6paNJ90LsDIarW6WN9vTWIQ5CUeocFKQS5vhDXWZCK
 +L99knzKlCi3/qsQdZR//Ho+wjbV2Co17NH1Whlu29eQc8BbHqCODRuHRHfcHkQT6qZndoqw2aQ
 23vFrDWd4UcgG7E+bPMj8/GmklPI70+zTjBg6NMs1zIChgcMe/23opkV5SMKtXhq9PpOUoBmDxX
 oYZQwGvHGZeh40cKpUgSebuEja6hzwFGNqROBpoOrFU6v2w42N/huMgzOyPgHMy+HS4dDDPiQTo
 pOIQWM+GdNzS+EgoNxfgZGfh0mJsqAE529SipOphr5ofLR1edAJkCMUGocLJ6tvbbpoQsjAq6cG
 dHrbrb/IqM5nZyMnwRWP9vHWrWg0HnG72av02NGFf/DZDpWjKUJB0f2FBrTBPEhLFickxzXiFPS
 +R6UPZu22EXVlwB
X-Google-Smtp-Source: AGHT+IF5d1u3QHCyUDrk70cdeAqVQOijvMKaFGxqWx13bNJl662rGPxo968JYRHPr8m2oyi3xmpQHg==
X-Received: by 2002:a05:6402:3456:b0:63c:1ea9:9ebf with SMTP id
 4fb4d7f45d1cf-63e5eb4b5a6mr3982449a12.15.1761402915833; 
 Sat, 25 Oct 2025 07:35:15 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb6f:7900:7ce7:55f1:adbb:3618])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7ef6e777sm1855280a12.6.2025.10.25.07.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Oct 2025 07:35:14 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 16:35:11 +0200
Message-ID: <20251025143512.78812-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/wpewebkit: disable internal ccache
 configuration
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WebKit's auto-configured ccache results in 100% cache misses.
Disable WebKit's internal ccache setup [1] since Buildroot
already manages the ccache in toolchain/toolchain-wrapper.c.

[1] https://github.com/WebKit/WebKit/blob/wpewebkit-2.48.3/Source/cmake/WebKitCCache.cmake

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/wpewebkit/wpewebkit.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 796e271ecb..15a2ea93e8 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -21,6 +21,10 @@ WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
 
 WPEWEBKIT_CMAKE_BACKEND = ninja
 
+# Buildroot adds support for ccache through its
+# toolchain-wrapper, so tell wpewebkit not to mess with it.
+WPEWEBKIT_CONF_ENV = WK_USE_CCACHE=NO
+
 WPEWEBKIT_CONF_OPTS = \
 	-DPORT=WPE \
 	-DENABLE_API_TESTS=OFF \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
