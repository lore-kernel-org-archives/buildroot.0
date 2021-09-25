Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A11AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:46:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B08EB60F70
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B08EB60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 527116070B;
	Sat, 25 Sep 2021 09:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WRJYyKRT2GO; Sat, 25 Sep 2021 09:46:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9679D6070E;
	Sat, 25 Sep 2021 09:46:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D6A71BF29E
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D4596070B
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4AXmmGr9_75 for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 09:46:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AEB260644
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 09:46:34 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t18so34943590wrb.0
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SEK+K3wuW5e+doR0guTukiqOQ1Nap+o9v2pKt8rHXZY=;
 b=XdEElo6MiafFta2y8tna2wQQAGOjRkNkcB6kR8GUBIWHY73b6MbT5fH9Fh2P0hxWOY
 15eh6ps2NICAvYjdz6AaSGSgaxFV8/HbIs6NWq7bgQc8rsbeftoAznpCww/39x1C5yDl
 ncwjPN83ErJxC18VqSAqED7ZdP89OiTjCtRFJOw0QGZAJxwVi/dzt6maUdmH9C5xZCsg
 cN5GjxMDz655vdQuLlBXZrGVFRCgT9S89Eu2T6ivfeCCPvXXywX80yCrNKe2e47W2hNq
 2JEB/k5I6WVrcALhKNQqh5kyd13cSqLToDlZXJGMVNgV+XYX+dSwosRMsL2RzrMnu+7z
 TFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SEK+K3wuW5e+doR0guTukiqOQ1Nap+o9v2pKt8rHXZY=;
 b=YfjoghbxW+vASJ6AQe7n2kybwC2+ILsGFxbHD58vOC4IxtjSI5fYM4zdTqLKQ0r0Op
 O6itGi2cB/PUggvlbCn/l6u1AebdldQykom/3F8HcturnJ0djBkuIUTivDhJmB+Iufin
 IxDgBbKWMSNfMyndHcDyjJ/T9onKvikkbi+p+CNW9GewejBbxoLi8GAY1ooV5TVsNjLP
 f5EBca+iZR0wrZxsD7W854DoQTvFKfDYjTlkxqgxWZeSc9DL/eBNVbYaRzQ1V2LZWycS
 Vi17YemraBnJKxLbkzmEOQ95m7cBNdExZWPdUJTacnRl2cF+WV8+/yXM9YN8i/ng0ONV
 LsKg==
X-Gm-Message-State: AOAM531Vm4CeMgYOIboFOZAR2+7qDJGjfBP2HSGGQ6wgTkFjbi/jz4yZ
 WD6CrCjs1D32MHIvoVYN7AVDGeWxBb0=
X-Google-Smtp-Source: ABdhPJx5cx+54VXPWLIgsZC08Yf6KOe2TY2BWTMAyLe+JkcE1PJ0XnPyKsOqaQ1Fx7hSZqANnSjhtA==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr16085966wrs.316.1632563192306; 
 Sat, 25 Sep 2021 02:46:32 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:7829:fae8:ae6e:81f0])
 by smtp.gmail.com with ESMTPSA id d2sm10297194wrc.32.2021.09.25.02.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 02:46:31 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 12:46:22 +0300
Message-Id: <20210925094626.365400-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210925094626.365400-1-asafka7@gmail.com>
References: <20210925094626.365400-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-inflection: bump to version
 0.5.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License file update was a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-inflection/python-inflection.hash | 10 +++++-----
 package/python-inflection/python-inflection.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-inflection/python-inflection.hash b/package/python-inflection/python-inflection.hash
index bdad35ad25..b170d3f6b0 100644
--- a/package/python-inflection/python-inflection.hash
+++ b/package/python-inflection/python-inflection.hash
@@ -1,5 +1,5 @@
-# Hashes from https://pypi.python.org/pypi/inflection/json
-md5     7941165e9f148e0520023941c0886b40  inflection-0.3.1.tar.gz
-sha256  18ea7fb7a7d152853386523def08736aa8c32636b047ade55f7578c4edeb16ca  inflection-0.3.1.tar.gz
-# License file, locally calculated
-sha256  4a3f52ac1012a90db398e4c55f1d1bea501dddafef8a4b3adb7533b1d820e148  LICENSE
+# md5, sha256 from https://pypi.org/pypi/inflection/json
+md5  c3287d4f0e3bdf625a52d655cc514403  inflection-0.5.1.tar.gz
+sha256  1a29730d366e996aaacffb2f1f1cb9593dc38e2ddd30c91250c6dde09ea9b417  inflection-0.5.1.tar.gz
+# Locally computed sha256 checksums
+sha256  9e9f9b4b2e7543ad1486f1328bf9ec50e5a5e2bb9caceb59652496dd61e64133  LICENSE
diff --git a/package/python-inflection/python-inflection.mk b/package/python-inflection/python-inflection.mk
index 7309880c6a..7c030e99b9 100644
--- a/package/python-inflection/python-inflection.mk
+++ b/package/python-inflection/python-inflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INFLECTION_VERSION = 0.3.1
+PYTHON_INFLECTION_VERSION = 0.5.1
 PYTHON_INFLECTION_SOURCE = inflection-$(PYTHON_INFLECTION_VERSION).tar.gz
-PYTHON_INFLECTION_SITE = https://pypi.python.org/packages/d5/35/a6eb45b4e2356fe688b21570864d4aa0d0a880ce387defe9c589112077f8
+PYTHON_INFLECTION_SITE = https://files.pythonhosted.org/packages/e1/7e/691d061b7329bc8d54edbf0ec22fbfb2afe61facb681f9aaa9bff7a27d04
 PYTHON_INFLECTION_SETUP_TYPE = setuptools
 PYTHON_INFLECTION_LICENSE = MIT
 PYTHON_INFLECTION_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
