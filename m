Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C8BD4A5F4
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 10:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19A7341357;
	Sun, 18 Jan 2026 10:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RURZKWBg-mSl; Sun, 18 Jan 2026 10:10:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B312041351
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768731003;
	bh=KUrgZhpRKfpfDj5YeYiPDSh6YR+IYInu0Os6jlpFT/U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r6mNl8MsJbgMRYsaxR2KmyDc17REzcgXnMyMB+7U4g/BLFAswpDi8+fmhi7oa+Yjy
	 PEVTt5lc5g/7RauwwiM6MAEuGJXptx5uEUbc9FJlMh7AAH8vPaVpOtkL8ozvNCqDgt
	 F6FJfc9NWNfsNwKS6FXJLVQWSBpbGxmJIhvo+f6N7mdPtwp5nvQIkeqayVs9zAGbVi
	 yS5iEb4wISiunJirD5XejyYYGiAgKMAjs4ZmTt5d1mCqwco8iwZR0K60ugzQPUrADb
	 r/zahX7F8YV7hXjFDFINZfYEE83Bp3WMGksnMin9LuSDXD1B1fZDKdBOL5DwgwbXNf
	 mSY1J1xMK07yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B312041351;
	Sun, 18 Jan 2026 10:10:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CA682A8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 10:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54230807A9
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 10:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tr_jrnwtlDy for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 10:10:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 891428079E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 891428079E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 891428079E
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 10:09:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09ef.dip0.t-ipconnect.de [91.58.9.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8F8C6A4C19C8;
 Sun, 18 Jan 2026 11:09:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39172)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhPjG-0000000041s-3404;
 Sun, 18 Jan 2026 10:09:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Sun, 18 Jan 2026 11:09:55 +0100
Message-ID: <20260118100955.628730-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768730996;
 bh=PmScqq+D0rn2kphIB3w0y0QkHpp47OU4oXIJs5VHhtw=;
 h=From:To:Cc:Subject:Date:From;
 b=p7md/IJcg+n4ruACbsLT4dZUzZXy5n4MllqxiCPH8jWgpIIoNPUBZ6QCgMetpvgmu
 Wd3mx1m8N9fDULD2mXmfJnU8BnJaOBwXoEqfXa+UBtzgAZobEk3GxSU1OSNsQ00E1A
 V//DaNckxW/3aG9RWTN+Ekb9dQoXnMW0GexidP4T7Em94vBZ/J09g1AkcdOMzxNtfj
 hJVkNQCylljrUtyubXGqWNKABGs6hEZm66iDpEi9JJAadrG0CqlJcVmYbcVdNyrQCw
 +Az5q3dKUinQeKby0WciC4u1OjZd6Hu/K5xm88zkO+8dMhztqlEZ4ZdhATYNxVH2HW
 yeF3ESzd//xhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=p7md/IJc
Subject: [Buildroot] [PATCH 1/1] package/easydbus: fix cmake 4 compatibility
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
https://autobuild.buildroot.net/results/5e5/5e5c468c657a402befec13e3b7abf6423ccfeb37/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...m-required-version-to-3.5-for-CMake-.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/easydbus/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch

diff --git a/package/easydbus/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch b/package/easydbus/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
new file mode 100644
index 0000000000..cee84c21f5
--- /dev/null
+++ b/package/easydbus/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
@@ -0,0 +1,41 @@
+From decf167b6b840fd520aec1f2fdac68a23c2acb83 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 18 Jan 2026 10:57:58 +0100
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fixes:
+CMake Error at CMakeLists.txt:7 (cmake_minimum_required):
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
+Upstream: https://github.com/mniestroj/easydbus/pull/7
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 575eb24..efaf339 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,7 +4,7 @@
+ # SPDX-License-Identifier: MIT
+ #
+ 
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ project(easydbus C)
+ 
+ add_definitions("-Wall -Wextra -Wno-unused-parameter")
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
