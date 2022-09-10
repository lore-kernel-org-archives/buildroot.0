Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABDAC6FA82
	for <buildroot@archiver.kernel.org>; Sat, 10 Sep 2022 22:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6280141BB3;
	Sat, 10 Sep 2022 22:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6280141BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rjB61kflunp; Sat, 10 Sep 2022 22:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C24409DE;
	Sat, 10 Sep 2022 22:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C24409DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D62951BF83B
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 22:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDFBE40123
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 22:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDFBE40123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBHUCD-HUo_v for <buildroot@lists.busybox.net>;
 Sat, 10 Sep 2022 22:50:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9269400E5
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9269400E5
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 22:50:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id o5so437987wms.1
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 15:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=f+bbaWN3GtNOGU1rZv8mrZb+ACUYIasfn/Oha/wFQKQ=;
 b=yL50evk36RjeOvP6OcbIgqnUxiDONp4fYy0iTjlsKadGNCvX5cYk73X7hC+VMAhoGm
 jB3NYlIRaGutS4E0GZ6FqpDHZOeewPiNEJcuseQZDHGhMWec5LvuMoKa9Mv/L3UnYHPG
 l9On965n637momwf0hDxPoy3oUAsrl/k/iHywhhD3HumiR5aZRy3+5+A9Il7X6mRc/9g
 3PZFln6eJRWMI65vmjHz59FHEpX14Alz269f7w5soY6ZJnIvbL1Q9stxv8ub5oUDdRY2
 8SmeIg8/vlJjXjAqarwsEcukvOQNPCyV1PED2GawC6vosbuK2O6cPbJTlAiCExSudKUC
 kMAg==
X-Gm-Message-State: ACgBeo2h080T6r0frrIvtt26b8SkFMhneshFJDbiC8QV5f7JXQ06nlc+
 WvTqhABgD+9EbURoaSv74lhveUAZMxk=
X-Google-Smtp-Source: AA6agR5IFZlpGUf7N1FQqSbNfuvkqriF1gsfRPfOdglo32YKlCl6ldmcqCfrntaJ1e4Rcbj4PdW7Cg==
X-Received: by 2002:a1c:f016:0:b0:3a8:3d3b:6b8a with SMTP id
 a22-20020a1cf016000000b003a83d3b6b8amr9355859wmb.168.1662850200743; 
 Sat, 10 Sep 2022 15:50:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m36-20020a05600c3b2400b003b46d9c3709sm3310265wms.48.2022.09.10.15.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 15:50:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 00:49:54 +0200
Message-Id: <20220910224954.82264-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=f+bbaWN3GtNOGU1rZv8mrZb+ACUYIasfn/Oha/wFQKQ=;
 b=SJ8KtiXKdpQpv6rMvAM2B17cElohIHQ53dktBtdBOl7JbXh4E04hEaAQ5QYG6ViWZV
 224nfbJuNX3cSoQeuSNKfPjxjAs2+FHkNNvNgg8Mj9CdNBLF6ol3XjhcC+LXMJGKq4Nj
 yTcKnD5w57+mB5v7ZeZYcVg8Tl08FR1BhRHAbs9EgKfgLL3jn/nyTGwiWVU5gmxiVP8Z
 0xfBufQrI5RwMoo9iNM0Js7VmYG6yFkq/ZjGUxI/taQtFSj3fhKOg3SSnyPU+di6s2Bu
 ZuZvmRuQUlAmYido1VNQHMVsTPlSIAIGXGxFqMgr9AR9Nx5B8O5uqntefo9KS7wuwQyB
 6qfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SJ8KtiXK
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump to version
 10.3.36
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

- Fixes for the following security vulnerabilities:
  - CVE-2018-25032
  - CVE-2022-32091
  - CVE-2022-32084
- Refresh first patch

https://mariadb.com/kb/en/mariadb-10336-release-notes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mariadb/0001-add-extra-check-for-librt.patch | 6 ++++--
 package/mariadb/mariadb.hash                         | 4 ++--
 package/mariadb/mariadb.mk                           | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/mariadb/0001-add-extra-check-for-librt.patch b/package/mariadb/0001-add-extra-check-for-librt.patch
index 0dd4c546fb..6e3fc70276 100644
--- a/package/mariadb/0001-add-extra-check-for-librt.patch
+++ b/package/mariadb/0001-add-extra-check-for-librt.patch
@@ -8,6 +8,8 @@ https://jira.mariadb.org/browse/MDEV-10841
 Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 [Rebased on mariadb-10.3.30]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased on mariadb-10.3.36]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  configure.cmake | 3 +++
  1 file changed, 3 insertions(+)
@@ -23,9 +25,9 @@ index 1b85c31b..4a1cd847 100644
 +  IF(NOT LIBRT)
 +    MY_SEARCH_LIBS(posix_spawn_file_actions_addclose rt LIBRT)
 +  ENDIF()
-   set(THREADS_PREFER_PTHREAD_FLAG ON)
-   FIND_PACKAGE(Threads)
+   MY_SEARCH_LIBS(backtrace_symbols_fd execinfo LIBEXECINFO)
  
+   set(THREADS_PREFER_PTHREAD_FLAG ON)
 -- 
 2.32.0
 
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index f7e3c7b744..c4064cff66 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.3.35
-sha512  9355de944eccef4e0bc01b19ffc3c0c72cf88befae7385c6f0ee1ea47dbd98d23f6bb46af9c140acc48d9d9613552870684bc0b7ca1f3cff1dc09c1a2c801573  mariadb-10.3.35.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.36
+sha512  321b4c48fcea4413eb239c4904c806306de660f2844edfa1d2a2a15213db287070d0f923db976588dfe329559d565bd98bddef3aaf8f14502f8c3db2ee27757a  mariadb-10.3.36.tar.gz
 
 # Hash for license files
 sha256  084aa0007efac6dda6aafffb3f3ef8b66b105862dad7ee23f6a4b52813f84464  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 4c855985b1..5fb8876278 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.35
+MARIADB_VERSION = 10.3.36
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
