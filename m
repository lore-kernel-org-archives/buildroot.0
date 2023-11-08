Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DA3C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 23:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2849540490;
	Wed,  8 Nov 2023 23:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2849540490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00cjRPdmQKnb; Wed,  8 Nov 2023 23:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E3FB40496;
	Wed,  8 Nov 2023 23:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E3FB40496
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 169CE1BF29D
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF05140489
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF05140489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5P_I4ehFWMGE for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 23:51:17 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C56CE40015
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 23:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C56CE40015
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-35957d77afcso3901755ab.0
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 15:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699487476; x=1700092276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7zEAfH/abq3CwNh5dEoqfHC6FEe5XlnJYdxhf33w4i8=;
 b=Qc7qlObMp7ZczSln+Q3ICGcF7XvFqty7C1LWO58fdpG+u1X4EUklfA0LEExAgxXmKk
 uqz3E0Sbznk0fqhnSQxtSAHb9jJEa6zyCtoSPxAsbzGBm/Nw0TokkLRbAykrSv3Mv0KI
 q6sPta3mpfxxiPboptd9BLNG2IAtQyMeZXGf91x55+hCE08/H6HyBo5IIy4asYOb+1WI
 POVpHYSzJ50L80aPzsdUQjgPyqT/YtfFQ8qba746/9XEmX7QzlJGN+LwYXW8Js5Wr+sS
 5v8bTGhix2C6t1WpGi4/c4QXfolNZQossbzNcGm2lEL2Y7I2hDnmQZ5Ew7ZbEy3agpbR
 HoKQ==
X-Gm-Message-State: AOJu0YzX5mlFkKdSFFRr3sBShJvc1Osms3bOc6CQU+9+A4hwDYeO7nxB
 eHOE1ZhuSSDkgg5l/tCw1QWHBoksVBE=
X-Google-Smtp-Source: AGHT+IG8Ddb+i49E+4Obpq1og3V/YmijtsizLl10Vb7NyM3t033L6m4W0SivewXIAyen2wyfQv+z5Q==
X-Received: by 2002:a92:d189:0:b0:359:3ff:17c6 with SMTP id
 z9-20020a92d189000000b0035903ff17c6mr7538142ilz.4.1699487476427; 
 Wed, 08 Nov 2023 15:51:16 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 f25-20020a056638329900b0043a0aa909bfsm2661440jav.159.2023.11.08.15.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 15:51:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 16:51:13 -0700
Message-Id: <20231108235113.3657109-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699487476; x=1700092276; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7zEAfH/abq3CwNh5dEoqfHC6FEe5XlnJYdxhf33w4i8=;
 b=eQn1osiv8NBKprUNYVy5I72ctLcGiggU9DkNl/FUFK/mTzdO3uD7MAMt1cSecTJ8er
 weoxaUYpMgaI8ZCcxDjR4vGvMxikFpRcTlUiY4deB7fFNb9DeMLAJTbZHwvP6dF5X/BF
 ymTV0ZdrPmIvU0OZUjIM14WzYsUcNcTLFxa45ifp61UjRGITPrIwN+EMJEKxN+u4iaIx
 sX/Fd4Ru3iyKJEgIfkLKFTBo/j5sS6NkSjTBb6MIw0UIjaXavGWdjSEp99KdyO+WaFEA
 bRYHfS3qQm2K0T+ofTtB1Dg8zjd1LNpuBSneTQ0MNun112aZPFrPCG/3/vHUIsXAbM7F
 AGRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eQn1osiv
Subject: [Buildroot] [PATCH 1/1] package/python-more-itertools: bump to
 version 10.1.0
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
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index c12d3f5623..6f659ab468 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  58f6fe36c3c94bbc569130df546dcfc9  more-itertools-9.0.0.tar.gz
-sha256  5a6257e40878ef0520b1803990e3e22303a41b5714006c32a3fd8304b26ea1ab  more-itertools-9.0.0.tar.gz
+md5  3651461253e7d206073affb491b5c6e0  more-itertools-10.1.0.tar.gz
+sha256  626c369fa0eb37bac0291bce8259b332fd59ac792fa5497b59837309cd5b114a  more-itertools-10.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 734d87e057..71c33bfdf1 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 9.0.0
+PYTHON_MORE_ITERTOOLS_VERSION = 10.1.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/13/b3/397aa9668da8b1f0c307bc474608653d46122ae0563d1d32f60e24fa0cbd
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/2d/73/3557e45746fcaded71125c0a1c0f87616e8258c78391f0c365bf97bbfc99
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
