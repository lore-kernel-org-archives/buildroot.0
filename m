Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B310D1358F
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 00:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5BC480B66;
	Mon, 28 Oct 2024 00:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxyILKH5fxQE; Mon, 28 Oct 2024 00:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDA6780BC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDA6780BC9;
	Mon, 28 Oct 2024 00:41:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0203C112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D72A480BC9
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGA5qN-XifQW for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 00:41:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8E6780B66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8E6780B66
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8E6780B66
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:41:56 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-83abcfb9f37so146561739f.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 17:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730076116; x=1730680916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oK8KB3LiNka6hIZ2jttImYpQeczaaSMDp9M14C62Lco=;
 b=XfpyxGVgan/C+KdT3eRwN+TjVG4CBX8AR5rL+73BZ0j8JiH6QeO5kUfYrTciYpYMrc
 rJoegR5Z131JB9U1bhX6ynHVRot3WfpCYkCwes806oTVgj70kHiTEQAPtCYOpYOR6ba7
 hYcZFXNAMReMyB8lh0xMMnaHfmAV/6xdZp6gRGhlSXWm6zvAlG9l/0xCtx5GXVT79y/w
 V3Bo6+7A108q0GzHysxwtU94kPFOIiG8CSrJ8J1OQSvXMWsi6TgvaUZg3Eeyd2eSGMxI
 HGQ1NMCK7sNnls1vNzkJDVa/Xi3tn74fWYuExepyuiJ5i2pV530JQoBUeHb32ZFviPJV
 akXg==
X-Gm-Message-State: AOJu0YxqlduZ0Jwv38kokYWjIvTxyWXYm+KJsYYIMaLecFya/o1n0X02
 ITjhnMpOlSbnTd78GY1CeKUxnkzS8K3b671L80TN6O8UyK/dDFjdgr0+qA==
X-Google-Smtp-Source: AGHT+IFa9Fs2NvIHZLCHwsVnUwg6hxW6XZi7t15EYyqFC8TJ7D3181Ky5D8LZz2WkxQWqYWAIG7Uug==
X-Received: by 2002:a05:6602:619b:b0:83b:28e2:4985 with SMTP id
 ca18e2360f4ac-83b28e24d1dmr280239039f.12.1730076115577; 
 Sun, 27 Oct 2024 17:41:55 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72751269sm1367149173.116.2024.10.27.17.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 17:41:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 18:41:53 -0600
Message-Id: <20241028004153.4111803-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730076116; x=1730680916; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oK8KB3LiNka6hIZ2jttImYpQeczaaSMDp9M14C62Lco=;
 b=amSUYemraffPeAxuPBwfp6BXHv/9osJCvoiHO4dh4bGD4sss8urWiYp0ZKvcsjlZA4
 mkEpQnim/gXm3S5NunoFtdLws3j5sV5pJdX+Gey+OaNBFGAAgF61kB60ZSRb22Z2gLTo
 +KMsDz/o0Dz0VBk6Wx55DW7ZXshpa0UanUhYkdWuDYLubTgtDcUk6lNW8K/kfCIx5dqz
 7LWo7VXKHuSRa/W1QCvhFNiEXlzCLJm1SD9N6+nosfxAYPpHIo/ccUDcbdz+KGHV/FGB
 9QKZ5jvs04oO77AaqDpatVZ9VmR9o8rV+2JCSPX21v2H2EA1CW35+BqdFIYa5VqsudKx
 thvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=amSUYemr
Subject: [Buildroot] [PATCH 1/1] package/python-tinycss2: bump to version
 1.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 package/python-tinycss2/python-tinycss2.hash | 4 ++--
 package/python-tinycss2/python-tinycss2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
index abd9dc4b12..4a7b26de82 100644
--- a/package/python-tinycss2/python-tinycss2.hash
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinycss2/json
-md5  736b69f1b164da932028538fe2a60262  tinycss2-1.3.0.tar.gz
-sha256  152f9acabd296a8375fbca5b84c961ff95971fcfc32e79550c8df8e29118c54d  tinycss2-1.3.0.tar.gz
+md5  de6bd20b47354352c2b2344c842385c7  tinycss2-1.4.0.tar.gz
+sha256  10c0972f6fc0fbee87c3edb76549357415e94548c1ae10ebccdea16fb404a9b7  tinycss2-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
index c803167032..b269617ad1 100644
--- a/package/python-tinycss2/python-tinycss2.mk
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYCSS2_VERSION = 1.3.0
+PYTHON_TINYCSS2_VERSION = 1.4.0
 PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
-PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/44/6f/38d2335a2b70b9982d112bb177e3dbe169746423e33f718bf5e9c7b3ddd3
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/7a/fd/7a5ee21fd08ff70d3d33a5781c255cbe779659bd03278feb98b19ee550f4
 PYTHON_TINYCSS2_SETUP_TYPE = flit
 PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
 PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
