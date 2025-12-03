Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C8AD12D5F
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 13:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFA1284057;
	Wed,  3 Dec 2025 13:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emwnWpkUEct7; Wed,  3 Dec 2025 13:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 004C084019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764768242;
	bh=W952UAxBX9cxLCdmrTni2a+JCrzmYU3VEUPWi/5f820=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AysqMUbAtKFQ+GjoDNfZxGejSMqmXgIWT5c0XAf4n/D6eHX98uRnYiQREtg0a8nme
	 jSZp5h+VOH5c+WknkWOPmOPSbI94JHhDhlZqAZMY17HPTLZbe81Q/32VbSSYtdO/mE
	 zF73316hd5BS7raQqCbPKXRhW35SZ+dzn4Yh+LJaJC+VLt3p0bVHbS3b3g1PueI2QL
	 igct2bv7zo8cujPX7AqoAKbhZJ3wPVMIU7B086WNdz7YMTfLndNJsohpDjXRPl3yyG
	 50MH42B5Mr1FBs68T20QZVYfrB5cIkjqj2Q3CVWSRniEVyiHxgw/9Aw3nqGtrHYS/V
	 Rd6rNpXTbKXbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 004C084019;
	Wed,  3 Dec 2025 13:24:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88A2BE4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 13:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 856954016F
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 13:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UF3KCZ_qa2-r for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 13:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59FA0400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59FA0400FE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59FA0400FE
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 13:23:59 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CFD7BB00576;
 Wed,  3 Dec 2025 14:23:51 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Wed,  3 Dec 2025 14:22:44 +0100
Message-ID: <20251203132244.3015511-2-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203132244.3015511-1-pkerbrat@free.fr>
References: <20251203132244.3015511-1-pkerbrat@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764768237;
 bh=yA37Dzj5Ugrn/eHct6w4QAbrbs3UvCk5bwsq8PRYCOw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pCEZu+PQw2Pn2bK9QGudCzdtS40XTOxaeMb8mM/7N9fP2M8APSrQ/j4kcuienOfC2
 CgNgrvCXbyer6neRprCvC2rzWKzF9EPnAUZba9EO+iScOG8XH1rYjNYQ8sF6NkJzVJ
 6ZkTOQPaGtBUEgqcQlZAmaNmDSAITkBahMQ+8DZZG5gwb3wK42r3Y7LkFyqqqDyBJV
 KoTV7bckHDNOztOKzdGm8SKp/aokTSv3ddk0UmJ7AGlSFcOm2TzVAgrrNNazrc7fgG
 cFEDhjcawap86DXEHy/z4/hlteBHZKBzpKlsB2DcS4neN/pIzaikuH4MkgEW2QXit3
 +veoDova+9Wfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pCEZu+PQ
Subject: [Buildroot] [PATCH 2/2] testing/tests: package: libcamera: switch
 to bootlin toolchain
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit changes the toolchain used in the test to the bootlin one.
Some syscalls now used in recent release of libcamera were missing (clone3,
pidfd_send_signal).

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 support/testing/tests/package/test_libcamera.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_libcamera.py b/support/testing/tests/package/test_libcamera.py
index 91df427b6f9d..c785e340d6b6 100644
--- a/support/testing/tests/package/test_libcamera.py
+++ b/support/testing/tests/package/test_libcamera.py
@@ -14,6 +14,7 @@ class TestLibCamera(infra.basetest.BRTest):
         f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
