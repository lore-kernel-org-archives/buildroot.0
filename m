Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7637ECD999
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 19:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A112B608DA;
	Thu,  5 Feb 2026 19:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j49auZn0h-Mn; Thu,  5 Feb 2026 19:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7864A60B19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770319798;
	bh=sc7iY572NsILBl6mNOBRQIG1kcFcyZKDGvjOtF+H704=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eMKezrutdi5sRLl3gRbigA4wbA6T7NZn2T0OctN5ZJWD/s/Yv+3BnJ2DOcU+pMCUY
	 PzeAG/3p/pxDT17qDXWDBLGh80JWM1Nm000U7Mgv5eYH2k9f3XQ3F9egS29Kf3j//O
	 ueCmvJhHHpMl6/nMDDCEZw5FNBMeAUABdTHkq9mZTue1vckCCq82sPfjKhKtv8ARSl
	 67EAe3CgF/AkR5mcE17jk7wL5bfgt5ZM8YKLktnN56m1NllYsYvrQ+kO3TlotV/5EP
	 9FOEPfaPBj6NWtDesk3kERivtrONCEtbRMCDQuFKkM0awid+lLmRQcwg9tsBsR+QSd
	 uiH+cTEPkLcVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7864A60B19;
	Thu,  5 Feb 2026 19:29:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E443D173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A542680FFD
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yqMrVYb_eCU for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 19:29:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60F1C80ED9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60F1C80ED9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60F1C80ED9
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:29:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8DEF5A4C57E4;
 Thu,  5 Feb 2026 20:29:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49800)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vo52s-000000002Is-1kXF;
 Thu, 05 Feb 2026 19:29:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Date: Thu,  5 Feb 2026 20:29:41 +0100
Message-ID: <20260205192942.1729614-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205192942.1729614-1-bernd@kuhls.net>
References: <20260205192942.1729614-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770319782;
 bh=X/ldlTKmpGb5JiUJ64hSODLsP/VkhzJQYD+QDxaRYvE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mhjRQyVDzU9K+ValxEIT3DXslzkJgb7RJ2X6mWfGr2lCKrZApZHCE/T75ga5AsWgY
 IakZZNsTlEi1CIwZ9KzzriGdfL2v0KiBlw512OqrHQ+Bx78rh5Gm+PcAfXLnOw6BEE
 c8Xr5hSfA9eoNrfb/LMPmZyeXzmbt15fEEAAeMJFrZi6WnMPtLFfXKWSxxxjJql9n9
 jPsW0+E5k8nv845tUWXUc5e/lSfwUjKqkZBHozEFpHW9THRbpzGb/4iI9r2wltL47F
 z9GstWP18Y7zO5tFs2MkATyEVV7SqhSS50swF3tKmL3Nq7e2NLYa8KMAImxBrUlBTx
 /tvpwpBbNBIBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mhjRQyVD
Subject: [Buildroot] [PATCH 2/3] package/libpqxx: switch to CMake
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
