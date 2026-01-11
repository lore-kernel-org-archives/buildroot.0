Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41759D2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 13:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B12981344;
	Sun, 11 Jan 2026 13:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6D1syPNqUttH; Sun, 11 Jan 2026 13:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3763581343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768136571;
	bh=554l/7ZK1SSBqgghK2f/yG0O51rd3Qe69vPRTGwisr8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wde+yaMVcSGm2y+MH5ZXSaRyJOaE7FSDCcOoknqKPs09xWKPFvrn5Fw7UU1rKXC7C
	 XBLJ236xO4Vx4i+T5yJftqac8kANl0bRFkRpTxBVN8xmd10XvvB1UZJYtLqEyzTia1
	 K153Ij1pbR8T7cDFvR+0Xk5pE0JSK+fKON69CShfjkd5FvsCikoeU3TkcCtHbVRiPY
	 OLOwjm/HqmWhD7PigrDvjXVIRQwqnUb+mHZGLO/r5xId418vZ3GtjtrNf6xhefG92u
	 yoEEuQOUVlxRAFlEAYBQ35nzJNaiJnY8Zu1XgaeAcfd1kLGybaEfvxvC6pABpz+dId
	 oKHTjGqNfzNAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3763581343;
	Sun, 11 Jan 2026 13:02:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97BFA18D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89C1940462
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSo6_1Gm-RSm for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 13:02:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A98D401FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A98D401FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A98D401FC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:02:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E1F7A4C4031
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 14:02:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36832)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vev5W-0000000025F-1JDF
 for buildroot@buildroot.org; Sun, 11 Jan 2026 13:02:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 14:02:34 +0100
Message-ID: <20260111130234.3228470-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260111130234.3228470-1-bernd@kuhls.net>
References: <20260111130234.3228470-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768136554;
 bh=249wG7BD6wPrySO+nDMn2P+l+oSwp7JYjKI6KntdsrA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=AihIWiEhQaYlmq35tb93fmMCoyJm/wjF7vCQxXxtz113FLg5Odl3p7q2FTPmd8AGd
 pZMe9oqzHOG5Gw7WcSSmKoKjblEM1TuPtxqaQcCBoh3gEQE0s8ANyp/prM+wEWNiVQ
 0g8L9OEhoyXn8Jjed568YNgH1PUWRTZC/XU8ohf2gDFH5oVr9I7G0Z1xvnu+JKcz/3
 4mbmb4vtLX5+X3F8xde2vm2M3enHnIGpFXD68mYYHKP3SbhYKCFDmto3glkGGwV++F
 Qs++zO+2AAP1OLiFhVKETvF8nQ/kWXJwOZhA37CskIfbA/90So6Dw4Sep2utU/G1ty
 3AVyoVkpjcdHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=AihIWiEh
Subject: [Buildroot] [PATCH 2/2] linux: select host-libelf for all
 architectures when building latest version
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

Fixes:
loongarch64: https://autobuild.buildroot.net/results/d35/d350f09f06d43246284b4c0112544d79a9b0f083/
powerpc: https://autobuild.buildroot.net/results/638/63835fa811ad0566a3e373d79686405fdb5a0df0/
x86_64: https://autobuild.buildroot.net/results/711/7113e9d3e616733f2e98ea175ab80ccb718c90a1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 14d644ecbc..d0e11b3e33 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -182,6 +182,9 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
 	       BR2_LINUX_KERNEL_LATEST_VERSION || \
 	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	select BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF if \
+	       BR2_LINUX_KERNEL_LATEST_VERSION || \
+	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
