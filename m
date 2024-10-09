Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5613CEE322
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 15:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78B8B403BB;
	Wed,  9 Oct 2024 15:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6t4m-7vkDr3; Wed,  9 Oct 2024 15:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F5D54068B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F5D54068B;
	Wed,  9 Oct 2024 15:26:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08AC51BF396
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 367FA4076C
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlLTjOWiRk0g for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 15:26:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3E1D40147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3E1D40147
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3E1D40147
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 15:26:43 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-8323b555a68so410862139f.2
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 08:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728487603; x=1729092403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YN9gYtlNLWiiocZBu+lpXqeHa/kEsGggyu8CQNj81hQ=;
 b=UnIWm8L4DGj/lOm1pH8LgCuHPQExQr2CshAlMNIHKKzghxmY0GLtjX2VnedXzkq+gB
 rAfG4Yz5Rm3EqqLEHhR05WJ/JS5pzkGTjqI/m6CEwsy1A41cxKHaZzKsl1fc5UhUNCB9
 vyNoD6SPjvEacJ7r5bYgZNM7o//q4fIBg6ESEFdNA24v/nrrKLng1TKamcmTU36OJTz2
 Wtq1HM2KST+8CpGJjkpV2PuHuOk+wmsTPS+khtMIZuGINNumSaLEMfxVJ3KUCH0+qvnJ
 ews4KnMVbREz6bvhiKLVku3b2KKJi8jtFSrNyAgF6ehA335DVdhkdlekPO2Q5Jk5UHw3
 XrPw==
X-Gm-Message-State: AOJu0YwZqpp/QtzYrLpxhudFWtbEk0aJ3wW9MmqBV80QVdjsAJh01OSd
 bG0TS0o9hdUMI8zjFkY4weSL3sPJgqs/khajvBgqmoDtZEZYVXdxykZUz0tZ
X-Google-Smtp-Source: AGHT+IHhuDQfkpAW4WE7PCof9CCxZOPaRaoNGiYGOido+ObZft6p541YIKZsCVg7TyTy9sfUufHOcQ==
X-Received: by 2002:a05:6602:27c1:b0:835:4402:e2eb with SMTP id
 ca18e2360f4ac-835440309e2mr181366239f.7.1728487602598; 
 Wed, 09 Oct 2024 08:26:42 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db87b088a0sm1388336173.179.2024.10.09.08.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:26:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 09:26:39 -0600
Message-Id: <20241009152639.3775256-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728487603; x=1729092403; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YN9gYtlNLWiiocZBu+lpXqeHa/kEsGggyu8CQNj81hQ=;
 b=UqhyFauHsEJul7gLXCWLKUorDbAYRIGPG17cN7s79i+36FNNqBaFv2V17rOpNhPCGr
 bX1BekctWDBBYj/Es9FnydNfPU5a2zgl1y5KGz1Tf4TKCBrKAO5QIOLMXP5+xBcgXfKf
 KkWf0G2CfLgSgbQGcUp7MGsFJYXCvocoXU9Vpp7yu+kZqTih7lgvyWSH2E5wZ7fPosRm
 OOffQlawvQ47pM9TNhXNQ96L528Sm6xwG/+wcVMj72wZ/qjz+8w80Uo5wTYMmisXUbG/
 C5n52UtIchXVJ+JrDQDWE7WEwfxBrDpyiO2rXorsDwLJF0GIcg7sTARJOWcGfqSxOva7
 vGWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UqhyFauH
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.10.9
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
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 4b75d2b3fb..9f06fbaad1 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  6a5b9b8da3ac1f64871e43fe4a0d0358  aiohttp-3.10.6.tar.gz
-sha256  d2578ef941be0c2ba58f6f421a703527d08427237ed45ecb091fed6f83305336  aiohttp-3.10.6.tar.gz
+md5  887aab9d024b90084f251c28f6c0a752  aiohttp-3.10.9.tar.gz
+sha256  143b0026a9dab07a05ad2dd9e46aa859bffdd6348ddc5967b42161168c24f857  aiohttp-3.10.9.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 42ea57d23c..5d8b66f8cb 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.10.6
+PYTHON_AIOHTTP_VERSION = 3.10.9
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/2b/97/15c51bbfcc184bcb4d473b7b02e7b54b6978e0083556a9cd491875cf11f7
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/14/40/f08c5d26398f987c1a27e1e351a4b461a01ffdbf9dde429c980db5286c92
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
