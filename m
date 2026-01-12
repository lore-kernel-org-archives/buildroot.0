Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DDCD2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B374846F6;
	Mon, 12 Jan 2026 08:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qDOz-EgUuVD; Mon, 12 Jan 2026 08:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78042846F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207800;
	bh=WfrxqrCHpRWpsRCU8+KoX9FBZgeCyc2GAniZZkEBcW0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j3OAqiTlott4hHIPpIb9I39xiZ4TQ0vjZMglc6s56sBJZZW6rFgy47UX9JW0CoqlO
	 KRhc/h3DmoLjvwQfLNMO670U/RhswguCkvNvMk0FtIBrtjMP542fNbnxCDq9HmRmQZ
	 LK9F4Glfb8nZB0W9fJqgFom9iOWd+xkBCClpKDRJx6jnfMqe5bSyVPiQDViocx0lkd
	 ACcQqyj9bfTcb2R0+tAFueKSEDjI6XOzJdh30JqC0CU6v7GtDMY6+ppvOQhaDUslkm
	 Pn12xblzz9zqGFHhH2dd5qIKzZAx3jhwGuaz7G7YuDkuU2bo5HHbkzDGaNo1ugpIpO
	 uMtHQ3rb53onA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78042846F7;
	Mon, 12 Jan 2026 08:50:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 846611CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 757C1846F7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5Arrzwhwe5m for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:49:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E335846F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E335846F6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E335846F6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9340A4C423B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-1Qbt
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:01 +0100
Message-ID: <20260112082950.2528445-53-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206671;
 bh=P/TwwSZr1ar0dBlEXausbbAfitSBiox2/SCZgUHyegA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Hj1svvrxWEjhN37FaROy9lQZuc/E3bk8gGJRuBjts7TESKNAXUQT5XPEdh26WVpIX
 i7ICtgddiBwPqrncjf1bpMEpHCcZ2Oy+UzJRwRxmPyEt3o0isV+GjK8OrT9Hda1qYx
 ZQK7yHMCMrzLfZS1Klq4VMr8ijr6DFE6wBNdf2v4h5QbSQh/W3TvbQSiUhwr5ZOpQO
 gN7LCOL7DjpfJzFEYPUfBcza09Ne/hzvjz8GnKGyaMbWVZooVozVNUqmdgcSQaKp94
 kXGf/VG3YgXnGIOyR+bSL3MpVqDYZY3q9s6kYDrELLruflvZ53cb4c2VFtk4nuZUMT
 ywIUVDESZpryQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Hj1svvrx
Subject: [Buildroot] [PATCH 053/102] package/x11r7/xdriver_xf86-video-mga:
 bump version to 2.1.0
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

https://lists.x.org/archives/xorg-announce/2024-October/003539.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash      | 6 +++---
 .../x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
index 813429789b..69092fce56 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003184.html
-sha256  27a33b70837965bb4a5f27fd260be085ca5bba837a4e62907f093c2f205603ab  xf86-video-mga-2.0.1.tar.xz
-sha512  d9a0abedb71f3354788c2f91b770bc00c4118cfa2c99072dea82c28f025bc87bb88ebaf969962a8f0e97e1ff7938aebd9c682b730b0e07d5174dd9e8dc2cdfb6  xf86-video-mga-2.0.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003539.html
+sha256  7bf85dbf4efa17b7cdd483be8f61cf11fd73d0310514b6ae10d89358de63ab73  xf86-video-mga-2.1.0.tar.xz
+sha512  b5c83ad96004cfecd1a081440d2d0bb4a43d1ce1cd202c0ab69c0ded92cbedbc8fbe2d3e06fcb960fcac9719c56b45465b4a853f6e7d80ffb47af371403294b6  xf86-video-mga-2.1.0.tar.xz
 # Locally computed
 sha256  f69c2f4fd11ec4de7fcc23146187836eed1755aade3fef28b9204ea1a4adf61b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 4841a643bc..8c37684dda 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MGA_VERSION = 2.0.1
+XDRIVER_XF86_VIDEO_MGA_VERSION = 2.1.0
 XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_MGA_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_MGA_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
