Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C191D637A4
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2346961062;
	Tue, 16 Dec 2025 19:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zr6cJItbGl8g; Tue, 16 Dec 2025 19:43:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 539336104F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914218;
	bh=HLnj7n7yR5a7YaABmh8vTFb+Y2aeNI4ebEXtGAzri7Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pUd+yvpZ7/Ml1IHhOOnMX8FnKFtnBJLiE1ckFUDkwWGRp13sIIa1do6pztasrnFx7
	 +KtEai57UsJgdti+8TE5cOw8F3HqY38MAxtN1cDYXYVS48Esdhwylfw5xurw0eBKf1
	 ivRPM66x/xuyp+JskFmpwHdwRoF8uUZiw9RdUs34cbgi7sZZbmiZ6iU2UEuO/PGfj3
	 FAZ7pFJ2CD4iV8lln95sI0Vk80yjkZIiXQLZEUfKyt46vNua+5m5rwClV7DXnRtPtp
	 LOr5Khk6QQhGKchmP2whSuWq8510wS94KzN2IIVLbq34KsvhJMstZjtN2wdoRMQjYO
	 cOxcb65CFqlNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 539336104F;
	Tue, 16 Dec 2025 19:43:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D4DC364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A50C61040
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XF5EFzSCMCgA for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:43:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2677F60DA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2677F60DA1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2677F60DA1
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4AF17A4C45B2;
 Tue, 16 Dec 2025 20:41:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-3Ena;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:05 +0100
Message-ID: <20251216194119.3020421-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914090;
 bh=KXUXb2X40PEtQApgS7riygToUbfCpJkCOstCq8NAecw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NSqb8qZIV6bWhp6x8WpJv+ldC8dkC0ikarF7yOPudMx+Ooh0Bd7nhbIMYWyjsX/Ns
 LfsKfErdelI/DjcLmbJRdpaWOpkIJY3D5DUJVCFqGAf/rjl4Ls601dPTvM+tZfz58/
 rRPNNaYc4h6aMh3F0sI79b0DFfOmdaaExcWT58WO0PbxGr0alSMjJ3h0E8KpEA4+kO
 eZwCPLm8d4iGBtb76nwLndUS1egvawZhoFGFJ3gTWAk8JOyxF2yO5TDmWifKaYyF0W
 poxZnP20Q1QaNVHccKCD2knCso/g9XDwLFSwu1tAmqOhakwJriARodrLd3LSEEerPh
 /40GBwxS15TmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NSqb8qZI
Subject: [Buildroot] [PATCH 12/26] package/python-twisted: bump version to
 25.5.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/twisted/twisted/blob/twisted-25.5.0/NEWS.rst

Updated license hash due to copyright year bump:
https://github.com/twisted/twisted/commit/662f2a9b0563cd7a0f6acf0ed92891ae2cd7e1f3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 436f4c48a7..f3cf53bcaa 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  a21b5326a74079a92d7bc4748b419280  twisted-24.11.0.tar.gz
-sha256  695d0556d5ec579dcc464d2856b634880ed1319f45b10d19043f2b57eb0115b5  twisted-24.11.0.tar.gz
+md5  845d6782c2236ef764f3849948f4bfad  twisted-25.5.0.tar.gz
+sha256  1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316  twisted-25.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  78d059391dddba18a695c1998ac9dde68160a1df1635f34adcfb3ecba4564802  LICENSE
+sha256  16b7f6825ee8aaed193e7fcfaee67ab493087302c700483f8991f22b70c539e1  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index b7217da6e4..8db5d3750c 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 24.11.0
+PYTHON_TWISTED_VERSION = 25.5.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/77/1c/e07af0df31229250ab58a943077e4adbd5e227d9f2ac826920416b3e5fa2
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/13/0f/82716ed849bf7ea4984c21385597c949944f0f9b428b5710f79d0afc084d
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
