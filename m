Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C7AC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 09:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84CFE60B96;
	Mon,  4 Jul 2022 09:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84CFE60B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZ4lE8QwnYYp; Mon,  4 Jul 2022 09:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8902260B91;
	Mon,  4 Jul 2022 09:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8902260B91
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AE581BF2A5
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 09:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 748A640941
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 09:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 748A640941
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3u4_RNa6svo for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 09:46:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 250DD4093F
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 250DD4093F
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 09:46:19 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id ej4so10972420edb.7
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 02:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4roaYDBsiKCQZ3y3nVzrW6zihG0JBAnsi1jMIwE2r8w=;
 b=LWPPNg1j6i9Y03OHw1rXIDLj3yXTWgJ4QGj0ZNT8Ahx8mwig3jKMi/GRjhoMzuLa6I
 vH8Y8KHbPn7LscbDtETeczaEXG6nbUlmSZKzxEnq8jZWSgU307BwlEfTcPnkku7B0sS3
 fDDaWqNnBR8LqhGJuryw8jCkiKrP8ayDnQj3M3MLqF2bK6jaRBK/F/P7pmP7c6Inp9RT
 NLDwljxya3VItYhFSf2NE/KKqWBhk4qn3Y0BpZGwfPCWl0/ybYzea+CVACvYeBgLhkCb
 +PHlzc6ptf3O7ey8wO/LufntjOTJY8mvdDLUsqApBqqD0LLWP8SM3pAkXlqKNVeht49U
 RelA==
X-Gm-Message-State: AJIora/YMK/i+4qBe1O+detuFW/b2poEhHUmqudetMRCgTVFsfoKOhpC
 vRD5s27589HL/0xqEQH5ZItLaRdGBygU1Q==
X-Google-Smtp-Source: AGRyM1vKJWk3y6+BJC/ePEROMKjY0zscCIUZNKICqlAUMJdRfiTeqv3OydSAH1RHlZ0Ki7ChmtjJMg==
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id
 fj8-20020a0564022b8800b0043a6c586c64mr2821010edb.348.1656927976941; 
 Mon, 04 Jul 2022 02:46:16 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 j24-20020aa7de98000000b00435726bd375sm20062211edv.57.2022.07.04.02.46.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jul 2022 02:46:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  4 Jul 2022 11:46:13 +0200
Message-Id: <20220704094613.5636-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=4roaYDBsiKCQZ3y3nVzrW6zihG0JBAnsi1jMIwE2r8w=;
 b=IfEJfSnZMJJiApHse/9niXnqT/yrH7LnnDEn5gyHsdij7owIcdh69r/++BQiLiROEh
 HxUdK9xzmKDQv4HTZunaE4thI1GbPO4KGHiylP1ds5FRYNLDXiU9rJ1qtEbx9uR17ZXH
 8n5Pny7AeJbDnje+848aKDm2wcCvILXIfzRaAZV2fqpCBTjW1Tqd+piTWI8Cz7euAVnd
 Xe3Zod8Hv/xvQ5NRUI6XJVtgD4MWo406ceDdL/d7cLnjNk4EcMa4rec+Fka3bOK/TqZI
 yOU6R78mxYZpTYZudjXtIB/+BhicCxJPj/KfrehPFWDa8FIVXkdlwEMu8zRc3yLFnuAX
 fvfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IfEJfSnZ
Subject: [Buildroot] [PATCH v2] package/python-automat: add missing
 build-time dependency
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

python-automat needs host-python-typing-extensions.

Fixes: http://autobuild.buildroot.net/results/a4a52da24032222860ad6abe89bf66839cc2e812/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v1 -> v2: add Fixes tag

 package/python-automat/python-automat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index b94fd2e1c4..03d6759718 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -10,6 +10,6 @@ PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/80/c5/82c63bad570f
 PYTHON_AUTOMAT_SETUP_TYPE = setuptools
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
-PYTHON_AUTOMAT_DEPENDENCIES = host-python-m2r host-python-setuptools-scm
+PYTHON_AUTOMAT_DEPENDENCIES = host-python-m2r host-python-setuptools-scm host-python-typing-extensions
 
 $(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
