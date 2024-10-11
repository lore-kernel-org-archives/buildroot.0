Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA5ED0EE19
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 18:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C307843D6;
	Fri, 11 Oct 2024 18:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjheT2RA4PlT; Fri, 11 Oct 2024 18:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6DC6841CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6DC6841CD;
	Fri, 11 Oct 2024 18:39:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52BBD1BF57F
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 18:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40642841CD
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 18:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YM1E20_9aFr for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 18:39:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE9B081AF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE9B081AF4
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE9B081AF4
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 18:39:05 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-8377fd76112so59437439f.1
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 11:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728671944; x=1729276744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u0Pp8EHV7R3yxHE9TEX9p6QffFCkcRXn9rQy50GZqi8=;
 b=dcDPG90WJ8D7skplOgjjIQ6pSFrK1TERJn3kKDG9LTf9cQD7AWGFOd0hFp1ud1V6oU
 JxfZqnZ/euEe4gZ5TO3F32xTiduHGYJMNZ9SLHjXEvj40CWyA8IWSrzaCpfjym51VDRb
 FeFcHridQWXguiQrv229JxbsoYJgTBytu51Wz7mIhjCZ6DKBvwwN+J5Rf6wU85RMCPIc
 0k2XRjNTIe97A108rZaGUvhH6qM3OXP03PkGSnPCr4q08TrdO5alCnaiCT0gyx8Jm+e6
 r/vVkLki3a7PdwVIe1EGZ18MIhmmKrYlGfS1EqwbnDRa15NyTjFfPqgmueH/I9OBfdUw
 +ogg==
X-Gm-Message-State: AOJu0YzWUK7ukrbdMajaqzRdYWStfImP8955jsTNWrln71E4BTKEAf7P
 q92r35AeDEZFx2B9/U+bXTXFL1GKOBnNr8kMebSpNcCLEsNFVgwuyllwpA==
X-Google-Smtp-Source: AGHT+IEPMQ2+ncHtTi4dXTn10x1liWRs2Q2mnBh5EgjRcFiwYCiAgopXKmrZhEj/NtQafUgX6jMTMg==
X-Received: by 2002:a05:6602:641d:b0:834:f34d:859 with SMTP id
 ca18e2360f4ac-8379231994dmr434991639f.3.1728671944159; 
 Fri, 11 Oct 2024 11:39:04 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbada8436esm743263173.94.2024.10.11.11.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 11:39:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 12:39:02 -0600
Message-Id: <20241011183902.2771890-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728671944; x=1729276744; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u0Pp8EHV7R3yxHE9TEX9p6QffFCkcRXn9rQy50GZqi8=;
 b=CZUtmS/jbXRlRURY1lIhkkmvU/O5wpZDO38W1YGJePsOaIpdU8PLQbBAu5l4iI1f3m
 L8Qw7nraritelQiDoagWf9t9VaXTencKNTHT9Oxfwiz76x5jAh/GhB2oUKCBvXSNIocU
 1cKwCOKcLnDRe9qdxZ2Z2uQigtEPTa0NaxLjmU4Evqx7uyoIUa6WCBJeAp8UX3qGX+mY
 yTaM4TMY7yejvWTwSfS/sFG/N7fLlyWrT3sopl0NvrEVMe4n9t+A/a8lBOq5tdsOlEwH
 fdK7aM4wdHFWnI0MRmLmz4lagKyRS5n/Txrw+5pWYXXhelziT0Y/u+T4PDSqIZyTriYA
 JgTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CZUtmS/j
Subject: [Buildroot] [PATCH 1/1] package/python-distlib: bump to version
 0.3.9
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-distlib/python-distlib.hash | 4 ++--
 package/python-distlib/python-distlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-distlib/python-distlib.hash b/package/python-distlib/python-distlib.hash
index 1a14e6ba77..6cf3715865 100644
--- a/package/python-distlib/python-distlib.hash
+++ b/package/python-distlib/python-distlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/distlib/json
-md5  c4df5794463d3710bae3d162bf953ba6  distlib-0.3.8.tar.gz
-sha256  1530ea13e350031b6312d8580ddb6b27a104275a31106523b8f123787f494f64  distlib-0.3.8.tar.gz
+md5  958df85785458fa326a07af4f9c1c328  distlib-0.3.9.tar.gz
+sha256  a60f20dea646b8a33f3e7772f74dc0b2d0772d2837ee1342a00645c81edf9403  distlib-0.3.9.tar.gz
 # Locally computed sha256 checksums
 sha256  808e10c8a6ab8deb149ff9b3fb19f447a808094606d712a9ca57fead3552599d  LICENSE.txt
diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
index 2eba3ae64f..e95c28c518 100644
--- a/package/python-distlib/python-distlib.mk
+++ b/package/python-distlib/python-distlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DISTLIB_VERSION = 0.3.8
+PYTHON_DISTLIB_VERSION = 0.3.9
 PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
-PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/c4/91/e2df406fb4efacdf46871c25cde65d3c6ee5e173b7e5a4547a47bae91920
+PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/0d/dd/1bec4c5ddb504ca60fc29472f3d27e8d4da1257a854e1d96742f15c1d02d
 PYTHON_DISTLIB_SETUP_TYPE = setuptools
 PYTHON_DISTLIB_LICENSE = PSF-2.0
 PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
