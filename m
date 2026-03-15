Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6BCD58B2B
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 13:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C8B40A20;
	Sun, 15 Mar 2026 13:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzGu0bQui7G2; Sun, 15 Mar 2026 13:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CBBA40758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773580610;
	bh=sc7iY572NsILBl6mNOBRQIG1kcFcyZKDGvjOtF+H704=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X2D3OhKvTup6cDcNOWzeaYZg4SAbMW/YWP0GlebcK1AVd7+/1HjQe8hu4M3qgNmUw
	 K/hnG/LAfHb87gEFxdjMD7Fy4RVzNF5JoeHPtWollfvUKtUZgNtQQpRt6qouS7Mhvg
	 bK5XsNOmJoXAJu0YANJL3mW2JYSHLmj4CXuWoNO4rgTBmO4XT3OiOhLyYbKz5vSypT
	 4PX0uq3O5dO0EdcABb4JYHWjL8w1pJqoVQZbV2jqXRKlBOfare4SAelDU/k5qzwIis
	 yZzdjppSDuDpGzWvuP4F8/C0Ceq08/80OardklXh8zzq52OM9eStdsbVBjJnxjlDUw
	 tED6ZRkhSrKdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CBBA40758;
	Sun, 15 Mar 2026 13:16:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0F4B1B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B68C6400A1
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyFw_qPXGssr for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 13:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A648640018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A648640018
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A648640018
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:16:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5fc.dip0.t-ipconnect.de [84.161.181.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0372AA4C2093;
 Sun, 15 Mar 2026 14:16:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40510)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1lKN-000000007HE-0sgs;
 Sun, 15 Mar 2026 13:16:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Date: Sun, 15 Mar 2026 14:16:18 +0100
Message-ID: <20260315131619.3961450-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315131619.3961450-1-bernd@kuhls.net>
References: <20260315131619.3961450-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773580580;
 bh=X/ldlTKmpGb5JiUJ64hSODLsP/VkhzJQYD+QDxaRYvE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jeJaZh8gyJwGXg+K13Rt7g+LFPoIYik7G3LYe391NxuQ3JUYC7pUAexQLECniNGA+
 91PO3kmwhmqGxcqWIjCOhBXfJcqrT0Wmc9PBpM+AszbxXzNAVFaKWUJ2l/QcH9Dbwx
 Dw+oVdrfmk18sOe5f64iWabqfIOysgS+uQaQCM0ws5K5kc/h5YFNILzMIWoQc773or
 NrNpXygt61U6m+U83xfCeHNhH90SpivSp4eyIiLXx+bz4ENJcYIvdb37g/nyYuWVc7
 eH1nw3GSZC4XdOFigiSnLXVf9UKSEVRyMFlPYRBftbDgjbSCVH+gzsXKmyOlR7QdaC
 2zF2O9JHSo4uw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jeJaZh8g
Subject: [Buildroot] [PATCH 3/4] package/libpqxx: switch to CMake
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

The upcoming version bump of gerbera includes optional PostgreSQL
support using libpqxx which will only be detected if libpqxx was built
with CMake:

Quoting the error message with libpqxx being built with autoconf:

CMake Error at CMakeLists.txt:685 (find_package):
  By not providing "Findlibpqxx.cmake" in CMAKE_MODULE_PATH this project has
  asked CMake to find a package configuration file provided by "libpqxx", but
  CMake did not find one.

  Could not find a package configuration file provided by "libpqxx" with any
  of the following names:

    libpqxxConfig.cmake
    libpqxx-config.cmake

  Add the installation prefix of "libpqxx" to CMAKE_PREFIX_PATH or set
  "libpqxx_DIR" to a directory containing one of the above files.  If
  "libpqxx" provides a separate development package or SDK, be sure it has
  been installed.

usr/lib/pkgconfig/libpqxx.pc is still provided by the CMake build system.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpqxx/libpqxx.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index f19420dc41..492370f7f5 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -11,8 +11,4 @@ LIBPQXX_DEPENDENCIES = postgresql
 LIBPQXX_LICENSE = BSD-3-Clause
 LIBPQXX_LICENSE_FILES = COPYING
 
-LIBPQXX_CONF_ENV = \
-	ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++17"
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
