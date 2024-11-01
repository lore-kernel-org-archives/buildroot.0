Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F03E6F092
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 22:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D5E60785;
	Fri,  1 Nov 2024 22:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4_0K7KMS4ml; Fri,  1 Nov 2024 22:17:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4E4060786
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4E4060786;
	Fri,  1 Nov 2024 22:17:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90AC7112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B5C340573
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odhjan9BF8Co for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 22:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44F464056B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44F464056B
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44F464056B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:17:29 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a6bcbd23c9so1709775ab.3
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 15:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730499448; x=1731104248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k/WYHAtNDoehocHpeGG1/j+ixEXn6evQUzYRB3gNh1A=;
 b=Rz67gpZp26ByQjPvhXNFS5MeCRwo+CXdTRClK9c0jDdNaIonZA/JXiKTIrzyMotZ/i
 sItcJCH7RtsYttVYa748MGHZF+FjJgsapF73TFb8kg/DCx6YIDD2+eh5KKW88e4H0qJh
 BuFTnEZ2Yntrp4rm1KDxiwYkAYYKpBlHhmKlyavZH1RPaHSnIJc//7m5i+fu30htNOrN
 6TBQitAz8qX+Uq6xRbSGqM3r1dTWHyssP4NiBWjftYqZwURptMWNWBwo6pny1lZY2xca
 jRstqPnJHmSHnVpUKpS0NrCGY3ogrXzPy6r7WyBc8X67HzSNvWBQuDtMjPgDFoQt4aA6
 6jSQ==
X-Gm-Message-State: AOJu0YzEJC0fnjp5tAsS0GNXkP/lpXm3Dh9u0S7MaMotXhuGxmWtl9gN
 zveDFmjQbvP/1R5t90yYm4bfDAKGU35pExG/aMj9TcP3UULCmS0h7OTUkg==
X-Google-Smtp-Source: AGHT+IFNo/LhkbqsjnOYbHaCEOvr+GQ8L8C8/Qqp+B8NlGOhr/YOS6ZD6wqd5JWCWnS/xDt/zimNCQ==
X-Received: by 2002:a92:cd88:0:b0:3a1:a619:203c with SMTP id
 e9e14a558f8ab-3a5e262e89cmr141015195ab.23.1730499447908; 
 Fri, 01 Nov 2024 15:17:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048bfc01sm916217173.58.2024.11.01.15.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 15:17:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 16:17:26 -0600
Message-Id: <20241101221726.1305455-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730499448; x=1731104248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k/WYHAtNDoehocHpeGG1/j+ixEXn6evQUzYRB3gNh1A=;
 b=TASXxD5yKd+/pwz6x0tFp/zgK6xc4FHLbI6yiruWKR9YN83JPdl5zx0VT8spdSGAAp
 qSZ/5bTV7EK+hZ+YBvmywnZhaf0jyppfKK0SunDyDpLhTI8rrLMTwwogupYCNVA3UyOB
 v+bcA8mDaKdE3z/UdfcMnVlmT309OTCWZN5Z0Ow2ECH0jFe668DINJdCVuO8rsa/3Ody
 vpvaCM/dhFYRGes7dpbHv+DunjcXYU/91HGMBjQFcWrusF8sYN/qV62EC5Xd22SO+ACU
 /DbAprhqi6pBaobnjB8cKQ7htV1+x/mtKj1Z4E2S0K8ayS6pGlOGIcLvor9NQyeRM3et
 a+og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TASXxD5y
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to version
 3.1.1
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
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 8060e78a35..927400f833 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  0d13f3dbe9b08aecdebe3d9b61cc58aa  werkzeug-3.0.6.tar.gz
-sha256  a8dd59d4de28ca70471a34cba79bed5f7ef2e036a76b3ab0835474246eb41f8d  werkzeug-3.0.6.tar.gz
+md5  6d7c384dc2616f434be9893bc1ae4452  werkzeug-3.1.1.tar.gz
+sha256  8cd39dfbdfc1e051965f156163e2974e52c210f130810e9ad36858f0fd3edad4  werkzeug-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 1e2567fc64..04e345f422 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 3.0.6
+PYTHON_WERKZEUG_VERSION = 3.1.1
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/d4/f9/0ba83eaa0df9b9e9d1efeb2ea351d0677c37d41ee5d0f91e98423c7281c9
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/32/af/d4502dc713b4ccea7175d764718d5183caf8d0867a4f0190d5d4a45cea49
 PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
