Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F1CC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D9D44049F;
	Wed, 27 Jul 2022 09:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D9D44049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWoF5GGxFnOn; Wed, 27 Jul 2022 09:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3767403B8;
	Wed, 27 Jul 2022 09:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3767403B8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9C41BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 775AC4049F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775AC4049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VxorsKlMlfB8 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:44:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E192403B8
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E192403B8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:44:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b26so23426596wrc.2
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 02:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+OCeJm/nfKv581oMX+RZ5zipVvV4Gacwl/7L8EzMts=;
 b=vwQJpzZzGEnCgAlzdi7smS0EMMj1CXOLYJO5hdSgvXREeKhLdGzRDTQse38wdw+I06
 7igw5TBRBU6MwEGRPr0uDMPrXOyP3Qvtu+7JYERRSQWLe/wdwXFIvjyiJrTFZuZmeGAn
 KccYZ0rvz005SV4llaPgVesipsXoIy9Be9rPxlL1P62bCmClmsZGp+/7vu6yqdG1uahS
 Z0cXnhaCaXXGplj1s95RiIdfYIkGcgGX93PYFLtLbt70Z7dbjZ3wBHLdOCuu31TkrUNv
 3LBo3KG4/NEgTyHxUdxYOVtCkh2iymGkUU0IoIn647Pk0dv54BRiPC15ES4tq4g+9JOM
 8ywA==
X-Gm-Message-State: AJIora+2JiNcp9FpCxJVWNA2oACtRcMdYZSEZiCaSy8gzmPCvfLNG5q6
 7YxgNiMjrFbQG0BhGTCyorEMUtGt0eE=
X-Google-Smtp-Source: AGRyM1u2UtPK7sGQQIUY+P/Mh63ONu/TViyWvEwZxPodufleTOQ7AZEY6WIvWKr95kOIFbeRAyQDqw==
X-Received: by 2002:adf:e187:0:b0:21d:64c6:74f0 with SMTP id
 az7-20020adfe187000000b0021d64c674f0mr12812135wrb.221.1658915038200; 
 Wed, 27 Jul 2022 02:43:58 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a05600c0a4e00b003a37b7e0780sm1419525wmq.8.2022.07.27.02.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 02:43:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:43:51 +0200
Message-Id: <20220727094352.1051200-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220727094352.1051200-1-fontaine.fabrice@gmail.com>
References: <20220727094352.1051200-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c+OCeJm/nfKv581oMX+RZ5zipVvV4Gacwl/7L8EzMts=;
 b=KPz4oHpsTVOhlToJ9i9oOe2AizXOkHqtgH+Rzd/uLaDLAglSD0uRH/PjqM/IGj75jA
 ZuensAiPJWHRjgDGsBpULe+i86DQgTFIAKQD6z1ypQOD8fWqJIMenQbX9UKpvqav3Bj6
 zMjvOdHluacHhhJ6rhz8v51BKlyipj4YCZRggXGhDGkcnoNqTdEHyIUueoHUWCw1HGtz
 /ZQYjAZrxis4nohRhVU7PCG0xLWrJtGTbB3vHrJ3OKG0zABHgl1wntzCTiwtCrYbBnYW
 yb+G+t9glN5M6+c45OS0n/GqGeycNW8S+mxqsKT/cSkf3MKJAK7NaWFsBbbwfqAB53GT
 OBxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KPz4oHps
Subject: [Buildroot] [PATCH 2/3] package/sconeserver: add sqlite optional
 dependency
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
Cc: Simon Dawson <spdawson@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sqlite is an optional dependency which is enabled by default since
https://github.com/sconemad/sconeserver/commit/4120395991c2c63abef58426beee4ecf5879c204

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sconeserver/Config.in      | 6 ++++++
 package/sconeserver/sconeserver.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 4ade8b4590..eed777ae96 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -76,6 +76,12 @@ config BR2_PACKAGE_SCONESERVER_RSS
 	help
 	  RSS module for Sconeserver
 
+config BR2_PACKAGE_SCONESERVER_SQLITE
+	bool "sqlite"
+	select BR2_PACKAGE_SQLITE
+	help
+	  SQLite module for Sconeserver
+
 config BR2_PACKAGE_SCONESERVER_TESTBUILDER
 	bool "testbuilder"
 	help
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index bad050210e..fd7e6774eb 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -91,6 +91,13 @@ else
 SCONESERVER_CONF_OPTS += --without-rss
 endif
 
+ifeq ($(BR2_PACKAGE_SCONESERVER_SQLITE),y)
+SCONESERVER_DEPENDENCIES += sqlite
+SCONESERVER_CONF_OPTS += --with-sqlite
+else
+SCONESERVER_CONF_OPTS += --without-sqlite
+endif
+
 ifeq ($(BR2_PACKAGE_SCONESERVER_TESTBUILDER),y)
 SCONESERVER_CONF_OPTS += --with-testbuilder
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
