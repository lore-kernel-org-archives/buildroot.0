Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4970EDEBEB
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8234980FDE;
	Tue,  3 Mar 2026 20:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkxRC6GmBON7; Tue,  3 Mar 2026 20:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 321EA80FA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568114;
	bh=Z2WeLXmhZQUnj376cvKCWzfWdeOylegGLCE4Y1HyO88=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GbP8vX3r0svEPZt+95lEXYMwEyHjhiUjfnwThHMWBNrphwzz2ZIPQc+5S+uhruhjD
	 doWVDklcjGaXInuyi8uizGqvM9Wby7Fjbka/LZZsjz2SIFeILb/iXhMkCEJmWtFTEt
	 z2xSE4EDL1SCy9nrY/Dio9CzbEIRc2ENkFgrzY//0zg8/tYg00A77jruY2znLY4EN8
	 HvK62ARXJfoDrDLe5grmKuPOQYwi4ZFXFB9ZJfeaR3tfM5zn2r6lrbYCd0IQQJJQBl
	 BRyRiuOd+Ql6Yp3FuIgEO3qGrPqEKN88lxe/WZqUW7s53zA+HIHeoJkQBWV1zMBZ66
	 xgeFOI+Z4LZ3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 321EA80FA3;
	Tue,  3 Mar 2026 20:01:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 843BF1EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76115400DC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIr3yQAjO8wY for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:01:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B2194002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B2194002D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B2194002D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 01AFCA4C3390;
 Tue,  3 Mar 2026 21:01:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvL-000000003gI-39wO;
 Tue, 03 Mar 2026 20:00:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:44 +0100
Message-ID: <20260303200054.784253-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568062;
 bh=VvYVa+tZmHqB0AztWVkD/l0HGofWyaFPjhOjIYzZMaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aoYnq7lXbD5mw19MDqW0ZGfkRY7aGc8cs2mgi6jQhIVN/oEhygDY9mbvOAd6Aj/D1
 gyf+wLgPpU/e0pUYmzq/jdFDYCaKR4FvM2R0lNV+xa6wIGGe5f0IzJOIEmZH/K0wr1
 QFpB1SD1nEZQyB9RtFwn4Jhb0YU0ZCo6xvh3lhymjdhzkQVZtuvxKAxzK9JfR3avRc
 dWXOnEp1LeKBkzlYXd5JvS07GSuf4vnzmFrZVPCQbZYhu9G2+3UvvHcD0/FbUFkM2G
 eryM4LipVNN4okJWLKijtTUjU0Ioh3OlsEFkZz4bUINu0LqHv9oTjRwLHuxbjHo1ab
 Tkvb2FhAx/D4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=aoYnq7lX
Subject: [Buildroot] [PATCH/next 05/14] package/wlroots: fix build with
 glibc 2.43
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wlroots/0002-xcursor.patch | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/wlroots/0002-xcursor.patch

diff --git a/package/wlroots/0002-xcursor.patch b/package/wlroots/0002-xcursor.patch
new file mode 100644
index 0000000000..d57980fa39
--- /dev/null
+++ b/package/wlroots/0002-xcursor.patch
@@ -0,0 +1,33 @@
+From 47486545b196987f6f07fffe2929bba8f515b8e9 Mon Sep 17 00:00:00 2001
+From: Dale Turner <rxguyrx@gmail.com>
+Date: Wed, 3 Dec 2025 20:02:29 -0400
+Subject: [PATCH] =?UTF-8?q?Add=20"const"=20to=20eliminate=20"error:=20init?=
+ =?UTF-8?q?ialization=20discards=20=E2=80=98const=E2=80=99=20qualifier=20f?=
+ =?UTF-8?q?rom=20pointer=20target=20type"?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream: https://gitlab.freedesktop.org/wlroots/wlroots/-/commit/47486545b196987f6f07fffe2929bba8f515b8e9
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xcursor/xcursor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xcursor/xcursor.c b/xcursor/xcursor.c
+index b5edb9de8..6627fb6cd 100644
+--- a/xcursor/xcursor.c
++++ b/xcursor/xcursor.c
+@@ -602,7 +602,7 @@ xcursor_build_fullname(const char *dir, const char *subdir, const char *file)
+ static const char *
+ xcursor_next_path(const char *path)
+ {
+-	char *colon = strchr(path, ':');
++	const char *colon = strchr(path, ':');
+ 
+ 	if (!colon)
+ 		return NULL;
+-- 
+GitLab
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
