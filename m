Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB7FC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F661410AB;
	Tue,  1 Nov 2022 22:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F661410AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWPFHcbtwj0c; Tue,  1 Nov 2022 22:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63A0040A05;
	Tue,  1 Nov 2022 22:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63A0040A05
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC9B1BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 644F540A05
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 644F540A05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ht64OVzrkhue for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:55:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D60C8409A4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D60C8409A4
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:55:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so238971wmb.2
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 15:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tZV28a2XQ+0vH5XN7J8JVa0mK4U5QbhaOCAPzfqeR9Q=;
 b=Lx5ZpFZ79jvcOCL+5lQIej4DWiY7qQLAI3FqVKwtqIYXsgNCBEsyWvUeBb1epkuurD
 ztQQ5eBzt8IfoNuZC6VB/RCST14AYrQqj3rL1Bj5zU00vhgGU3DOZzmZ6klMfefM281K
 yOPUoP8b++XiTZQOmqR7kdBnpmlEMB4Ik0QdmqwFtQ2jcljoXVZhcEU2iZqBZ7zMzJuh
 pgZg4ukbAm9O8bMLVv///6rv3va4N06efFZsI5dRSjYHOZazEcQTUisozMjZ/UsQQ5Sq
 /aaPawwZE8yzX1Scc22UVdW8JULwOwM9Nq5LIuPyCLaEVlvn2m5ekc8jAJ1zcEbL2wnR
 A1cw==
X-Gm-Message-State: ACrzQf22lIgK3Jh2bZTDGAZq9dsjZls51CrJoRbJm4NukM209J0yXD9Z
 c2VgkFEyR3DP3tFdUD8wQ9E0w46Qi8o=
X-Google-Smtp-Source: AMsMyM5ovNpkw7L6rlrUMGAeZIDzcUWDFvFNlLt5A71ThISrWr/FUme5EiJ1Qv5QbYdFefTKTiHWsQ==
X-Received: by 2002:a05:600c:1d2a:b0:3cf:7332:946 with SMTP id
 l42-20020a05600c1d2a00b003cf73320946mr7628779wms.126.1667343353477; 
 Tue, 01 Nov 2022 15:55:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002367ad808a9sm11055111wrw.30.2022.11.01.15.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 15:55:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:55:50 +0100
Message-Id: <20221101225550.249546-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tZV28a2XQ+0vH5XN7J8JVa0mK4U5QbhaOCAPzfqeR9Q=;
 b=YP3Pj7uZbiCyBlMDW7YMbmdBR2TTVSEpnyIfnx4LO8Oq5E2cCO9kY/SnjgOoUTVDhV
 kHKlEmALumifzm/5jmF9JW3QTVhOVsxD8dLaN4OMeJ5e9J5EqPuYeUnpMXpQv4TRvYw2
 g4asp3Lwd/QQPM2lIPGM+//Np6wq9n5sHEtS97OTWqY6frs7t579WAJInAVXuVKd376a
 mDROuSPGRZTjW4ti8NPZHQvhz1Fw6lFTjGiUbE1oCAJ+QsT/zNM/0093rmCr76qJdjyv
 VC8eXpgPULkfjvMumBT6djUyPPj9o0lCg+W6qcVB89qMLmkcthkVFrADDI39lNzoTqV0
 HMNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YP3Pj7uZ
Subject: [Buildroot] [PATCH 1/1] package/quota: bump to version 4.09
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
Cc: Jarkko Sakkinen <jarkko.sakkinen@intel.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://sourceforge.net/p/linuxquota/code/ci/master/tree/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-realloc-3-instead-of-reallocarray-3.patch | 34 -------------------
 package/quota/quota.hash                      |  8 ++---
 package/quota/quota.mk                        |  2 +-
 3 files changed, 5 insertions(+), 39 deletions(-)
 delete mode 100644 package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch

diff --git a/package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch b/package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
deleted file mode 100644
index 093d7cc821..0000000000
--- a/package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 02b222a335527f1031cc9495d8c5ebc1bc5b1d4e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 11 Nov 2020 15:00:47 +0100
-Subject: [PATCH] quota: Use realloc(3) instead of reallocarray(3)
-
-reallocarray(3) has been added to glibc relatively recently (version
-2.26, from 2017) and apparently not all users run new enough glibc. Just
-use realloc(3) for now since in this case there's no real risk of
-overflow.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Jan Kara <jack@suse.cz>
-[Retrieved from:
-https://sourceforge.net/p/linuxquota/code/ci/02b222a335527f1031cc9495d8c5ebc1bc5b1d4e]
----
- quota.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/quota.c b/quota.c
-index a6ed61f..a60de12 100644
---- a/quota.c
-+++ b/quota.c
-@@ -385,7 +385,7 @@ int main(int argc, char **argv)
- 			  break;
- 		  case 259:
- 			  fscount++;
--			  fsnames = reallocarray(fsnames, fscount, sizeof(char *));
-+			  fsnames = realloc(fsnames, fscount * sizeof(char *));
- 			  if (!fsnames)
- 				die(1, _("Not enough memory for filesystem names"));
- 			  fsnames[fscount - 1] = optarg;
--- 
-2.28.0
-
diff --git a/package/quota/quota.hash b/package/quota/quota.hash
index 354a3e2de4..5b083c911c 100644
--- a/package/quota/quota.hash
+++ b/package/quota/quota.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/linuxquota/files/quota-tools/4.06/ (click on info button)
-md5  aef94648438832b684978d46fdf75110  quota-4.06.tar.gz
-sha1  98288699cc14da42f762301c2b6731ec7c777681  quota-4.06.tar.gz
+# From http://sourceforge.net/projects/linuxquota/files/quota-tools/4.09/ (click on info button)
+md5  f85c2e15d9a735640675ff4977b57bb6  quota-4.09.tar.gz
+sha1  5c215d869626b532be2773f4161bdcc8b9f97126  quota-4.09.tar.gz
 
 # Locally calculated
-sha256  2f3e03039f378d4f0d97acdb49daf581dcaad64d2e1ddf129495fd579fbd268d  quota-4.06.tar.gz
+sha256  9cdaca154bc92afc3117f0e5f5b3208dd5f84583af1cf061c39baa0a2bb142f9  quota-4.09.tar.gz
 sha256  32a5fd41e7a257f7f0373988ea8d45cebdbf376060703c242c11c000751b1203  COPYING
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 0c751d4436..1b6a4b1975 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUOTA_VERSION = 4.06
+QUOTA_VERSION = 4.09
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
 QUOTA_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
