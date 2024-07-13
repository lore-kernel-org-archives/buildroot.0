Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0050FC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7F5A404C3;
	Sat, 13 Jul 2024 20:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_L-2pxUpTjP; Sat, 13 Jul 2024 20:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A8E640503
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A8E640503;
	Sat, 13 Jul 2024 20:17:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F310C1BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 598D4818A2
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78-Zmt-iDlkT for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:17:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 228F08148E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 228F08148E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 228F08148E
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:17:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-36794da7c96so1794754f8f.0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720901867; x=1721506667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q7qmcdqMxCjjSS6BX+xOqrBZ5+OVYVYNMBfPfw+EThU=;
 b=A0+4WrDCVRkxePy1T7LuhvWbNmQZm3gwQTOhBs+Iq44fWoU0rPB9Gz8rr/cVzVq4OK
 EcfbKoxEgDzNhjLAFURjdO7MoPiKOvMMWthKFRSEUiLQJvGZmP5JNIadg4PRt+XtbGFw
 5+j7WiM3HVXmCSdfAjwWZgrN25kFXeeKFKAE2Z/YuUTes+vXKtq4EZr58dckfF/a186I
 pda4bx0BSOQwIOtueCLyS+172WL35q0AZFE/4gEzqPyLdUAAnXQrze7nnUw4QF8hFKHd
 Nqd4X7+Ov3VqKS2jgpZLXOZMn1Piciooh/VnEeIwo6pA9CuN0tGiu6Sbsmw3Mrtv9lsP
 mLTw==
X-Gm-Message-State: AOJu0Yy96vo+44F5hDT/nUf/cZ2vbLVpRyDqr6DU7TMzOTABM+nnxWU4
 dFbSRanBQKKd+9lafQX+Au99RPjZ926bsGulWUXIdqadh4YaVW7L1o06oA==
X-Google-Smtp-Source: AGHT+IFAOtISLmgKT/EaxcVvbS5cLu2pWrgiG9f3+bZmU+sC8b1TJBBiJZO0gMAZvbBgTAA7CIH3QQ==
X-Received: by 2002:a05:6000:156a:b0:364:aafb:6020 with SMTP id
 ffacd0b85a97d-367cea46790mr12625445f8f.14.1720901867071; 
 Sat, 13 Jul 2024 13:17:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e93c92sm32597135e9.22.2024.07.13.13.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 13:17:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:17:42 +0200
Message-ID: <20240713201742.571539-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720901867; x=1721506667; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7qmcdqMxCjjSS6BX+xOqrBZ5+OVYVYNMBfPfw+EThU=;
 b=a2o3dKE1fTAVS9MIGfhChWefZZDvfkJkGFGZiDhc1ctZynsGkX62XpORB8zCJvrSKT
 HBIbsaC4Aq6KJY6dNpM74qEiwZBpabjSk0DFJ+tGi6WoYQJXCfzl+MXYLbPLnZLXuE+2
 l0QoHUoaxKCpHmwHTGxPqbxDbFtSa0Ci0Uh/rTcKRmi1kSvKkO7LUrmOuVRmwDvsfdug
 AyKOqti9wY9pffL5siBxm+DdlaXbSTgvm+5t4mPyURjseZr/inAAH2DAOtRKbl0gPnz5
 eqgHCqih2MqY7CZ4hP1AiuQ5GTZz+t1l7Q9WA7gzG6OKXFxywmRGb3UxfcMfU4rZaJ19
 z1Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a2o3dKE1
Subject: [Buildroot] [PATCH 1/1] package/cloudflared: set
 CLOUDFLARED_CPE_ID_VENDOR
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:cloudflare:cloudflared is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/83298F83-C1E0-4BAC-8FFC-90FDEDFD95D8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cloudflared/cloudflared.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 1796972be6..a243686441 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -8,6 +8,7 @@ CLOUDFLARED_VERSION = 2024.6.1
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
+CLOUDFLARED_CPE_ID_VENDOR = cloudflare
 CLOUDFLARED_BUILD_TARGETS = cmd/cloudflared
 CLOUDFLARED_LDFLAGS = -X main.Version=$(CLOUDFLARED_VERSION)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
