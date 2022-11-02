Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28ADC43219
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 17:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F0260E62;
	Wed,  2 Nov 2022 17:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62F0260E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CIihAAt-ZSZb; Wed,  2 Nov 2022 17:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E55860ACA;
	Wed,  2 Nov 2022 17:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E55860ACA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D35D1BF294
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0785F41673
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0785F41673
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTdAn9Pg5Rlg for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 17:39:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C7041619
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7C7041619
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 17:39:21 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id 63so15620044iov.8
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 10:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9vmx88pGWzkOU7GTMiQbaiQKvuhTN4x1vf+fbHeM68Q=;
 b=xw+QGu8W1to/pUBpyVKzS2FGWv+GreBydAit37OV/lckK2cms6HH05sZT+oNoBfxuw
 AkKCmAC3lSRir59f/MtBOkd3Mn3dP8DhDNYwv0o9qBMAmuzPPLYXddLl3IdJfpRodiUm
 1tjCJGK4CnoUe8n3wmOFKZvVWKBcOPOjAh4/rM5PBRghZK7AiXvjCVRBMFG/q2PeippV
 5jVxeQ5MsWBZ9rhSxy3jXCNoNl1TDCUSMzqlNCYyAuavfmhQzL1F3PlgdHxxGHUbTg6F
 CcKcxer0rruYP65FlMPZisNXEOq9sz07oJZVj4k2tuKVezlG7nY/GsYGrnoflRfu+TjP
 l8Ug==
X-Gm-Message-State: ACrzQf1DIYFreOqY2Q7BwBIvQthpUFRkS1fxPoQYOr6xz/VcJz/xtUkx
 lv5N5eydcuYKlKA0lI5UZMMmggUEvABFGg==
X-Google-Smtp-Source: AMsMyM4ge9Fay5JUXSI/kQryGgkRt6G11HvwhEQe31W5/gIKsFH2tcgfaeZj9TNnbsMQO8uWEQYcZA==
X-Received: by 2002:a05:6602:2a46:b0:6d1:877b:860e with SMTP id
 k6-20020a0566022a4600b006d1877b860emr11200748iov.146.1667410760677; 
 Wed, 02 Nov 2022 10:39:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o14-20020a056e02114e00b002faf7965948sm4787541ill.55.2022.11.02.10.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 10:39:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 11:39:18 -0600
Message-Id: <20221102173918.1945927-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9vmx88pGWzkOU7GTMiQbaiQKvuhTN4x1vf+fbHeM68Q=;
 b=qSzsWUKNAUXO51ZmJhgIOnyqv6AHDjn9H8SkIeD7zUBwltlUtsBbmaSKTEAexp5A9g
 SwgkG8wD0JfXyOTtZJFF6wGY9vkx9v3j7sS8hvho2XhZdMPwI/q7Qfm4jzplGkewi4HE
 2LFv2AiWtzd4sV1hdpK2GOPghIvXYhB959PkCkD1HE40+L2zEaho7K+LX7Y2AVFvr32f
 lJiy+a0AVfW99a3SzFlgt6748oWm4ALgJOtkHBFHkzDQfAuLmZxgZKR7ApN77f3TcH9q
 t7k4U3h/Z2HZCbCwmSkxP8y4LfxsU0ZrGcLIT/YzkCm5TheYwbXekl9ePxM2ton6TTxP
 r3rQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qSzsWUKN
Subject: [Buildroot] [PATCH 1/1] package/python-aioprocessing: bump to
 version 2.0.1
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

Migrate from setuptools to flit build system.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aioprocessing/python-aioprocessing.hash | 4 ++--
 package/python-aioprocessing/python-aioprocessing.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aioprocessing/python-aioprocessing.hash b/package/python-aioprocessing/python-aioprocessing.hash
index cf92a72d4a..8913a7abb0 100644
--- a/package/python-aioprocessing/python-aioprocessing.hash
+++ b/package/python-aioprocessing/python-aioprocessing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioprocessing/json
-md5  838b6aa073f1373bd42204f86b0e3196  aioprocessing-2.0.0.tar.gz
-sha256  469dfb746e8c4e0c727ba135cfabf9e034c554f6a73c27f908bfe3625dd74b9e  aioprocessing-2.0.0.tar.gz
+md5  e533c65f5879374c27f266c2040405ea  aioprocessing-2.0.1.tar.gz
+sha256  fe01c7b1a38c78168611d3040e73d93036c3b7c8a649d636dc9ed7a3bc9b1ba2  aioprocessing-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  53c809e8f0b91a68a39477e5fbdf77fe2b74dd6a1647c2dd9b7b22fed135239e  LICENSE.txt
diff --git a/package/python-aioprocessing/python-aioprocessing.mk b/package/python-aioprocessing/python-aioprocessing.mk
index e1e919de2d..6cd59ab599 100644
--- a/package/python-aioprocessing/python-aioprocessing.mk
+++ b/package/python-aioprocessing/python-aioprocessing.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_AIOPROCESSING_VERSION = 2.0.0
+PYTHON_AIOPROCESSING_VERSION = 2.0.1
 PYTHON_AIOPROCESSING_SOURCE = aioprocessing-$(PYTHON_AIOPROCESSING_VERSION).tar.gz
-PYTHON_AIOPROCESSING_SITE = https://files.pythonhosted.org/packages/8e/3e/54266241660fb026bfd27f660d44cd81a4b7f8a145d8e2db010de12622a0
-PYTHON_AIOPROCESSING_SETUP_TYPE = setuptools
+PYTHON_AIOPROCESSING_SITE = https://files.pythonhosted.org/packages/4d/85/9a75151e7049bf144c01384279201d82d99484bd658f8e6fb013552d8724
+PYTHON_AIOPROCESSING_SETUP_TYPE = flit
 PYTHON_AIOPROCESSING_LICENSE = BSD-2-Clause
 PYTHON_AIOPROCESSING_LICENSE_FILES = LICENSE.txt
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
