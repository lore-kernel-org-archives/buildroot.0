Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4482DD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E950406AA;
	Sun,  7 Dec 2025 14:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0AFaBrPYfnm; Sun,  7 Dec 2025 14:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E2740668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117642;
	bh=2aFm/xqYy8PfJ12dHL8Exb/db4a9T9Vr7b/oj7wxHL8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=US1ZQYBYJrqwIEBeIAxOo1VgFH0rm1ZrXHnTG7h0IgAfomxMdr2ixN0oFOjm8JBq3
	 uASWVoYmfNR0xT0kr9QjSlCmmO/St5Sbqedlt18gkj2GyH8vsnBWz5+TmslUSMR1Ci
	 dyWYZMtVHCijcny/yT9uby5NeCBA7iXLebA0w0KofnzzTHjrHJEsPgaBQjGrWZHdSX
	 6Lcv2poZbObo6RRZfDYIql2k6B8KFVm7OXm2jATGjXnJ6tbApfIxuaRQeXgii2GfIb
	 otBCB/r7FowtkHIp3Czl+1v3+KtF3r5dnvm+AZCavMooNE7r18kzCFES4MuVzxjyko
	 K2LHN6FcMB3Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E2740668;
	Sun,  7 Dec 2025 14:27:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8DA62CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB69E40668
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcYp-52ufwcS for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0BD840660
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0BD840660
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0BD840660
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7E2DA4C0952;
 Sun,  7 Dec 2025 15:26:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFit-000000001Fk-0VtX;
 Sun, 07 Dec 2025 14:26:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:40 +0100
Message-ID: <20251207142651.3695074-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117611;
 bh=IQrDEidcadQHqqeY7O7CCqE1ejigTe14ZNd7V5w2zwQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=l7JO3AhGCSkUyiylqY8L7omWe+i6r9ak99CjvnrE8EjMigfAtaVjhXNrPc4TfnpL2
 ohc48NGiEdjlQ6BQO1+DBs2crgq8/h61GFh5APWrKc+OqaqzvalLuBjgxhYRPLuO38
 P4IpP6ateY/awN37X4Sm2kT410ToNiDEkcE8Qaev2i9qQPL0/4e1LKVApAu0vL1/uB
 SFVTQ6b8YqdPopds5AOSWYUs/tWh9U32UQ4KyqSGBx3ylTwNIMHD1TTnxaHx502bgW
 pIFXKIFi6bdTEuVctI18bMXJ/Q+xSfvSQz3cq8Z2gRnuWaT9ISQcGecVzBTuDe81CT
 ya6qUDTSP65sQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=l7JO3AhG
Subject: [Buildroot] [PATCH/next 03/14] package/signal-estimator: fix cmake
 4 compatibility
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...01-Bump-minimal-cmake-version-to-3.5.patch | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/signal-estimator/0001-Bump-minimal-cmake-version-to-3.5.patch

diff --git a/package/signal-estimator/0001-Bump-minimal-cmake-version-to-3.5.patch b/package/signal-estimator/0001-Bump-minimal-cmake-version-to-3.5.patch
new file mode 100644
index 0000000000..b2316edd9b
--- /dev/null
+++ b/package/signal-estimator/0001-Bump-minimal-cmake-version-to-3.5.patch
@@ -0,0 +1,22 @@
+From 1c6a2dbda2e76782c3ae92eb25731352dcbd0f7c Mon Sep 17 00:00:00 2001
+From: Victor Gaydov <victor@enise.org>
+Date: Sat, 16 Sep 2023 14:58:20 +0400
+Subject: [PATCH] Bump minimal cmake version to 3.5
+
+Upstream: https://github.com/gavv/signal-estimator/commit/1c6a2dbda2e76782c3ae92eb25731352dcbd0f7c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2c5fadfb..78967cd2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0.0)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(SignalEstimator)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
