Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA28C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 06:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41ADC40912;
	Mon,  9 Jan 2023 06:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41ADC40912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6sRlC9xBeJe; Mon,  9 Jan 2023 06:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 195624090C;
	Mon,  9 Jan 2023 06:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 195624090C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEBA1BF48D
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 06:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53BC24090C
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 06:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53BC24090C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXDITyzd-YbH for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 06:09:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B2434090B
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B2434090B
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 06:09:32 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id o13so4437956ilc.7
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 22:09:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+vERBBE0544hl7J/dC5T+i9EyfDjOp4pUAnqQuuBF7w=;
 b=gC30oigSbjRv/KNGLr6g2KD1SBArNsZiYAbzNCGtSsjkMLc+kVd/5OiGr8hI/vUD8v
 IJLV4cjkGmdqH2jF81jgNaqQv3mGcShz9UUFQYqW/lybf0JvMpNMdyUZBorpJPZ7wlWQ
 /cQMX1tKN3vu5fMEluxEW0RibLkA3OTuMES+qa286/xIeexn8aTPg6hNOOM6OyBeq5t4
 BPSL1H7YrA6qNDWqvLsBpkumULG6g80iHIkUc1C00DrmrIgo+M8cHCvhNgVIOuRXsdCF
 pAMyum4Uq9KM+6PSE7n+zjd5xRH+6rSTpho/q8ICkXioSdFXw3caCZfdTBJkjcpvjSDq
 8bdA==
X-Gm-Message-State: AFqh2ko3DgYtNlSlupc5yo5rM5VmTnzntOrUQbY0CjS3IB04znmTpDvb
 5IoiWtngN56zvrvk6m6g4ciaP6nJeWTdBE7L
X-Google-Smtp-Source: AMrXdXtTe8KG1k0hvOYran+5tBloQSWOp9FmctKg+LPGIs/Dfn0Zb8Ivykmdq5eLv8UN8UnLbbm1Rg==
X-Received: by 2002:a92:c647:0:b0:30d:9d9d:3068 with SMTP id
 7-20020a92c647000000b0030d9d9d3068mr4805979ill.24.1673244571171; 
 Sun, 08 Jan 2023 22:09:31 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 n1-20020a056638120100b0039e8e0ecbcbsm223094jas.64.2023.01.08.22.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 22:09:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 23:09:29 -0700
Message-Id: <20230109060929.2824169-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+vERBBE0544hl7J/dC5T+i9EyfDjOp4pUAnqQuuBF7w=;
 b=Wjk4GmH1wubvBJLyStS7BBM/ksNrPUg6lNlr0rPxIJBl7gUgCQijDuInNv3l7cdWVR
 rwORJpjeF4JpE+QWIk+Tmz3UM6enKcbPq3PocK+O1WhI4o3DGqTTAONjQELndhSctmUc
 LW0NOijgOaTL4IsA5khJS5c2jqU6WDQdxfopWeDoweA2Wyun7XZgR7/0vRXRBq2VJhSp
 yAMVNONC6G3C/NPBmJzESiO9+/cz/YBGjSz45X+7YFIWK9dtKT7jE6QZ3NAmX4ug9HxP
 rcFisQbGyz6JoAoJY+E7grAhnGWndJ4v/QHLs+I9i629nB7mrPCHzp/GwtVKJ9H/rAYW
 ImJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Wjk4GmH1
Subject: [Buildroot] [PATCH 1/1] package/python-termcolor: bump to version
 2.2.0
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
 package/python-termcolor/python-termcolor.hash | 4 ++--
 package/python-termcolor/python-termcolor.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
index 73fb9129ed..9be0ad00c8 100644
--- a/package/python-termcolor/python-termcolor.hash
+++ b/package/python-termcolor/python-termcolor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/termcolor/json
-md5  f7f59efd147dd1ec2a25e667616e8a52  termcolor-2.1.1.tar.gz
-sha256  67cee2009adc6449c650f6bcf3bdeed00c8ba53a8cda5362733c53e0a39fb70b  termcolor-2.1.1.tar.gz
+md5  ba0af4ee713cd0030c2d436091af4241  termcolor-2.2.0.tar.gz
+sha256  dfc8ac3f350788f23b2947b3e6cfa5a53b630b612e6cd8965a015a776020b99a  termcolor-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e79b6bd82962c1330caaa7c42278567b08667777673f8e2371a624d5715d4c0e  COPYING.txt
diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
index d7511d692f..5cbedfb396 100644
--- a/package/python-termcolor/python-termcolor.mk
+++ b/package/python-termcolor/python-termcolor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TERMCOLOR_VERSION = 2.1.1
+PYTHON_TERMCOLOR_VERSION = 2.2.0
 PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
-PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/19/da/ff1f0906818a5bd2e69e773d88801ca3c9e92d0d7caa99db1665658819ea
+PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/e5/4e/b2a54a21092ad2d5d70b0140e4080811bee06a39cc8481651579fe865c89
 PYTHON_TERMCOLOR_SETUP_TYPE = pep517
 PYTHON_TERMCOLOR_LICENSE = MIT
 PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
