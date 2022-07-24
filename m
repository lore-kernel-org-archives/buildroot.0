Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF2CC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 03:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5910284B9A;
	Sun, 24 Jul 2022 03:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5910284B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_Arc64kMHd0; Sun, 24 Jul 2022 03:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7347D84002;
	Sun, 24 Jul 2022 03:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7347D84002
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47CF61BF332
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21AC36107A
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21AC36107A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pl2XkQv_WFYU for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 03:29:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E8A61058
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36E8A61058
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:29:33 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id e69so6392242iof.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPVFDdrbpMiM49kAHVwZMzMUEcSZ8itt6UImAfioIlM=;
 b=Fhj8mTQZIVpGsxMUHZ7wMZeg+qshnSyCFFfe/1OQbU6h6VSoCu4VkvfGZO7D5cafnW
 M95z+8+2HI0VmufOGGZQK3ZzaTKsP3P0ktxsDM+YTy0YGsv6ytKgzhzxin+74boqL/mo
 afAI/Q/CTy/orGroR+aHBKK9Gsj3npVz+wFaihcIg0UgMn1kcC3emsxCsFKkc5ePqjqM
 9V2hlLtSe8Fi8nCI+eRXh9t1V+tr4boSpfOFRiqYTQuVhZP0y5qZM0VlKuULGaW5d9M1
 M/mB4PNTLPopKNcmV8pRoyUepLAyA/nQOAi1z6H5nRUlkGba7ffuwm+UAHwalU4bgYoI
 x3PQ==
X-Gm-Message-State: AJIora9xielzy1mNdWBZQm9unor7RrCV40H6k6BaL6KQudPlebFBqaVP
 Iy0ZEn6PXMrLPyDOsf7Tfxh4Ac5cGcxZ3w==
X-Google-Smtp-Source: AGRyM1tvjy+G4NEgrYQzWXQxaTMyHm9OWovmB4oPNYAhHie2uSNndyctx0HaTlW9rMEK92HLtG0EIA==
X-Received: by 2002:a05:6638:3014:b0:317:9daf:c42c with SMTP id
 r20-20020a056638301400b003179dafc42cmr2734511jak.10.1658633371943; 
 Sat, 23 Jul 2022 20:29:31 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 y4-20020a056602178400b0067c05ad90d6sm4284681iox.19.2022.07.23.20.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 20:29:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:29:29 -0600
Message-Id: <20220724032929.1270070-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPVFDdrbpMiM49kAHVwZMzMUEcSZ8itt6UImAfioIlM=;
 b=TMZZDF1rUnQXQo5fmQf4qw7CNrsbNnNomqBoTzUf5f8NwTih6UALY5hzPB8DsmRW2r
 2cer95ttTjnPSC1mzXUYHCvzbFrIWqn0avnAc82TaARTFvCt4jokU+EOw2//AjFIO/4w
 MzO1AO6lrFB4iLaxJHNmhTf+6Dxao7LvlfA+Z/ZhMpr7fXPqfpGJjRYEzKZpatOt1AmA
 QDhncg7F0PmSqTJihWR+c7vToOQgK+z202/408g8zuFf9YRlsj/ByTCys5EsglY0aUib
 /PeyXyjieseemhkrJKC1/vx9ExTvxe0Qb8F8lESjcYxmFnPaJzwPwoWs4ngxfh4rDJ4l
 B8Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TMZZDF1r
Subject: [Buildroot] [PATCH 1/1] package/python-pydyf: bump to version 0.2.0
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

Migrate from distutils to flit build system.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydyf/python-pydyf.hash | 4 ++--
 package/python-pydyf/python-pydyf.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
index 90774457a1..193f7b8869 100644
--- a/package/python-pydyf/python-pydyf.hash
+++ b/package/python-pydyf/python-pydyf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydyf/json
-md5  f78ee205b0637c92197f5d584d60cb8e  pydyf-0.1.2.tar.gz
-sha256  1e2f5de48174f505de025a7d1e7cf01bbdd9422ca8ab9451782bf00ee178602c  pydyf-0.1.2.tar.gz
+md5  fa3584c0c172a53705d7887e2f4c071d  pydyf-0.2.0.tar.gz
+sha256  06ebc18b4de29fc1450ae49dd142ecd26bd7ba09d0b1919e365fbc3d8af8a622  pydyf-0.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index 7cc0df2643..cbe2733b48 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYDYF_VERSION = 0.1.2
+PYTHON_PYDYF_VERSION = 0.2.0
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/78/ed/2ccc153d50d21a56916fd5c9d367cad798d4ca8a450cef03e7faa3b920c4
-PYTHON_PYDYF_SETUP_TYPE = distutils
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/3a/5e/4d4f5f77c706b0b871652cb4ccb98a52647ce917168a48e2b8cae742da1e
+PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
