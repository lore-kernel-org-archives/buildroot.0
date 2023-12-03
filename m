Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B773C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E733740156;
	Sun,  3 Dec 2023 18:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E733740156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59Xee_ULTC4L; Sun,  3 Dec 2023 18:44:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B93D840192;
	Sun,  3 Dec 2023 18:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B93D840192
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 957681BF408
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 734DF8141F
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 734DF8141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1yrr_2URuOB for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:44:30 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50A63812E7
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50A63812E7
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c09f4814eso6210065e9.1
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 10:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701629068; x=1702233868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G4PFz6Fw2Jd7kfmNWC7NUSs2+N1uElGzXD9gnWxAWNQ=;
 b=NLI6+wtfQawddnyWI8CVq6wt9K2opapbmSd6rrX7RJrDMihz+YKlgEjjNIxKEAMsqe
 BivXVILE81vJ69sQ1zzK39ekT/4k+J7XsqluqitvgWyY+EAFasp+tYN6d6YAw7sj098a
 kcKXjsyyIGeJx50uXehcNUTRxI9VOl+95sJ3jLG9OeLWmk2NjaCjnlPv3yjxrlGtrqiQ
 4T3xcvf50SK93Xk6FVpD7defUJT18GdrHgutfA15SOJWtv1WnEYjO2hqaQeRGj3rVM9U
 iKhWwex/KJ8Zn+ZPx6P5gG2Stv7KLw74GwOP7MjK4o5rGnUrc4ipDKA+GojxpFbvOFP+
 vi9g==
X-Gm-Message-State: AOJu0YzylS2H7WgWIooPP+xJ0vKyoYyFQH7q5O0NmNlEGbYjN0klGnsF
 WitAq3dzSV8m2GKIaLO59Ylp83VW830=
X-Google-Smtp-Source: AGHT+IE94VVioMAA0w8d6efUNG6ZTS6K5sqHysVKYNJY/c6x4vDLHl5veUOMSD4Rrlu4MOIRKKvVqg==
X-Received: by 2002:a05:600c:4504:b0:40b:5e59:ccd1 with SMTP id
 t4-20020a05600c450400b0040b5e59ccd1mr2059621wmo.178.1701629067809; 
 Sun, 03 Dec 2023 10:44:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay10-20020a05600c1e0a00b0040b397787d3sm16187452wmb.24.2023.12.03.10.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 10:44:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 19:44:00 +0100
Message-ID: <20231203184400.499648-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701629068; x=1702233868; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G4PFz6Fw2Jd7kfmNWC7NUSs2+N1uElGzXD9gnWxAWNQ=;
 b=NvlEc9t6yxwYiKqxNRI4f2+E7mqDgBBtLBNWCvsqZJMxMftMgE8cWJowXiLwtIOIRA
 QB8BEY4J/ccqr6kNF8gZoJhE/rkisRLz9ReZ1whXJtjMW0HBsDsIV6MQvSrY6WzXEK3w
 Kuai0koKX1uiPETgfKvVQ6sQqd7oKRxa0tepyAv5zGbJEEXs58+RVuOfnJxnpL+9X7I7
 nZkbExRRGHK60OrALHV3ekHuEr/D6VywkUlLRE1SUyESWSZ1Pi6sIjCCMA9ohxBzdkfw
 y7+8agVST/zxbQFihxTKjVNCWHAE25079vb94Bwmjc8frXExQmU/S73920xGNPxz+3Uf
 omlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NvlEc9t6
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump to version
 10.11.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure raised since bump of fmt
to version 10.1.0 in commit 619b5585d92c8f701cd92e0e26c0883a753125ad
thanks to
https://github.com/MariaDB/server/commit/f4cec369a392c8a6056207012992ad4a5639965a:

-- Performing Test HAVE_SYSTEM_LIBFMT
-- Performing Test HAVE_SYSTEM_LIBFMT - Failed

[...]

-- Downloading...
   dst='/home/buildroot/autobuild/instance-3/output-1/build/mariadb-10.11.4/extra/libfmt/src/8.0.1.zip'
   timeout='none'
   inactivity timeout='none'
-- Using src='https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip'
CMake Error at libfmt-stamp/download-libfmt.cmake:170 (message):
  Each download failed!

    error: downloading 'https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
          status_code: 1
          status_string: "Unsupported protocol"
          log:
          --- LOG BEGIN ---
          Protocol "https" not supported or disabled in libcurl

This bump will also fix CVE-2023-22084

https://mariadb.com/kb/en/mariadb-10-11-5-release-notes/
https://mariadb.com/kb/en/mariadb-10-11-6-release-notes/

Fixes:
 - http://autobuild.buildroot.org/results/9cb577195aa939289102116df5a2eac03f0d5017

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 03ce5a968a..fd73cca4f3 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.11.4
-sha512  62fc05395857dd036ebeed53b1ff0ecd9abd95ce8e5316194286521caae0f9452cf96a93613adec809e39e1d8ef20c330b24fee82b3bb90ee27a84f2bbd0d8d2  mariadb-10.11.4.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.11.6
+sha512  3d77f7be4a26d5a36af56150a5f8ed5e21adeed9bc8ea1bd694e47a25a571bd73468eada7c96e0dfe5a6c81bef625abf71a56d228cf43a738e555e3c0d824a6a  mariadb-10.11.6.tar.gz
 
 # Hash for license files
 sha256  2b278a3a2f20696113a7c57c4f3e6a5cdb9a25f2a827e72e0c089a2f805ff91a  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 78e4703eee..7f3755892a 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.11.4
+MARIADB_VERSION = 10.11.6
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
