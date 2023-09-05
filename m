Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3B8C83F3E
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 18:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2A71418C0;
	Tue,  5 Sep 2023 18:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2A71418C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQzAlbWq28_V; Tue,  5 Sep 2023 18:06:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3E7F418A0;
	Tue,  5 Sep 2023 18:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3E7F418A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2BA1BF318
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60BD08136D
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60BD08136D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yHyAv3ZIyhEm for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 18:06:22 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C91C8135D
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 18:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C91C8135D
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c328b53aeaso21708365ad.2
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 11:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693937181; x=1694541981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RVaVbo418wgK02UOE+IU7pDJALykfJrWc4drr5p8p6Q=;
 b=ckfvJZNY4NWFn54MPvvDUtds6ANWJMm3hxR+EhhPkCP4weI2RWzmpkbBR2eXtc5ZBO
 n9BJvu8fZJzDPLujrZ9Zgf3VaHdT5GTlbxpXZyhSUJl/dUSqPSYzOp4SrRLGIUj+6UJg
 Fs6QE2F5fQrOjbsOp77Xr8FEPiyjf+j9X76+MeN7O08jXU9iWI6cVq75gh9krjUraQgp
 Igav7xXQPtyzjA5R+8/c9YE2gcg/8quHro9Eju9rT61jaNPJM539GvlzgnqrFKqVYXjU
 eDNhRpT1QQBFAB+6jd783J8bAamCmM3P8VPryMtxvUJCorT6bKj7rjvxCVbog47mQXLY
 8/iw==
X-Gm-Message-State: AOJu0Yzcd+R2HuyjQnbFaBmVmOdWG2znc0gPGTZdabGxiKPoosaCfIFa
 IJsO2YHJUfN3VLZkwE3ppkrM3E+2QI4=
X-Google-Smtp-Source: AGHT+IGrGzeUFZsNuty75t4QeNs1a3Yyz3oIVIkLCqLyvMJ5q2135uuKDcLg4q0yfohFQrT59ZbVzg==
X-Received: by 2002:a17:902:d505:b0:1c0:ecbb:182f with SMTP id
 b5-20020a170902d50500b001c0ecbb182fmr14815426plg.5.1693937181484; 
 Tue, 05 Sep 2023 11:06:21 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 ix21-20020a170902f81500b001bba7aab826sm9658143plb.163.2023.09.05.11.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 11:06:21 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 12:06:04 -0600
Message-Id: <20230905180610.1610778-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905180610.1610778-1-aduskett@gmail.com>
References: <20230905180610.1610778-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693937181; x=1694541981; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RVaVbo418wgK02UOE+IU7pDJALykfJrWc4drr5p8p6Q=;
 b=fYp1usoIa2S00rQODCbqtOBU2+ARF9GhV/cZKUI2cJYB4NDzEprC4FQ6lQyO7zyFHi
 l+OiuHzxwlUEz3cAZHIqXnhIWUN32IBfRVwUDh/E4dQPZncRm+SZAFZHVhGnSUBioqRq
 rd8fmfV6ogEx3iSa/WqdIyxUtmo2KPHrl16jjeEw5W4krbH063JxN01BVDaNrJUEKeYv
 NO86IUaoZyK+yZb3UBqSANCj+CLpb4DyW57MRXPzDfyEJlmY+eeSMHRM1mAMC6NWTGbe
 9OypeLUZMY7BEmdMTLwcb0cdudinNIYuAo+ov7HQpEzj492t32brGcAWu7xdNAPMLEgH
 uRoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fYp1usoI
Subject: [Buildroot] [PATCH 04/10] package/php-gnupg: bump version to 1.5.1
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Adam Duskett <aduskett@gmail.comm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <aduskett@gmail.comm>

Drop upstream patch

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
---
 ...0001-Remove-inlining-_phpc_res_close.patch | 33 -------------------
 package/php-gnupg/php-gnupg.hash              |  2 +-
 package/php-gnupg/php-gnupg.mk                |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch

diff --git a/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch b/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
deleted file mode 100644
index 9b94cb7e4f..0000000000
--- a/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 887b0899d7e7423baec691255c2d8b56bb348ecd Mon Sep 17 00:00:00 2001
-From: Jakub Zelenka <bukka@php.net>
-Date: Sun, 14 Mar 2021 18:52:21 +0000
-Subject: [PATCH] Remove inlining _phpc_res_close
-
-[Retrieved from:
-https://github.com/bukka/phpc/commit/887b0899d7e7423baec691255c2d8b56bb348ecd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- phpc.h | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/phpc/phpc.h b/phpc/phpc.h
-index dc5887e..9206105 100644
---- a/phpc/phpc.h
-+++ b/phpc/phpc.h
-@@ -945,16 +945,8 @@ typedef zend_resource * phpc_res_value_t;
- 	zend_fetch_resource2(Z_RES_P(_pz_res), _res_type_name, _res_type_1, _res_type_2)
- #define PHPC_RES_DELETE(_pz_res) \
- 	zend_list_delete(Z_RES_P(_pz_res))
--#if PHP_MAJOR_VERSION < 8
- #define PHPC_RES_CLOSE(_pz_res) \
- 	zend_list_close(Z_RES_P(_pz_res))
--#else
--inline int _phpc_res_close(zval *zres) {
--	zend_list_close(Z_RES_P(zres));
--	return SUCCESS;
--}
--#define PHPC_RES_CLOSE _phpc_res_close
--#endif
- 
- /* resource to zval */
- #define PHPC_RES_PZVAL(_res, _pzv) \
diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
index 99ffe87f46..084de7750a 100644
--- a/package/php-gnupg/php-gnupg.hash
+++ b/package/php-gnupg/php-gnupg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d4f5f79aa483908f3df08e5b343ea3593c6d725b9ed2103e30242627659e0a64  gnupg-1.5.0.tgz
+sha256  a9906f465ab2343cb2f3127ee209c72760238745c34878d9bbc1576486219252  gnupg-1.5.1.tgz
 sha256  da1136d4d9326317cbd320dadddf7e9b4b4edffd973eb083cb7b9754fb6a15d9  LICENSE
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index a89f0978af..89054f5f7c 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_GNUPG_VERSION = 1.5.0
+PHP_GNUPG_VERSION = 1.5.1
 PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
 PHP_GNUPG_SITE = https://pecl.php.net/get
 # phpize does the autoconf magic
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
