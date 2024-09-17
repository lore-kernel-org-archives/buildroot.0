Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4891CAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 23:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75141610DC;
	Tue, 17 Sep 2024 23:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XV2VLk8ZBX5E; Tue, 17 Sep 2024 23:33:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8135861141
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8135861141;
	Tue, 17 Sep 2024 23:33:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7B61BF2FF
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A62540573
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQb9Gv4cEjvB for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 23:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A7CC4013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A7CC4013B
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A7CC4013B
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 23:33:23 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a08c907245so15975055ab.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 16:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726616002; x=1727220802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JVH0PhuqzGJ6Zw5HkEwrGuq6lwwfENkUU4SZhlLdwsA=;
 b=GNmTKbPYSnucQjlKFDtAwcTQvQ2hCs7FTWGoYPLTs6dI0/PUyH6cZk7SIf4dPuz5kU
 0/N2/X3nwQDyojd5J21l8+u5a8l1zjurgEOKwqQ6wONKwuPvfz6fpvocppBxUkRYoJb3
 6JnxncCU1YYpVLqZIxR5+p8scE5YstFyn9rqrowEPintmxdmelWyLsJeGANSiBOQ2R5Q
 Dnav/20mndTo2VIIOV6PfP0lBCHIIxl9kMFQFaScHabAJRPPbhXMpcYamwFZvIbOs25T
 8WuysUbAEX2Ohk02/qZcOkfnFxvn9YBOSkKw7EZ3zDiRFkVfNex8BLbTTOBceSgNFMJo
 rRJw==
X-Gm-Message-State: AOJu0Yx/sl4CFQEGZXyXYSTYPXMTs/rIU+Dk39CPB4F9VoIRCjClwQJB
 BennQdzL6IqBnxzWbnO7LUNpWhl0MH7r6nGj6+lIZMBbtc7G7ZIW6xWBkHHV
X-Google-Smtp-Source: AGHT+IGzPCYoHKG36lAgnTG9yagyTdliBZnWoiOtFngpoJOOatYc5klOL7roED3JyJQFkwhVDKnyzw==
X-Received: by 2002:a92:c243:0:b0:3a0:4d72:7f5e with SMTP id
 e9e14a558f8ab-3a08b70dc47mr150044825ab.7.1726616002097; 
 Tue, 17 Sep 2024 16:33:22 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1c390sm24619105ab.49.2024.09.17.16.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 16:33:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 17:33:20 -0600
Message-Id: <20240917233320.400090-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726616002; x=1727220802; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JVH0PhuqzGJ6Zw5HkEwrGuq6lwwfENkUU4SZhlLdwsA=;
 b=c4yOriJfExawKz+uvi/7THav4DseDGWFuP6vX1l1RAlhE6c0UDnh5lI6rzfyEwRzPP
 Y8Rv1NFTSxu4u28hJ4qvfHuHXLuIZNI8JqVopcKMzqBZIYAytk7nyQj02BxaSqMGRKcu
 CHNXCCO2PURcgiHbgX0QbQhi/QvyGpIFrFC+dlapHM0eywQVFrzkHn51wUZqHgASvM7X
 ErZAdvdKbFugWtI++0bUE/ulS+bpL+OrHtVwyL9MwL3kdMRjgbdWMNUSPyw1A3R/N69R
 srJCVx2j2g70+xlrK5+N44gRlliSyTuX23Q8SJHQsQhUjMdEtxJ7TkOSa/Y2NvffRAGF
 esgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=c4yOriJf
Subject: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to version
 3.1.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index d029ebda2d..d58c0b27fa 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  2bfafdb2d02d19ca4a3dfd02a9dbdfa7  pyparsing-3.1.2.tar.gz
-sha256  a1bac0ce561155ecc3ed78ca94d3c9378656ad4c94c1270de543f621420f94ad  pyparsing-3.1.2.tar.gz
+md5  92160532cc2c2f289e5f35d87ce0ed0d  pyparsing-3.1.4.tar.gz
+sha256  f86ec8d1a83f11977c9a6ea7598e8c27fc5cddfa5b07ea2241edbbde1d7bc032  pyparsing-3.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index b7cbbd4262..7b85a346d3 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.1.2
+PYTHON_PYPARSING_VERSION = 3.1.4
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/46/3a/31fd28064d016a2182584d579e033ec95b809d8e220e74c4af6f0f2e8842
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/83/08/13f3bce01b2061f2bbd582c9df82723de943784cf719a35ac886c652043a
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
