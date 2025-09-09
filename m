Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8AECAC583
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 12:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6558140407;
	Tue,  9 Sep 2025 12:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xb8q5loY-r9g; Tue,  9 Sep 2025 12:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 885D440B69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 885D440B69;
	Tue,  9 Sep 2025 12:43:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 08A46186
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E14B282521
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWDAPnbHEDbX for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 12:43:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 184A180D47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 184A180D47
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 184A180D47
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:43:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1183990879; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 09 Sep 2025 12:43:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uvxgb-00G6hv-2b;
 Tue, 09 Sep 2025 14:43:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  9 Sep 2025 14:43:00 +0200
Message-Id: <20250909124300.3839010-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qxg4VHUecnxGXHaMOGuw68TVYdDoa9tdvgCJ5B/p7pyO3TflsYWJ/5c+vv5648sfXbgGT11SOvicynNTq9eG+/oYAfY2Iwmr25jc4Svl2OsvucgQ1R32DzzAXMTLq6nws1bS948n1aYwNvJrq0h8oXv2F7S6B7VewB7WU9l1dWJjxHSHyHIqzzz2WdNlla5WNhdmmDPFOB4pLnnUvWnQfmzJkkWKNdfS2k+yXwH7HLWWwxwSdQFhvf+BL0P5nDIXqIEGD1xm+RNHQQ8U8hOt1VDqe3U4Y1WdsfkWq/gDmiqy0/KFjr9OMcbMxXLxEUxIMrF2cSAwLtU0xoqg0kh2qw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=SggVhwwokctm1Hw4bWSRAckIHQyi/p96UIit3O+L/ik=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=qxg4VHUe
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/fatcat: add upstream patch to fix CMake
 4 compatibility
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

Add upstream patch fixing cmake 4 compatibility:

CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 has been removed from CMake.

Fixes:

 https://autobuild.buildroot.org/results/548e662429e7cf91bd48e447345374c6734f1de7/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...m-required-version-to-3.5-for-CMake-.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/fatcat/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch

diff --git a/package/fatcat/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch b/package/fatcat/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
new file mode 100644
index 0000000000..31dfedda22
--- /dev/null
+++ b/package/fatcat/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
@@ -0,0 +1,40 @@
+From 2e3476a84cbe32598d36b5506c21025b3f94eb03 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 19:30:26 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream: https://github.com/Gregwar/fatcat/commit/2e3476a84cbe32598d36b5506c21025b3f94eb03
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d6a2649..8f3eadc 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(fatcat)
+ 
+ OPTION(DEFINE_WIN "Compiling windows" OFF)
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
