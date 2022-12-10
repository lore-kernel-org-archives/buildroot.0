Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8EFC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 15:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8839C60ABF;
	Sat, 10 Dec 2022 15:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8839C60ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XsWZFRDCp22G; Sat, 10 Dec 2022 15:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0B0A60A71;
	Sat, 10 Dec 2022 15:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B0A60A71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64D2C1BF5A4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 15:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FDD260A71
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 15:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FDD260A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9cjNHVJmoqCq for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 15:47:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC4DE607F5
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC4DE607F5
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 15:47:08 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id h6so3607880iof.9
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 07:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xhHTeZ7A7zXGMP0YXSnATmutPy43/9qSgCJrjVRF054=;
 b=xmkpS+bW9hpP44vBWhCjCXQqhKiEE3f8zMYbSgqA5lOT6l/G24uwjytQwliHe2uw6/
 S2Sqfp5NMv+Ie+59+JwjHBeaJapqE7mzzHN+XPyeBY5xAdcdqUL3MMHCuXOiqKSEU3mV
 2F6krIghdyPlaOVg8bsqNpzHlJDqNn7J5hJG3N63L8WtgveUG3jfosJ3ufd7rgu1GTiO
 njROE3OGNnKmxNwx40mXrb/uqTOT5ZScfLKo5bpDJkKXyocyjueLmiceoIBjHD4SuKcp
 6p9/4NwmYHsE0PxVKUUtLOk61hsio8bZ9Y/gX5uxqUF+RuuaJjuJKYvX5u1sObWbwc9N
 JF1w==
X-Gm-Message-State: ANoB5pnoSwOYUoKOGMCj+s85HnyAVKgQoYxkyps2eA1ORQntuxJ2fnP9
 YPSeBySG8CBD6Y15oPJltQv0LDZOVWuWEQ==
X-Google-Smtp-Source: AA0mqf4ZbYq5uSVUXG+V0Gp4sObGbjYyL5eNapTKRysS4VdY/DgvBEZBlVIq/s9Nvt1iiYnAhQqL6w==
X-Received: by 2002:a5d:9485:0:b0:6bf:ea95:984d with SMTP id
 v5-20020a5d9485000000b006bfea95984dmr5791221ioj.12.1670687227421; 
 Sat, 10 Dec 2022 07:47:07 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 w62-20020a022a41000000b0038a4d0e1fb3sm1470691jaw.112.2022.12.10.07.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 07:47:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 08:47:05 -0700
Message-Id: <20221210154705.2380126-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xhHTeZ7A7zXGMP0YXSnATmutPy43/9qSgCJrjVRF054=;
 b=jg/PANUsWY3yZa+/H/YT7yNW6rN/EVSk29hBTKHerAV87rvWJ+W6WV4k55c/le6D+2
 u5nOaqGWNgrSqTffGyorCvKNVLclzEsMAkltGdow0CVKenygllA+KxB5RsfcNzYMeSg7
 KRyXAU4YDQ3nBbs8LMAEg60F/j5d7rxothH6K6GaIVdNxjxJMPInX8QS3goNLmHNfgLQ
 OJ2cmSWlbJxQntBtRYrhPvW20TJX7QA4m1FCiRJCGq01yEfT9mrijPdxNtjg9ORcsRcg
 cOvTze5PYXAxr6W121xa4RzjZ78TcwR0sMWDbOcvlljukXK7qpaQiWlblFFgvsm2jJHY
 ddqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jg/PANUs
Subject: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to version
 4.0.1
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
 package/python-bitstring/python-bitstring.hash | 6 +++---
 package/python-bitstring/python-bitstring.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index f05619a5d3..f078cc7f14 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitstring/json
-md5  04d24380a0dc491e6bdacd983a90912e  bitstring-3.1.9.tar.gz
-sha256  a5848a3f63111785224dca8bb4c0a75b62ecdef56a042c8d6be74b16f7e860e7  bitstring-3.1.9.tar.gz
+md5  ffd806650062e2fae33ee19b51906924  bitstring-4.0.1.tar.gz
+sha256  7719f08f6df89ce28453a5e580d4a8ec1d1bda892dbb033466da0ccd9bdcb706  bitstring-4.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a9e9c584106d4f9686c9a6aa036e507b5e7044633b8acb4365bc074d8d004711  LICENSE
+sha256  3705eed5a923f35d9bfaca1f10e9136cc84d6e576570aec661bda69991f129ea  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index ff59487540..11c9375707 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 3.1.9
+PYTHON_BITSTRING_VERSION = 4.0.1
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/4c/b1/80d58eeb21c9d4ca739770558d61f6adacb13aa4908f4f55e0974cbd25ee
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/d2/64/e733b18349be383a4b7859c865d6c9e5ccc5845e9b4258504055607ec1cb
 PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
