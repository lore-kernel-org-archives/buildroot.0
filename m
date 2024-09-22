Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A888BCF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 02:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E0B040124;
	Sun, 22 Sep 2024 02:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ET1B5JLX1IzU; Sun, 22 Sep 2024 02:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03A924036A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03A924036A;
	Sun, 22 Sep 2024 02:51:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF0F51BF419
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 02:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD479405FA
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 02:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1kyLP1L8rUk for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 02:50:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE71D405F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE71D405F3
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE71D405F3
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:50:57 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-7db238d07b3so2678160a12.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 19:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726973456; x=1727578256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hz/wj9ndH2W7hSZNUzZ+berCKtzU2NNgYMDgbxGk/7s=;
 b=V+qFuxruvIlDX3hR+aR21DbB9W4CeJ3+DnickSjODf636t6todcyRNVEtJ2R8h5YeX
 MJoDgPB/IJt/RbxId37ad/CPsX0UAZ1IqSaDA3Z+eEFuUw5i2NOtup22EsMsIdzkNrjg
 21YjjXgDBaEfGX34LD3SWyiZsr9YIhH3WT8hPvMQ9ktioGuoDAAcAQqbfcb7pYrPiSFv
 2avqh9tjUWWlBBED4Yq8qK92kLapnVmuhmPdZ8rLj/SayJ/qMG/snXu3a5Ow8bcXDoug
 e++KBrXl+iHP3GKzdDOEG6lFGxpV0xGFWXdHNXkefuSAPGz4F4w5X1Zl2l63odItABxT
 Jmpg==
X-Gm-Message-State: AOJu0YzKWWs09iO3WDjhnHaCsg0FuMuoM5G/R4jynunkfEd6PCZG+UVc
 V3bGlG5DjXx8wrhwT7N9u4e/pZIrxOsfGOUN9VDbC4u8t7egd2/M2gn2mj6ZrMY=
X-Google-Smtp-Source: AGHT+IF9x15kuPZAuT8KWtzeCkOdctsWaf8ke1IDS9q+donQ8ppk+yHv1TuhLlkY/U4jrl3Feay/+g==
X-Received: by 2002:a05:6a21:3489:b0:1d2:e78d:2147 with SMTP id
 adf61e73a8af0-1d30c9d3fe8mr10806397637.6.1726973456288; 
 Sat, 21 Sep 2024 19:50:56 -0700 (PDT)
Received: from localhost.localdomain
 ([2600:8802:2a05:9000:19d8:5269:4572:b863])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944b97544sm12318654b3a.146.2024.09.21.19.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 19:50:55 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 19:50:51 -0700
Message-Id: <20240922025051.2621578-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726973456; x=1727578256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hz/wj9ndH2W7hSZNUzZ+berCKtzU2NNgYMDgbxGk/7s=;
 b=RV0lcVKsXfhpHNrFc09S2ma6CKrDNy4Tm2WZwvaxBlC4bYiHnvkVQFlnaofX1wK8mP
 SBZUDUMTSSx1qB3RHq41JxaLYCf6gclx1dlL9aFvFNLKgIMShu0drhrApZDB2zpiXab/
 IpeRjx6oBS5uA+jE8G08sNXOlYA4724d51ofbw5twdPqNFmiKBlC3jdnR1TN4483Lljv
 ZMM93kRqKQtj0mhnj8rTd989q8V0YCtMwoQxyG6LeQtj5X6mUWUkxk0Eg3Amo+iSC7eJ
 8ruvO1rNkop30cZW+bSXYdxKeR7O6vod7g6P3h8vhIrc38/YxVqmALszYlbgm6XyyKX1
 u/8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RV0lcVKs
Subject: [Buildroot] [PATCH 1/1] package/openssh: bump version to 9.9p1
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.openssh.com/txt/release-9.9

License sha256sum has changed due to inclusion of the openbsd-compat/base64.c license in the LICENSE file.
(https://github.com/openssh/openssh-portable/commit/ef2d7f2d3e1b4c9ae71bacf963e76a92ab8be543)

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/openssh/openssh.hash | 6 +++---
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 44f9645035..5758ce4f36 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.8
-sha256  dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3  openssh-9.8p1.tar.gz
+# From https://www.openssh.com/txt/release-9.9
+sha256  b343fbcdbff87f15b1986e6e15d6d4fc9a7d36066be6b7fb507087ba8f966c02  openssh-9.9p1.tar.gz
 # Locally calculated
-sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
+sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 7065c3ae4f..95c059e03d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.8
+OPENSSH_VERSION_MAJOR = 9.9
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
