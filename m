Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01DED25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA90584435;
	Mon, 12 Jan 2026 08:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dO44G-_BcYeD; Mon, 12 Jan 2026 08:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E50B5844D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205975;
	bh=aR/OkTTwdjIDkbu3Qdk+onDGy0l5AYHUsrYU/jds/zE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JKNruhcBM7wlAGKveDfl8wLGaBr1PavRvFu3cbYM+3/0dQrv96OqBY9DBSTEiPz6o
	 kKzlkXdJ7S4ShORBfKwUKkhqwxQN5luO47uvkHRquAJBgUUpUFV7iz37REZ6WBwNlm
	 ncMjBCKEkTMXYJ3eqTkh1yODLhrzh7uA3VCguJyJlu90S5KTDxVB+I/EjS0mdCnf1M
	 UEBLi7KM6gfPF4XFcekPeWLKeQoUZn/VV7aSEVj/mS20wrdy1WWG+PQtSu/Dd8nI48
	 kGfaFs+H7qLpFbke1H2TkCKIDq4ozutsFP1axKoBB2hfw3guoGIuI33DxfV4WFqEr/
	 BEipf33RLr8zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E50B5844D2;
	Mon, 12 Jan 2026 08:19:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45F9418D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BF4C614F4
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVC5knL1OfxK for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:19:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20B77614BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20B77614BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20B77614BA
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D9028A4C402A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-0ttl
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:00 +0100
Message-ID: <20260112080419.2516889-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205144;
 bh=hHG6IQUev7ksPXJtqymcUPdIQ6b7CcxSUimNfuSJ6PE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=q/otFJdPqWdbogtBQLsaLPc23s4874zrHWntWTNP05ujgq3gUEa3/BuVeY1savZIP
 71rlvQPiQxM6g7aSR/LRWX6VxteuCeQvWCfM8HK69rb+1IJRv5xQMGVphISAU9bOMi
 xKsC5fUcgwIYpOfy8BzN24yade0w7wPA/wNXCFgQWRptdXecXJQs5p2rKw3jIlZH2T
 BNFsqp6pePGxxP0JAtosc9Tzp/OsiNC41OTp260u51mzmP0K+EYmcWcsZIr6fiJDxL
 CnrObJHbVy21EyVdksuMCMHKmC2nmUCc65HP24JydEhyrq+Q2+CrcCXKVtJpVrv1sP
 YDxxCWdw1S2gQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=q/otFJdP
Subject: [Buildroot] [PATCH 025/104] package/x11r7/xapp_smproxy: bump
 version to 1.0.8
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

https://lists.x.org/archives/xorg-announce/2025-May/003603.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_smproxy/xapp_smproxy.hash | 6 +++---
 package/x11r7/xapp_smproxy/xapp_smproxy.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.hash b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
index 587864baf7..8afb3239d8 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.hash
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003218.html
-sha256  4aa99237cc9dab7d87ce9bc7cca4116674a853b5f08dfe3f9db1bb2b2cf9f305  smproxy-1.0.7.tar.xz
-sha512  cd6a6933b74f76ae65fb16504e57871724bc1102eae1d02e801e99c3fe73fe44e27f87cef3fbf9f75f369d18197b53bb677d637d94cc8185b55acae0cbd44f21  smproxy-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003603.html
+sha256  fee584eae2ec1ce2d178d72d3b484920271ba68a27935769cefbafbc3a2ff6c8  smproxy-1.0.8.tar.xz
+sha512  e930a01c3535050d7d580a93c0b2b7898ff8a8d7ab498215f2d035ab902989497d1fbc70f2939d04b609c980e86d0d4ba7829a98fda3261cb4b159432cd2bc8e  smproxy-1.0.8.tar.xz
 # Locally computed
 sha256  92dce6d8a1fcc0c6b5e56dc44e431e7f73bfa2ed5e83295662aa314067a671d8  COPYING
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index f76752941c..2ecd32e9e1 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SMPROXY_VERSION = 1.0.7
+XAPP_SMPROXY_VERSION = 1.0.8
 XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.xz
 XAPP_SMPROXY_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SMPROXY_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
