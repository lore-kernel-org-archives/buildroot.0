Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C56FA3741
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 03:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 581ED60E87;
	Sat, 29 Oct 2022 03:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 581ED60E87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2bOWHoMQXceo; Sat, 29 Oct 2022 03:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B87607D1;
	Sat, 29 Oct 2022 03:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84B87607D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3656C1BF9AF
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F9B1410D5
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F9B1410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSlwp2svDDv4 for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 03:11:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA7B64148F
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA7B64148F
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 03:11:31 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id h206so2610026iof.10
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 20:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cN9FfMdNuQKSvZ1frNQoyh2/abFJVmraxlYkMAsSt80=;
 b=eqMgyvJ+vy4LKdXrTqJu2Yfg21F5i4A2eb5VB6oqUZu5VLvpahACumECzwCudwvanY
 Uw5OQ72u9gxgmqCWoYmUnO4h1C3q3kcxfILAJ60UIyCgHTOz/SnAuDfs3Ez5aaBmUWNk
 QMNDbk0jInt0F5bjdBOm549NEmP/z3eZzUVF5adHNGVNUtY/iyAoCiauf5wZ7PretSa6
 8gwZdIzl93/hbF0IlUVglULEHuwqldw74EDDOnZaz3UGfOXGrknYldRoAJ2n3GqTFe+T
 UFf8/j3qMNLEtxbGQmYHjt9CkayMLTjPg1evwTmV5UDSYbbC4wkhvaw9iGH1mYQ2fJ32
 SrKQ==
X-Gm-Message-State: ACrzQf0Y/WcykSayswhmPFkTEDf7ZyZz+q9Xat0uc+CDTbaKuWgwBLQV
 GUu/RcgOfNBgZjFwRl6ZpYk/bV3ufpzTKw==
X-Google-Smtp-Source: AMsMyM5n2fXA04jx1NA8zVWZ0xRHdjoPwXpQEM1Ozaaa0VAVOZdWj1kuGbUee/qFN0VXSkyFnL3mIg==
X-Received: by 2002:a05:6638:1394:b0:374:798:98a1 with SMTP id
 w20-20020a056638139400b00374079898a1mr1115294jad.61.1667005574543; 
 Fri, 28 Oct 2022 18:06:14 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05660208c700b006bbddd49984sm96806ioz.9.2022.10.28.18.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 18:06:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 19:06:12 -0600
Message-Id: <20221029010612.1391444-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cN9FfMdNuQKSvZ1frNQoyh2/abFJVmraxlYkMAsSt80=;
 b=NchUDlAT5O4WLRnAr1UObVGygcoG/8mKQrxME+UbW86xNsECws9ZEB2Dgc1IiyTqKk
 if/zoueS4Uk9b9O6GZ0l4l8/09bK0CLtlLvNc2FcbOl+B3iOh9rZalBWtpnPTbF6ZJ2c
 7nRsfJeybvatd3JgZKFapAQ6DVUhPpHHIlQCkRv+OL7YjE5va+UbkYGTute60mwfZz9u
 s80xr8sNrn7SDqjXA2IFtzlhUxafV3Kx6c54SoXrs9KDZXvjyE6VVcNxMp5CgSzKQCtg
 rhoJs0UzeDY0B9fiVt/LSuPq1q+lYFWM21wrFA9VCuozMe05Vdtc/KUgKjgX9WBr/CiI
 nITg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NchUDlAT
Subject: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to version
 57.0
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
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 68b895361b..21e58d3677 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  0a339942d1d238aa0b974c1ec1580c03  weasyprint-56.1.tar.gz
-sha256  27f796abce8edebc9e5b3cff2d095a9fa2b0af5766801431659db51203c70b38  weasyprint-56.1.tar.gz
+md5  b270213554d781c86b6c3d390b097f2f  weasyprint-57.0.tar.gz
+sha256  7b6f5cc13819e9a7d8748c1dbf0e8d2444f7a4818a98339f82dccaa822bf911b  weasyprint-57.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index aff9a31a43..9dd364e1c1 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 56.1
+PYTHON_WEASYPRINT_VERSION = 57.0
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/30/2c/9c29989bf03bb573bd963c2cf167839099bdaff05aff1f0eff2ccbd1b509
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/b7/98/cd0df64b306ac901ffd53c50d9d5d79d92cae756b6469fc14771adb39d77
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
