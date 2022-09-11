Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469DAECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 22:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF548242D;
	Sun, 11 Sep 2022 22:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDF548242D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HBHhjsCrTp8s; Sun, 11 Sep 2022 22:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB9D81B23;
	Sun, 11 Sep 2022 22:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB9D81B23
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94CB11BF34F
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 22:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C1834163D
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 22:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C1834163D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2MnPQ12wAK5 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 22:48:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34AC3415A6
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34AC3415A6
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 22:48:30 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id h14so3690166ilh.10
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 15:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=CfmzCgjr/4aEyltd7We4PeF3Fnv+LAyUZ723NIzT100=;
 b=VudgSUVI8p02KNZneJyGQBSWSGFq7cCnZfwISjEGXwoxkgVM2qYjd7SdyV3T+vj0tr
 VZi/HYjuCtdbXmhWO65QdMFcPH93rdqeyepDkynlb6nnmpZjI3Cld/Q1FtnEDJZ28E1q
 Im8nd8Ncb3XYEyzJYQLnHFaZYv2uOK4aX/5Vcvkpg1fa1dc6XYWBTHy4e2QqYKrj+h2f
 b38BqMqRDpdvd9lRgd4oLcSdJ4cCqzpVfiu3TwDpko7oXWOdeQj6k9Y+EkOaBZ+Yrgno
 Qfc0jmZg2m1IHFyszI2gXRIv4+J2AbRbeInaoAyQ+Vzyok1n4Xymf+SUaqeze3+lutRA
 ABXQ==
X-Gm-Message-State: ACgBeo0VUPzE/5xhAh7A/CeLmUAWCbxLUe4WviRU5tdSxvnvVhsiAZz+
 MBIIT+ZtzRzNNLwRO93XnnIPpEhUVFY=
X-Google-Smtp-Source: AA6agR5gthl8d6lI1PjDuKLaM04yFJ6bcahQ9JBqGTOIsLwjim35H/ytMHBhoSRNYOS1/hZPa0HJxg==
X-Received: by 2002:a92:ca4b:0:b0:2eb:6bd4:627f with SMTP id
 q11-20020a92ca4b000000b002eb6bd4627fmr8591274ilo.51.1662936508975; 
 Sun, 11 Sep 2022 15:48:28 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 n19-20020a02a193000000b0034c164e05c4sm2807811jah.177.2022.09.11.15.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 15:48:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 16:48:27 -0600
Message-Id: <20220911224827.3710470-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=CfmzCgjr/4aEyltd7We4PeF3Fnv+LAyUZ723NIzT100=;
 b=LmCsPpP6xLkHoPMaQR2AoJ7Jak0IvtMPV7E38dw6uPSZPJFsQh2YfsKv7B0Qfb4r1d
 7dG4v+KLzgsz3EQVo2g6WPZiOfPi4mj6Vx8n2FhICwI5R8SZOKTaby4LOS50wyPE8JFn
 CZ6kJRF5zqEPbKXUhxOrx+f+uyRwpnA8eykudjnAhZ52K4HqReXox+KSzaNFtXT7ndQJ
 5YZO+Gtyh9M0NMA9RxfaJBaH1+1pd3E8EPru8lqYmVxYmtMfkB+vAG218QXvXgWgNo67
 rIjvnD0DHVJQQrgvhuIYdLL8Tvq7IhEYXcc/sIrjyCc3ClDUS0xkV/vlfR8HA734AmUb
 yu6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LmCsPpP6
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2022.6.15.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to updated link in license file:
https://github.com/certifi/python-certifi/commit/b0b48e059995f455ac1e79b3ad373ad4ef355516

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-certifi/python-certifi.hash | 6 +++---
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 4d3c20afee..e93a228d7e 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  d8a2f5d006b656e2b9ee102a3be11a26  certifi-2022.6.15.tar.gz
-sha256  84c85a9078b11105f04f3036a9482ae10e4621616db313fe045dd24743a0820d  certifi-2022.6.15.tar.gz
+md5  10b6970c3e64d037137f4bd052ef417c  certifi-2022.6.15.1.tar.gz
+sha256  cffdcd380919da6137f76633531a5817e3a9f268575c128249fb637e4f9e73fb  certifi-2022.6.15.1.tar.gz
 # Locally computed sha256 checksums
-sha256  be9d82f36112f87a7f1d74ecd4887e1467bbae8878a84004a00117b1e475a3e2  LICENSE
+sha256  a02f6c638f9fb84d06f7764c3ab085d8af7eda5b93c166da54312479077c6fb0  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 6c8a7ffc2b..c03cd6e1e4 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2022.6.15
+PYTHON_CERTIFI_VERSION = 2022.6.15.1
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/cc/85/319a8a684e8ac6d87a1193090e06b6bbb302717496380e225ee10487c888
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/90/c2/4e37394b66e7211ad120f216fc2e8b38d4f43b89c8100dd3917c9da9bfc6
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
