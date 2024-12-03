Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A08E69EBD
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 22:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20BC984745;
	Tue,  3 Dec 2024 22:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81KacyrBdGVt; Tue,  3 Dec 2024 22:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 228F08475F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 228F08475F;
	Tue,  3 Dec 2024 22:10:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 816052073
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 22:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 625AD8478B
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 22:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKfUleOnjphd for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 22:10:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63A2784745
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A2784745
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63A2784745
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 22:10:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c998.dip0.t-ipconnect.de [79.214.201.152])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D68CDA4C3D89;
 Tue,  3 Dec 2024 23:09:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35402)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tIb5a-0000000011i-0eVa;
 Tue, 03 Dec 2024 22:09:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <dalang@gmx.at>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue,  3 Dec 2024 23:09:47 +0100
Message-Id: <20241203220949.1073051-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241203220949.1073051-1-bernd@kuhls.net>
References: <20241203220949.1073051-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1733263790;
 bh=ecBGpHlfwUVpt/qVe0iz6jfMCY10QIDZ+W2dmLWpQMg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KNYFQw6os7FGRgMetIkg9XQ/9h9rHbUWdYtadNJNnEE5txNgUvXYs7mDh38qGT9r2
 UGpD9/qMh1tOx6ZiVN3WWSlwMkQUr4SiHTdUSnlhYvTBqzHSdARqR9SdbQCo2Aa6VC
 sIpB61whDCuddgLc5+HyB5MrTs62csennblyzP66giKK15WX9Ob5ZwmuY6axBf1Hku
 wV4LlXilTwH06sF2ovdQtiKtYK3bg11WfUbpCOllknzZ0Lq3gO3AtDg2NYET+iYXlI
 Oyy3NQh1IgdFH1zmLsemUtZ48WVT5FF171B1/Kmrd6CoVIJ5YCMbfSNXJ0vk13cWJq
 j7Yxewmg7Eryg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=KNYFQw6o
Subject: [Buildroot] [PATCH 5/7] package/wayland-protocols: bump version to
 1.38
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

Needed for mesa3d bump to 24.3.0:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/cdef622a0a2ba95302a5b21bdeed99a95dbc8347

Release notes:
https://lists.freedesktop.org/archives/wayland-devel/2024-August/043774.html
https://lists.freedesktop.org/archives/wayland-devel/2024-October/043851.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wayland-protocols/wayland-protocols.hash | 7 ++++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 93d40a919c..c04876eaa1 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-April/043581.html
-sha256  71fd4de05e79f9a1ca559fac30c1f8365fa10346422f9fe795f74d77b9ef7e92  wayland-protocols-1.36.tar.xz
-sha512  5448b9aedc953ce6be0f378da900c195c8743cb6001f615823b5fc9cab3e3ee54271132055743278e10decef7f8e9dcdeef31593a2a12062575fb90eb0084be0  wayland-protocols-1.36.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-October/043851.html
+sha256  ff17292c05159d2b20ce6cacfe42d7e31a28198fa1429a769b03af7c38581dbe  wayland-protocols-1.38.tar.xz
+sha512  43fc36d35bedb245deed0e2de246f42d2bbfa6ecafa094f2a7fb103d6df8ae28f3cc200bc5aa24745b9131a28381883c24779da0a6d9ac954753bd5ebb1405db  wayland-protocols-1.38.tar.xz
+# Locally computed
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index c0dfe69401..e989c75d16 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.36
+WAYLAND_PROTOCOLS_VERSION = 1.38
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
