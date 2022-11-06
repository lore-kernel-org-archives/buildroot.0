Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D19C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 16:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C30860AC6;
	Sun,  6 Nov 2022 16:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C30860AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id afziIro2dJmK; Sun,  6 Nov 2022 16:11:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C4DD607F6;
	Sun,  6 Nov 2022 16:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C4DD607F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 610081BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 388FC607F6
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 388FC607F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spdThXGMP-1m for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 16:11:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A0E7607CE
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A0E7607CE
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 16:11:53 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id e189so7171916iof.1
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 08:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aN36Jt9JYFlhz8ozUaJUOJty6NbIe0mcGzHjNoarazE=;
 b=Kg2TTnrMtXw996Ya1MWhvCDr06ctSnTXIM0E/fFODHwQB7lfVAAR1OZflk+/AnMb8a
 wQjPIpS1V8d8aFjWJJbvtxLABAFWdFRIo9Me8LR97q+qVFq0WVECcJtFrDrEcpJpXBQL
 NvzjCrZ01WnBlxkPZlJpcSHjRmG2o7eml5VM+YfMe6ctnSstd2iJhJJuzUyOm93hcr2J
 R3PkbK3qcJmqCN6xkDfvqSVcScP/DPewYJCYLpspS8vPdfu1nP684p1dFQ0osyiXKdD9
 Jouccoxibho7daN6Zc/EfsX9jP1RWQ14XeYVQCz2NZ4S8lF+YOxaO9crk9bglaNR5ZaQ
 6nbA==
X-Gm-Message-State: ACrzQf0oaauBj2+1GjKS3tsKG4utxLVDr3TgnydarDhoIAOJ0hakW1s2
 cEqmCz2e+0cEL0Yk42vddMrr9PgVw9to5Q==
X-Google-Smtp-Source: AMsMyM5vDSdTaeWVhcLyHRJHWQRhIILdtOu/+5/NBSzdPQIWmXtc0zsrjlZWI2FKPEp3G8nvzO1Eog==
X-Received: by 2002:a02:ac92:0:b0:375:6b5c:1643 with SMTP id
 x18-20020a02ac92000000b003756b5c1643mr19620561jan.186.1667751111960; 
 Sun, 06 Nov 2022 08:11:51 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 r17-20020a056638045100b00363ac6a0b89sm1745633jap.172.2022.11.06.08.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 08:11:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 09:11:49 -0700
Message-Id: <20221106161149.322781-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aN36Jt9JYFlhz8ozUaJUOJty6NbIe0mcGzHjNoarazE=;
 b=UxiYRc852rU16PcbIG/jue0ddZwb44HPQa/bVQ0fTh54j0GpnXC2bSA8Yr7kynvQ9z
 0uce2cWO5DmnvMAa6RFxJ9692hlGcGD19CaJ5nUzLrMk5aX1aI78i3wTAGR/mDDqFCdo
 Fak9OvKNBSDujmyhyjjRofyhvV7CV19Ca2bE/TZhBv3862Ghy+FqBXXgekzAkHawhgMJ
 lpJhUIrUmqNFM5Avx6BoeJZiwZbF/vdAjEpW7xzsfoWW/cgp0F/iUuwkkv+MBcJbEIVV
 CPl6R1m0C4bMXnY3S2CjITrsWmy4KuS06w55h2JaY8kj84foa8UFcg3IW4TJrgdqyth1
 2Qeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UxiYRc85
Subject: [Buildroot] [PATCH 1/1] package/python-pytest: bump to version 7.2.0
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index c2ead0aa64..2ae1e61ed4 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  4a98001581a18d4084cb5027fdb1467d  pytest-7.1.2.tar.gz
-sha256  a06a0425453864a270bc45e71f783330a7428defb4230fb5e6a731fde06ecd45  pytest-7.1.2.tar.gz
+md5  49decbade40109f9c6970df60c22a230  pytest-7.2.0.tar.gz
+sha256  c4014eb40e10f11f355ad4e3c2fb2c6c6d1919c73f3b5a433de4708202cade59  pytest-7.2.0.tar.gz
 # Locally computer sha256
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 85d762ac8b..1794582dd3 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 7.1.2
+PYTHON_PYTEST_VERSION = 7.2.0
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/4e/1f/34657c6ac56f3c58df650ba41f8ffb2620281ead8e11bcdc7db63cf72a78
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/0b/21/055f39bf8861580b43f845f9e8270c7786fe629b2f8562ff09007132e2e7
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
