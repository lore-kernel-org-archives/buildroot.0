Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AA2C63797
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 18:19:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F39160462
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 18:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F39160462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F27B2608D9;
	Thu, 22 Jul 2021 18:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDUIXg93F4BY; Thu, 22 Jul 2021 18:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4199C60730;
	Thu, 22 Jul 2021 18:19:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8CCF1BF83B
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 18:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B86AE82FBE
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 18:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGIx0dZrBWdx for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 18:19:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FEF182F9B
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 18:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626977970;
 bh=qaEl1H4IeihDq4pp93RAJNrJ17gWs1DvhERXWJ9xGL0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=VjNRNPeg5j0RCGzgi9UfcGEJTPE5FsPvlhNtYR3DKn4oj+GsKT4Wmg1tpcJ+wGH/q
 eey3LJgycAfJgLt+P4tO3KO7prEkmdBvDwpnCEPTXOlbaHcKhqqtn/xGXplHGRn0UI
 eSGYIKcWVJuVPBb01MFGbYdgLcvwJ+QimyS/rqTs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.131]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N2mFY-1l5pza2m56-0139sx; Thu, 22 Jul 2021 20:19:30 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 20:19:28 +0200
Message-Id: <20210722181929.24015-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Cz0OMnICzliI2rGR83geSzZkb+cAxmlgkVs1UXR5sf/2R2NJboi
 a/wHkjRXorptalIMfTGJtcU+aYIdgGKgdKljoJphiBR3WA0lBDoYnsFlKLa1mZ0DTFAcVKH
 lvv4IfIeXd2P8pdstCoKCP+kPpkpDsOMteeWgXIkAxrm7V3MR9QB/brx7d2Hkx5EU59eJDw
 H443yqkDThOIE+QxxBAsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fBY8Iii1jj0=:EUl8QJWG3kvz7T4SmeuBQH
 U71omgWOVVc4Pm0doqqYBv+9BZfD3oNB8OvtV6YQ8JMY0MQL9VeLtwqo+XgkTEf4u9iPzobnu
 LPVdLk8nSpl41QTxfD/XIAOd+BYMl3JHhXt3fXxYSTUGOubBVtBaibb9B+wNILBvvS7PEEJk0
 Lgr9E3pPrYu1qxsI8LKOhqtGwYlx45EpDJ/Ouv7CcHRBJbmlUGIiHOZFsa193ohN9JrWZM5Ds
 WoxoupVj9gyTm4O67FAXDb1BYKRvrgCNBjyK3lEKKnSzgX42PD+a8IfQy37peZZQ4BjzFQJR6
 Cf7qlLObSpFKFy4RJehIwf7LvpW9uvzh1OZX4bvjtyB1FWI1Uq10b59+FN4KCBFB3AhCG24x+
 eJV+5jrVPsRavKKik02C1cVlWbI5NHxcTKNEgZVgWs88wxBIcgS7MpjlhzZ3R2YU+dbkoptJn
 SCgd7vbElE3k6nfLa6ZzyyNevVDDbmwq1yFHIhGDxl432dIpk+vsu+uBgBcJbku1ODzPO1vDi
 Sx1f3rE/sQzJAhqFNPgF64bvsSrtaU6NdjtNmL4sSb/ug2nUyadJEW+m5Gow660Oq3fH2Lhnx
 pEm+fAoTrXMZBfbBizxwaZXnGeWL2eGm7+QWnGjlh8M/IXXAFsJS21syFMUb7FsdydJ9BK5DP
 XqYCtTZcxn4OeL3w19LU4JMYpZo+LzU74sTtIa4GQoPvLrBAVR8XGX1OIpZSyE/VUPPhaDNOi
 lfaGK3vHkhTN4Xg7N4zHIg+xNWfIz/CDQCLAqlgH55+JHb+0vgMohYtic54dMieAVDbhBzEC3
 FW/MxfUQU5XmOrVXaRqXmEwsWG7dY8V04k2VINCuTpSyBpkpChjBDidm7K+F8CKuwSHhjbbYv
 KJwSRjWgIiCoeJuxuJypXuW58RZUYWJeaprwulHXbU2CDeGVaoJEubU9qsuLQ/oBO1dli0bf9
 8jsVWxskaVjEACQiVKOCPUl0yrYb93q4wqlRGN1dIQihN+nZyqJtA5tpOT5SoArO9y40+HL/0
 LwvhkX5VFX/xRwkNPwZcZbLoLKEtotJmqLBEaKjhRHHnhUH9ycXk6otU0xOM2Y2FOAw3lduSu
 s0+zLelyVJwdZ9UGQ/XvhrRNAOWaK9S5aJl
