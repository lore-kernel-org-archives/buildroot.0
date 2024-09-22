Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F40CCF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 05:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22E014011C;
	Sun, 22 Sep 2024 05:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rin1ldyGVcau; Sun, 22 Sep 2024 05:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA65140360
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA65140360;
	Sun, 22 Sep 2024 05:49:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04DBE1BF3C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7E89606B1
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmU7VUcFdqjx for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 05:49:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5FA66065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5FA66065A
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5FA66065A
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 05:48:59 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-82cdb749598so199044839f.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726984138; x=1727588938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wwzns93A2266g4aVEvgZlf76mtgIJhn/cI/zTuWrZPY=;
 b=gpqvQF63q8fpCoIiv9aWZ1ttEa/Jz2Ubad1Bnbzp2SYrrtIy8Krc8ICBpCa/vhEHKF
 cs0Y9XnJJm8jTfVpdr+KkwjyCr3ssc5dw9iah3CfROUQ/FwzfXCWVaO+ciSedHmooUz1
 8hYbw9sBasQMIwZEj8OcQWO22fg6fwPHgQV2rhsRbXuji0u4SuWjyaCMCVGUrgn2V167
 E6Q3psRkm4sXtBbES3ZO79/iJfxAS8PRg37fRN5C4fZDEj83w6sGCvefae74RnqHVte9
 Vw8RRGk3uetyjexGXQdVWuasmTFUZ6s/Niw0Ef6Qqs3zRCz1xPjV+j6krh3Tdql/Zw/Q
 +31Q==
X-Gm-Message-State: AOJu0YxkFh8mBR5ZQMRZZejsHJpGVxsAM+h4SQGYegnCMI+5NqSeYWoc
 vpfnTvC18cO9sYN7upidFV/Art6UC1tG44lKrZWm1fRbrAiPDqCX3noT0Q==
X-Google-Smtp-Source: AGHT+IGRZQIz/hp5UDNafn8eoshFCbeEqO8kyEyLhpAfdo3S/3uY9U6UTv9AaOjrt6gZ+kp6MFg4qQ==
X-Received: by 2002:a05:6e02:1908:b0:3a0:911d:c277 with SMTP id
 e9e14a558f8ab-3a0c8c6a282mr74601295ab.5.1726984138459; 
 Sat, 21 Sep 2024 22:48:58 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a0ca4087ddsm16520505ab.65.2024.09.21.22.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 22:48:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 23:48:56 -0600
Message-Id: <20240922054856.947641-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726984138; x=1727588938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wwzns93A2266g4aVEvgZlf76mtgIJhn/cI/zTuWrZPY=;
 b=Ld9tYRe+Vl5d0Gm8RvqJp74VLWZnfNHBrD0P0gtE7GlaAedixxP5EWMaJ2Cd1O2xwM
 ZNbxuSwoQzKi/B4Cp0WMbvlrpWuUy78nZI4POF/geK/6cjJjTYgMkPZeW7qFTiYmlumi
 Ols2TX0Ps7ldqZX9bew8A3kVL67DHj+i2zIM4dR+uDAkIK+axIrxXnTAsDRWGeznBlZ+
 3HWswziv/C8TdZtjrs/6Rfw5lVPrioRqG5KdJn3mDqArCxy7TKWsoKSCNDNf2rEDmZSh
 LkyIzsoFtLWJn3OfqXMfOKPveJgks35z47iK6QIXbaYFkzdYVjWlMBWnUomZaXzlDURY
 s7yQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ld9tYRe+
Subject: [Buildroot] [PATCH 1/1] package/python-typing-inspect: bump to
 version 0.9.0
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
 package/python-typing-inspect/Config.in                  | 1 +
 package/python-typing-inspect/python-typing-inspect.hash | 4 ++--
 package/python-typing-inspect/python-typing-inspect.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-inspect/Config.in b/package/python-typing-inspect/Config.in
index dda057a19c..b897676996 100644
--- a/package/python-typing-inspect/Config.in
+++ b/package/python-typing-inspect/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TYPING_INSPECT
 	bool "python-typing-inspect"
 	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Runtime inspection utilities for typing module.
 
diff --git a/package/python-typing-inspect/python-typing-inspect.hash b/package/python-typing-inspect/python-typing-inspect.hash
index 737373d609..55c29bf7ba 100644
--- a/package/python-typing-inspect/python-typing-inspect.hash
+++ b/package/python-typing-inspect/python-typing-inspect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspect/json
-md5  d56c8277a55d0bf061275df1ea3785d5  typing_inspect-0.8.0.tar.gz
-sha256  8b1ff0c400943b6145df8119c41c244ca8207f1f10c9c057aeed1560e4806e3d  typing_inspect-0.8.0.tar.gz
+md5  334f7f909260ceebb05e10ebd7039ff0  typing_inspect-0.9.0.tar.gz
+sha256  b23fc42ff6f6ef6954e4852c1fb512cdd18dbea03134f91f856a95ccc9461f78  typing_inspect-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f9d3567d00ca2337f769fb28c553cc590213ecefed4ed599110c10ded2ea0117  LICENSE
diff --git a/package/python-typing-inspect/python-typing-inspect.mk b/package/python-typing-inspect/python-typing-inspect.mk
index 8573bb1c27..09930058b5 100644
--- a/package/python-typing-inspect/python-typing-inspect.mk
+++ b/package/python-typing-inspect/python-typing-inspect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECT_VERSION = 0.8.0
+PYTHON_TYPING_INSPECT_VERSION = 0.9.0
 PYTHON_TYPING_INSPECT_SOURCE = typing_inspect-$(PYTHON_TYPING_INSPECT_VERSION).tar.gz
-PYTHON_TYPING_INSPECT_SITE = https://files.pythonhosted.org/packages/72/23/bed3ea644bcd77ffe9a7f591eb058c00739747e33ab94d80cc4319ddee8e
+PYTHON_TYPING_INSPECT_SITE = https://files.pythonhosted.org/packages/dc/74/1789779d91f1961fa9438e9a8710cdae6bd138c80d7303996933d117264a
 PYTHON_TYPING_INSPECT_SETUP_TYPE = setuptools
 PYTHON_TYPING_INSPECT_LICENSE = MIT
 PYTHON_TYPING_INSPECT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
