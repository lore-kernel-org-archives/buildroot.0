Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FBEFF885A
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 21:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32ECB422AE;
	Sat, 25 Apr 2026 21:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z48wqLJlbmfV; Sat, 25 Apr 2026 21:18:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AAE642263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777151896;
	bh=pJPQvf1FATmF2DM1tAPrHMdp9DxKzDKZF7L0yaF2iKU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TlRTp9ndZfH6Ibg3WBmK2tob+F7pml9K/Nq7dtnh+KXVHavj716x/jZgoauzypiyn
	 E4RIVra30K3waR4T/WyKwUSVTGl53tysJmhnEfd7yB7sxyWyE8t74XYImZVTKvKinz
	 amwyPt/HJ4dSsoFlzYadyaSTycoJ65Ayuxy0TuJ2wShIW2ikz0tripztEd3yMyAarF
	 ABzrRe0D4/TzFoxwczMMmsT+oAXKFF5iggwggo02cN9DUv8mxxy6tXywS31vLPZX6c
	 yeNuYdyEpN1UYfdT2s8QGZJ8dWS4mNvvI7rmQU2LKdJdutMPdLU644PXEHjDLoP86g
	 Xix1O058zvqvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AAE642263;
	Sat, 25 Apr 2026 21:18:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B4F7194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C60E61296
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgenPjNrg33p for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 21:18:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E8EF61295
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E8EF61295
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E8EF61295
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:18:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 73CA4A4C1003;
 Sat, 25 Apr 2026 23:17:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48402)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGkMj-000000004gG-06Q4;
 Sat, 25 Apr 2026 21:16:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Apr 2026 23:16:35 +0200
Message-ID: <20260425211641.479665-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260425211641.479665-1-bernd@kuhls.net>
References: <20260425211641.479665-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777151822;
 bh=XmuyFH4roEoPP0M1qOHKLO0x0UWGwjgeCDkGwDBKu/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CPzepF05PHNEJTDRYgd0ZuKd3BG68W88RQ/xqLhSFpSbl9K8cAyEJ2S1YpfQl5K96
 NqnoeyYUqETdbd4lKhV9KAhap0oaERPbtIn9uDj9P81/Nl3qoo8j7tux49anRMmvoL
 WulAAWCUJ6nlAqIIzFiZBd1sRFnWkmVtEp6NI9Mje/868RlIGhz7X7YqzzNezOWjI8
 Mlxq0wn63VOfIh5CwvXwhgvsjPNNhFyMwTGDAQgJoJvb5KpotvgyiO/BpXvnWkyzk1
 dbwvXXV4uZSf4AK7OTMa0FKlw50omOvSnH4Lm34hVtqngUpUoRoKAZ1INnAKZ3f/SR
 DJBL6V7Lq9B3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CPzepF05
Subject: [Buildroot] [PATCH 2/8] package/bpftrace: remove configure option
 INSTALL_TOOL_DOCS
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

Buildroot commit 97e2f63bdf4cc992787c570b17b099c41c5535d2 bumped the
package to 0.24.2 but forgot to remove the configure option
INSTALL_TOOL_DOCS which was removed upstream in version 0.24.0:
https://github.com/bpftrace/bpftrace/commit/579e0e9dfe613502d14b6091ed35b0dee7e90f22

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bpftrace/bpftrace.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 94f7c6b4f9..35c8dec29c 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -28,7 +28,6 @@ endif
 BPFTRACE_CONF_OPTS += \
 	-DBUILD_SHARED_LIBS:BOOL=OFF \
 	-DBUILD_TESTING:BOOL=OFF \
-	-DENABLE_MAN:BOOL=OFF \
-	-DINSTALL_TOOL_DOCS:BOOL=OFF
+	-DENABLE_MAN:BOOL=OFF
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
