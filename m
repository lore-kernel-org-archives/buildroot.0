Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F02FFF8862
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 08:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D28141203;
	Sat, 25 Apr 2026 08:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRMtrn8gvD3g; Sat, 25 Apr 2026 08:57:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A79A41205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777107436;
	bh=zjc5nHYRU62BNARzGNQudOGRqNagCqVcnY65s8+KQbw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=q8FRb5jc+PlUEqw8UYFk0DLkdy09vVA0OXU7Bs47wPyge24P8hESXLMEm61DtjQ0H
	 j7aRQ9TwTwQfn/yJqfIsDeKn8J/7l/FQRcTYEhmcDUkIlF77/ojYEtwLdDzCNfjY6m
	 krhWowXpLFLd6FhfD9AxxDRpxxYBr0eDNgaQonF43FrrUYpqWX2pdzpAfYLRJKUHAC
	 UeRMgZE7EjKtlquDc0quEw5hGPnHNWoQUuWI6Ze8Ealtc+LhZXXUKP3AjEiacvhm7K
	 4Jn7BtOHTMkv/G/lvKTcTYiX1AnBJEucnDGEG+MZJ4rBWvhbMVm8ik29DoD7tv6KdW
	 rsQ3PYQXUj0vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A79A41205;
	Sat, 25 Apr 2026 08:57:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80F99194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EF1460DE5
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id malZkWPBlnys for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 08:57:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E4956071F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E4956071F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E4956071F
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1wCDET3iyG-005hXZ; Sat, 25
 Apr 2026 10:57:10 +0200
To: buildroot@buildroot.org
Date: Sat, 25 Apr 2026 10:56:54 +0200
Message-ID: <20260425085657.474422-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425085657.474422-1-fiona.klute@gmx.de>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:quNPc7fPIQdTtp13OE/2Ab0T4yh3k0WYOGrYOLzO+DBo1Fn9ysY
 9FCvw2xULM7REOkQGgDhdZo51j42b+Ujx6eTUKDUXtYJ2RSUJw0G5Jm3Deec8ayuDtUeJBE
 EB/uWB2jBlkdE/IfexEYI30v5cb41o82X1JbSjWWIggOwth7gBDAd+ub3wWOsPh/GTOTs7+
 V3G/mFSBPlZafLks5mQ1Q==
UI-OutboundReport: notjunk:1;M01:P0:ysbd2/FLwZs=;c2uHjEaqHYGvSiYT8jq9/JWrlJH
 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
 LhVWHb9zajkkUNg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777107430; x=1777712230; i=fiona.klute@gmx.de;
 bh=C1AgVqHuu/yQTmt+Mlcqn9W2iskkswSUjXRAMGm6EiU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lNXsFwiyLEyQlf92H5rJaUkzHXiWKpRUI+CZWEIWLa2qS9B7IEsgzODB8Oivy7+O
 VFkGwDcjAOemisIj7WC+d4TQqPx1J9+D3Qm9OIC1hs1TxJnBELv1N8M2fkVp/Ti1a
 U/1oOkVUeSfZuto84ft52geUf/devqvjVDOaPfClXq5N/KWFZqeu20CCXGeDbWDkn
 FQp/RUkyrFIvF9aDuALlhc5kGiu4h4Ljh1gUU1S83p0i2+nDZ08fiQrgVLfrMPKNn
 2wcb3RiIsEgpM0IKFww7UL5zDyLNJH5zSeW/bdIIwH/x3hA2Yn+tvgMJfX7tkMeWj
 CkW8N4+YkByTgRYRQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lNXsFwiy
Subject: [Buildroot] [PATCH 2/5] support/testing/tests/package/test_kmod.py:
 use current 6.6.x kernel
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 support/testing/tests/package/test_kmod.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_kmod.py b/support/testing/tests/package/test_kmod.py
index 1d9ea535fc..e11d3b702c 100644
--- a/support/testing/tests/package/test_kmod.py
+++ b/support/testing/tests/package/test_kmod.py
@@ -15,7 +15,7 @@ class TestKmod(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.35"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.135"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
