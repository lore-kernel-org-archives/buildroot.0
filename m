Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FDDC352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 04:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3650C4091E;
	Tue,  6 Dec 2022 04:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3650C4091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id llXrdZLTxpaw; Tue,  6 Dec 2022 04:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F9C40917;
	Tue,  6 Dec 2022 04:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F9C40917
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F1A41BF358
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 04:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE5B860AD6
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 04:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE5B860AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8ns6jSDRY-F for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 04:42:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 186BB60AAC
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 186BB60AAC
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 04:42:00 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id v1so4432058ioe.4
 for <buildroot@buildroot.org>; Mon, 05 Dec 2022 20:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DNLF7VqTZVAFCwQ/zrC5fzmM0E4C+4GrkpmtZZCvGY4=;
 b=M70B8YEQyx9zkq2P1LesZRBczAAzlYdB6mESq6zTj/2BRjv9SFWib355H1a7IOcU8U
 Q88ahV9BpABEd/Nna7OPXhFQrRkXG73Tjd4s5TtFUa0aNy/4MckL0LDKOolMyDjtzVqL
 bp+/Zc/Q9a3oAQ1mxsbhsMuAdEfznWHyerZ5nihpWXTQP+nHN+WyuwegA1gx+fHAmD6W
 neuT/T0yi/3WKQEbE/mrk71aosZGt6xh6jGBE7B8wo68DT5mURWv9dY+aoZKdPlAXFUc
 jKGAVnqvbnxAOnGs0f5aH9e0A8MT7MdE2B24OOShJc6ZOd1rNneRBx6hybayBN58/Jyw
 P0sQ==
X-Gm-Message-State: ANoB5plWhwASbObzfufWOhLHY9sF2aJMxqx8UwYmxdzcYyVEhc2861Rd
 j8VLcuiBYwrHLdlr9VYJ9SZiVJSXYOk+W+rZ
X-Google-Smtp-Source: AA0mqf5yB73cBkQ0cE+tpC1a75zgGQcXTYr6COxPDqOs2qst0G0aPWNiJ/ioV+idr0HDWkbWwGJg5A==
X-Received: by 2002:a5e:a505:0:b0:6df:80f5:c0e5 with SMTP id
 5-20020a5ea505000000b006df80f5c0e5mr18106878iog.44.1670301719002; 
 Mon, 05 Dec 2022 20:41:59 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 n10-20020a02a18a000000b0036332a07adcsm6247184jah.173.2022.12.05.20.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:41:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Dec 2022 21:41:56 -0700
Message-Id: <20221206044156.2804371-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DNLF7VqTZVAFCwQ/zrC5fzmM0E4C+4GrkpmtZZCvGY4=;
 b=RvCt1yh6vgSvFEecIVnbYu9Y8IJ35DzKeCN1qxTUyORWXX93Z4znqzo7QPYIR4+IM5
 z3wh6gXxmnCsdLlMah3zk64bGOR8dlXgRaYkXlBfF6tNMdBqrvNHYP3aZyYKJZN1Sl6Y
 p8JI/cNpIFKuour8Zo/z12U1IzI1Y+mB7yIxSS/w3dOGT3+Br0aBPow8LPXhQ7CcgwBT
 TeMZHBorEiB+UUOOerPodWkA3teTzEVdeY6N/5n3l00c/HXuFMAMqhpHW9X4Z+HMg+B6
 bzsA3OdBJ1mcsFyZQi8ihicmd7Wjma51dtL/V4edUJykgwlzlNABxgwSjDkWlivqOgDo
 aeHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RvCt1yh6
Subject: [Buildroot] [PATCH 1/1] package/python-pep517: drop
 host-python-tomli dependency
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

The host-python-tomli dependency is not required on python version
3.11 and newer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pep517/python-pep517.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
index 1fd294fbb4..c43b09faaa 100644
--- a/package/python-pep517/python-pep517.mk
+++ b/package/python-pep517/python-pep517.mk
@@ -10,6 +10,5 @@ PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/4d/19/e11fcc88288f6
 PYTHON_PEP517_LICENSE = MIT
 PYTHON_PEP517_LICENSE_FILES = LICENSE
 PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
-HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
