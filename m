Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2D2C531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 07:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CD3D81212;
	Sat, 25 Jul 2026 07:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuGAtKNgHb40; Sat, 25 Jul 2026 07:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A9D0811DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784964536;
	bh=g+3ts0J/aqjCewJYe3HIMGIZNcJqYl5a7oG5usJ28Gw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pnMj7GMVGgS0/2aN+34VJsSE+gglB4ADf9ySuX7nk1H4b75T2oUMOhZEZMh/xD9/j
	 306GbmZxxvhbyxOphZPffMoKludzC5dMNZ//G7JD9xQgm74isjUzrss1bIRWLdClDy
	 1638U2/7Xn/PZwd2TlaN27hqV9Kbz/q2Tj9EsN1IVXVO769pUlhgP6GFtEIzQ9ZTtY
	 rJR8tPWUdoLgtU7huqYgREYhmJ5AiBQCanmiKyUWwk2oIV1FhhNgNiKF3wAI4IypE3
	 I9a5PTCHGOBhdBNVuPP/YCPrNwrijEwOETLggQqXClcxMqHAUQY1445/DVxQL4pl/H
	 WTefI26auQ15w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A9D0811DE;
	Sat, 25 Jul 2026 07:28:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD0336E
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 07:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 994DF606AE
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 07:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuxHfGNS9VDJ for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 07:28:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EFA060626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EFA060626
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EFA060626
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 07:28:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb30.dip0.t-ipconnect.de [84.161.187.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A7E5BA4C3DC3
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:28:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38592)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wnWoU-000000008MU-02gH
 for buildroot@buildroot.org; Sat, 25 Jul 2026 07:28:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 25 Jul 2026 09:28:50 +0200
Message-ID: <20260725072850.27821-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784964530;
 bh=9EQdrdNznGxrzhX3k/iXGNp+hpupRBf1C+DyULurscA=;
 h=From:To:Subject:Date:From;
 b=PVpwvoJVHLo2njdqrIDFapHNtQLFEX+0flbD7lgXzOUyXM9LGg77hU/C/zaFFZzxc
 GINIqU3UcFq31WaNqvs2OBDmqoN/5vpHkiK3+ZUBciwbbMxCuzb6IEIpyJAc7NVrFr
 zYlqIen69s3TmTimNqCWMXupUKK8fja1b3VevR9XdTo+Ytf+MvjewuZkmQed0cECK3
 5hTWFT8EYNBqMJvUSpB8iD2qfbYYMFCIlTIO/yDiHo8+G9i3u+SHuUOO/TtL1GsPgC
 /ym/zOCEetCJ4ABNVsn3dlIwRMpJChRHBm0/k6j7kMgDkBuPMdG8AE9hK3ksM7L2Eo
 YfwZswoHH66tQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PVpwvoJV
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.53.4
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

https://sqlite.org/releaselog/3_53_4.html
https://sqlite.org/src/timeline?from=version-3.53.3&to=version-3.53.4&to2=branch-3.53&y=ci

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/2fd4bbca1e23db90284ced98c00c91db6c5646ea

 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 1b81bef6e8..3844da4792 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c917d7db16648ec95f714974ace5e5dcf46b7dc70e26600a0a102a3141125db0  sqlite-autoconf-3530300.tar.gz
+sha256  0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c  sqlite-autoconf-3530400.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b27abef9e9..5d0fdf4791 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.53.3
-SQLITE_TAR_VERSION = 3530300
+SQLITE_VERSION = 3.53.4
+SQLITE_TAR_VERSION = 3530400
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
