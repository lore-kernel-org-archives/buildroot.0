Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A761D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F14E40E50;
	Tue, 13 Jan 2026 19:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gs9kZ0P9gsh; Tue, 13 Jan 2026 19:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C69840E52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333694;
	bh=1inOAHUJAy2KpoKwvS+HLqq0hO77mIWIc53VdwLJTbM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=We41bT6k+dmaNt6RWmSjp1zmnd4TuPbViA5FuqMCigcn27AIO/5w0mnumP3Cu1o/6
	 oNjBX7POTE12pUugukzTjD5eQZNVSMX3/UefB6cSzVHy8vXynanfgN2eXZwcr/9+Zu
	 6tUJzslzhsfFlbDXP0ifJzizCaMSbtFbTamHz2HuDRJcgoX8Rkzok/KQFAEq9mlEGR
	 aDYRsownnXZkHCw7CPouoDMRuiALVd0vRWzhfaq20SlEpMvT2f+/Sb0OEb9iC2htru
	 NdU1o8IdqjT/TeVa9vNTKq0VgvzfVTn1nbbpmA9URQB9mzYafHAr7g/KEJATc4J9F6
	 /kYn4CqFG3VUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C69840E52;
	Tue, 13 Jan 2026 19:48:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32230231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23E7460B91
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDRSchyVIqRZ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0F1860AB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F1860AB6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0F1860AB6
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08EE8B97A863; Tue, 13 Jan 2026 20:48:09 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:48:07 +0100
Message-ID: <20260113194807.100467-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
References: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333689; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ebhk6VaCAxy+oB8k2aMda3xEiHXi8/ABa2vTVO8lYEA=;
 b=T5ie4PNjxUGjj/Mlhf1Js3MPGxDqjdNaRYGjpY8yULcSSw8FIke69lyLKtEqJsCXyiWmQ0
 l1lL4J++zC+y1eznsfHIY0aGM/UroPU9hu/yx0vOMtOd0M/egpUQg641JY0RN5xpcJUebl
 f1obKKC8Fk4ZYgJXDLNr1/xOnm0q1CeVyrSLEpFFNoc1KSS0STU0CnbwpAz/TDGEbeoSy8
 A+ENCtORUr8tnsRbjc0cUKjiWiSBG8esiT2IN/aEnTwqzzmdQQvxo7rt05gRzEV533BGui
 BTSnkJeayCYjTVvyONf013bmMLPgJ9MMtG1ET5efwOfwVGoEG04kih28+flwKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=T5ie4PNj
Subject: Re: [Buildroot] [PATCH 1/5] package/qt5/qt5webkit: add patch to fix
 CMake >= 4 compatibility
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.11.x. Thanks

> ---
>  ...pdate-CMake-minimum-required-version.patch | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 package/qt5/qt5webkit/0009-CMakeLists.txt-update-CMake-minimum-required-version.patch
> 
> diff --git a/package/qt5/qt5webkit/0009-CMakeLists.txt-update-CMake-minimum-required-version.patch b/package/qt5/qt5webkit/0009-CMakeLists.txt-update-CMake-minimum-required-version.patch
> new file mode 100644
> index 0000000000..97115125ee
> --- /dev/null
> +++ b/package/qt5/qt5webkit/0009-CMakeLists.txt-update-CMake-minimum-required-version.patch
> @@ -0,0 +1,92 @@
> +From b3e016db4ad62bd3386736ce380e4b1c4601a08c Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 28 Dec 2025 14:44:34 +0100
> +Subject: [PATCH] CMakeLists.txt: update CMake minimum required version
> +
> +Building with CMake >= 4.x requires the cmake_minimum_required()
> +version to be at least 3.5, so let's update to that to fix:
> +
> +CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
> +  Compatibility with CMake < 3.5 has been removed from CMake.
> +
> +  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
> +  to tell CMake that the project requires at least <min> but has been updated
> +  to work with policies introduced by <max> or earlier.
> +
> +  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Upstream: dead, repository is obsolete
> +---
> + CMakeLists.txt                           | 2 +-
> + Source/JavaScriptCore/CMakeLists.txt     | 2 +-
> + Source/WTF/CMakeLists.txt                | 2 +-
> + Source/WebCore/CMakeLists.txt            | 2 +-
> + Source/WebKit/CMakeLists.txt             | 2 +-
> + tests/webkitwidgets/cmake/CMakeLists.txt | 2 +-
> + 6 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 31a2ea1fd544..a870b490c7fb 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.8.12)
> ++cmake_minimum_required(VERSION 3.5)
> + project(WebKit)
> + 
> + # This should be removed once we require CMake 3.3.
> +diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
> +index afd76ca1a184..07fb5ad450dc 100644
> +--- a/Source/JavaScriptCore/CMakeLists.txt
> ++++ b/Source/JavaScriptCore/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.8.12)
> ++cmake_minimum_required(VERSION 3.5)
> + include(WebKitCommon)
> + 
> + set(JavaScriptCore_INCLUDE_DIRECTORIES
> +diff --git a/Source/WTF/CMakeLists.txt b/Source/WTF/CMakeLists.txt
> +index 1d41f303acde..efc52e5280e4 100644
> +--- a/Source/WTF/CMakeLists.txt
> ++++ b/Source/WTF/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.8.12)
> ++cmake_minimum_required(VERSION 3.5)
> + include(WebKitCommon)
> + 
> + add_subdirectory(wtf)
> +diff --git a/Source/WebCore/CMakeLists.txt b/Source/WebCore/CMakeLists.txt
> +index 3b3a9ed4bd24..c69cf8eae586 100644
> +--- a/Source/WebCore/CMakeLists.txt
> ++++ b/Source/WebCore/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.8.12)
> ++cmake_minimum_required(VERSION 3.5)
> + include(WebKitCommon)
> + 
> + set(WebCore_INCLUDE_DIRECTORIES
> +diff --git a/Source/WebKit/CMakeLists.txt b/Source/WebKit/CMakeLists.txt
> +index c845856da6f6..b900d088ded5 100644
> +--- a/Source/WebKit/CMakeLists.txt
> ++++ b/Source/WebKit/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.8.12)
> ++cmake_minimum_required(VERSION 3.5)
> + include(WebKitCommon)
> + 
> + set(WebKit_SOURCES
> +diff --git a/tests/webkitwidgets/cmake/CMakeLists.txt b/tests/webkitwidgets/cmake/CMakeLists.txt
> +index 8f266fccb48c..2f5dd261971e 100644
> +--- a/tests/webkitwidgets/cmake/CMakeLists.txt
> ++++ b/tests/webkitwidgets/cmake/CMakeLists.txt
> +@@ -1,5 +1,5 @@
> + 
> +-cmake_minimum_required(VERSION 2.8)
> ++cmake_minimum_required(VERSION 3.5)
> + 
> + project(qmake_cmake_files)
> + 
> +-- 
> +2.52.0
> +
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
