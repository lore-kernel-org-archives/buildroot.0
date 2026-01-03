Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864C5FC617F
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 14:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4800408D0;
	Sat,  3 Jan 2026 14:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Fm-DVHrFPkO; Sat,  3 Jan 2026 14:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F1740639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767449584;
	bh=xpE9ylJ2UvnVdZWl1C3NAhCC7StuqLkTjlSQpZS0L0A=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HsJDH3S4iv/VhDEW6hH5v+9xKGXyPzvGV+6MCgQzdkk8x2n9VsJV54iwqpka5IHlv
	 Bd9tLJDGMGKN3+OhexIb0IPWlOnKoJXWFKZmXxVUIY+CGjp05Yo/21Feye2qZr19ds
	 MNK7iUTceasgwuer1IAUI365oKpuRt74YCDisj4XiTirAvaw8neH0gKvDGMrTqmPRU
	 l6nQqUWwjkn0HuBHThNKqPi0cTcOpcS52oQhBjI31TK2QnV/Sfy1Y0YG0wS66E44I1
	 fMt4KvB2WYGu0kZXNk7jPY1GOkZmVsblUjG9Y4xJHi+sB/hOE5EZTTzhuFK3HhuwiG
	 V7d+Uz3y3j6pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F1740639;
	Sat,  3 Jan 2026 14:13:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95942249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 14:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8679560873
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 14:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1a3KyDU0j4Wx for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 14:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 928B160860
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 928B160860
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 928B160860
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 14:13:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B26BEA4C1108;
 Sat,  3 Jan 2026 15:13:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47332)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vc2NI-000000000jE-1WaJ;
 Sat, 03 Jan 2026 14:13:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>
Date: Sat,  3 Jan 2026 15:13:00 +0100
Message-ID: <20260103141300.460719-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767449580;
 bh=0UxGeKmzZrmckvtakpHXpmq2YMNUJrW0MyAa2vkmBFA=;
 h=From:To:Cc:Subject:Date:From;
 b=GwR2V4d9hjEzjJgRX1v0JC/xKuYeoYdLdmaQT+tWLti/tduRT9sR/q5JoCS7H30Ey
 qibAr4CSHSNVYBgtvc6gSfJQWBfIEPzVv0bDXNB//9hTHQUVUqWNNuHZ3d8D70QPEj
 5U1Yhs5wNh7eXNkzPwduRqR76WM5G+RTCTQwbZoTZe4bUH2JToc9qQkL+mOK1C218D
 qL4/7guTnBvj7+mE1XsVGc1s4jrRcP4rB5NIvmZl5OGIqwhQOVx5V/6eQx4v/KgyRZ
 FVxFQU+5PNC+jV5jVfzNXiRypy90CMPMMR1U2vtJ7jkxP8+8+0amaYTiM3k2o8SDl1
 hn20wxeTdnOgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=GwR2V4d9
Subject: [Buildroot] [PATCH 1/1] package/cfm: fix build with cmake 4
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
https://autobuild.buildroot.net/results/d01/d01d8fe3a63128246ce242de450b016b4ef13baa/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...01-CMakeLists-fix-build-with-cmake-4.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch

diff --git a/package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch b/package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch
new file mode 100644
index 0000000000..1219a98056
--- /dev/null
+++ b/package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch
@@ -0,0 +1,33 @@
+From d2a823ef01396cd148074a99ccbbf1ca1115b24d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 3 Jan 2026 14:56:38 +0100
+Subject: [PATCH] CMakeLists: fix build with cmake 4
+
+Using CMake 4 the build is broken:
+
+CMake Error at CMakeLists.txt:6 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+Upstream: https://github.com/microchip-ung/cfm/pull/1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5de2e0a..378e98d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,7 +3,7 @@
+ 
+ project (cfm C)
+ 
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ ## libnl ################################################
+ find_path(LibNL_INCLUDE_DIR netlink/netlink.h
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
