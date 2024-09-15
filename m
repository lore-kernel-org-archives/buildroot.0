Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC00C3ABA8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 20:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35BCD8113C;
	Sun, 15 Sep 2024 20:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyFqBzXU7sTu; Sun, 15 Sep 2024 20:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35D1D81147
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D1D81147;
	Sun, 15 Sep 2024 20:42:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE1321BF5F6
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 20:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C81D40245
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 20:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHawBlMJ0_zP for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 20:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6BA34400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BA34400A4
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BA34400A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 20:42:47 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a08e9ae822so5651215ab.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 13:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726432966; x=1727037766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o8I2l78FFY14vgPEBN8augueXWfWhm58lOfOuM7IPkg=;
 b=UwAUlEooxEmxZQnecgfguJ57mUeIeh7SBwvczFj+45txu2A1E6GS2GklVKSC3twSo+
 BKM+dHkjH3k63hUyClDwpJTbjeieM6r9D3QC/XTW8fYEsk+4I2bxqCvsrsWUDxXtiraS
 afez26sWwsKTny9PpcSxvRbY9V5I4BGdyzcu2F1xI3ePzfM/LBRQ8srhQLgSc94IUKEn
 qy2jdzIOOs2X2YhjgMUVizgrxRr5Nk5rsBZjZv1pwd3/Z5T67UNtd1Q9e2l2yLrfaFN3
 cpExRE7FXaDEC+CikjeFQY/4Qcs/oYQJzJ85N+6ctF09N/3sVdk+iyX4kIYOBPAkIV4j
 wlXA==
X-Gm-Message-State: AOJu0Yw7nLuLs0XO2OjKxDlHQuhmkCTEjW9qnNK776Y6q3AB9EH/Hmb8
 XqRV9g9hJ2jOmn+bCw3ZvN/4MZa/C4chPN8ToT97Q/sT8bxEH6zsBBHxHg==
X-Google-Smtp-Source: AGHT+IEHSMgfJEFfxKOo+vmlZoTiGGNnq37HFt/48RSpBpO8DcQ1dzEIhNQPKLiVQv6lCidE0XHCrQ==
X-Received: by 2002:a05:6e02:1788:b0:3a0:9f1a:7908 with SMTP id
 e9e14a558f8ab-3a09f1a7970mr16660915ab.11.1726432966379; 
 Sun, 15 Sep 2024 13:42:46 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed595fcsm1102298173.155.2024.09.15.13.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 13:42:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 14:42:44 -0600
Message-Id: <20240915204244.1595894-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726432966; x=1727037766; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o8I2l78FFY14vgPEBN8augueXWfWhm58lOfOuM7IPkg=;
 b=MGAv/cEHY/Mv6RnOxZo0hLcCg/t3zWmUjX1FGd25V9muETtpOmd0vXeC/9YH8fqZHW
 1LNPhhA1Pobb2Yw3Wqis5ekefRjyW7soEdQbA9ll2tmIrChmtXnc/QGTGACo4S+Vi2/o
 u+ubAn2vEYCynF2qaiUBpNVe1FHNy3B6YtNGECVgq7J+ugxvVlMMTjBC/WFHvmP6yPYc
 JXy7WagjTM6lc+lW+RiM1FwIX2Ys+YzAq5pJXzV+hRSJED+EN7FAKntVSmFpqW56+YXG
 Y7jKx58oKAiS/+uX/h9DyjM/A9o/MGkclNlHy0t3oHsizro2TeoDovePjxROwEyCNixj
 aaaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MGAv/cEH
Subject: [Buildroot] [PATCH 1/1] package/python-jsonschema: bump to version
 4.23.0
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
 package/python-jsonschema/python-jsonschema.hash | 4 ++--
 package/python-jsonschema/python-jsonschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index 645a6657fe..79d64f4846 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema/json
-md5  e758f0f6a8f3f59d754e7e35ea9f0792  jsonschema-4.20.0.tar.gz
-sha256  4f614fd46d8d61258610998997743ec5492a648b33cf478c1ddc23ed4598a5fa  jsonschema-4.20.0.tar.gz
+md5  a2cb5fee4da011118708ab275b34f30b  jsonschema-4.23.0.tar.gz
+sha256  d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4  jsonschema-4.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 9e8b6e18b8..21e4adab48 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 4.20.0
+PYTHON_JSONSCHEMA_VERSION = 4.23.0
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/a8/74/77bf12d3dd32b764692a71d4200f03429c41eee2e8a9225d344d91c03aff
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/38/2e/03362ee4034a4c917f697890ccd4aec0800ccf9ded7f511971c75451deec
 PYTHON_JSONSCHEMA_SETUP_TYPE = pep517
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
