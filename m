Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60164C12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:14:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1195E61222
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1195E61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D327582977;
	Wed, 21 Jul 2021 17:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nY4r4LqBYELE; Wed, 21 Jul 2021 17:14:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 486908293F;
	Wed, 21 Jul 2021 17:14:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9B161C1135
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9C5D8293F
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbHxTMulRrhq for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 17:14:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD07882702
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 17:14:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d12so2939533wre.13
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 10:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u6nwPxm+l02u7V7dCH6tHReSyz0wSlC36Y2ElC8Dn4g=;
 b=h2Y4Lw8Kv955Jo2dx8cguA9vKCQYjUTs3zD3fDXZKzrtG4G5w2pfuba4w4e6Q9MgPg
 +UXjVhLP8LobE/oa1el8rwBIZwNahlQjpUid3qRLJF1WCYredYifCW0rGC8LK2BrHbjA
 yq49fIQ6Fki7YpMx16o7AUj55kxsD8MTPik+UcVFFC2oijNLN46pxepSTjqMJ2o18Vyd
 yvowhTs4JqeFse3pzikBrh/70M/gyAZ2uDxJxEEPa/wV8GYpgmGwUTrBP50xohIP1MqZ
 CmCyWVsTm6/EmKguhUw6eQg77L11xzbVynf8d4O/RqLjc9ebLYtyajzUPXv4SEJIGT5n
 atqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u6nwPxm+l02u7V7dCH6tHReSyz0wSlC36Y2ElC8Dn4g=;
 b=B2t2Ue36NFRk1qHALAuDsp+1qnzARYSO12WbjSr3g2R0GLPIJJsf0OJ2mS6HOryZOR
 YHSa6xyamNZMTzmNqWUAbaVjfxdDL0FLXIZnqRnl8ji54/VPHPkI8ZKG9zvR4kMizs2v
 KgN3BYwGl6G2y9ZBzHe6TN4EUnBFytz89VDYSd7VcM0nurezJOVg/tBz4lp2rAbRIsxb
 TAk3egePIeO7rN2Zbhm+Z4GQmAC/2psOyLF3G4zfCvsng4/R9J2EjOh73EY0j7xQWvI4
 vQIQ5zGyNqfg743hjW5lD9g06eyx2zQU339ua8qPUlsEOvgkY2BOyfHSNjPCVbBo8afR
 ib2w==
X-Gm-Message-State: AOAM5312ihC+jnO/8KW3/buTFPEUmKE+C8L8A5YCSlBwTIKS9WlpQO4O
 NOaFKDIKoVur2ZS0FVNPB6Hh7q6OZL/SUw==
X-Google-Smtp-Source: ABdhPJwWXn9ub+vfeB+MmZaVyScuXVvejvgP2iihV6P8eZqOnOkIg8A4qeCRCVMtZAJhMbiprQWEvA==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr24715668wrw.29.1626887642711; 
 Wed, 21 Jul 2021 10:14:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id c10sm22862916wmb.40.2021.07.21.10.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 10:14:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 19:13:54 +0200
Message-Id: <20210721171354.493806-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nbd: bump to version 3.21
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...the-file-descriptor-before-returning.patch | 25 -------------------
 package/nbd/nbd.hash                          | 10 ++++----
 package/nbd/nbd.mk                            |  2 +-
 3 files changed, 6 insertions(+), 31 deletions(-)
 delete mode 100644 package/nbd/0001-Also-close-the-file-descriptor-before-returning.patch

diff --git a/package/nbd/0001-Also-close-the-file-descriptor-before-returning.patch b/package/nbd/0001-Also-close-the-file-descriptor-before-returning.patch
deleted file mode 100644
index 70330c8e91..0000000000
--- a/package/nbd/0001-Also-close-the-file-descriptor-before-returning.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From d2480de925e83c8bf60faa96141f4198bdf7f619 Mon Sep 17 00:00:00 2001
-From: Wouter Verhelst <w@uter.be>
-Date: Fri, 2 Aug 2019 10:33:00 +0200
-Subject: [PATCH] Also close the file descriptor before returning
-
-Coverity CID#1162721
-[Retrieved from:
-https://github.com/NetworkBlockDevice/nbd/commit/d2480de925e83c8bf60faa96141f4198bdf7f619]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- nbd-client.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/nbd-client.c b/nbd-client.c
-index e9ec0a86..94035886 100644
---- a/nbd-client.c
-+++ b/nbd-client.c
-@@ -930,6 +930,7 @@ void disconnect(char* device) {
- 	if (ioctl(nbd, NBD_CLEAR_SOCK)<0)
- 		err("Ioctl failed: %m\n");
- 	printf("done\n");
-+	close(nbd);
- }
- 
- #if HAVE_NETLINK
diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index d856953c22..f0df35bc27 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/nbd/files/nbd/3.20/
-md5	910fe6c152f8c30ad8608388e6a4ce89	nbd-3.20.tar.xz
-sha1	9240430266ff4bfb2316ef6d880056a9974a59fd	nbd-3.20.tar.xz
+# From http://sourceforge.net/projects/nbd/files/nbd/3.21/
+md5  c51c4c500fe1ed84c3d5d5dd2ca71d23  nbd-3.21.tar.xz
+sha1  88c3296d43d20d7bda97e0f1bab0243a4f6fa880  nbd-3.21.tar.xz
 
 # Locally calculated
-sha256	e0e1b3538ab7ae5accf56180afd1a9887d415b98d21223b8ad42592b4af7d6cd	nbd-3.20.tar.xz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  e7688af39d91733bbcd2db08062c44fe503d004e51528740139c44aff6a6bef9  nbd-3.21.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 6c77bffdfe..0a7f08b2cf 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.20
+NBD_VERSION = 3.21
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
