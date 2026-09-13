Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BED0C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98DEB6064B;
	Sun, 13 Sep 2026 16:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq6Q2wEE7fNn; Sun, 13 Sep 2026 16:25:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1907C605FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789316741;
	b=jDejxk/9fMq3kg5iK/vp6L0qj4W5A1Al1cN06IVjNOBTvh7ekrhk2iaALXv/GgE9/a5W
	 o1iMQ7pEqQ9FdN2ShZKyp68v3Q04qFZfB4oczBWcmKueS3q3SGdRUXPyC4v4ON3bkDgtU
	 RyimKBjjcIgPjHuq2LwO7jQ74PnAJno022w7UtH+xGRTeMbkYab5f8dKyIihc0isnHTqQ
	 Z51bVwaCHIlRTr9STsyjFG/aA8ouU1tOQu8QAr/Fp8woHZrqmdXXmF9A+eRgEgWD1Izx1
	 3H7FIK0KdrxKWgtOxqmXKFeYV5z4qqGGRYc0aM5SwiuhA4fZFsNpjCYGHrVPTKlQOPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789316741;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=4kNh4bTc60Zyt/DYkBBGYfigaG4QP3WrAstrO/SixuI=;
	b=YC8a80uNjojR/8xmZx0j/Bdo5wl3NDGm7sSCTEQOZF3Zco/9snuCX1Fb+1HKB+vNCWrQ
	 xB9oMB8s1nF0OJo7oMw28AdVThwiGbq/TZDYLdw8mfJejF4ZYfmdOCOQ5mjDlqV+oP00Y
	 n6mdTmCIvNZYO1gNEwWXCZiaQIqOMuYn+D+GYvj6JnMeM6V5sJxOi1Ry0bSODC4Wz9SYq
	 RcFDrEoXpj3tUv8EIpRByxjnqm7ORotFvAOQ4VH6oAbXDXhVyKdUcyqN5m/auCXlkhE8/
	 2zLuEKn64VF2yJRrnfmVqNiZt9s7hLXdS00due4Zw0eU8wH+sh6ZJFbRUrb0LGeIYtA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789316741;
	bh=4kNh4bTc60Zyt/DYkBBGYfigaG4QP3WrAstrO/SixuI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=F0OafEMm6VNU7EJFrwLZ3VGe9Cop9r+uP+tmvBiioe25fBRrmUX9wPJW5eT/ZkOXt
	 8ND2mUDOJiWnDrE6GzqCAJCQlQHKrT2IPhRouOfRegwZz0MSNvl/wIaY85JlEpdDjb
	 vOsrdy9PNitR9SZi5X6hk1XLXDjv1eXmGBT++UcPmt1MTfapY3GJ4+tJaOPTZvqvvW
	 PhmwGlBLgHkVHdxnSC1LUrChKRt6ElUnDRVZyNPaCo3nw4T4kL/fiZVorDUfT+myIK
	 rxxZ6p56u371yEm2jR8Chz40g3TZcBWI3HzzJqFEFV5hpClthV3HOkr4k4RcBLYmjO
	 4pc7ln2iPnF1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1907C605FF;
	Sun, 13 Sep 2026 16:25:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A43B362
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4BEC80C71
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUdtMK8urI3x for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:25:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1729480C27
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789316739;
 b=pz5ZZ93RyJO38fL2cjnDWVnmAYa/vm9qtHduUQiJFPv0WkksIwqN+vgRaxkyzkzwUrcd
 uQ+XBdR9fAfXRRthsdVTOERPHXyS0AS3WcxJOaPy84f8Ga1Bm22RHidybTu7LFXB/vv8Q
 0LIkjaQi0aJMeEYmh3LAsYYCrSeDaWPE6r011R4uzlHfpMuJ14YARyI7DZXGXRlFC4mVh
 GXUF/Ae8tB81Se3VRYB52HTOvQSgq3M52H3r9CDkKsnVqqgi8M2MSJomu4QIEtYCSMB6G
 eRQUFIBcREU4kP51BK4PiK2fV5RroV4k2+PxulhSlKXfPXCNpqg9ZEmabAanFkPBclg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789316739;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=zn/uOP507kQVFbgErfKXekLVicTm47svbxCLi/iSO1Y=;
 b=EezNqVZ18wezD+hFDzWbN+s5CsuevFQ1puLeFj1DyfvV/aOY+z2e9Bdof+uOVTOjWCPI
 CVF/hzfVXQ4W3qxLgmbh5Vk+V0uO1Vp/QNrZKrT8Vmby5qyeFk1n1MrHurTrSxPIXwohX
 2tNO2V6HaanlKtkmIfZbsS1MfL1h1ex6oc3F6foFAJzOOYH62gqFg+brK1rcQMbAcCEJb
 QMq6lQYSDpKKadtLfIqtHNCHhHHJM0VrLDLtmWY3EJZe1MjB150WNpvq1Agylw+dohW7i
 aaG0q7K6Ko4AWqWbY8wpRQ7IymaAPBtyNP+l/VTCotZvJRUr4nxD07HNidTMSRZP9JQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=M9uuHmhn; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1729480C27
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:25:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 12822C63454
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:26:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5982E60435
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:25:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9E38611C78D5A; 
 Sun, 13 Sep 2026 18:25:35 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2026 18:25:34 +0200
Message-ID: <20260913162534.1674919-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/qt5cinex: add missing select
 BR2_PACKAGE_QT5BASE_GUI
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_QT5CINEX selects BR2_PACKAGE_QT5BASE_PNG,
BR2_PACKAGE_QT5BASE_WIDGETS and BR2_PACKAGE_QT5BASE_EGLFS, which are
all sub-options of BR2_PACKAGE_QT5BASE_GUI, but we don't explicitly
selects BR2_PACKAGE_QT5BASE_GUI.

It turns out that things work because the package selects
BR2_PACKAGE_QT5GRAPHICALEFFECTS, which selects
BR2_PACKAGE_QT5DECLARATIVE_QUICK, which selects
BR2_PACKAGE_QT5BASE_GUI, but that is rather non-obvious, and it makes
more sense for BR2_PACKAGE_QT5CINEX to directly select
BR2_PACKAGE_QT5BASE_GUI if it also selects sub-options of it.

No functional change.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5cinex/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5cinex/Config.in b/package/qt5cinex/Config.in
index 8dbf484267..d831af5a79 100644
--- a/package/qt5cinex/Config.in
+++ b/package/qt5cinex/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_QT5CINEX
 	# dependency.
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5BASE_EGLFS
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
