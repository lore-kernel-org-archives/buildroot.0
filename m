Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D73C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 21:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CD7360AD6;
	Sun, 24 Apr 2022 21:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5g4yB5sgVDQ; Sun, 24 Apr 2022 21:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7920760ACE;
	Sun, 24 Apr 2022 21:40:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF7521BF470
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE24481347
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 21:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 347fl6LrKbQR for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 21:40:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BCCB8133A
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 21:40:07 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id i196so14013994ioa.1
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 14:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a0NKFLYCvuCd7IUDOBOi5UYPQyOMwrgrQwUGVCeFIRs=;
 b=LKtrAPbnOCv54+J4xN0JuTKOkt9Ad3rVDndhu3CNo44gvDBfIz2W+tkdOYdaGK35Kr
 NAKs0HhywSJs8/ZQUwFXa8nHV/oKIoXz1vcPSgNpZuqNoaQVmq5fmS87g45i/aL0rXbF
 ro0NvEscRj4cZ294DbPDj0pppMzinQp30Hv2pdJm5u28OQNMJhQ29I+D7DjTeoDkyHVt
 sIhFJnEneNd02WlyVTRiJM+as9kSIEl3zGubBQEypEBlvbxd13ZUVCLapTQ84M/9g9k1
 IO6fEVznu6GppAkkckM4FKsoZqcEx1O8ObMfw4mos+b+3kxuvljZwq7i8HWxLVRslrfC
 xR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a0NKFLYCvuCd7IUDOBOi5UYPQyOMwrgrQwUGVCeFIRs=;
 b=r0navvDaVTl9XaANb2nIHO1HCBFjevkudbXGwh1MhoR60tEpoGN3kDp+dcuWdvqadi
 bFVXy17zGgmntieEO5T/gsXCQVGWztdGFtnFw8s7UTdsHClb8lKf0FkFDROuH2WZFcnv
 lfVGRBObOnUFoGS2Jk2gYO7sys5r1iv/5hloa2LtHplg1t87IhbaEvDRwJDP+6Stgakg
 tCIZ4usuYH3isSG9U9dFmH9d0agUZhTPPsRocMxvyvTH4iKYwrA/a97IgodcAegZ3Q3R
 PRBqqxcimY04veeTcWmoIGl0SfS0kiLWmEc4Oe1T3RVk8Ay4f8aKGRY3yaI6FjW8ar4f
 jTbA==
X-Gm-Message-State: AOAM5334HELVcWIvZfy4cEGK4Xjjj6Z4rbhqK8qBcAAtlCXNpEWFfN05
 YxTKQjSGo5fiJZT4SAFlsNiue5vW2VCA+w==
X-Google-Smtp-Source: ABdhPJyQpAurLPH5vBSAmfcUeo/b2Hn43BIU9KSbJgZF5B98DuxfHVqu2j54Vi0ZUCoialgQDd5ruQ==
X-Received: by 2002:a5d:8486:0:b0:64c:6c6b:4660 with SMTP id
 t6-20020a5d8486000000b0064c6c6b4660mr5853353iom.21.1650836406333; 
 Sun, 24 Apr 2022 14:40:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 o19-20020a056e0214d300b002cbec3af6casm5385084ilk.30.2022.04.24.14.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 14:40:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 15:39:56 -0600
Message-Id: <20220424213958.1747120-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220424213958.1747120-1-james.hilliard1@gmail.com>
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 3/5] package/python-flit-core: migrate setup
 type to flit bootstrap
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package needs to use flit-bootstrap since it is a dependency
of host-python-pypa-build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flit-core/python-flit-core.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 0e058a1f17..aaf4c77c6a 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -8,6 +8,6 @@ PYTHON_FLIT_CORE_VERSION = 3.7.1
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
 PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
-PYTHON_FLIT_CORE_SETUP_TYPE = pep517
+PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
 
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
