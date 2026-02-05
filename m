Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E77EECD998
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 19:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47289610E2;
	Thu,  5 Feb 2026 19:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKvg5OXM_kmr; Thu,  5 Feb 2026 19:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D41B610A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770318905;
	bh=3o/PZIHQ6witTQF+De6ZQefc27QcTPiCN1OJX9xDUgw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=My5Yn0Chwg49YhjJw2gQHIGhX7wjUz0wcIzhPPTMssyhdNNEJusL+pl28PPd3RwgX
	 LIwt8nhyd2pUbu+9g82KJu4ug2fvqyfSTlbBWAV6WIVxteH68PUTdpkOgyHmXUvDOH
	 N5+IAGEauxSHq9HMFAwD3L1K5IKBptr4cetHMW7kTFDjCfBS3eV9amj1KjwfhtMpHt
	 2tIGFAbTYJz4Di4FqWcoL0xQsiVp6D40jL1QW/7kUFZ0JFB68YupyINYTKh5SuMXAO
	 ujsVBjBtIgJJV/LWuYsuMcrVbBjAVuTxk0ycMTrWBTs2cyW0hSVFHd4GkvKNpA06tl
	 rgCDxwpgthMFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D41B610A9;
	Thu,  5 Feb 2026 19:15:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB479173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D24F6610A9
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCByHDF-a3EV for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 19:15:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CABDC60F92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CABDC60F92
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CABDC60F92
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:15:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 336D1A4C5882
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:15:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55262)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vo4od-0000000089e-46Ft
 for buildroot@buildroot.org; Thu, 05 Feb 2026 19:14:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Feb 2026 20:14:59 +0100
Message-ID: <20260205191459.1727293-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770318900;
 bh=g5unme6kEM4Cra5e/kaZy/KE6jVHUYOOcdwjoJ3+2xw=;
 h=From:To:Subject:Date:From;
 b=Wo1fjbt/mDYxY0mkPp9LlEl/rtkv8DfczVcPTp+blwuOpV+izP4B1ZvIYDQrn+uKh
 h6chyp9rCG/72iQBYQhV4e/Pi8/ElE05NuIKsBT51KqiGwiSDQroxu+GKAqMhpnjUF
 j8+SNZAOOrWM+Ad6YTY8OVHab+ChC895sIE1I4RWz9yL7Eo42Y1H5CPv3oKLyRr8Y7
 THBhAE85FTw+S/G1NW85a6+weSvgO5WprjXdwmbI5We95XthzyTbsEhSML+MOXNXFU
 DSWhOzmdCCl95cUVP7TBsPnqn1M/QhEyTD4c00+5i+HMPt3BwdLEch/LQbyY6FgeWx
 qZkZKCvgPLYOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Wo1fjbt/
Subject: [Buildroot] [PATCH 1/1] package/cppdb: remove remaining patch
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

Buildroot commit 5eb9f8aee52c8dc9355f0ab096df9e56e9459f46 added patch
0002 to fix the cmake 4 build.

V1-5 of the patch which removed the package were sent earlier to the
mailinglist than the cmake 4-fix. Since v6 it should have removed patch
0002 as well but this was missed so buildroot commit
b7143b2e22dc6d5f6bc0f7fe745118db7dbcb787 of v9 of the package removal
patch left patch 0002 behind.

Remove patch 0002 now to really remove the cppdb package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...s.txt-fix-compatibility-with-CMake-4.patch | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch

diff --git a/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch b/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
deleted file mode 100644
index 3bba81f563..0000000000
--- a/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 27003c60a05dd3921538323a53b1650e289cba8c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 17 Dec 2025 22:27:33 +0100
-Subject: [PATCH] CMakeLists.txt: fix compatibility with CMake 4
-
-Upstream: N/A, dead upstream
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5e81b09..32ff3a6 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 2.6)
-+cmake_minimum_required(VERSION 3.5)
- project(cppdb)
- 
- set(CPPDB_MAJOR 0)
--- 
-2.52.0
-
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
