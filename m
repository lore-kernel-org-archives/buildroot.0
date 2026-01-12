Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693B9D25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42C9F84480;
	Mon, 12 Jan 2026 08:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCfTn1dlTlS0; Mon, 12 Jan 2026 08:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9626C843F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205902;
	bh=MDrx02BFISSrx2ysvIF68AVW39ZS5fU3xWolOOiRL24=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bdsz+cPzZPO+tlmNyb0fETCNPFzmeYgbq8gYNAvclhdg4gK8A8q5f+bWmgBwLo0ze
	 x8ZvGwHiNuidjLUbH+fCQxLzjI5sXKRoFJUaKhs/jXYcn8u2ChCZ5YD7kApt5nNxHt
	 0JqRob78RILCmwOlYY2bbSx7CgbpD8lWHrJsmZ5VJO495H5zNpYC0E0QOgPvJEQNup
	 WuEDPO43XAO26a5GffP3a/ygAO9lghe/bynkQSwsc/LyLhB3yd8JUV/9WIAl1lzsHQ
	 2/3HnBAJzKgfJXfI6Pd1GVvAwAgWHayciSe+ijieCslQMRYuTMHDrtih8JFYhbgvmQ
	 8YGrE7YaKDb7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9626C843F3;
	Mon, 12 Jan 2026 08:18:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2EC118D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4CE3843F3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9TqaapwwSge for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3C3D80D8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3C3D80D8F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3C3D80D8F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4C3AA4C3F7D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuV-000000003M6-3LHx
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:54 +0100
Message-ID: <20260112080419.2516889-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205142;
 bh=ZXl+kAL/5VVnmnRteCMotQ/UwFv8sXmDCXYV5o0CyaE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=vIPgS+6bBjwj2XRy5baixRB1drzSUY+YQ4TZ3o+jeghEjiacgtZyydloaTo1Qd3wP
 YSrf+EaTHFrq0vOi+YgJYsGU+hlrFwUOQXr/YZMaZZkFZkMOJ6XMGvZUNqsIiQ78ul
 LhD0zeFPi3fSC0cl3iHdZ+6Y6SjQnapwCyNGdAuvfOOaGBNfDwWEG+D86FVJb2WSq/
 7JJWohPopQ+4NexJsRbxh+lgIw4VQDAVhlM7FUW8ROZZYmHCA4PFvHrB339htIRM7f
 8KPiL1ZM6Rz63mlOGj6jpQ8SFllHIiHPpg/9n5wRQSnoysEQJbYNGoue5xlZ1zXNs+
 o9hIe22Fvt0DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vIPgS+6b
Subject: [Buildroot] [PATCH 019/104] package/x11r7/xapp_xfsinfo: bump
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

https://lists.x.org/archives/xorg-announce/2025-July/003619.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash | 6 +++---
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
index 7d5976473d..1904dcf145 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003238.html
-sha256  92f3ca451cba7717eed15f80de3c123aa56c82a1ee7d6e9116ba513021b98874  xfsinfo-1.0.7.tar.xz
-sha512  1914916bf995c08a520bd009ddfa57c7e4a997a829380232d359f9bf68852c67650efb8f1fe3cc8a11889b2ec067f50ac38df711ffaf4536802a0b530dc1789c  xfsinfo-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003619.html
+sha256  ae80592b6063da928e3d0c81023709b2fa29a04fcda49f6c363ac579d97f23a2  xfsinfo-1.0.8.tar.xz
+sha512  fdba207b6fbce0f9335b712a2b25bc3be973fe1ff712373b0d1a688c130299e9ea870f34a44f24757e73e88c59bdea03d67e96efbc455030f71ef81ab4668c98  xfsinfo-1.0.8.tar.xz
 # Locally computed
 sha256  bae01fa08f30f21f9cfb75e8339d081b34e5e03d12677177f85a55b0ca41d0db  COPYING
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index 29e9fc75c4..4fcacf599a 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XFSINFO_VERSION = 1.0.7
+XAPP_XFSINFO_VERSION = 1.0.8
 XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.xz
 XAPP_XFSINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XFSINFO_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
