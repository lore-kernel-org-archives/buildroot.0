Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88096F47CD8
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 21:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E36382D7C;
	Thu,  5 Mar 2026 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgiaV9vXFHXV; Thu,  5 Mar 2026 21:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D66C582D2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772745020;
	bh=efguG6A5kL4OZeqntzGPmH1LqbSYj+cCvTqm11/42Rs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IIycGRmBrc7s7e1Gk7fvSf6hC+mgccZ0xbRdIhNbZXsOGLLiJusOsjdegJBp0kr0i
	 zu8WbI6W95blxusrl5DwYNGEf8BsUnvs/tldvDH0nfgyRs2icMZx/dUsJs/P9NfV1s
	 E9ZiOnMhjyrFlgVG861/cnB8SmfIXoOivmeO3XNNZZkV0QDMrDTj/YACwtFbQXITSo
	 Eu8pN5Z1h/jPFyACDJNhDwwNMhDjtNGo2F+9wNQF35jeDJIQ7d/QTJwjJrB7uZ/FJn
	 Opk1jnoqjVwkydo2x/qSx8T5IgzEoxzbvJWqwUTWFm+oUM3cqA+rWONYzXzSTVlb2B
	 OmqUmyFollrtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D66C582D2F;
	Thu,  5 Mar 2026 21:10:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA0A6223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB20960E32
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6EHQxk7a-rv for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 21:10:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C98E60E30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C98E60E30
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C98E60E30
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:10:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D2217A4C372D;
 Thu,  5 Mar 2026 22:09:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyFx9-000000003FD-1nTi;
 Thu, 05 Mar 2026 21:09:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Mar 2026 22:09:37 +0100
Message-ID: <20260305210950.3471974-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305210950.3471974-1-bernd@kuhls.net>
References: <20260305210950.3471974-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772744991;
 bh=kroJWmlhcbU41myDRAr+wlZM/105BgVkxhvj005fFRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uAr2+/bE69FL6QYwu1B7WmFVJN95mZLXQPjoMyBg+WtGEsBToNbQ0UVQ+3ZjyBhgY
 i5etARLk1bcMH/++ODozJqCtFQZhDBP29qLqLf04nXhjmdymmtnrsO+ZDrDBZGTUlR
 6jkDMscQjiGN/ieP7hTj6aLcxvjGX65s1lWexz6ntkzsp0F1PTMpjoo99XfKLjFHTl
 N9wlYB/ulXe5LxgNmG64ojUTtSXuptpMF+l+JJFf4Q/mM8tEGGe+Mj7ZQn64npShH3
 gVPb9gaYesQHbS7CbdO4bWi1f7tphTGJiFNifrhye3Ai/0ki2WsN4Kn/TxG4ajvQjo
 HpUI1R3gWs66w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=uAr2+/bE
Subject: [Buildroot] [PATCH v2 02/14] package/lxc: bump version to 6.0.6
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://discuss.linuxcontainers.org/t/lxc-6-0-6-lts-has-been-released/26294

Added sha256 hash tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lxc/lxc.hash | 3 ++-
 package/lxc/lxc.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index cfe0e5ab6b..8cec7002fe 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,5 @@
+# From https://github.com/lxc/lxc/releases/tag/v6.0.6
+sha256  b0ba4537258d2b848fd07dedb1044dab132de3fb3f1976d240da40a7dee1b8cf  lxc-6.0.6.tar.gz
 # Locally calculated
-sha256  2e540c60b9dd49e7ee1a4efa5e9c743b05df911b81b375ed5043d9dd7ee0b48a  lxc-6.0.5.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 2f17960e55..399b47070d 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 6.0.5
+LXC_VERSION = 6.0.6
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
