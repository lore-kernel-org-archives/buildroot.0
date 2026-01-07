Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E7DD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 238E840BBC;
	Wed,  7 Jan 2026 17:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ivq553TWMNL; Wed,  7 Jan 2026 17:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2096940BBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808550;
	bh=l/3EHZuxufAyvtv9ibbIjK8KTGb1VjdxLXfEmUkse8w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HySn1XDMu9tz97xH0F/GlQONQQlWLgVQQz8S7WbYWeoVdw3a5GmyovIeTfshgvWna
	 YZwh1SxseoEuWm8xW9sW2C5vzXcMxsc2Ny+gV2G2wK2BGsY2yd2TpnV/SeMbb2Q/fB
	 RZot0FEeQGQ3R0Z7IYy1W1WfFGTbp2MJUZ/6IqXD9kUtKct1/h48MukyaoBty/eKBj
	 45rbaa0u4toU0emZzvZuIjwU6YCKzEXaaXyUQ0nPSTX8DJNigJK/DogzNGhuBOJasV
	 QP8UW/TGrTID4roe30/v1TEol6/GtUMDHTixY6Te9ApnIgptyoAaNKiwoV7sudgKdL
	 WhOIY9Nk6S7Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2096940BBE;
	Wed,  7 Jan 2026 17:55:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 428B325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE91605C0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q340G0fN40a2 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A4C7607FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A4C7607FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A4C7607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 948FAB97A704; Wed,  7 Jan 2026 18:55:43 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:42 +0100
Message-ID: <20260107175542.230284-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217222539.1989993-1-thomas.petazzoni@bootlin.com>
References: <20251217222539.1989993-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808543; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=LyLwQcH+VHgzygATdAxbMb4gG/P0kPggpbh65ZUa0OY=;
 b=gOMKIkCs6sAD8rF8GGfszSrOui3r41PqxZBS5Y4Avxa5Du6ZMOJcGHJSQT4Lr+j8y9yI/2
 ULKuiah2UBDvX6+5o4OJ/aq9oQS0g+pfPHtRuSsPQT20rnhpE+k9S8MibenW19A2zkCTUg
 UeeQEAM0ip8FFN27c4+CTdJbMACfFtFRN8R8g9Y1SFFC8b9cMZtntJun6xk5LF9CvP7MuG
 IgfwBQAQgz+X7WJhp75jGycCqbi8fx86c9Oesd4MdFPKUnsSLnWgyYGpIc150SCfx7RusS
 oMkEdAtUHbxqtoKjU6pNsReYLzGIDpwZ1hEJpykd1QT03XSZU56C04xZRG14rw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gOMKIkCs
Subject: Re: [Buildroot] [PATCH 1/3] package/cppcms: add patch to fix build
 with CMake 4
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
> Fixes:
> 
>   https://autobuild.buildroot.net/results/5f0a3a525866519ee12acb9997d217b4a8b870fe/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.11.x. Thanks

