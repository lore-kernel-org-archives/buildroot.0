Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8F2E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 14:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FCD340683;
	Sat, 11 Jan 2025 14:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CelGLQsLsiGi; Sat, 11 Jan 2025 14:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F3C7406B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F3C7406B8;
	Sat, 11 Jan 2025 14:35:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55BBD940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35971406B8
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8l3v6uSwka5 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 14:35:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3081C40663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3081C40663
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3081C40663
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:35:26 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-844e1eb50e2so96347339f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736606125; x=1737210925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Bu7L9Fm8t3fEBVC/0qiHjRydee9HUqYfTx6nM9DNg0=;
 b=MfsNlInGmWFns97B3vw1V5yDOxYmTSy9hWFilayhyQJM4d1BewT00P0UG42VS1ibkR
 ebI9eM4xqoM0Qol9oG6UkRKUzQkt6ufjgI7UuwZbC8G2X7MyvSuuouRp22937X31dL37
 KPefH5WpI0nIMHB5CApHYf0pRiuqyTdgf4w99tDrxyZG/qa+Ul4/vfw59HUkj3QBbcge
 Et3R9Uu09SenJwAVQ+Xrj0a88hmtCk5/ZiBKHaAsnIK9y4TWcOef+VOC0cGirII9wYfh
 NXRLH988pkXfLyfGaSnn6rfcoxqUllfqLj7/r4hKfMDuqU+Q9LGlHApRcOthqzKymMJr
 S+yQ==
X-Gm-Message-State: AOJu0Yypc1u5um8EQ1xNE/e5bLI7WebBRD4vJ5RnrifTxk1vWYlrNabU
 +s1nUFhvd/64aYh+JudUbWVy8TWrtjRATcMzFDMnII4ii5mcyI1dc90jCJtlIL4=
X-Gm-Gg: ASbGncs5b/j1jgd3Jk3dCH1Cf1MPvljF0YCvpeQscWIEefzSxg2ZqttCDNPZ5qxoPij
 bNlvrfscjNKEkX7kIk6wwCBjoumSFCbtAYyVCsNZX+KmkMXFr0zAeVky4OWq9vbhiAaDdAf8U/r
 qJ2d9cjqgVA34k9o7eXQzeMKDUVQ+JHNBxKHQS23Kwgi7+pihPwXtGzi8jmGn/49CtZIAR6r02O
 t3A1jKsTRvLKJsxje4CA3fY9e90ghnMjDIRGOBMB+Fhp2xvyoh+hxXTEDopPyNtCr7xxyNmbRnc
 WElUSNpMpjBifmyNbNIW2kV06xuTA5o=
X-Google-Smtp-Source: AGHT+IHSW/0WcFE9+MdE3Wpr0hROCpXp9Z3rEvNSuXW7Ucap7EKe5xIaNE5uWbLjWGTaIiYL43cpGg==
X-Received: by 2002:a92:1905:0:b0:3a7:820c:180a with SMTP id
 e9e14a558f8ab-3ce3a8bb656mr86490365ab.19.1736606124854; 
 Sat, 11 Jan 2025 06:35:24 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4adef371sm15964185ab.47.2025.01.11.06.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 06:35:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 07:35:23 -0700
Message-Id: <20250111143523.2741916-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736606125; x=1737210925; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Bu7L9Fm8t3fEBVC/0qiHjRydee9HUqYfTx6nM9DNg0=;
 b=Y0OZdCGZ6lBlfXgaIHcamB8fRGmLUbhJMVx6dpJYhgVOHqqK1PPrzcW/XeV7rRaK60
 h0qpRPNf+H1ax8k+u5xykSQQgbQ5n04XHJUwPa/x63cOB7KpMQGofIa0aFxKOrs9jPvv
 bvskp4vzXGVcnzg2n8eieRkxJ+zi9VArp1/1Yt+HiKx1+fIuvuwz1FInteNPHRrOewvo
 8TevGsChWSR/ah7iVmZJ+4zGrMdFOvv7P2phtJ/5Guls+oiwn9H2xUo9HjMCsDJR/ofk
 I+XjQ9Lu8bUAJ0pyBdFTgGx0IYMQXuE3MOpmA8ltcOhDuas/YxqxBVRNM3M0fdssbUBp
 nXrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y0OZdCGZ
Subject: [Buildroot] [PATCH 1/1] package/python-modbus-tk: bump to version
 1.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-modbus-tk/python-modbus-tk.hash | 4 ++--
 package/python-modbus-tk/python-modbus-tk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-modbus-tk/python-modbus-tk.hash b/package/python-modbus-tk/python-modbus-tk.hash
index c7f4ac2dd4..c60733b02d 100644
--- a/package/python-modbus-tk/python-modbus-tk.hash
+++ b/package/python-modbus-tk/python-modbus-tk.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/modbus-tk/json
-md5  2e66c361d3e4591a19be1259ef50fdf7  modbus_tk-1.1.3.tar.gz
-sha256  690fa7bb86ea978992465d2d61c8b5acc639ce0e8b833a0aa96d4dd172c5644a  modbus_tk-1.1.3.tar.gz
+md5  03873278a842535c9069cc0dd352f520  modbus_tk-1.1.4.tar.gz
+sha256  68977766eb10469973dd56a2814bd981b85dd180b79043248786d88008f2593b  modbus_tk-1.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3b6a7f9c478ac1982e86cdadb45eb4788241b95839500eb26839d5053b74a24a  license.txt
 sha256  aa7ca42152a13db6a27b31944f99851efc3b9ee813912ff21d7d6ceadca62e6f  copying.txt
diff --git a/package/python-modbus-tk/python-modbus-tk.mk b/package/python-modbus-tk/python-modbus-tk.mk
index d8552e57a6..2e15354b04 100644
--- a/package/python-modbus-tk/python-modbus-tk.mk
+++ b/package/python-modbus-tk/python-modbus-tk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MODBUS_TK_VERSION = 1.1.3
+PYTHON_MODBUS_TK_VERSION = 1.1.4
 PYTHON_MODBUS_TK_SOURCE = modbus_tk-$(PYTHON_MODBUS_TK_VERSION).tar.gz
-PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/8d/9f/5963e30dba160dbc646b76c59ca8136709c7fe9002bbaaa3cf1e1bb0404b
+PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/78/40/9ae5c428b1867bfccd3c184dcf18cfef04e3d9c5b9dc22b8e9eb8d480651
 PYTHON_MODBUS_TK_SETUP_TYPE = setuptools
 PYTHON_MODBUS_TK_LICENSE = LGPL-2.1+
 PYTHON_MODBUS_TK_LICENSE_FILES = license.txt copying.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
