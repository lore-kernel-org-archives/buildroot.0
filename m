Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33862C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9849D409EA;
	Mon,  9 Jan 2023 03:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9849D409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xpAFzL-crMq3; Mon,  9 Jan 2023 03:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 820D4409AF;
	Mon,  9 Jan 2023 03:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 820D4409AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97FB01BF86B
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 804E640127
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 804E640127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KU9P15yacuWj for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:42:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29F1340116
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29F1340116
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:42:21 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id o8so4361447ilo.1
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tlwuq96MadW7bZgigLAKGawRy/fDGZxtG5lVA/FHySU=;
 b=2yayJ2b/FOCPfLByWUVap8CmhwUZl1nLKj7O6qztGR6H6rtiLZtiY22ZE6JTq7Z7S9
 qKh3FRUwZvixksYkEn4fiTRyi65BC1UFmBW0BKYzgJPu60kXUJr5N9TXrVC8anc8R+sk
 hci/j5r3xqHEFJhz9ZVdYPG5a2+3havXpNkTYvXvNdQJ20T25GFkHDZQ/PGKtrdMJ96g
 bnjmTJvCicsiawJDjqekrvo0Bo8VMLlEXvs5GZerGgYXLXitaCGAGzouRQI8Ne+sHrVv
 /szaPvP4+NhmCr2gwac5CK5WOU2zGNPCveF0AK8G2wW0bsAv3aTtAU4Sf7VvN2CiAqOL
 3auA==
X-Gm-Message-State: AFqh2kpax4e6VYShMYbzSLMl5Tnk39O4skf37ZnnliGarF53N5wJMhtj
 /DVN/EGl+GScRSfDG8e9mZH4rVUBm1AoYQ==
X-Google-Smtp-Source: AMrXdXvapJjeLTjSUp2nLUrMMMHnUUdRF5Ob5/hjmMb+XCWdU9+VKB7+ktr1dXQTrxsIYB+9xAg+BA==
X-Received: by 2002:a92:364f:0:b0:30d:6ea8:4f27 with SMTP id
 d15-20020a92364f000000b0030d6ea84f27mr12435030ilf.15.1673235739969; 
 Sun, 08 Jan 2023 19:42:19 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056638112e00b0038a346207cdsm2454036jar.84.2023.01.08.19.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:42:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:42:18 -0700
Message-Id: <20230109034218.2150414-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tlwuq96MadW7bZgigLAKGawRy/fDGZxtG5lVA/FHySU=;
 b=Tr84EnqGG1QqAVUY/I8RAPK3BWXLasGyLJhT2jtBcswoHtVYUGiBFSiUCBf948L/yq
 VbaafUDxSNe7jojEw26KwS8R8okChqhuy8EuUmY6Rr+yJoqU6cfD7jpIGl1ia3PWjgHY
 s260GNBMEpAkI+f+YNLzwrM1FVH54LL2GzmRM1c1lRkrepHW2Q6usXcFijHxYRXHbJBy
 Haho35UEIAOxUDBR91pyJKCRnHetxUO/Er4FbNxGXqmxJ5XodaHU91giGJhz6J5BauMv
 TClfZkLb4ty6onReryk2iUS7PYHiSON3n7cE6xdRNx9RMl6eKRW5knQjB69eAedr/lCs
 YDiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Tr84EnqG
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to version
 1.84.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index f0dceeb43d..e9a3992f8e 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  eebf2c558dd1af0f8f32b361e91f2fa3  dbus_fast-1.61.1.tar.gz
-sha256  bda4a7d559047b74f409eda278f68f610a418e86ad3efa0368fa2ed240daa6b6  dbus_fast-1.61.1.tar.gz
+md5  21e3675168e3dbe807c6c8a29267241f  dbus_fast-1.84.0.tar.gz
+sha256  d64f1b68c1c81268e846471caeb9264a9306a6c6ad356c30d5cdf7d1ecc251a1  dbus_fast-1.84.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index de7049ba22..9dd88f613f 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 1.61.1
+PYTHON_DBUS_FAST_VERSION = 1.84.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/dd/f4/a280d46b119d59f6a3d84abf474452ae76651558b0963ab8c48ae13b5a44
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/81/67/a83522d6692a72911c3586e2fcd2363ce22d1522a7e17e1012f255a6083b
 PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
