Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947BEEFCE3D
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 19:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51C97812AC;
	Wed,  4 Mar 2026 19:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43yenpwiAizD; Wed,  4 Mar 2026 19:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18723812A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772652897;
	bh=JuINE4GMBdou9H47wF2itNmqwHWq4tb9J1iU2FIzJXY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XuGO+t+RpEozh1H+N4sPJtdAozFb63+xcu7zKoKptdkG88u/Y8tgzp39yczyA2NcU
	 6j5hHugGaEJJ9NBisK+wAcOSGUB5eRG17W/WtwtFL6vRYmXX+JUOVbml9+xDpNQIzw
	 8PsqBukH/8vNBgb10abuaOTof8FPKzVD/wEExCOOjrgOcgi8JTjUywB5tjlNLgB3KN
	 e7BHmjQuobxUWow5j7UnNLDGRzANGHq7Qag6xFGp1qn4GEbQCHbd/3JJmug9f9VNSL
	 chJPizNX41fOY/DeXh64F5RkWcyWJkmTqalPWB0us/m4zNn3ABeUzlst2qtXVDr4cS
	 6sSRQN1M3s8Lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18723812A0;
	Wed,  4 Mar 2026 19:34:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA54A1EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC4A960820
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgFa4i619Zaq for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 19:34:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B801360826
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B801360826
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B801360826
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:34:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b996.dip0.t-ipconnect.de [84.161.185.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 815E3A4C3351
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 20:34:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxrzg-000000001uz-1lto
 for buildroot@buildroot.org; Wed, 04 Mar 2026 19:34:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 20:34:52 +0100
Message-ID: <20260304193452.3499452-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772652892;
 bh=OWA1U+vfbuBwJK7Pl0FWMuRQb43OKdnUUbaG6g9umgw=;
 h=From:To:Subject:Date:From;
 b=ZAbKc2nMf8h2BZAFJbJmWz3ZbIlwSTLEN0xwT/CoC4FT1Xk75XjrpY1qn9nr9j+wj
 73LWMmCAMXyblKS+zkTqPKAn3DwqZ/Lpr3QLkLaBoCIdjkH1GA8xcZYx3jrEAWnF+I
 G+rT63WQZYrUVBCoaGp8D/8loHDeDLhOnu6/c31FGhZ4J97JyMHHbkhgWZxB977H/0
 nSPUbnUy65Ne4Qlk730R4M3O4bKRPWDVK//CAT3ZYMzxVSa9qBgtnIXeaEjGeGmqwP
 siUhSuN0xIo3+Y2dI42hHDwyHoyGOodcZwxfEzPWfe+Mj6cnhjfeXma5xu5sb7qfwV
 NEfNpnU5u8czQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZAbKc2nM
Subject: [Buildroot] [PATCH 1/1] package/libplacebo: bump version to 7.360.0
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

https://code.videolan.org/videolan/libplacebo/-/tags/v7.360.0

Removed patch 0003 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...vulkan-utils_gen-fix-for-python-3.14.patch | 31 -------------------
 package/libplacebo/libplacebo.hash            |  2 +-
 package/libplacebo/libplacebo.mk              |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch

diff --git a/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch b/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch
deleted file mode 100644
index 86f7c00856..0000000000
--- a/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a22f0dff5fe89385155743a1735b146babfdb131 Mon Sep 17 00:00:00 2001
-From: Nicolas Chauvet <kwizart@gmail.com>
-Date: Tue, 29 Jul 2025 11:42:35 +0200
-Subject: [PATCH] vulkan/utils_gen: fix for python 3.14
-
-Python 3.14+ has added more type checking. This patch fixes usage
-
-Fixes: https://github.com/haasn/libplacebo/issues/335
-
-Upstream: https://code.videolan.org/videolan/libplacebo/-/commit/12509c0f1ee8c22ae163017f0a5e7b8a9d983a17
-
-Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/vulkan/utils_gen.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/vulkan/utils_gen.py b/src/vulkan/utils_gen.py
-index 9a97d35f..9b803d82 100644
---- a/src/vulkan/utils_gen.py
-+++ b/src/vulkan/utils_gen.py
-@@ -202,7 +202,8 @@ def find_registry_xml(datadir):
-     if not xmlfile or xmlfile == '':
-         xmlfile = find_registry_xml(datadir)
- 
--    registry = VkXML(ET.parse(xmlfile))
-+    tree = ET.parse(xmlfile)
-+    registry = VkXML(tree.getroot())
-     with open(outfile, 'w') as f:
-         f.write(TEMPLATE.render(
-             vkresults = get_vkenum(registry, 'VkResult'),
diff --git a/package/libplacebo/libplacebo.hash b/package/libplacebo/libplacebo.hash
index 302afcca16..a8d34c3fd2 100644
--- a/package/libplacebo/libplacebo.hash
+++ b/package/libplacebo/libplacebo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  46b501842e5b18867c6b7dd5c901e65ad6396608ad76309c366d8ace8be0d0d7  libplacebo-v7.351.0-git4.tar.gz
+sha256  0d4adc5cbe7b3691c2c77fed1b9e94a00fcd2c2637a301aa2b522c093139e5c0  libplacebo-v7.360.0-git4.tar.gz
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  LICENSE
diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
index ee5a4cc2c2..cb53248624 100644
--- a/package/libplacebo/libplacebo.mk
+++ b/package/libplacebo/libplacebo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLACEBO_VERSION = v7.351.0
+LIBPLACEBO_VERSION = v7.360.0
 LIBPLACEBO_SITE = https://code.videolan.org/videolan/libplacebo.git
 LIBPLACEBO_SITE_METHOD = git
 LIBPLACEBO_GIT_SUBMODULES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
