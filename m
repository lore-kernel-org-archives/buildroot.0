Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D31CCD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D676D419A6;
	Mon, 15 Jun 2026 20:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cbf1K4fkT7WK; Mon, 15 Jun 2026 20:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01300419AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781555188;
	bh=RCfals1z79kg0bJ26LIuaKsvUxqNxqfIyj8eE+xj15M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kN9Y+ghK61MVEmcKcbGBWfslbuFMG1hmuKvO3ZD6k9ZNOymkJrtlInQojYBmL7sCH
	 ON31CbzAioW9CkUw8pB1Ef7QjA/OW7ZtN4NRWr48IcWapZdN0iUcEy/CfqxKOhholZ
	 6XiF1JD5LQp9KLSMIVylLJGOmU+ynlv3Eo1rbVBC7gJUJ4WvF3u6q3hWayPk2ofVCb
	 7tP7gKB+j9I+Djf4aqpTS13H+O1ukHStgKw+aTxvA1SrUMkudthJj9pHcPQ4So3DHl
	 A1lBtMq2/jsiN32oCJq4sNcNZ9e+nQEhDUCYMkKVjS/jHAptEPnb682B2V0mHxp8yz
	 GK28pZ0YZKbXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01300419AB;
	Mon, 15 Jun 2026 20:26:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AD772F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60BE4419A6
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3e3uXfT97NY for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:26:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59465419A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59465419A3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59465419A3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01c8.dip0.t-ipconnect.de [91.58.1.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF4E5A4C3221;
 Mon, 15 Jun 2026 22:25:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58352)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZDsd-0000000017U-2vDL;
 Mon, 15 Jun 2026 20:25:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Jun 2026 22:25:57 +0200
Message-ID: <20260615202559.1465158-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615202559.1465158-1-bernd@kuhls.net>
References: <20260615202559.1465158-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781555159;
 bh=QQKzM2XJVKoS17jqry4dzSUwGj009+v42eZ8/3pJP78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bnjgZaW1wQGWFMOYrzctY7mwTbTusMd0tAYInkMnoWtCSxh8x+CddFl0VNaanT2qn
 RmAo7Vrgd4P1MKkwqTRITwgW+KavYRq5FtTmqz+rxHybNhBRFC02a5YrHtuFwACQlC
 et22DMQqnhE33e/bWpcWhbvQW8oJLWQSv17WOWQSX+Z945cYlXTcNTcQs/jYCT3YEu
 1mNiI/CpH2TvzXJdbuO3TCA1tAenl2xe0gITPATq8u0oSLq8WgxdMkGTBGrPUiqT5g
 dTmJghJFtx3L1thIonNV9hdqGS7Tw62AMY1EDEZ+mPGR1kg0R2hOIBXpGw/2jjveX+
 CZ5kkz5pWYTfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bnjgZaW1
Subject: [Buildroot] [PATCH 3/5] linux: select host-libelf for all
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
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/9b6fe0892e0acd8d750f614656648fb51467f668

 linux/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 0baa52de0f..51b0a3fcc5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -192,6 +192,9 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
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
