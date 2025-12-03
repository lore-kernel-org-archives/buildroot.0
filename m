Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161FAD1BDD8
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 20:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6597040A8A;
	Wed,  3 Dec 2025 20:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WFJysU4UA51; Wed,  3 Dec 2025 20:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F23E40955
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764793594;
	bh=VF/+rU+8VTx1CT8U9OylsDuC/ZbA6QXztG85vKXkOD8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kHOdJC0+KTzxZwNnlCRGsBM4qojjyV5b6QwaA8CbVe41M5brH7FIcrzlsd7jkUqxQ
	 XS7yD6Xr+k2Pr8ZsbwxQjHc3vWlYTWAvt1Z+jn6Br2QmsDfcEFyKmzpnc4/zyOQLKf
	 1FFb/Ha9Sm10Ny/nxlZCVCHfmaMrkPzXuKerpgTg7qoSxHBqVdq32DKCD+ciZiakdK
	 ATbSCHL3WCVafiquby+2eBIWnicLa6qLgXth+agNKS7wrJPKMR+T8nXX1eIF38yVJW
	 l45Be4/hcNZqXiwp7Eag4f3ldadyVCsCfu2fD8vA7k7v+k2zWdCj0pDkboWJxHXTKR
	 wD+sE5TaJ+14A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F23E40955;
	Wed,  3 Dec 2025 20:26:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD3A2D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 20:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA66340058
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 20:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Di5uCM4vD2OV for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 20:26:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6BB140028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6BB140028
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6BB140028
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 20:26:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84A99A4C7965;
 Wed,  3 Dec 2025 21:26:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36768)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQsxt-0000000056X-3bCX;
 Wed, 03 Dec 2025 19:56:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Wed,  3 Dec 2025 20:56:40 +0100
Message-ID: <20251203195640.2297610-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203195640.2297610-1-bernd@kuhls.net>
References: <20251203195640.2297610-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764793589;
 bh=G7SBLgMb0I6G7JVH2u/0sqT7+/ION1eZZsyhsSBVWtk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vd/q/jyWQPvWsLMkwPCDi+ln6HEMyGlLZO9yv5FNRFhwlDR7J5q++qe4pYnSCfA5G
 i+kHOZFeDVABqjEzIEYYy2OYWtzBTrPsznz7Cx1DPTeYxNrzwlHBvuRpI/YeJyN53m
 T6GFrVdiKc2BPNZR1Pch44pVlU84EuRaPKvg1V1Nw3XVY9lOpJ7XHCg9gTUPJ0K6O4
 c9Z4r0sOSJclgpN5aJOD0kFoHDET2R1Ey1luybCoIukhB0qnyaLr9ET9El06SC3Tkm
 cQb1ddYxZPGUbSFAPhY1bupHvgKfRFEH+g6YjpCCFcvtLR6/Z5z19DmGSmanWbx77U
 aNPgwo8p3xmhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vd/q/jyW
Subject: [Buildroot] [PATCH/next 4/4] package/libvncserver: fix cmake 4
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
New patch in the series to bump libvncserver.

 ...001-CMake-require-at-least-CMake-3.5.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch

diff --git a/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
new file mode 100644
index 0000000000..e7b30e3db6
--- /dev/null
+++ b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
@@ -0,0 +1,26 @@
+From e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@jolla.com>
+Date: Tue, 13 May 2025 08:37:07 +0300
+Subject: [PATCH] CMake: require at least CMake 3.5
+
+CMake 4 dropped support for version requirements < 3.5.
+
+Fixes building with CMake >= 4.
+
+Upstream: https://github.com/LibVNC/libvncserver/commit/e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 205f3928..9b8118c8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.4)
++cmake_minimum_required(VERSION 3.5)
+ 
+ set(PROJECT_LANGUAGES C)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
