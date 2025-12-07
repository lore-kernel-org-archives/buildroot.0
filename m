Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABF6D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0307F81178;
	Sun,  7 Dec 2025 14:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EpU6BwgLqH6p; Sun,  7 Dec 2025 14:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 296A0822CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117682;
	bh=CNL8Q7YpynMMBQ+VzS+Lb76PEODQbf3qcVoweeWoAoE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GQpiMg6tZ3Ot/ujswGrgJJ2dKDchJcU2I9ES3Vq3ca8bM4GpRocTJ0wYHdAWgSqa6
	 rfZc9dxz8BahSReEt9Nc/2Vhuel//3kTxvijilxUH85cu0MfEEqc/FAktbG1gZk/z0
	 bw+n/1JfnB7N2JD7fAO9TBT8Op9oBMZM2SDWNjfxerljF2hP68SfOb8XpiosHWWNLB
	 wq0RHLFOdX+DfsdewiOG6mlkwKoucpxUAXpAkjxIM/8fPZZbDDeX7aYWnTtjIaQIGs
	 CiZbmI7z06XgYcpQd8gHpUmFvY1O6eSG779SDT1R9mMrqo6YOvDjgj8/ezlRB9wUl8
	 5y4JsI0gh0byA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 296A0822CC;
	Sun,  7 Dec 2025 14:28:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDBCEE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A47D340259
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQznHzEEOsV2 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97C0140166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97C0140166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97C0140166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6CF45A4C097A;
 Sun,  7 Dec 2025 15:26:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFit-000000001Fk-1vOJ;
 Sun, 07 Dec 2025 14:26:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:43 +0100
Message-ID: <20251207142651.3695074-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117619;
 bh=hfZ4xLJhD9reLacQ0p3WvqVq0vLr79aP3qx3b3PRuUQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FKYrLrMl5TVBpblLXrBQcOJCxE1LchIh1NS8vg0ARRGpAx4JUNKrGFqqUyadT8Q2K
 W/sBVQHqy93tMrW1AlgYcP60bLewZo2iFTjx3ahbz/lsF7AbCIvjM8cLwtQ/NFAGAE
 OWmFpiKdL1UwDWdK0LJeF1R5PhRVz139Lxw6rCgNNFf8wQFsFFYLxWQwBs6LV1f5Vm
 6YguYUY7bUgFoOXhz9fcZ6y1x6NnjlM7EqX0cN5romeNwDM3jsJ45SPIM8Ttaviyrt
 YGHM9A+mnxps4tgljOPvbbX4XCev9tctRI8pAeMUKUUq3L47BMymcB3R/Q7ZFUVnlX
 NEGlYv4xM7dfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FKYrLrMl
Subject: [Buildroot] [PATCH/next 06/14] package/libuhttpd: fix cmake 4
 compatibility
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
 ...1-fix-cmake-required-minimum-version.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libuhttpd/0001-fix-cmake-required-minimum-version.patch

diff --git a/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch b/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch
new file mode 100644
index 0000000000..097a44cf85
--- /dev/null
+++ b/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch
@@ -0,0 +1,34 @@
+From b9bf3936b3778912444eff7f7866db1d66f4c50b Mon Sep 17 00:00:00 2001
+From: Thomas Perale <perale.thomas@gmail.com>
+Date: Sun, 6 Jul 2025 20:14:31 +0200
+Subject: [PATCH] fix: cmake required minimum version
+
+When trying to compile the project with CMake 4 the following error
+shows up:
+
+CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+This commit bump the minimum required cmake version to meet the needs of
+CMake v4.
+
+For more information see:
+  - https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
+
+Upstream: https://github.com/zhaojh329/libuhttpd/commit/b9bf3936b3778912444eff7f7866db1d66f4c50b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6719e5f..0392f25 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(libuhttpd C)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
