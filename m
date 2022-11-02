Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C62C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12F5F416F8;
	Wed,  2 Nov 2022 19:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12F5F416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WjV8ldH7XXWO; Wed,  2 Nov 2022 19:06:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBD1B416E2;
	Wed,  2 Nov 2022 19:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBD1B416E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12A461BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED977416E2
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED977416E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ef-ixe8IQiTq for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:06:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2C1B4167A
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2C1B4167A
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:06:43 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id g13so9975801ile.0
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0lV6Z+2IRAT65Yh1KrAtbJniqZ6h4QQ3Dxp/wdLh68M=;
 b=FNacL+71rJLr/XZJOCNXvza9uwAe24Cvh/ulPRO4oZCDJBpIg7TiblIYU+foR9EfBl
 YnY/IhVU51EZ8pGmjTFuS/c/dj0io4dmXJQVSt89IkSjxdZknypf42p48fRxE2AFIOob
 /neusE8ozjLLhSU/yyVg6cwh5h5DiGHU/LC5CR1N4MvJMbBPC7Qcc5bmTFnABVWd5DYe
 0a7d0J+bVJIFVnN+57NujhOsGZXNIrQMrDTcIYHi2eo6MAMYTXVnpByl+zg8Ctkk3tTD
 DTk4KJyT4dozgMrlpMSzuEZV5v9DbcDUFNIU8VUrkKH8H3slIge63Y4tU10Jtv8Go4G5
 FsCQ==
X-Gm-Message-State: ACrzQf3YTgzkcvir/6dkq0hPzVof4ypKCostMu6qWAUVw9sF338wRnPz
 hm1cbl3xPBgZWhMsvGWsoLSJUwGFyeVKDA==
X-Google-Smtp-Source: AMsMyM53H/KIWRn0eCi3UYsr4pUBtz8bs/TPthbQbxaFcFdfsUoL6680an8dv1+od6zj76o5IDiavg==
X-Received: by 2002:a92:d74f:0:b0:300:ad95:35c5 with SMTP id
 e15-20020a92d74f000000b00300ad9535c5mr12497368ilq.137.1667416002505; 
 Wed, 02 Nov 2022 12:06:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 b3-20020a923403000000b00300d658f4b6sm179259ila.19.2022.11.02.12.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:06:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:06:40 -0600
Message-Id: <20221102190640.2855482-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0lV6Z+2IRAT65Yh1KrAtbJniqZ6h4QQ3Dxp/wdLh68M=;
 b=bKWzHU+IirFq+b2dJru+33AuU89+Gc/mSj4y88CtqRSy9mQENb6W2ULePDlTTnB9Pi
 pUaYUaCBIkD9oPVnoTSt156uqA+V/dUmDwTs9sxkR92u3OLPYWY+C3EnFbPhaJ+av+Tc
 NZi4pyKctNpTOZwpR1OQBY0RLJudnJQbllbhdLURAtAMk8j0lmYn/M8Hk/1H1a1gWBct
 mp0+aiFeOvaxUE4ktAux93sKPxVZBlIAVBef2OJf2Cb2nU/G7C3ajrT/k6TVRgej1jNM
 ExJeEiTUIdOGtte3aug3UpUbeGjlLe/SPIY9ev7ay2zxaBEg7MZ2CN/akRNWFW0YpUDT
 KUcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bKWzHU+I
Subject: [Buildroot] [PATCH 1/1] package/python-channels: bump to version
 4.0.0
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
 package/python-channels/python-channels.hash | 4 ++--
 package/python-channels/python-channels.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels/python-channels.hash b/package/python-channels/python-channels.hash
index 2d0097da2b..ea643f1589 100644
--- a/package/python-channels/python-channels.hash
+++ b/package/python-channels/python-channels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels/json
-md5  6f3fb75828b681a69372934a09ac3f32  channels-2.3.1.tar.gz
-sha256  6b8ebd93fe0041a23e31c9f4130d92fadb9c0040c0eb377a004540631325a31d  channels-2.3.1.tar.gz
+md5  b145f0623bf1bad8ceb534c306ad2f2a  channels-4.0.0.tar.gz
+sha256  0ce53507a7da7b148eaa454526e0e05f7da5e5d1c23440e4886cf146981d8420  channels-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels/python-channels.mk b/package/python-channels/python-channels.mk
index c0eca71aa2..40f17cb114 100644
--- a/package/python-channels/python-channels.mk
+++ b/package/python-channels/python-channels.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_VERSION = 2.3.1
+PYTHON_CHANNELS_VERSION = 4.0.0
 PYTHON_CHANNELS_SOURCE = channels-$(PYTHON_CHANNELS_VERSION).tar.gz
-PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/75/53/2db9662a52dcedb02a25f87d8efc5e630059967790e4c10887dbd2db2073
+PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/8e/cb/6fedd9df5972b893a04c8e5d7748873d6480a813e74b0797945bee1f4282
 PYTHON_CHANNELS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
