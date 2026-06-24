Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB78CDB481
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 12:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF1760BA9;
	Wed, 24 Jun 2026 12:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCMSZ58aB8oU; Wed, 24 Jun 2026 12:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62DC660BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782305531;
	bh=4JVaEt95jCJqYCOH0mPlcGL2xpRmGJx6dKybOqrCFpw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bedCLrWQgGt9zJSnuDFkjLnO76sIIfn3oOCIiXsoS+rYGItfKydbR2T2s0fZcppsL
	 3zmcjxeuOxhCJJC71nX2gu1KRBTksK9HXcEKjEnO6agIXqOwAVnqWzmYIiCNaSupls
	 2Fud5J15jekCO6gELs1+cAAGpB4D4fiPm8XbGIhVqQ3KRs9/rLv4kW8r20TglSBB0G
	 eroDk9tnJe6dcgsNVZcS5NJRsIe6JmBK1w0OgLpm6ChRA/RkLYAZMmH9i9/yq874d8
	 heO5k37/OJ/HNCoE7vTnOBLwjdts8izWZW+bsPpd1kyPbf9hw/THaN4S8Unvw59u+S
	 iizhTpnwWY7iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62DC660BDC;
	Wed, 24 Jun 2026 12:52:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B730256
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDAAE818DC
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kumWtXkCpRSY for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 12:52:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3154F81A58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3154F81A58
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3154F81A58
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:52:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-46019edc13dso614425f8f.1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 05:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782305526; x=1782910326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dvTWDZTiAVFRapBpPaOkPnsB2R+RxIYEy817Y2Qlgp8=;
 b=HRlcLEF/+Jf6pevyu5MordIBtEWIeBdHynb417WDHP/AvQ3cix/u8FP4udP9qDUxa6
 zsc7SyG9sndOQtIRNzGf05iPEx1Tcr0Yr7XpqRZxSJP/5689K6xKzpDXkSx2Z483zZX4
 YJRwC8JU2gt+W0xnc21QlR/z0x/eZrsrhDby71jPcS1A/UjQ9K5BY28L4ip0ekB1irtp
 tdKKrmSj/frLs+M4yjV4WZ6M3/kKdV3/uD02XSrFYH4g2ALxps6q54P65OIiz5MSNYkO
 iTDz+J6IPViTrlJRQf32RHufN/a6paFCwNZczJK2DAs7y2+qUQewwgn0XeaBf6/OHgE2
 0vRA==
X-Gm-Message-State: AOJu0Yw6eCQ44Hxcy6TYLM613zk6rf9DniL+nZ7+nBBMM0lEMr+mCY5t
 SOuNTbf2eOpeDhSsiYOdTZh51THZOK7iB8hD3A8cyMpp0Xjt6v7vaALA3/hcEGrfUpzOJ/4kT3W
 h1r3X
X-Gm-Gg: AfdE7cnpVOqrGuWlSFhhILh+BPcbxcF2wbDb6/60KPGvcssz5QONOCRuUoqWCqdcUB5
 t8VLUaMoE4uJg8InCcL3zwF+GUzUTAHkztJUkaAKIolYbxxcO4SY0AV4ALAv+kZ+j5yCOEfv7Kq
 tQwNxQTTN2KKvguhCBsOuNyVYVGdcHCRYerm4Sz59/pIsVcGkEf9fOqlQawn13GKAE/M9wB+gfC
 oxtpG8vNtdZ3m3GoafnrCFceI8xHZcFV7xxgqyHihDwRwFi1en7qkeb7GdrLM0S6pPuiu4TJzRr
 tiERzNEHYLjSmLENciv49ocX/LQFAuFiJeYcLvRUE7F54WlltyjIPdUq2ZNp55Bck3q5mXeoMtk
 eUXGgwkoXOpx7i/ZG33CH3Q0ZZmyw39BarW9UEvneXVWZkib/bSh7JFZMPfrZY6MCpwCAj4gEyK
 i8YBJYdrkJNGloEJPEqN+2x7fDtdMjNl3OCtuuB4LraHJlCacF4G4L/ZmhHr8xeRAeCBBHKPTXA
 go=
X-Received: by 2002:a05:600c:548d:b0:492:4a50:41fe with SMTP id
 5b1f17b1804b1-4925b37eb43mr101919305e9.22.1782305526167; 
 Wed, 24 Jun 2026 05:52:06 -0700 (PDT)
Received: from P-NTS-Evian
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924923392dsm722946235e9.2.2026.06.24.05.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 05:52:05 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Wed, 24 Jun 2026 14:51:54 +0200
Message-ID: <20260624125154.1869177-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624125154.1869177-1-romain.naour@smile.fr>
References: <20260624125154.1869177-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782305526; x=1782910326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dvTWDZTiAVFRapBpPaOkPnsB2R+RxIYEy817Y2Qlgp8=;
 b=sof7b/i3NY+Ap8BJh6C1gkJJA/Ihj2ATeL0RW6N6fiu01aEPcLGh8u1BSq7eo9JK60
 7mz58uiCZF92qwTYOJ3mqFf9sBSX2AtCQvxld04GQFq4l+8NxB8WmDV4C/7Rdsq9CvKe
 ZpwuVzeiJqnEFwhCjjeLVoyDzzUN7UjUdLIE4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=sof7b/i3
Subject: [Buildroot] [PATCHv2 3/3] support/testing: TestIptables: bump
 kernel to 6.18 LTS
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: update to the latest LTS 6.18.36 (from 6.18.21)
---
 support/testing/tests/package/test_iptables.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index eeb4ccb5dd..918fa4fb29 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -15,7 +15,7 @@ class TestIptables(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.82"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.36"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