Subject: [Buildroot] [PATCH v1 1/2] package/mariadb: bump version to 10.3.30
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Scott Bartolett <SBartolett@thorlabs.com>, Ryan Coe <bluemrp9@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- rebase 001-add-extra-check-for-librt.patch
- for changelog see [1], [2]

Fixes:

  CMake Error at libmariadb/cmake/ConnectorName.cmake:30 (ENDMACRO):
    Flow control statements are not properly nested.
  Call Stack (most recent call first):
    libmariadb/CMakeLists.txt:423 (INCLUDE)

[1] https://mariadb.com/kb/en/mariadb-10329-changelog/
[2] https://mariadb.com/kb/en/mariadb-10330-changelog/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mariadb/0001-add-extra-check-for-librt.patch | 12 +++++++-----
 package/mariadb/mariadb.hash                         |  6 +++---
 package/mariadb/mariadb.mk                           |  2 +-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/mariadb/0001-add-extra-check-for-librt.patch b/package/mariadb/0001-add-extra-check-for-librt.patch
index 90aa626a0b..0dd4c546fb 100644
--- a/package/mariadb/0001-add-extra-check-for-librt.patch
+++ b/package/mariadb/0001-add-extra-check-for-librt.patch
@@ -1,4 +1,4 @@
-From e6244400dfd3547531a3a3289fadbbe19873f096 Mon Sep 17 00:00:00 2001
+From 960c74ec60962f707bd41724edaa2640c0324400 Mon Sep 17 00:00:00 2001
 From: Ryan Coe <bluemrp9@gmail.com>
 Date: Thu, 27 Oct 2016 20:33:21 -0700
 Subject: [PATCH] add extra check for librt
@@ -6,24 +6,26 @@ Subject: [PATCH] add extra check for librt
 https://jira.mariadb.org/browse/MDEV-10841
 
 Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
+[Rebased on mariadb-10.3.30]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  configure.cmake | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/configure.cmake b/configure.cmake
-index 896226de954f4642a238ca6a72e0930590dc1681..77ca485fb05e6b63bb69f9561b4eabfaa208a419 100644
+index 1b85c31b..4a1cd847 100644
 --- a/configure.cmake
 +++ b/configure.cmake
-@@ -126,6 +126,9 @@ IF(UNIX)
+@@ -134,6 +134,9 @@ IF(UNIX)
    IF(NOT LIBRT)
      MY_SEARCH_LIBS(clock_gettime rt LIBRT)
    ENDIF()
 +  IF(NOT LIBRT)
 +    MY_SEARCH_LIBS(posix_spawn_file_actions_addclose rt LIBRT)
 +  ENDIF()
+   set(THREADS_PREFER_PTHREAD_FLAG ON)
    FIND_PACKAGE(Threads)
  
-   SET(CMAKE_REQUIRED_LIBRARIES 
 -- 
-2.9.3
+2.32.0
 
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 26faf529c2..4025be317f 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,6 +1,6 @@
-# From https://downloads.mariadb.org/mariadb/10.3.28
-sha256  e8c912cae2e5800d0da364cc23437907ed4be767f2cbdf198cf3afc03db6a6a3  mariadb-10.3.28.tar.gz
-sha512  f6941bcc818f9b3640e4b5fdbdd3a32b45c62c04087e583f1f0e1c0258b09a21c7639abd1c902e183c057838308ad5eedc00ffee76d44a02043e8e349015fb20  mariadb-10.3.28.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.30
+sha256  bd8735c65bdb7ebcd5d779fb9d3de3f2fcd319ad6482278d73dfe7301ad4ae1b  mariadb-10.3.30.tar.gz
+sha512  742c30b3ebc0b6d36b98d4e7a7fb511098142e72d8f42cbfa73a0bdea2059be17e790fbda4732329bbd99e4b50b13cf18e8122964a473e0b62170ab869eca8fc  mariadb-10.3.30.tar.gz
 
 # Hash for license files
 sha256  a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 56d6afab17..ade73ccfe0 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.28
+MARIADB_VERSION = 10.3.30
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
