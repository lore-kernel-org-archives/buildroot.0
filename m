Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11A4C9832F
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 14:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91F9C61CCA;
	Sun, 18 Jan 2026 14:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ez61Uf5fY2gn; Sun, 18 Jan 2026 14:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD9D61CC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768744872;
	bh=m/qsz/Uoc/X/X4wEVYajOkF5spySRxmyt5QAOOGsV1M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hhgL32sUDpIXhJePxJAzcQ7tXxTcMXWkHKUnhqPU5WA1y8jEBk+1ArrLiTkZun0mA
	 Q1o4FMROWvSr21uKG3noIj/XHFjhbVIM65CkGbEmZXm/Mj49H/c/9TdGiPk52gU1Ug
	 fVkG/+nqxNEc2gM8GpHO2Eiti40kDorEpTYGQjvwrXZAC/B+hSxMqn6grh5jxuWD9R
	 z5CoPFvgPE/XqS2ctz7BIdKvaL/x9ztC9NkxqcQOxe3PbuPcrPlBH0S5Lar3FvD6i3
	 NPkPu77h1KmnQWulKjvCBidQnNku8MEs9RmwNfpHC906D87oh50bOsxTihncLqzQBM
	 Zltl2ojyZ8ghQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD9D61CC6;
	Sun, 18 Jan 2026 14:01:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B03F2CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 14:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23399403AF
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 14:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DoGzDDbb2L4m for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 14:01:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35D9D402E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35D9D402E7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35D9D402E7
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 14:01:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09ef.dip0.t-ipconnect.de [91.58.9.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42A62A4C42CE;
 Sun, 18 Jan 2026 15:01:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58042)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhTL1-000000002dJ-1nUn;
 Sun, 18 Jan 2026 14:01:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 Jan 2026 15:01:07 +0100
Message-ID: <20260118140107.2331715-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768744868;
 bh=qjjFAYvedgI5xX/0UBTA35+QG8kW3wtQRXL88q720do=;
 h=From:To:Cc:Subject:Date:From;
 b=PtEGaVusa3pDgHqlF3516ZQjHJ8z8NMlIa8SpR/NOuT3gsWT6lHiIPPvrDhH4A+wB
 ZR/tP7OI3dPP2JMqq12TPhqTh1/fMi4fvm3Mpsnrz6PqZEOvfzoZGGMgb/2QSe4/uT
 NNxdMpvbV3gfJk6RliZ6o5NNM48suxqt5OcneJ1teJPQfx1l5s172xiO+8jQIHuo6J
 sPQwGSWoj5EE37vdF2jefiWLyuilecIoH3ynesUwOyAkdGCAj8aslpFUKg8X3xtG+M
 mNVN+YmKgWy3PAgwoR8ijq3L3XD4EwWR0bCI00nx4CSSnOGRVZeD2edgHiPzmNdjuR
 BOix5my/dn6YQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=PtEGaVus
Subject: [Buildroot] [PATCH 1/1] package/lua-sdl2: fix cmake 4 compatibility
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

Fixes:
https://autobuild.buildroot.net/results/f75/f75d1d0b83c90c0cb5dc7781ea8ce7ff1d67512a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-better-FindSDL2-based-on-components.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/lua-sdl2/0003-cmake-use-a-better-FindSDL2-based-on-components.patch

diff --git a/package/lua-sdl2/0003-cmake-use-a-better-FindSDL2-based-on-components.patch b/package/lua-sdl2/0003-cmake-use-a-better-FindSDL2-based-on-components.patch
new file mode 100644
index 0000000000..ce3a96e5a3
--- /dev/null
+++ b/package/lua-sdl2/0003-cmake-use-a-better-FindSDL2-based-on-components.patch
@@ -0,0 +1,29 @@
+From 8bb1cbb2b346502d6285a40e25e52d3e41551afb Mon Sep 17 00:00:00 2001
+From: David Demelier <markand@malikania.fr>
+Date: Sun, 24 Jan 2021 14:28:15 +0100
+Subject: [PATCH] cmake: use a better FindSDL2 based on components
+
+Upstream: https://github.com/Tangent128/luasdl2/commit/feb49bb1eea77aa953313f2a641576e515f0ec3b
+
+[Bernd: Partially backported to fix build error with cmake 4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f5b59de..cc28bdf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ #
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.10)
+ project(Lua-SDL2 C)
+ 
+ # Project information
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
