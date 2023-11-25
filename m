Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8A4C636BD
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 01:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12A14402EB;
	Sat, 25 Nov 2023 01:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12A14402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxWm-OLZT61c; Sat, 25 Nov 2023 01:38:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAE2C40160;
	Sat, 25 Nov 2023 01:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAE2C40160
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6DD21BF3B5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD855822DD
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD855822DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZWko7iW92uA for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 01:38:13 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E412B822DC
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 01:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E412B822DC
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7b35b9645e1so82913339f.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 17:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700876291; x=1701481091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q/KvQ57MaXjpP1JX9o0NHJSy35CeysvwvfXiLb6+A60=;
 b=d42xhP0wUK/sj4ECZU4A2kTJSznIv47KVJ7IoT8b8pOsmzBjZoFJhcaid2BbCfo6+9
 9eW9F1ZaYAm/WE9zFiIbK80wZRVATqs93nSFhdM4qkJ49chDf+RxzH1xKGP/nAcviRn3
 yDE939CrJbzF3esUD7AdcnazyxCUGYNsn2JW0VpXOX4yvQMEFqUMViFU0EvFwqOcgAH7
 VHfFqqzrUh5Nv1qK4ddsiCNnIhWy2G8P9v+LeXC5SsLQ211D/KZ/LzTB/jvPFM+FYvG6
 SXT6TIiyJL0T2PcfXGpQraXBCTGK3IbIMNoNVD5AfQXKlrINgo8eeSbbtjSt/tb7GB/c
 /Gzw==
X-Gm-Message-State: AOJu0YwYL3eF/Xexl5LciIRgT5RuaNPkxlirqUzaOOPg345sTE0Outhc
 qHA1odDtpgU1PR18OnROqEEU8g633NQ=
X-Google-Smtp-Source: AGHT+IG7cnNmbPLtljIMh7o6oHzqodNeUlop0QLbnXULRgUfD73EHy6ov2KvRu0WgiTwfe+SBmdAMw==
X-Received: by 2002:a05:6602:168a:b0:798:d82b:7b02 with SMTP id
 s10-20020a056602168a00b00798d82b7b02mr6886318iow.4.1700876291511; 
 Fri, 24 Nov 2023 17:38:11 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 g1-20020a028501000000b004645642818esm1139552jai.35.2023.11.24.17.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 17:38:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 18:38:05 -0700
Message-Id: <20231125013807.213822-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125013807.213822-1-james.hilliard1@gmail.com>
References: <20231125013807.213822-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700876291; x=1701481091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/KvQ57MaXjpP1JX9o0NHJSy35CeysvwvfXiLb6+A60=;
 b=G/DGCpOfff5kH6xSQfHF6Fnn8jCqbJj5GxykpYCAkru2jZQcOdczFUywV/CZ/F5SIJ
 RZDsp82uuS57ONoidSphJ1nICj6GbXAjNt4bdKXcldCzfmfH1jj5Sqxb4kzqBY95A0ix
 jLKoYarInnBsh/TjcSNPwU88DvvTUO9B0UGP7o7jPgKVmnM9fRGB+f17UoFqTzNQLP1f
 /6/CaGK9ppISxQZWBkX55CiCt9L55YOzXgIK433B4jWKj/svHCuT3hR2lgtxzvLzm+Gg
 Mz8QnOfTdvLisJEJMsq9P5D0rGFusZY4mCMoNc8DSHLXBkNPGHKjuOImSd2lgcaYwkK4
 /LAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G/DGCpOf
Subject: [Buildroot] [PATCH 2/4] package/python-meson-python: new host
 package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-meson-python.hash                   |  5 +++++
 .../python-meson-python/python-meson-python.mk | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 package/python-meson-python/python-meson-python.hash
 create mode 100644 package/python-meson-python/python-meson-python.mk

diff --git a/package/python-meson-python/python-meson-python.hash b/package/python-meson-python/python-meson-python.hash
new file mode 100644
index 0000000000..537353bad2
--- /dev/null
+++ b/package/python-meson-python/python-meson-python.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/meson-python/json
+md5  e91eb9946d7bb8be06e434c5a2dadd05  meson_python-0.15.0.tar.gz
+sha256  fddb73eecd49e89c1c41c87937cd89c2d0b65a1c63ba28238681d4bd9484d26f  meson_python-0.15.0.tar.gz
+# Locally computed sha256 checksums
+sha256  8f82ea9ef9a55b47f4170536d02e48b5bc33fc5135e5b4a1b5f8d6404833ec9b  LICENSE
diff --git a/package/python-meson-python/python-meson-python.mk b/package/python-meson-python/python-meson-python.mk
new file mode 100644
index 0000000000..64d5de4ba9
--- /dev/null
+++ b/package/python-meson-python/python-meson-python.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-meson-python
+#
+################################################################################
+
+PYTHON_MESON_PYTHON_VERSION = 0.15.0
+PYTHON_MESON_PYTHON_SOURCE = meson_python-$(PYTHON_MESON_PYTHON_VERSION).tar.gz
+PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/a2/3b/276b596824a0820987fdcc7721618453b4f9a8305fe20b611a00ac3f948e
+PYTHON_MESON_PYTHON_SETUP_TYPE = pep517
+PYTHON_MESON_PYTHON_LICENSE = MIT
+PYTHON_MESON_PYTHON_LICENSE_FILES = LICENSE
+HOST_PYTHON_MESON_PYTHON_DEPENDENCIES = \
+	host-meson \
+	host-patchelf \
+	host-python-pyproject-metadata
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
