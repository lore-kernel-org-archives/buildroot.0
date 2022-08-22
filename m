Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3119DC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 07:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A506540276;
	Mon, 22 Aug 2022 07:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A506540276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2SiL_VvixOlb; Mon, 22 Aug 2022 07:08:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5091840923;
	Mon, 22 Aug 2022 07:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5091840923
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 851791BF577
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65E8140923
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65E8140923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uMCwW9cHA4pX for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 07:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DCE8408D5
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DCE8408D5
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 07:08:04 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id bb16so11207879oib.11
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 00:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=d9pnmIhJFmipmsZqlS0kbveW0cwOTqm9Q5TnDHlNves=;
 b=gLMZ+wogPsze4JqsMY3Cfx+wphjzL2kzkd2HFeNeJYnoakTQaPtSvXR9G/Y539MeyO
 +eM5r2MDSfa1hByIbE6uXtUs5QctAGXgvPgxezay4LaAVKb8TZ7zqyDAVDtiHMOHsiOl
 P6/cRFCqPe07SpYsYNlb5RJW2cq52KY7AaTy8PoGOda/gzG6PWXeGEVq8yETWJNWCDTX
 YDr6r2t6QQ3Ueu9D8zJkVK7X7wq+zVIAuSj32BvIZxNWT8EaYP0B/lqLDMH3GTcB9Z/n
 oWR5SYwYZkeqtMYL9d6mOBAJpVgH29Uy45gTk7S3gc+6b+7Bf0767J5VnIfXTmBDhV/D
 VNpQ==
X-Gm-Message-State: ACgBeo1oA7ju8//03LUDneJN+GjZZR3rEnvXue8zOniZAzg4Qj16O3uk
 VYsOXSBV56EyCjT92jgr4FhAwHGu/jQ=
X-Google-Smtp-Source: AA6agR4ut5eJ8irc3Dpn+iqsg+3eAoMhMH2X8KDuT3ACBQAYC78L8Fx8rD7YJj+iGh0g9C4LXlqP2A==
X-Received: by 2002:a05:6808:ec3:b0:2ec:8fcb:1d4a with SMTP id
 q3-20020a0568080ec300b002ec8fcb1d4amr11083987oiv.162.1661152081805; 
 Mon, 22 Aug 2022 00:08:01 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 r26-20020a056830135a00b006391bdbb361sm1162132otq.31.2022.08.22.00.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 00:07:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 01:07:56 -0600
Message-Id: <20220822070756.2928475-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=d9pnmIhJFmipmsZqlS0kbveW0cwOTqm9Q5TnDHlNves=;
 b=QUPL9THubQrRR7UW2S82iQPH+40opiQFDpEoyGaJBr0Kis4nJE9fcMsunKlTjWo8AB
 VzSNJoK8xANPOysQqz0n4mo8rxKsaNPk7n1OQVdnZfJ2I2EQvQSeZRbb4hcE0yCjmV0M
 adbC1jz24PwqJCS6RStqKNOeYtAkM9T9QbTDQ5yCucJTyoJ40nAVN8XJuTOv1iep3+Iz
 A/ksryVlcWLzjbbz0t0oqAD3CKexq5nHYPDKTE/tO/KsSOKs5iwDYr+JoWJWkS1XKXEs
 +N3ezocfvIqpPb6T2gsGmLInsji1yrSR7qfrxcTE7gVVYx6sCJH6Uo4D+Dv6tm9UuNRp
 z27A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QUPL9THu
Subject: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to version
 1.3.1
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
 package/python-frozenlist/python-frozenlist.hash | 4 ++--
 package/python-frozenlist/python-frozenlist.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
index 034150397b..4d1ac3b411 100644
--- a/package/python-frozenlist/python-frozenlist.hash
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/frozenlist/json
-md5  e65d870bd189ba3c21ab7eb10eab22b7  frozenlist-1.3.0.tar.gz
-sha256  ce6f2ba0edb7b0c1d8976565298ad2deba6f8064d2bebb6ffce2ca896eb35b0b  frozenlist-1.3.0.tar.gz
+md5  6ac017ba79ac7a1491e47e89012efeab  frozenlist-1.3.1.tar.gz
+sha256  3a735e4211a04ccfa3f4833547acdf5d2f863bfeb01cfd3edaffbc251f15cec8  frozenlist-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index ad618971f7..51b5d42832 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FROZENLIST_VERSION = 1.3.0
+PYTHON_FROZENLIST_VERSION = 1.3.1
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/f4/f7/8dfeb76d2a52bcea2b0718427af954ffec98be1d34cd8f282034b3e36829
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/8a/95/229aacfe85daa28e2792481a98c336bc30d3729533e6a44db537880aca21
 PYTHON_FROZENLIST_SETUP_TYPE = setuptools
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
