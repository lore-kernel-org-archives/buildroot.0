Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AABECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 01:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADEB841524;
	Fri, 23 Sep 2022 01:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADEB841524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAx2e2-qOLRv; Fri, 23 Sep 2022 01:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D1F24151A;
	Fri, 23 Sep 2022 01:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D1F24151A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D53381BF37E
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0A1083216
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0A1083216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vU1sU8gOQsSU for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 01:06:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD714831CB
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD714831CB
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 01:06:31 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 r22-20020a9d7516000000b00659ef017e34so7356348otk.13
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 18:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=AWl7/CDCb9pWyHtD0FTiIdik/ZFPhSiHmL/QeLrfNDU=;
 b=OCBeunWTt+fhpKfNVXWx/CcRTkIvgiXZPRovbXuFBV1GJYbUSjvjSH6O/gOmVvzBJ/
 gqEfLAqHFjV3u1J/+Pgaam27+VjBqmH+nR0Y2z6B6IVGNUSQIQK0JmQqG8vcUTqYd2jP
 ZkEQdnVYz8IHbXRzKzTsBRnp55ZrHoB+6RBrFjX4HYKq8c7VJd0ONtZhbFiB7xJuW3W3
 v9dalzSpgibiL6H2Chi00VYZDLzrNvwH8lmM+gvQltBMjgzpQj8Vv0n6lVhX4hOnls5y
 NAvrqMjNnzULZswKKQ7+ffzwDDVUUkd3BpZY2aNWqCFskGf6g4FPGhWveMgniztURQxz
 IGVg==
X-Gm-Message-State: ACrzQf1CflbNiWjMf/3aXT/CSsSE5Uws/GCS0W71Fu/T/n7n3MZoG/AT
 Vzp6I40UP6s5J7f9uyut4uL8/OsF/ZzR7g==
X-Google-Smtp-Source: AMsMyM4vQ3ACR+pjuHiYsfT/GTpTDyUitonKx9RHGnzzTg59Air93f9NyL4UvMQuG650fZHwmzDJuw==
X-Received: by 2002:a9d:4b1a:0:b0:655:bad8:3fa5 with SMTP id
 q26-20020a9d4b1a000000b00655bad83fa5mr2989633otf.120.1663895190430; 
 Thu, 22 Sep 2022 18:06:30 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 j1-20020a9d7381000000b00655dda40f54sm3373554otk.78.2022.09.22.18.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 18:06:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 19:06:23 -0600
Message-Id: <20220923010623.1341541-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=AWl7/CDCb9pWyHtD0FTiIdik/ZFPhSiHmL/QeLrfNDU=;
 b=BYTTIP47YvpgKeswxFJ+2KjhWiaG4nTYPWOrj9JXF+TfjxI3HPJhHXBLAXTQtUTb70
 W8EgeLGBhiSRA1G4mqNiBo8u5g5ysTxIgF8WSYmT728hH769zYm5lJrN96HfugNyGThS
 Pn2YvkGQi4B9MIhcR4bg9MHCLSjnvqJgW5kDe3O//fe1K1Q5zUUKl+n4VVl2MLoW3IRB
 RLGOeuyvZGXEi0xsTLssFX+3rfoSxJRRwrwt/0V3NKusjmW6Zsdvxz3csdsJR18F1z+5
 qHKiIWBOxaSqGMRHMaLI0taSeg2F4rRSE3FfVnnp9NUYWIOB++o0M7aY2y9VvIoO7bBt
 wLgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BYTTIP47
Subject: [Buildroot] [PATCH 1/1] package/python-cssselect2: bump to version
 0.7.0
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
 package/python-cssselect2/python-cssselect2.hash | 4 ++--
 package/python-cssselect2/python-cssselect2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
index ffbafdfd40..13bdca9a39 100644
--- a/package/python-cssselect2/python-cssselect2.hash
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect2/json
-md5  cb5630e049172f431aeb82a3d504664a  cssselect2-0.6.0.tar.gz
-sha256  5b5d6dea81a5eb0c9ca39f116c8578dd413778060c94c1f51196371618909325  cssselect2-0.6.0.tar.gz
+md5  594ebe75a12dfd6cc288858faeb77415  cssselect2-0.7.0.tar.gz
+sha256  1ccd984dab89fc68955043aca4e1b03e0cf29cad9880f6e28e3ba7a74b14aa5a  cssselect2-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index 0e34059e75..67907f9bcd 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT2_VERSION = 0.6.0
+PYTHON_CSSSELECT2_VERSION = 0.7.0
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/68/62/b6a16d0c32bb088079f344202e3cd0936380a4d8cb23ef9b1f8079ff8612
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/e7/fc/326cb6f988905998f09bb54a3f5d98d4462ba119363c0dfad29750d48c09
 PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
