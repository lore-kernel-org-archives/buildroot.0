Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54445C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B06440A8F;
	Sun,  5 Nov 2023 20:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B06440A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7JHxh2d1KzY; Sun,  5 Nov 2023 20:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 805F140A90;
	Sun,  5 Nov 2023 20:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 805F140A90
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E53D21BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB7D440A7B
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB7D440A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3jWHGpFXK715 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:22 +0000 (UTC)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81C2740A76
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81C2740A76
Received: by mail-pg1-x543.google.com with SMTP id
 41be03b00d2f7-5ab53b230f1so2992176a12.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215981; x=1699820781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4RxTYYAZVetyVk5yuYIjwnXPFOf6P4LCrZZujCJE/kc=;
 b=OXsXnmc+YJWgk/1AqfT6xsNW56jp/HKu0OT+9k9rlmVXlh5pOFnpUVx/9XUAuLZzry
 LrEfW+wYK6GVLBHPN5ZeSuTUNZdRDFy44MsMNPPQScaxylAHy0qyTi8LCQit6zsbrgpV
 Uv9qCkCyhwgiHenX0bWRywpbnMszQsJcY2+IzpTIg8RyAVUJIRpQ5ajKGyzcnFmce3M7
 t4i6U07Dbt/nPGrkOQxAfCCy5s0L+K/6vugLDZVFaA71aRh2522Xvc/GpbBRDkG5m0qW
 l8S/sVI4b2zjl6ZbMOzhR8WfJChE35e3n0DXQgnJXVkTp50WDCY+/Vm8DDYnLz2CfUdg
 lQ7w==
X-Gm-Message-State: AOJu0YwszcyVu/Vo3I8a0imr9JDLKngrgonVhNCJO77hTnCo/wCj4T6i
 7qPd+o2+CefpPeGCIMrDF3lj1lf6X7bPuCy379S2DUG/4kQ=
X-Google-Smtp-Source: AGHT+IFk3QIBvratds6XwSS4M1DQ4uEvq4opqVzk38rhOtqkPZTltwdJS9DvxAtygIEnhPi6on+P0Q==
X-Received: by 2002:a05:6a21:189:b0:181:6bde:72aa with SMTP id
 le9-20020a056a21018900b001816bde72aamr13362060pzb.42.1699215981074; 
 Sun, 05 Nov 2023 12:26:21 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:20 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:46 -0700
Message-ID: <20231105202555.359391-15-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215981; x=1699820781;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RxTYYAZVetyVk5yuYIjwnXPFOf6P4LCrZZujCJE/kc=;
 b=avfoE+zmz46dUxMlpvbrUKuNVEH7kbdapihz4XhFJTHFyH7YuQTPSE5ts0M1wKTT3Q
 3u01pteARoAQv0f/lJXcEdSYEleDmqI/GpMfIBKR/N4N9Dd++STP45mgw1hSFZEzOz9P
 7PMT+xMZi5mfuJnjpG7CxWHJSoLMJJMx15RIs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=avfoE+zm
Subject: [Buildroot] [PATCH v2 15/24] package/python-systemd: bump version
 to 235
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
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove the "# Should be kept in sync with $(SYSTEMD_VERSION)" line from
python-systemd.mk, as this package is not updated on a regular basis and does
not keep up to date with systemd.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Remove the "# Should be kept in sync with $(SYSTEMD_VERSION)" line.

 package/python-systemd/python-systemd.hash | 4 ++--
 package/python-systemd/python-systemd.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-systemd/python-systemd.hash b/package/python-systemd/python-systemd.hash
index 789b48590d..6cc6639218 100644
--- a/package/python-systemd/python-systemd.hash
+++ b/package/python-systemd/python-systemd.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/systemd-python/
-md5  5071ea5bcb976186e92a3f5e75df221d  systemd-python-234.tar.gz
+md5  93f3ca09f35719ca6a4edd1d62d38dd4  systemd-python-235.tar.gz
 # Locally computed
-sha256  fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7  systemd-python-234.tar.gz
+sha256  4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b8008e695c0a  systemd-python-235.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.txt
diff --git a/package/python-systemd/python-systemd.mk b/package/python-systemd/python-systemd.mk
index 3ccfd57ce5..fdc5d7e278 100644
--- a/package/python-systemd/python-systemd.mk
+++ b/package/python-systemd/python-systemd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SYSTEMD_VERSION = 234 # Should be kept in sync with $(SYSTEMD_VERSION)
+PYTHON_SYSTEMD_VERSION = 235
 PYTHON_SYSTEMD_SOURCE = systemd-python-$(PYTHON_SYSTEMD_VERSION).tar.gz
-PYTHON_SYSTEMD_SITE = https://pypi.python.org/packages/e8/a8/00ba0f605837a8f69523e6c3a4fb14675a6430c163f836540129c50b3aef
-PYTHON_SYSTEMD_SETUP_TYPE = distutils
+PYTHON_SYSTEMD_SITE = https://files.pythonhosted.org/packages/10/9e/ab4458e00367223bda2dd7ccf0849a72235ee3e29b36dce732685d9b7ad9
+PYTHON_SYSTEMD_SETUP_TYPE = setuptools
 PYTHON_SYSTEMD_LICENSE = LGPL-2.1
 PYTHON_SYSTEMD_LICENSE_FILES = LICENSE.txt
 PYTHON_SYSTEMD_DEPENDENCIES = systemd # To be able to link against libsystemd
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