> ---
>  ....txt-make-it-compatible-with-CMake-4.patch | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 package/cppcms/0001-CMakeLists.txt-make-it-compatible-with-CMake-4.patch
> 
> diff --git a/package/cppcms/0001-CMakeLists.txt-make-it-compatible-with-CMake-4.patch b/package/cppcms/0001-CMakeLists.txt-make-it-compatible-with-CMake-4.patch
> new file mode 100644
> index 0000000000..6080fb1e1b
> --- /dev/null
> +++ b/package/cppcms/0001-CMakeLists.txt-make-it-compatible-with-CMake-4.patch
> @@ -0,0 +1,107 @@
> +From fb3943378d84a6ced1182502eb839d6fc6e51914 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Tue, 16 Dec 2025 15:31:38 +0100
> +Subject: [PATCH] CMakeLists.txt: make it compatible with CMake 4
> +
> +The build with CMake >= 4 currently fails with:
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
> +we simply need to specify that the minimum version is 3.5 to fix the
> +build.
> +
> +Upstream: https://github.com/artyom-beilis/cppcms/pull/106
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + CMakeLists.txt                                          | 2 +-
> + booster/CMakeLists.txt                                  | 2 +-
> + contrib/server_side/sessions/CMakeLists.txt             | 2 +-
> + contrib/server_side/sessions/berkeley_db/CMakeLists.txt | 2 +-
> + contrib/server_side/sessions/cppdb/CMakeLists.txt       | 2 +-
> + contrib/server_side/sessions/sqlite3/CMakeLists.txt     | 2 +-
> + examples/message_board/CMakeLists.txt                   | 2 +-
> + 7 files changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index a9c601b..826e87f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.6)
> ++cmake_minimum_required(VERSION 3.5)
> + set(CMAKE_LEGACY_CYGWIN_WIN32 0)
> + 
> + 
> +diff --git a/booster/CMakeLists.txt b/booster/CMakeLists.txt
> +index 6ec1ffa..8f63254 100644
> +--- a/booster/CMakeLists.txt
> ++++ b/booster/CMakeLists.txt
> +@@ -6,7 +6,7 @@
> + #  http://www.boost.org/LICENSE_1_0.txt)
> + #
> + 
> +-cmake_minimum_required(VERSION 2.6)
> ++cmake_minimum_required(VERSION 3.5)
> + project(booster)
> + include(CheckFunctionExists)
> + include(CheckCXXSourceCompiles)
> +diff --git a/contrib/server_side/sessions/CMakeLists.txt b/contrib/server_side/sessions/CMakeLists.txt
> +index 0909fa6..e7ae01f 100644
> +--- a/contrib/server_side/sessions/CMakeLists.txt
> ++++ b/contrib/server_side/sessions/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.6)
> ++cmake_minimum_required(VERSION 3.5)
> + 
> + add_subdirectory(sqlite3)
> + add_subdirectory(cppdb)
> +diff --git a/contrib/server_side/sessions/berkeley_db/CMakeLists.txt b/contrib/server_side/sessions/berkeley_db/CMakeLists.txt
> +index 6bbac69..534bce2 100644
> +--- a/contrib/server_side/sessions/berkeley_db/CMakeLists.txt
> ++++ b/contrib/server_side/sessions/berkeley_db/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.6)
> ++cmake_minimum_required(VERSION 3.5)
> + 
> + if(WIN32 OR CYGWIN)
> + 	add_definitions(-DDLL_EXPORT)
> +diff --git a/contrib/server_side/sessions/cppdb/CMakeLists.txt b/contrib/server_side/sessions/cppdb/CMakeLists.txt
> +index 9781be9..792ec39 100644
> +--- a/contrib/server_side/sessions/cppdb/CMakeLists.txt
> ++++ b/contrib/server_side/sessions/cppdb/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.6)
> ++cmake_minimum_required(VERSION 3.5)
> + 
> + if(WIN32 OR CYGWIN)
> + 	add_definitions(-DDLL_EXPORT)
> +diff --git a/contrib/server_side/sessions/sqlite3/CMakeLists.txt b/contrib/server_side/sessions/sqlite3/CMakeLists.txt
> +index 4c236e3..82808f4 100644
> +--- a/contrib/server_side/sessions/sqlite3/CMakeLists.txt
> ++++ b/contrib/server_side/sessions/sqlite3/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.6)
> ++cmake_minimum_required(VERSION 3.5)
> + if(WIN32 OR CYGWIN)
> + 	add_definitions(-DDLL_EXPORT)
> + endif()
> +diff --git a/examples/message_board/CMakeLists.txt b/examples/message_board/CMakeLists.txt
> +index 0e5c555..96a56c2 100644
> +--- a/examples/message_board/CMakeLists.txt
> ++++ b/examples/message_board/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.6)
> ++cmake_minimum_required(VERSION 3.5)
> + project(cppcms)
> + 
> + include_directories(${CMAKE_SOURCE_DIR})
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
