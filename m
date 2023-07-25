Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290EAC001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5CF0400CB;
	Tue, 25 Jul 2023 13:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5CF0400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_-9DnwqbAjz; Tue, 25 Jul 2023 13:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DABC4167E;
	Tue, 25 Jul 2023 13:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DABC4167E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C72F1BF3CE
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 756BB817FF
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 756BB817FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtihrfIfxlGT for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:18:00 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1855981438
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1855981438
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3461053677eso12988225ab.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690291079; x=1690895879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d/kYnya5Ar5mJawQfPJYSTZOMYUcfJrD7RU7LZc+zmY=;
 b=BLCCHM+9BCE/TXP5luKXfRlc+d4VcOzVvFsCrHqHEE8ABZEAAlJ+senrJLi2NVTHBf
 +FurYdvpUUODjzho7Uf24Mq8vvFl9WwQ4P3gFrUBhikVz5rGyFOWURV4G2Q7mIH26NQk
 FlWuMgpvMdIauxQeqqU11WDtPxIEZ8yPCJodwLa5BoIPjkMko/zSEKVJ7sKOnfVcvbjY
 LRHFkJA72kGAvdyDOlwUx59nKLGfekEwUQm92GInRkab+y+9X/QttmVtWdkWyu9dRWOn
 0R8wOWiqf8aCV4fIvG1onqyTogOl8PPpj184DPg512EgJ/Gnm/3gEPcNIiUUMHw7bRVQ
 Trag==
X-Gm-Message-State: ABy/qLbg67kWnok4eXX7hLTCvS8tyhpiT1giuspmahZDwETIqzfsA+2+
 KCv1kwk/nHGcHY1C8B8KrILcAZOhJiI=
X-Google-Smtp-Source: APBJJlFqKHMk2fvmvKKy9KQ8U3JliChqN9ij6/cHMmMr3ghCUKdMCG/WvosxMmmO/nsP8727EQjs9A==
X-Received: by 2002:a05:6e02:216c:b0:345:7331:80a3 with SMTP id
 s12-20020a056e02216c00b00345733180a3mr1189114ilv.0.1690291078691; 
 Tue, 25 Jul 2023 06:17:58 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 v5-20020a92ab05000000b00348a5e95d47sm3705955ilh.14.2023.07.25.06.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:17:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 07:17:56 -0600
Message-Id: <20230725131756.132690-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690291079; x=1690895879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d/kYnya5Ar5mJawQfPJYSTZOMYUcfJrD7RU7LZc+zmY=;
 b=XdhH9MmE6tjpZY3bjJYrqCQqRfIt2UZApVyzUjtEoDNz0LM3M8apG1eDrzqLHsSMxH
 Mm4n7YgzMJJ2i//7x/PkuY7PORczCO1hE09Cdt7VTkaO7D9nTb0UZlpIX7lce6KEeo5A
 ahy64ct84M8AugwvZE9zcGXwTYr/EMby9/1u2Lp+yZwwhC2JQVaJY4L6aolXoEIrbgAd
 ucX/ldfrPF7XMxCOafOaLUTW05PzJk5D86+kNu6fhBhFWDNXRwCMfqBO8kb+vfXnOgen
 77NQ2OuSsEZmqqZ1lBu0EVU0DpjxdQ0k8WASoXzSe9PodadG32/RpLlLgbLaTfK7JEYy
 hlUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XdhH9MmE
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 23.6.2
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 4fa7c451f5..11448fef3a 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  55cd275bc3d9c7e354f4b6a87b87f466  autobahn-23.1.2.tar.gz
-sha256  c5ef8ca7422015a1af774a883b8aef73d4954c9fcd182c9b5244e08e973f7c3a  autobahn-23.1.2.tar.gz
+md5  f29d3cebec06c81a87823a2776ffcc5c  autobahn-23.6.2.tar.gz
+sha256  ec9421c52a2103364d1ef0468036e6019ee84f71721e86b36fe19ad6966c1181  autobahn-23.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  ab1dd7a42dbdae302346c5a4571f2149691cc1ec06836232bf4923527e3fe41c  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index c44acb80aa..703f106515 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 23.1.2
+PYTHON_AUTOBAHN_VERSION = 23.6.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/53/99/b6e0ffa0e8bafe9dfae1c9ab46d44d07317cbf297fbf8f07aff8a80e5bd8
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/92/ee/c3320c326919394ff597592549ff5d29d2f7bf12be9ddaa9017caff1a170
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
