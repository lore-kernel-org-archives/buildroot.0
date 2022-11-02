Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A946FC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A5E24170B;
	Wed,  2 Nov 2022 22:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A5E24170B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWZ1iCjPLd4i; Wed,  2 Nov 2022 22:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1236741704;
	Wed,  2 Nov 2022 22:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1236741704
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2644D1BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0069341703
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0069341703
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWUpAMRg0Iml for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:26:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22F141701
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A22F141701
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:26:59 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id d123so11519897iof.7
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 15:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HneCP0av5kVVo/CrWoFoVYDXR90+awBRwwFf1ZJB+m4=;
 b=mXSmaQ05aYtozM6z7isPpaLJFuanKmVStJkEqfbs9MeHjCzelDTLT9ynshto6xCRSk
 0/K8LHRO7xvfe3JgHlB6d+4I5TzMJigIk+zdwFkuOKW0GYsmBFrxK+0YcCT4UPlskfyr
 fE9ExFI8Guf/Qn+3GLHuICPyt0JgUEC9rG6NO3Z80L5eFg/WkaISShKoUAMd5lpknA0h
 RG18FvgCNpriWUgxRxDrqGESMTg0MkENefwgSQ173QwdTIQPBhgY1lyrg5WX5CRb7HPj
 NM0L+TVLvRM/PJ771FPiuyYfjfQ8o65tCA7eQdE5OzIjIUdXxi5A40rdpRS0FIDMYda1
 +xtg==
X-Gm-Message-State: ACrzQf19OTuJcgiFJdPDfMs+XVQuNwTHkRJBcyYXRvvaBmPQKimykIC8
 raQpeE4kJT1r4k/e8NxbJiRmzXKBkRLgXA==
X-Google-Smtp-Source: AMsMyM7CI8acbCphDwnMZb4kB4hFxQYAxKY2MAZ/JJ1B2JYNPGegupuPuriO11tbw/nnDbeVCE4zrQ==
X-Received: by 2002:a02:c6d9:0:b0:373:e154:268e with SMTP id
 r25-20020a02c6d9000000b00373e154268emr16811953jan.291.1667428018200; 
 Wed, 02 Nov 2022 15:26:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n4-20020a02a184000000b00346a98b0a76sm5194885jah.77.2022.11.02.15.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 15:26:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 16:26:56 -0600
Message-Id: <20221102222656.3272628-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HneCP0av5kVVo/CrWoFoVYDXR90+awBRwwFf1ZJB+m4=;
 b=pz1MRwhdf60AhoYeV074gVKRktsPWVkAZf9qswKhUYVWy5pL54zewGwTxKnHtJa8PG
 Z4xR9/P0CLsLDgzT8s+xJRiYT5O6QlmNfmij70VNk8lUUuLb/VK5aOQ9QF3xtxkfVnNd
 JCktwzLDOc+0gV5qu/BUJoYybekZvINkEuImqQRuYDxeFPZ51y4AckctkPC7IzjSIoEW
 WXuFUnYGKrE7VoviQzJlQmfjGcBJwYqTyc8T0YFtQhCuIemrE5V2FpGI2k8bKl7Ol1mN
 UBmDtxj+p7Rm3/ueTsBGbzGkzWbt2Sr1Fwoj3aulqWIqhX7QUsa8EktOHcNgzdoBTODQ
 kmXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pz1MRwhd
Subject: [Buildroot] [PATCH 1/1] package/python-iso8601: bump to version
 1.1.0
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

License hash changed due to date update:
https://github.com/micktwomey/pyiso8601/commit/406db6f23ffbf6815a320c30be070b89d28e2974

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-iso8601/python-iso8601.hash | 6 +++---
 package/python-iso8601/python-iso8601.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-iso8601/python-iso8601.hash b/package/python-iso8601/python-iso8601.hash
index 76dd5ec452..7c6d3f3ded 100644
--- a/package/python-iso8601/python-iso8601.hash
+++ b/package/python-iso8601/python-iso8601.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iso8601/json
-md5  d6fe8ccc847aaf8ac965da3b6023e697  iso8601-0.1.14.tar.gz
-sha256  8aafd56fa0290496c5edbb13c311f78fa3a241f0853540da09d9363eae3ebd79  iso8601-0.1.14.tar.gz
+md5  29dd454d638bd684bd3466583f6724dc  iso8601-1.1.0.tar.gz
+sha256  32811e7b81deee2063ea6d2e94f8819a86d1f3811e49d23623a41fa832bef03f  iso8601-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  116d368d14a8cf0061027c944c60ee20b476ce42814818a7d627396906761f16  LICENSE
+sha256  516b02cd11e78c37a04f9effadd85af0483dda7ab1e715eef1cc94f97dc49e13  LICENSE
diff --git a/package/python-iso8601/python-iso8601.mk b/package/python-iso8601/python-iso8601.mk
index 3f128d15e4..68bf69933a 100644
--- a/package/python-iso8601/python-iso8601.mk
+++ b/package/python-iso8601/python-iso8601.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ISO8601_VERSION = 0.1.14
+PYTHON_ISO8601_VERSION = 1.1.0
 PYTHON_ISO8601_SOURCE = iso8601-$(PYTHON_ISO8601_VERSION).tar.gz
-PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/f9/ed/b97abc7877e5b253eef96a469f47d617b0ebcccc735405fa1a620c7ee833
+PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/31/8c/1c342fdd2f4af0857684d16af766201393ef53318c15fa785fcb6c3b7c32
 PYTHON_ISO8601_SETUP_TYPE = setuptools
 PYTHON_ISO8601_LICENSE = MIT
 PYTHON_ISO8601_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
