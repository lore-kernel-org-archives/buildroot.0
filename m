Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1E8D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DECC406BD;
	Sun,  7 Dec 2025 17:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_InipROdW3A; Sun,  7 Dec 2025 17:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 537B74059E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765128157;
	bh=ReDDWhf/jYH6EI/4eqX95vWp0z7g/n73EjH5vb67pA8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f4+2Vc70TYTHoEUxSR4PL7yCq2j1tY0Dni7ibXbZ9wuTSA8U0acfZ3t61oC2lku2g
	 PeDJjL01PRjwHnSGs5Rid/fb34TT/JG8zLqY1TXubs5MDUPpRD6Rhz/8AK5FSqlNVO
	 IPeGPuokXrQI2ISqoQSbk2w0Xace4X0leFt1BcMNwMwLXwbF0wuSbHODl/dNy8v9hI
	 ApwiZ7YhgRQu7PAqZkGzLMB93O6miCh41ervwlX69nh6Mv5TbLS4DgTkvP9Koh6ab0
	 USyrJzFVg261Dv9PKgYrs0IgvTdN+akDyuU0WNeNwAWa9H80PC3/ceED8dNKgRFZXL
	 kJoDWYEr+cyCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 537B74059E;
	Sun,  7 Dec 2025 17:22:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A9B2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53626404A0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etGPEt1gxQiq for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:22:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2472F40423
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2472F40423
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2472F40423
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:22:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8689A4C028B
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:22:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50850)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSISs-000000006sZ-07vY
 for buildroot@buildroot.org; Sun, 07 Dec 2025 17:22:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 18:22:30 +0100
Message-ID: <20251207172230.3760260-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765128150;
 bh=O1potxoCZC3WNmI4lauhRSs0gvkkJBU3ib3CID7y4V0=;
 h=From:To:Subject:Date:From;
 b=phbGIQAh2L8HjuZoi3aQ6CrJ7kHIXdvBhL/+1LrFjswPmxPxBHeBYQm/rJ3aaZc2z
 60wlDkseRrjg+xNr+If8fOSJLy6Yaa3EHeTXW/Zc8lz0+pFzY5HsXtFn+szJPgX98X
 538QnYaOf4VxnIFEIiUcj6Tv7Rg8IVcu3IH9rsgZna1NM4bJP3UxXEySMJ+mFuea0K
 cS5zBIbExrrFrpBotR6up7swedUL/ZqNPkIb1Eu8Vyn9F1APVcpdeGfwI+4K2WZw3u
 wvkL7xMwxjBDbF3rKLvSliyTIsyWNMDLVu+3F6eUDtbfXm3aKzXDZDhkmCD+WK4v1f
 5TedwJSZk+1Rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=phbGIQAh
Subject: [Buildroot] [PATCH/next v2 1/1] package/read-edid: fix cmake 4
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
v2: fixed check-package (Julien)

 package/read-edid/0004-cmake4.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/read-edid/0004-cmake4.patch

diff --git a/package/read-edid/0004-cmake4.patch b/package/read-edid/0004-cmake4.patch
new file mode 100644
index 0000000000..4530a9d3b9
--- /dev/null
+++ b/package/read-edid/0004-cmake4.patch
@@ -0,0 +1,17 @@
+Fix build with newer CMake versions
+
+Downloaded from
+https://gitlab.com/liguros/liguros-repo/-/blob/develop/x11-misc/read-edid/files/read-edid-3.0.2-cmake4.patch
+
+Upstream: sent to pyrophobicman@gmail.com
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/CMakeLists.txt	2014-02-05 17:27:26.000000000 +0100
++++ b/CMakeLists.txt	2025-08-27 23:01:08.868613931 +0200
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.10)
+ project (read-edid C)
+ 
+ option(I2CBUILD "Build I2C get-edid implementation" ON)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
