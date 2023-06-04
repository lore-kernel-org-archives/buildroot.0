Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D557C77B73
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 06:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B902083C78;
	Sun,  4 Jun 2023 06:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B902083C78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dw2GKZj_MnsK; Sun,  4 Jun 2023 06:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8E4183BC2;
	Sun,  4 Jun 2023 06:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8E4183BC2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB771BF83A
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 06:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4943060E39
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 06:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4943060E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bf9qMi3xDh3V for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 06:47:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F65B60E30
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F65B60E30
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 06:47:47 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6af6f49e41cso3532481a34.2
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 23:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685861266; x=1688453266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2O7uJR+z40vBVRd8mHWyx6IG0O84E4ecfFTPRF2XtfQ=;
 b=V0e4IMwLh2VSAppXBVXU5mz+6Yh5cuoZOGe1bWZuyHNLBblh0obFPV0kqhOsCaACLn
 1suGiFJPbQXwNsQkISSXs8QmzdhjT+9FM+zg608MeX8CQwzUfbJDxWmV1xjAEbvO0R4J
 cJsBChtyC0dEKAWvcV2reYPqvqczv3l+n6Wt/5bJN7PbtzG1YzEV4kNKgByj8fPn3iTQ
 qEPXuyV9QgMCOH/zsUtr267dPmCAyG4LXI6QFa7pFlNGM2Ez2DWkNrnIApHRBkKqULxf
 8BFWBuxtDidJ4YRGHFtvnQ4mi+G1ww6/9116tRVNiRqQ0rGUzDh00LS8HaKC/BY/2Jmr
 9Kow==
X-Gm-Message-State: AC+VfDyouQQe02fMnKlEDq7e/wVHh5qVFYtHVUHTJSOZHE+VdTp458pz
 n3Z8z2BQ78wBaPeYvaOqQ0ZNO0NxPRM=
X-Google-Smtp-Source: ACHHUZ7xehuX665w6cXCbikFKDI1NJiorAuu70Sne3qy64V73jFHC9HXOcnY69U0Pb6V7/I6CN/1+Q==
X-Received: by 2002:a05:6358:7f18:b0:127:91b7:2207 with SMTP id
 p24-20020a0563587f1800b0012791b72207mr13760379rwn.28.1685861265794; 
 Sat, 03 Jun 2023 23:47:45 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-82.three.co.id. [180.214.232.82])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a17090a764f00b0024de0de6ec8sm3734536pjl.17.2023.06.03.23.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 23:47:45 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 43FB4106291; Sun,  4 Jun 2023 13:47:42 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Sun,  4 Jun 2023 13:47:28 +0700
Message-ID: <20230604064728.367037-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484; i=bagasdotme@gmail.com;
 h=from:subject; bh=MIqzS6eeu4nVd6o+XinovcpslTtgKnKuHmbKM0Ojzac=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhpQa4wbj9r1r5Ax12ic+LP11/uDnwsYrazj2vXy5Pkrn2
 FY/4VPRHaUsDGJcDLJiiizRa2V3GfPuvWQWk1AEM4eVCWQIAxenAExkw2SG/3mljm9/3DEwFwr5
 8bLg4JQK58AXG/nStaMXbqj7wzF140uGP3yvA0y/Kdu9yzQqUe24WlT+6vmNax2FZ4OXrclqee6
 /jwsA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685861266; x=1688453266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2O7uJR+z40vBVRd8mHWyx6IG0O84E4ecfFTPRF2XtfQ=;
 b=Riz5BmQ61TO4RbEEggAt4uQGKSkOS/lJhWSaQBeCYu9Yakz+SQfdbqmUzZcONDFxp2
 8o3N1MB4XoGnhHd3cjUplt5QOaESMxNZIW9t+UzbYVQatkkNXQxsLEfXi16KwXXLC5Zt
 ff9uWS1q2ThAI2bAbwcU7JbEi6e+v0DV6JzfQDuMAJ0AYcyldceeKrzFuNMOXIIjs+t7
 yjToNVPZ/0WkfaWCGh8NSmQ3E1C7yU0nSioBUe+lGlVQ/OlSVHnJfG2F2bSSe/QdGhuu
 QlfPdbSIR2aq9e9JPSgFLaGW/iky4nU7+pRXQ53R4kJfJgufgQvbTH+2NbVXq/1jE00D
 QE9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Riz5BmQ6
Subject: [Buildroot] [PATCH] package/git: bump to version 2.41.0
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the package version to 2.41.0. For the release announcement and
notes, see [1].

Link: https://lore.kernel.org/git/xmqqleh3a3wm.fsf@gitster.g/ [1]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 1efa95ed44..91d723ecd1 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  4893b8b98eefc9fdc4b0e7ca249e340004faa7804a433d17429e311e1fef21d2  git-2.40.1.tar.xz
+sha256  e748bafd424cfe80b212cbc6f1bbccc3a47d4862fb1eb7988877750478568040  git-2.41.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index ba86915b36..99646b10dc 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.40.1
+GIT_VERSION = 2.41.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: d2c1d8dfb5233acf90da6a3b26526fc9ceebe2df
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
