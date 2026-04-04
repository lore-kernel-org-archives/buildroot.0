Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F93E88D88
	for <buildroot@archiver.kernel.org>; Sat,  4 Apr 2026 06:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B31C760850;
	Sat,  4 Apr 2026 06:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHRFSKRyKKlL; Sat,  4 Apr 2026 06:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B78016083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775285803;
	bh=5+lTB3S09G07T+5aqlT5h4KQk4n96kovYZhWRJs5bFU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P5gsGoAaanWCe/GpaHvi33SzblP5DI7j/X/jRIlHY7t4QZG/r7OtNK1TYfwDY7ZkS
	 aBroihLyX504jX2069djcqk2hDO5zYA3UiNIw7ioQn6/K7N9CfQTh1yCicgMcuyVKa
	 XHJlBfMMVZ+sZYxLnjNiBd78p1wZ8t900K7wUHNJJNMfp0yx9tmbT4mZiJtUB2posf
	 5rN5j+1v/S+RwYY+oRZBhqwrMaW2PnKXEr447iFBVkZ8aX8Le3+g/Ubv48A3dgTnk6
	 5vh4edicN/BR+VHwt4OI/l4AgH4EVsz2/F7zOJtdOlyURg6c86PSUGZ7piM8aQIeoZ
	 NbqnFjN5/Tqyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B78016083A;
	Sat,  4 Apr 2026 06:56:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7803E75A
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 06:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53EA36083A
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 06:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNjYrp_IBRoS for <buildroot@buildroot.org>;
 Sat,  4 Apr 2026 06:56:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E5DC060747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5DC060747
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5DC060747
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 06:56:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 57B54A4C3763;
 Sat,  4 Apr 2026 08:56:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44876)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8uvr-000000000Sv-3m0H;
 Sat, 04 Apr 2026 06:56:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Sat,  4 Apr 2026 08:56:35 +0200
Message-ID: <20260404065635.334754-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775285796;
 bh=VXJLpN5If7nNtCFgsHqvhazZ3FqH9ufWYMmAu5Zdsuc=;
 h=From:To:Cc:Subject:Date:From;
 b=K4NmFhhPZVXnPJXgrUGBfQwKQ9fAY1ZegvqNP6fc96F/Kwk/Y9U40HEqgZJhUW/cM
 HWK+ZP7FGWjE9Ak6dBZSt5ZrksWGfGWjSgU/9pI4V0N509lQeG/di4muSgyxkd5piv
 MHwtNgGe7yBDNi6a0oYxaWM6DQFYMp0aFOBGYKD0+QeRYFu0DJcUBe2M2ua2dhHo/X
 9gFeC66P7VNqdeBgek/NY750Yv1+KINInerKRcL/N920zGaDVQRAx5rcKUoO4mtyql
 T/LeSMXstLPu5bsuEBDofD7V6+jWsOkJ8QPGcyy5djCQXkbKrlhq6cP9mLOfewkT/F
 jczo+WDN5OXOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=K4NmFhhP
Subject: [Buildroot] [PATCH 1/1] package/mdevd: fix build with glibc >= 2.43
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

Buildroot commit 227378b5930b681c79a13476ae60a98753a98a03 bumped glibc
to 2.43 causing a build error in mdevd:

src/mdevd/mdevd.c: In function 'act_on_event':
src/mdevd/mdevd.c:797:36: error: assignment of read-only location
 '*(const char *)strchr(ud->devname, 10)'
  797 |         *strchr(ud->devname, '\n') = 0 ;

Add upstream commit to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/92b/92b9b307996a44b66dc3f7f7d35dd74816b62480/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Some-libcs-have-a-char-const-strchr.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/mdevd/0001-Some-libcs-have-a-char-const-strchr.patch

diff --git a/package/mdevd/0001-Some-libcs-have-a-char-const-strchr.patch b/package/mdevd/0001-Some-libcs-have-a-char-const-strchr.patch
new file mode 100644
index 0000000000..f039d34a05
--- /dev/null
+++ b/package/mdevd/0001-Some-libcs-have-a-char-const-strchr.patch
@@ -0,0 +1,29 @@
+From 4594ed03e4ced04cb914c8fccad1ffab41cc4ee5 Mon Sep 17 00:00:00 2001
+From: Laurent Bercot <ska-skaware@skarnet.org>
+Date: Wed, 18 Mar 2026 15:45:17 +0000
+Subject:  Some libcs have a char const *strchr()? need to investigate
+
+Upstream: https://git.skarnet.org/cgi-bin/cgit.cgi/mdevd/commit/?id=4594ed03e4ced04cb914c8fccad1ffab41cc4ee5
+
+[Bernd: removed non-related content of the upstream commit]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mdevd/mdevd.c |  2 +-
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/mdevd/mdevd.c b/src/mdevd/mdevd.c
+index aecd5a7..7df3aaf 100644
+--- a/src/mdevd/mdevd.c
++++ b/src/mdevd/mdevd.c
+@@ -794,7 +794,7 @@ static inline int act_on_event (struct uevent_s const *event, unsigned int actio
+       if (ud->devname)
+       {
+         ud->devname += 9 ;
+-        *strchr(ud->devname, '\n') = 0 ;
++        *(char *)strchr(ud->devname, '\n') = 0 ;
+       }
+     }
+     if (!ud->devname) ud->devname = basename(ud->sysdevpath) ;
+-- 
+cgit v1.2.3-70-g09d2
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
