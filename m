Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF596C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 07:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 831AB404F5;
	Sun,  5 Nov 2023 07:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 831AB404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8TQH0MgerPv; Sun,  5 Nov 2023 07:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78F08404EB;
	Sun,  5 Nov 2023 07:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78F08404EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7871BF592
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55D1082268
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55D1082268
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwH_JxxY2Sks for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 07:57:18 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D10582240
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 07:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D10582240
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7ac7b2b1e99so130731539f.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 00:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699171036; x=1699775836;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YgYZzWZE75QN0qUS/ZH7utr81DMBGXsDEKNVw8RLrD8=;
 b=vMdYV3WwEht3DJezPmKzH44Jyv2T4XAa7xiF5g5Rq1Gc8fOGPEpIalC+LAoq8jIiI3
 SkSZibcacj33w0XfAV72eMFX1DTXzh61EEwDQrighVtdGE651kDNIdo8EVL4Xi7320Ft
 LeLeDavJWStH/a9H/qpXq+hlFhoMIIL6gVpBRqL4thQp0enwmDvLLqOeYjFs54vk5q3x
 gIfuCnmxyM6avkVmkXmlmYDukeLUJRDHdoOQdrHiBhji5rDDEcDDOpN+UreuYHkVCbYV
 y76shOI8jJ7K2CoI7z2/sxWImdPLzT8323GFIwSHUfZjra7VaPvb0EuF49swHlEGkz3q
 ggDA==
X-Gm-Message-State: AOJu0YzIhdB1MB2M9oCzkhw82lDZX04Op+/hGsqB8zuTmZIYy6qR+UqO
 wDxOI2YuBlygncmSmd3ndrrszzX/pLM=
X-Google-Smtp-Source: AGHT+IHrt51RxlYAP3c1ucnaK4XZOgSz+xQGeSWdYjoIfQH9JFYI99cUDYM9De41JTNwyvzQtfaJuA==
X-Received: by 2002:a05:6602:13cd:b0:790:f866:d71b with SMTP id
 o13-20020a05660213cd00b00790f866d71bmr33388550iov.13.1699171036704; 
 Sun, 05 Nov 2023 00:57:16 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 k2-20020a02c762000000b0042acf389acesm1424639jao.71.2023.11.05.00.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 00:57:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:57:09 -0600
Message-Id: <20231105075709.2892493-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699171036; x=1699775836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YgYZzWZE75QN0qUS/ZH7utr81DMBGXsDEKNVw8RLrD8=;
 b=f2WRZKMxndk8hpkIBO0IjXn8hEt9wAFjRJUYt7vq+FzQt0FOPIpzikCwHnJnA2ghNr
 7bfLar2CaKvzo6YylbUH+MJYM+MHN7EoTuwqiad7EmAkZHe99Fh+FUjF53EAf6Rzv7K7
 0qc5vk3vtlbeiIqRS7DVusojobCzq3a6NNli2U+RoxtlvpOMfsi1bwPNk4ceVNnhlZPk
 iwJ8Jo+3fKoWSBaCEs/ZTagosTdQSE84l1tFU3Gx/leCTFw3zy9Z6gYyNqBGjDRDZBv7
 KXg50Jl9Vb5AscFQxCjW2YnW0NPbJMcOKBFCtTy0s6UMFlxXxwUhx9Rc6XRbJqQa2D5f
 W2fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f2WRZKMx
Subject: [Buildroot] [PATCH 1/1] package/python-iso8601: bump to version
 2.1.0
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
 package/python-iso8601/python-iso8601.hash | 4 ++--
 package/python-iso8601/python-iso8601.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iso8601/python-iso8601.hash b/package/python-iso8601/python-iso8601.hash
index 7c6d3f3ded..fe643ce8b7 100644
--- a/package/python-iso8601/python-iso8601.hash
+++ b/package/python-iso8601/python-iso8601.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iso8601/json
-md5  29dd454d638bd684bd3466583f6724dc  iso8601-1.1.0.tar.gz
-sha256  32811e7b81deee2063ea6d2e94f8819a86d1f3811e49d23623a41fa832bef03f  iso8601-1.1.0.tar.gz
+md5  6e33910eba87066b3be7fcf3d59d16b5  iso8601-2.1.0.tar.gz
+sha256  6b1d3829ee8921c4301998c909f7829fa9ed3cbdac0d3b16af2d743aed1ba8df  iso8601-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  516b02cd11e78c37a04f9effadd85af0483dda7ab1e715eef1cc94f97dc49e13  LICENSE
diff --git a/package/python-iso8601/python-iso8601.mk b/package/python-iso8601/python-iso8601.mk
index 68bf69933a..ce25a2fb28 100644
--- a/package/python-iso8601/python-iso8601.mk
+++ b/package/python-iso8601/python-iso8601.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ISO8601_VERSION = 1.1.0
+PYTHON_ISO8601_VERSION = 2.1.0
 PYTHON_ISO8601_SOURCE = iso8601-$(PYTHON_ISO8601_VERSION).tar.gz
-PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/31/8c/1c342fdd2f4af0857684d16af766201393ef53318c15fa785fcb6c3b7c32
+PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/b9/f3/ef59cee614d5e0accf6fd0cbba025b93b272e626ca89fb70a3e9187c5d15
 PYTHON_ISO8601_SETUP_TYPE = setuptools
 PYTHON_ISO8601_LICENSE = MIT
 PYTHON_ISO8601_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
