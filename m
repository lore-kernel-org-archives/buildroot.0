Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF44C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 01:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A403440424;
	Sun,  5 Nov 2023 01:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A403440424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id inyguoEeQwbI; Sun,  5 Nov 2023 01:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 721DE4042D;
	Sun,  5 Nov 2023 01:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 721DE4042D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7891BF263
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21CF7821F7
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21CF7821F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHqNugOHZJa3 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 01:44:12 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE064821C5
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 01:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE064821C5
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7a66ff282baso88650039f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 18:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699148650; x=1699753450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0hMWaf3L17TXimlhG0RlrJsd+B9UGMJkXVurYpBTzbs=;
 b=qg1e1GY3ZiLcOIDx6JYOasCKRZyHrQH8Ato5maybhPJ8gfC4EVppc1JdSMeBclKua8
 TXdsAmODCI6drMeVx7j9QwOX9W8mnnBHhL5utTqFO54VBEdyqepHZzyXc2oR4FDMx9PQ
 Etwj92ABSB329m/oyWBOyJRcfA2y7OI63hm/8tCma/6okoKKN1hbrcrkkdf6DcbNX1Qd
 8tTpKjvgv6MGcqtQrACYwlNpopGbwD4qEpFcriPA13FMcP32RhU1ZM1qjHiCUnOy11YS
 vtdsYZVeIvLG2ReDxcWEgas9sgqLOP+o043j2AKx03Z9CeI1bX8IgtkJ/SOaWod7kDD5
 F9Wg==
X-Gm-Message-State: AOJu0YycbcTGBQbiIbvlFyOGAajE0OPqYx4COQrkZWQJOUWZuyi2g5ro
 OdmAZXfYfrgxArMMjnoEIfHvPQeWF1A=
X-Google-Smtp-Source: AGHT+IHtI9HSzIqTZih8xNVQbfM+vG/gTGml78lsNsC2Jrx++CBBO0sB7iQOXfal2LO2eraIBWWA2w==
X-Received: by 2002:a05:6602:2e01:b0:79d:1b4e:fb8a with SMTP id
 o1-20020a0566022e0100b0079d1b4efb8amr6597259iow.9.1699148650419; 
 Sat, 04 Nov 2023 18:44:10 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 dy39-20020a0566381d6700b0042b14d9be7bsm1355462jab.22.2023.11.04.18.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 18:44:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 19:44:04 -0600
Message-Id: <20231105014404.2723026-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699148650; x=1699753450; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0hMWaf3L17TXimlhG0RlrJsd+B9UGMJkXVurYpBTzbs=;
 b=W4yk2kiMVwvKl1LDb4xPr2CkYkYhcO0NS+b7csYNj3Q8zIQyruq0iSMLFLDujlnqPI
 T+5vAdnHd5675tN010I+V+rhE6yQkoHJGnfzPa7WmPy5XnpYsBtGViQNBAJ/DZeWvuTg
 7lnwa1WdbuKh05a/HKJEYn/61Q4ijOWyfSGnhGki1w/Vbmzv1Q+X66o3Vm2oIxqIspU+
 J16uEiYDT/dXQW0spHvHKx/TFD4zpn9ZgqUzb860SJ80jH9qgFsoqSAU2BfTQ+iAh9xu
 zTWHxP5WCCE9cOQL1WP/YeR0CzVjzjfA0eRIyCMuIXSPltr0BldyiLiWAZK5DuuotOIf
 1eow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W4yk2kiM
Subject: [Buildroot] [PATCH 1/1] package/{avro-c,
 python-avro}: bump to version 1.11.3
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/avro-c/avro-c.hash           | 4 ++--
 package/avro-c/avro-c.mk             | 2 +-
 package/python-avro/python-avro.hash | 4 ++--
 package/python-avro/python-avro.mk   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index b52a787ed5..83b5759a16 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.11.1/c/avro-c-1.11.1.tar.gz.sha512
-sha512  e72e8c245a8b86326bc18a5d5127e9beeaceaf805e8a62760fd88d627e29954c750346485bb43822df408c8a172d910c27ddf7e3815bddbdb04d16c54d859323  avro-c-1.11.1.tar.gz
+# From https://downloads.apache.org/avro/avro-1.11.3/c/avro-c-1.11.3.tar.gz.sha512
+sha512  56ce8c6f0b06b779679a6e7a2b738ec94277920e9b3d7c6f1062a0b47db80b90dccf89df9d977ec1f120211f7c2f33845e18df4961818e5c5cc93aaec18e1302  avro-c-1.11.3.tar.gz
 
 # License files
 sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index f217c1d7ed..d7efdc2003 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update python-avro
-AVRO_C_VERSION = 1.11.1
+AVRO_C_VERSION = 1.11.3
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index 0d457a11fd..e57b6a722b 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.11.1/py/avro-1.11.1.tar.gz.sha512
-sha512  bce5983cd7ed20be848cca41d143f16bf5bab57edc010d590fc1268405de4267e028ff7ec740282a03034aff5aa528feadb2be4e71ee6879b3080e0a9e19cb37  avro-1.11.1.tar.gz
+# From https://downloads.apache.org/avro/avro-1.11.3/py/avro-1.11.3.tar.gz.sha512
+sha512  c2066b4dd8b55b0534fb5bb8fc5a81abcef76ab46458b666c98732811f632c34062c1a0cefaf370aa0843c1cad5bd822f9a6ef0ad88cda5177519a3d3c73072d  avro-1.11.3.tar.gz
 
 # License files
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index 6193cbbd8e..4e9db9fefc 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update avro-c
-PYTHON_AVRO_VERSION = 1.11.1
+PYTHON_AVRO_VERSION = 1.11.3
 PYTHON_AVRO_SITE = \
 	https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
