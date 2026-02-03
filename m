Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21767E87853
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 18:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF95640BB9;
	Tue,  3 Feb 2026 18:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eC9HKakR9l6g; Tue,  3 Feb 2026 18:10:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9188E40BA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770142219;
	bh=L3MYAa96pMkXTsp2Ku/Be7xNLsL+l5lZJpv6ypKZ8EA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFAPxZymLmI2DAV/lsoHO724JqRNp6e7qLxZTcbu5QIR6HG0g0VJX84X3R3sB2Os6
	 8og6oVXj83Too+c+G3UkdyIs+SQe9ikoOyyBb2nJBdC+KuuA2BYWlm+/o3TIRr7q1j
	 HGVI/h3hEVq7lI8SfNc7r0bCrIdOjXbcBzN+7QrdrSES9CLxUijLqHiT/8qljXkRQD
	 igj1gQAPCGWwj0P+TL1O6zg0vJKs7X7uNHB/Q7Ji+2/G/ztmiSwBxTbHnxafx9Atw+
	 t/SjAPau4yAogpEs46g3rmJgA4JIAKBpDQYQDr6I+pRvxGuWBDxRn4FNCrsALIK1oS
	 UFSukV8L0wWvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9188E40BA8;
	Tue,  3 Feb 2026 18:10:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96383F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 780396063A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFCNjRcMajzl for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 18:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B933608C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B933608C2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B933608C2
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1226A4C5445;
 Tue,  3 Feb 2026 19:10:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47822)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vnKqp-000000002Qe-2SBQ;
 Tue, 03 Feb 2026 18:10:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>
Date: Tue,  3 Feb 2026 19:10:11 +0100
Message-ID: <20260203181011.2433975-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260203181011.2433975-1-bernd@kuhls.net>
References: <20260203181011.2433975-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770142212;
 bh=xlJPY8QlfuH4/yZBOYQJhhlZtfGK8WaO1zUWiuwHYuM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MsRBmFQAVcW2duBaIGUrD3ac3eRQT/0r9RBYJ3qMwKBn5/enA4t5EnJiCntoOUfO+
 NkffVOGh+Q70VAgoq5HCUOAMpTXl257N9f3TjCRh8EE99CZHOSd4xwu5KK8ZZjAaXS
 IxjhjdQQs8EpNu6D+3zIjSW84yf9lZ7zRajf+J63f6mHab7PbDjlF8gdMTTStFgVIl
 CoP0of5KxlSBxNnFl1HYZ2LYpNPWhfYUEpew9b2k/HQv0ou79ce2OGggEntwzkj9Yp
 //5daS4yup1uUjKE+WucZApuL0gHFbbyExX75TffFpzJ4UNa+Mo1sQMKmwAcy8H7AJ
 5LnmcJ3WJIVuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=MsRBmFQA
Subject: [Buildroot] [PATCH 2/2] package/tcf-agent: fix cmake 4 compatibility
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
https://autobuild.buildroot.net/results/1d2/1d237d7b85c6d34f3628b86a9820452b2baa50f7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...pdate-CMake-minimum-required-version.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/tcf-agent/0003-CMakeLists.txt-update-CMake-minimum-required-version.patch

diff --git a/package/tcf-agent/0003-CMakeLists.txt-update-CMake-minimum-required-version.patch b/package/tcf-agent/0003-CMakeLists.txt-update-CMake-minimum-required-version.patch
new file mode 100644
index 0000000000..f4cf1a510f
--- /dev/null
+++ b/package/tcf-agent/0003-CMakeLists.txt-update-CMake-minimum-required-version.patch
@@ -0,0 +1,39 @@
+From db29f70205479f26b557d68db1a74fd0c7342b95 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 3 Feb 2026 18:36:42 +0100
+Subject: [PATCH] CMakeLists.txt: update CMake minimum required version
+
+Building with CMake >= 4.x requires the cmake_minimum_required()
+version to be at least 3.5, so let's update to that to fix:
+
+CMake Error at CMakeLists.txt:3 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream: https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/merge_requests/13
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ agent/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/agent/CMakeLists.txt b/agent/CMakeLists.txt
+index d5fa5396..aebf2cb5 100644
+--- a/agent/CMakeLists.txt
++++ b/agent/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ # -*- cmake -*-
+ 
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ project(tcfagent C)
+ include(GNUInstallDirs)
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
