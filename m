Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21200D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDB51845FA;
	Mon, 12 Jan 2026 08:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MD5MGV9toh4b; Mon, 12 Jan 2026 08:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0171684635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207463;
	bh=aR/OkTTwdjIDkbu3Qdk+onDGy0l5AYHUsrYU/jds/zE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WLoWUYTQ66aPRpnG2RtSMQOCCKa0ugfiGBhACsSEZQsP6APl6ViQjBqtdk/lcNjJB
	 Jb0HC3lVal9hnvHIfwvYKqyvVj1dGSbosIXkWCNkYSiUuM3EjxC3tmdA3I97fcnFdQ
	 IgfrLnM6Z0dHjU4s4eFzL2vn/FnWolc+b5rtNE6iFDh28VwvZPRC4Nturt5jtdvuor
	 04FHFX+CLAowQWX7loWbU2wy3rHoQPxeU8uSLar/d8pZdh6X2AWX2wf2AgthssmMeU
	 gYLnPP7DYVBC9x5b1lKAolIt7xQGsnF7hwPLnBnKxNTD79Lf2a3ur9XUxxjPqTCLWi
	 ERUsxp5YyFEZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0171684635;
	Mon, 12 Jan 2026 08:44:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A0771CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57C94416A5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEdqrx-eyUyV for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:44:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DA9D4168E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DA9D4168E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DA9D4168E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:44:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60A0BA4C419F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJC-000000007z0-1WwF
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:32 +0100
Message-ID: <20260112082950.2528445-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206662;
 bh=hHG6IQUev7ksPXJtqymcUPdIQ6b7CcxSUimNfuSJ6PE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=aFwKeN9FCVItv+qoAR4Ggu0SwfRoLCU0ZMzmQ4s4OVpDkNWY7jxk6iI8DbaMJgH+t
 yOfU88I6E1li106O6sLDX80FbHbmg375JxQlQI1obKMhge3p9Yl/A+S+yR1LOLv5qQ
 Gs7TbVkUVrlxPu0KWZZzwrzGOsVm99Bph+GnwWJUmUXSN0TB2HiCDvcq73zg4lPCUB
 najLBcuu5wQQQeO8aup7FZvPiLx7HE21c7K6cD8y30pKiGQqyNOET2qh8GwJm5s4Nm
 LKBTL1aK6B0AfVW6wJxx0DKDAEpE4aBsRoljU9jl96OH9WlBnzWZLyLyxXxAXZtT+v
 QpzmyAjGLyvUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=aFwKeN9F
Subject: [Buildroot] [PATCH 024/102] package/x11r7/xapp_smproxy: bump
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
