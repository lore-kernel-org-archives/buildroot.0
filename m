Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED50C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 422B860FCC;
	Thu,  3 Nov 2022 18:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 422B860FCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1GhQTdqBPQB; Thu,  3 Nov 2022 18:13:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7EB160B0F;
	Thu,  3 Nov 2022 18:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7EB160B0F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DDA61BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 769B360B0F
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 769B360B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLkWJDhQPK2M for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:13:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FEA160B09
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FEA160B09
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:13:38 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id y6so2017779iof.9
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0tq6rEvkoDT1PWxNPLa4MGNASkMC6UGd27XVG59Cy5c=;
 b=AJU/n1MWsiuGsOOZ/gGCxHfn4C7M5unobUNmWx4fFr7Jthy58yxdyOBzXxyKj8hS17
 vNMhRRnNinvLCbMnbsQpc5cXfs1Bi9m8C4B8gmBoMz87iUFeblTimwJj/9QfD52aj78I
 UNOn08sQSFcZj6SgYwsSBi0YxPrvaBXzXzpXTSGBaaK/wHc/P56mw/4VYb69jklFhzU1
 dCg/r56qLFvjQgBp2Fn6hVNRPVx9mhh+2T4sAzFwA+7yFjWPSkX8DX33HvoDlPbLPD7K
 hsy/PBFMOzr7rNkf15/PLeuvyeDybp9lGCGxvkeSHEexJTIxP82iukrPGNx+WDLYv9Lm
 xpdA==
X-Gm-Message-State: ACrzQf0pZ12IOfm/8zfDAlB+6y3tCFQXHeskRHMQssbbUEAMT4TvmkjQ
 l7GR6blhTNKzeifyU+dQmqkHk6yNK3fSY0HX
X-Google-Smtp-Source: AMsMyM4czrvBBV/rUB21KWsGcDqMbdfHpoKsABqlBNxwtsKguVEU19PoE32UIE6XeuhDrMtyN7QPQw==
X-Received: by 2002:a05:6602:2d82:b0:6d4:cc5d:b980 with SMTP id
 k2-20020a0566022d8200b006d4cc5db980mr5286336iow.80.1667499216896; 
 Thu, 03 Nov 2022 11:13:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 p1-20020a022901000000b00373aa370dc4sm400979jap.137.2022.11.03.11.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:13:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:13:21 -0600
Message-Id: <20221103181321.384630-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0tq6rEvkoDT1PWxNPLa4MGNASkMC6UGd27XVG59Cy5c=;
 b=ht1/IRRPFL8EWiC/XXC0xHmx82VQwqjuNlQ9vIaTdI67XghH7tlGD3TFtuuiBoHMrc
 Mh07VfZ6UJj9EtErlEgpHSXlVlAgkmwjr+0kzYFSt1vE/cIvxvZ+65bdiwat0WkUBzYI
 c8xOUn78Qncli9CRUkavuhq2xkq+PBR5GeBQw28PYp97MOyrqvt+fqP8MZK8FtGXfVon
 pCrm+js+Llg5NcF7wG1toqM3J/fr5vFUBVe90+fFvB6Q6AcOMsgf67F/OF6FNoCcNQhZ
 czZF3kXZ8HwqWceks5LctKMjyO4YX94wUZlv48im8l/dtK7kfmGpdhyRVqzVMCy5UzlO
 BsSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ht1/IRRP
Subject: [Buildroot] [PATCH 1/1] package/python-pyrsistent: bump to version
 0.19.2
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
 package/python-pyrsistent/python-pyrsistent.hash | 4 ++--
 package/python-pyrsistent/python-pyrsistent.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyrsistent/python-pyrsistent.hash b/package/python-pyrsistent/python-pyrsistent.hash
index 70d1cc6fa2..bb55c7135d 100644
--- a/package/python-pyrsistent/python-pyrsistent.hash
+++ b/package/python-pyrsistent/python-pyrsistent.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyrsistent/json
-md5  cef3da08455664bf917dcf8cd00d49a4  pyrsistent-0.18.1.tar.gz
-sha256  d4d61f8b993a7255ba714df3aca52700f8125289f84f704cf80916517c46eb96  pyrsistent-0.18.1.tar.gz
+md5  23da81256b8817e123568a858bf78997  pyrsistent-0.19.2.tar.gz
+sha256  bfa0351be89c9fcbcb8c9879b826f4353be10f58f8a677efab0c017bf7137ec2  pyrsistent-0.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3ea56753cbd0cc897d3f4414a902f5694991db7c1b3abb8230216381185f9112  LICENSE.mit
diff --git a/package/python-pyrsistent/python-pyrsistent.mk b/package/python-pyrsistent/python-pyrsistent.mk
index 27ec41028f..6a5ac30a15 100644
--- a/package/python-pyrsistent/python-pyrsistent.mk
+++ b/package/python-pyrsistent/python-pyrsistent.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYRSISTENT_VERSION = 0.18.1
+PYTHON_PYRSISTENT_VERSION = 0.19.2
 PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
-PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/42/ac/455fdc7294acc4d4154b904e80d964cc9aae75b087bbf486be04df9f2abd
+PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/b8/ef/325da441a385a8a931b3eeb70db23cb52da42799691988d8d943c5237f10
 PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
 PYTHON_PYRSISTENT_LICENSE = MIT
 PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
