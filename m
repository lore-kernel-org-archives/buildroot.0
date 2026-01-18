Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C51C9832F
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 13:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 236D1846A5;
	Sun, 18 Jan 2026 13:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5CL5iIi5aJhv; Sun, 18 Jan 2026 13:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FD3F84699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768743120;
	bh=dhv89Yf1OjK90o/sfws9Uq+cGn7p63Su0DvdvVb3ia8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GcC/YLqIQlGm65OB9T0o3SmXEqZ6NGnSdEujg/RJwiUhbFWyr09CIQOxhqtRjfS34
	 Scm6o4g60DLX4TfDbnP+DjHxXG7R3vUwVgbPzcqoe6v1hFskbBaXP3XcSwg23hOyum
	 pGNz5hTRTV9pZQjGErx1h+LldDYhGOXwZUh5iMgZJGDxFxZ7SfkFPZ81bbjrRYwzvV
	 bHPNZMCovDMcWhv0R1VhAVgwjV04H3By+wbe3dKiekcmN/dVNoQrpgPmqutiJO96XH
	 ZpK6LJI7yfxxEgVmjzL68gnTrO4q1btDjiFuqdb0oXYU2Sgvh84kbLUf/+E/g93ULx
	 UzLkDZSnVaneA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FD3F84699;
	Sun, 18 Jan 2026 13:32:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 235AC2A8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 13:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 021D740235
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 13:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uS7XUHEip6gH for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 13:31:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE4B540258
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE4B540258
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE4B540258
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 13:31:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09ef.dip0.t-ipconnect.de [91.58.9.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6FDD9A4C474D;
 Sun, 18 Jan 2026 14:31:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43970)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhSsk-000000005yN-2SCK;
 Sun, 18 Jan 2026 13:31:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>
Date: Sun, 18 Jan 2026 14:31:55 +0100
Message-ID: <20260118133155.1910082-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768743115;
 bh=86ve3pxaTmLbY3ToTuuyX9yc1iU5WKV9Ig25h879UxE=;
 h=From:To:Cc:Subject:Date:From;
 b=nzveG2itFjIynRli/239H0xBrWjwRcPZGaWtTTc7F0zRc/7lwykAPJrjd7jbm+bM0
 l2LsEeB9z4vUODiZV8KgrFLf8xLSRR9XhTT6DreUCQf4molHEqHD8VdnVLJvZVVSrj
 P40sI12N53w9pw+yPWVLm6ypSs1tNxLnytly1TB0o6RoL6AF7UB3DfhijcWqw6fp9Q
 0axbNlLBD//UPa2Ho3iUl71bJoGG3WO+zzW5BEcn1L4bVzFT0/VUzE8DaNiwNRfMwg
 P5FGA+Slp2qoIMsQppvH6U9Or3FoNsYmneI14xYCtXIOsxvyovb0M8P61fyefD9h20
 PlrFOCdLhNd+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nzveG2it
Subject: [Buildroot] [PATCH 1/1] package/mrp: fix cmake 4 compatibility
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
https://autobuild.buildroot.net/results/d93/d938025a881a14003c1b50065f163115e36cf33e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...m-required-version-to-3.5-for-CMake-.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch

diff --git a/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch b/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
new file mode 100644
index 0000000000..7ddf08cd6d
--- /dev/null
+++ b/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
@@ -0,0 +1,41 @@
+From 23877eaf1042b56e1bdca1883447e9a83d5e8263 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 18 Jan 2026 14:26:05 +0100
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fixes:
+CMake Error at CMakeLists.txt:6 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+-- Configuring incomplete, errors occurred!
+
+Upstream: https://github.com/microchip-ung/mrp/pull/2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d7a3798..a0ae196 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,7 +3,7 @@
+ 
+ project (mrp C)
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
