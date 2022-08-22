Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E072C32789
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 08:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11764402C1;
	Mon, 22 Aug 2022 08:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11764402C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pkyd2zh843Hp; Mon, 22 Aug 2022 08:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC0AA40993;
	Mon, 22 Aug 2022 08:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC0AA40993
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32D011BF321
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08E5C81063
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08E5C81063
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3wWp7GXk4XZ for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 08:43:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F5D381026
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F5D381026
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 08:43:36 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id o204so3926415oia.12
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 01:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ljVCN5nlKrZo9y9tIStKV8r7J0e6MKGuSkyudaonONE=;
 b=kommMh7zYl+hFOD9NKCDVHS87ASzG48zd9aOd/VVyHiLETSk73f7teqw+hWhQQwsIs
 ThaunKEJw+CWIYMEI0ZWPIRpSGpB/7SsZS74KHaA7eniVtjdMHdr0A06Hasy1ADmKpnx
 TLF49mMH0T1TPnQ63f8vkqnCBsLwV+XG3xF+WmQIboP3lpWAWosUfct0DWWIQCXHz10e
 dlcEjlud1UdWMIXU6WZU4Ql6ieQnXEOo70sGo29UsmqeFH1sIlIdI3czph4UvUia2TUR
 g7OoSF+l3QI6GtszR4IiN94/Y0wpxfjOe9G4Qvugh/h99ilGKOLcyQTgbDX4AnyjQqlb
 1/sg==
X-Gm-Message-State: ACgBeo38Je6H9O0NbKGApfFZI+366QAlPcXpPpYUmEA5p2C7lzOOxG+P
 pZjdAtU87sPxY1qqBDhzkeCOyTiozak=
X-Google-Smtp-Source: AA6agR6gPJfprL9AQaCSWZ0V3po1BvdEQiEiIQLCv5UBdW61rSeekqbQjIw3l9CSrCceFTmrZqJzhg==
X-Received: by 2002:a05:6808:1489:b0:344:7ff8:54e8 with SMTP id
 e9-20020a056808148900b003447ff854e8mr10799694oiw.195.1661157814641; 
 Mon, 22 Aug 2022 01:43:34 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 g22-20020a056830161600b0063715f7eef8sm2807488otr.38.2022.08.22.01.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 01:43:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 02:43:31 -0600
Message-Id: <20220822084331.3261657-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ljVCN5nlKrZo9y9tIStKV8r7J0e6MKGuSkyudaonONE=;
 b=YdoFZq/y5FehSalSGnJi3kNjZRLfvw9KLwwMV8PTZ4V6pCdk3VJP2GsbxAIF7jv9h9
 yGJqXX+PVRR6dHVTy4PI+YP2p9A7AmXikGDJsZY7Ap691VM5kecYNJvwCHdre0V8renS
 LgdAqGDMhne+X+2eOka3Bu2ztzny4oeet+7tVLWhWYVzjP4E4SJVEuswO6cW30+Lj/wh
 sr/AQvfh2QsaSRhiiJ7Cz7UI8KiswZ5TWTSvnjKk60WCY2dnrPrTbjosr2zS45KIaY73
 egoteKsKQE26HXq3suWydykemz3N55RGfGmi4XwR6t+QaHeRGx6pJpixllydwVKV5EzI
 qrfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YdoFZq/y
Subject: [Buildroot] [PATCH 1/1] package/python-typing-inspect: bump to
 version 0.8.0
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
 package/python-typing-inspect/python-typing-inspect.hash | 4 ++--
 package/python-typing-inspect/python-typing-inspect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-inspect/python-typing-inspect.hash b/package/python-typing-inspect/python-typing-inspect.hash
index f3ff6b642b..737373d609 100644
--- a/package/python-typing-inspect/python-typing-inspect.hash
+++ b/package/python-typing-inspect/python-typing-inspect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspect/json
-md5  1444feceb8213bd94cfece3c6d4ffc5c  typing_inspect-0.7.1.tar.gz
-sha256  047d4097d9b17f46531bf6f014356111a1b6fb821a24fe7ac909853ca2a782aa  typing_inspect-0.7.1.tar.gz
+md5  d56c8277a55d0bf061275df1ea3785d5  typing_inspect-0.8.0.tar.gz
+sha256  8b1ff0c400943b6145df8119c41c244ca8207f1f10c9c057aeed1560e4806e3d  typing_inspect-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f9d3567d00ca2337f769fb28c553cc590213ecefed4ed599110c10ded2ea0117  LICENSE
diff --git a/package/python-typing-inspect/python-typing-inspect.mk b/package/python-typing-inspect/python-typing-inspect.mk
index eef1f0b586..8573bb1c27 100644
--- a/package/python-typing-inspect/python-typing-inspect.mk
+++ b/package/python-typing-inspect/python-typing-inspect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECT_VERSION = 0.7.1
+PYTHON_TYPING_INSPECT_VERSION = 0.8.0
 PYTHON_TYPING_INSPECT_SOURCE = typing_inspect-$(PYTHON_TYPING_INSPECT_VERSION).tar.gz
-PYTHON_TYPING_INSPECT_SITE = https://files.pythonhosted.org/packages/c3/da/864ce66818e308b38209d4b1ef0585921d28eb07621ba7d905a0e96bcc80
+PYTHON_TYPING_INSPECT_SITE = https://files.pythonhosted.org/packages/72/23/bed3ea644bcd77ffe9a7f591eb058c00739747e33ab94d80cc4319ddee8e
 PYTHON_TYPING_INSPECT_SETUP_TYPE = setuptools
 PYTHON_TYPING_INSPECT_LICENSE = MIT
 PYTHON_TYPING_INSPECT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
