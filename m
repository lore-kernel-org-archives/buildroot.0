Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D195C6FD20
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 00:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D708E40217;
	Wed, 22 Mar 2023 00:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D708E40217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KibzfMpMFu6V; Wed, 22 Mar 2023 00:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1127B4059C;
	Wed, 22 Mar 2023 00:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1127B4059C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40D901BF5F5
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16B5440154
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16B5440154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hhBNYYiCj_fo for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 00:11:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B88340104
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B88340104
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 00:11:18 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id h5so9043792ile.13
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 17:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679443877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=biS+fm+roHdTYo23vQZmMSdWgMjj1T0AY4Tc5dK6Pnw=;
 b=CcWbbQ+dQTcHLRT2pAa1GJ48CLEPDZVH8gsni9iG3xfEdGnjjSHZ2pBrFyX5Zx797f
 J7C93Mwl8EsHYD+3ES10GZ+I5EBnqe7ffch2Wu9oSy3bc3xkhl5cuBGJY0JTmYj5qnQv
 6EkoP6Qp6Lwdz9DT85gU/LLWVJ3PbKwxffKGng5UAn3rxWHt1j4UkRv0pQOjSXxT1Ism
 DKLkG0+1s+f3lM4oxAzYBLcsYqrJUxmEh/ncFzem3XpTXdPTVjkvKaNsyNSEf1V/ua2g
 sUZQ07RTDbhcR498h2lX/gYNs1/9obDrwQwUdZtFLS+CFsTaKUoK3EdmuOCk+o1k+vqx
 yr3Q==
X-Gm-Message-State: AO0yUKXBd1bCuSlATKK1HXeaEMjasbEzUfl64oSG0NBNTxGOKTsv3xNc
 MdbUyrDTs89sx6RSU9fKTLhGf971GXCNrA==
X-Google-Smtp-Source: AK7set/OmA5SLL+X2jYsEUz85mf8WZYEapfAE0VJRuUMskywZQ0vWP1Ea769SChUS1Xy4foRYs9RFA==
X-Received: by 2002:a92:d944:0:b0:316:f71f:fa9b with SMTP id
 l4-20020a92d944000000b00316f71ffa9bmr3131847ilq.16.1679443877106; 
 Tue, 21 Mar 2023 17:11:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 n17-20020a02a191000000b003a958069dbfsm4536801jah.8.2023.03.21.17.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 17:11:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 18:11:15 -0600
Message-Id: <20230322001115.4055182-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679443877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=biS+fm+roHdTYo23vQZmMSdWgMjj1T0AY4Tc5dK6Pnw=;
 b=LfE4B3gJxOXbBUwXIKjQTz4zvm4bWF/R6fF7UGp3AjIf9YRQN5d6b7mC935EvisFhD
 v4ojqdH+ZvmWCSnHBs+ScxllOzzkOU4wxpZ9avcinA02qA8AKn3RCqQ+kDCqVtnYrYgf
 Tp2l6++988O1YfLfE5TI9wPOHHwYtuAPA73jIymPAUJp4YhfuU09tw7q7bhZXvDH9i8O
 Z6gpZuX7slbmL6YWwQM/XS4eV4bCzugl/eN9jOSGJJqKuC4/XFv/2EldCmgTr/RneyPq
 WxeYCwPaJXXyoHuc8gF+B/TN4M3z7+Ms69aVVSzObqO7qEXYTXa+3lwQOWX2/lvAYvy5
 D47w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LfE4B3gJ
Subject: [Buildroot] [PATCH 1/1] package/python-aiofiles: bump to version
 23.1.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiofiles/python-aiofiles.hash | 4 ++--
 package/python-aiofiles/python-aiofiles.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
index d1594c3989..e7799c7ff7 100644
--- a/package/python-aiofiles/python-aiofiles.hash
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiofiles/json
-md5  b22db90039c881f6aa64431c6b23f30f  aiofiles-22.1.0.tar.gz
-sha256  9107f1ca0b2a5553987a94a3c9959fe5b491fdf731389aa5b7b1bd0733e32de6  aiofiles-22.1.0.tar.gz
+md5  d648a31366030470c97401741747065f  aiofiles-23.1.0.tar.gz
+sha256  edd247df9a19e0db16534d4baaf536d6609a43e1de5401d7a4c1c148753a1635  aiofiles-23.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index b65d2cfa82..96bd636a4a 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOFILES_VERSION = 22.1.0
+PYTHON_AIOFILES_VERSION = 23.1.0
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/86/26/6e5060a159a6131c430e8a01ec8327405a19a449a506224b394e36f2ebc9
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/40/a0/07be94aecba162ed5147359f9883e82afd2ac13aed33678a008fc8c36f8b
 PYTHON_AIOFILES_SETUP_TYPE = setuptools
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
