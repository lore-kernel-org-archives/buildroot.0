Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41CCEE01FF
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 14:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8564D40408;
	Tue, 30 Dec 2025 14:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZJ4mDV5Y183; Tue, 30 Dec 2025 14:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF928404FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767104478;
	bh=0tnCz2nVokCGLh1TaHh7pckCQuJthyX/czfZNQQgAnI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rhR5nkcAIKW5LZk1+RfwcK8JUGI3rcHnIFJdl2VOvDh+sUI/H6WtXwMP8FruSBf5Y
	 wKSEFEhMfqOqWqAk22gELlaeIcBOGxYmQ5PfhLI8y3JDwgqrah509Ry3EOdTLxD9YE
	 gUmYzG6DzCWZXclroWs7DOQec2+CwV5RpnTgowsJW97ZT7iXRB2g/BfOFqza3aHZAk
	 hBfy8UaniIit2X6SWJ+/6BHg9aZljMK6zMh8lGpuZERCNtXgaM1ir5aer7nXp+DjuY
	 5kAOeUBRAb+hk1LLc6sBIVakblr8sze/Xgun5NH4MO/H5M9cAEjuLd6w8OlA6daX6k
	 u+g8srRrxDxiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF928404FF;
	Tue, 30 Dec 2025 14:21:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A223A177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87E19608BB
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrptNeen9cbG for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 14:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A667A607FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A667A607FA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A667A607FA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:21:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA01AA4C25A9;
 Tue, 30 Dec 2025 15:21:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60254)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaab4-000000008KV-1CjC;
 Tue, 30 Dec 2025 14:21:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Date: Tue, 30 Dec 2025 15:21:13 +0100
Message-ID: <20251230142114.1564503-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767104474;
 bh=DA/R/0lsrhAzB25nfBQR6oj1hNsAmqZVa0n/c5lMvLM=;
 h=From:To:Cc:Subject:Date:From;
 b=l/Uh1WtEIK6FztaOePjzSUh6ltu74Kg4Hi26qpiKKmFv6PjPmpCT7RaljIHPJyfBg
 oUn7VEGBoey9W9z3fZAbPM5U9SRnvbviUunSQ/MBG9yXVoOBDXDMmi1ORfBa54rZCm
 HsZ4pSV9GOAtBsm19O3LapQTC7EYrOA1TlabOg7ojOXTpD/jfz1O3R5WLk3ONKwhfw
 jGcY6xlpuiKMH1GANV+x8+gHftYhcWg28iveZRruaxQvqDcpFY5Bk1OOZj8VgAwYKZ
 MqBGleXFYUVEK9VFniyRIp27xv3KLasF/KSBvVhaSrg1TMyZ+wB8OxaMFBlmlc61E5
 lVy9EPicHFv0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=l/Uh1WtE
Subject: [Buildroot] [PATCH 1/2] package/libpqxx: switch to CMake
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

Quoting the gerbera error message with libpqxx built with autoconf:

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
