Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAECE7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 15:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8DEF6110C;
	Tue, 17 Dec 2024 15:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTpvcnAY_5k8; Tue, 17 Dec 2024 15:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C7CC61108
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C7CC61108;
	Tue, 17 Dec 2024 15:36:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CBCEE3
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 15:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46BFC404B5
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 15:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4Hn2I7jYZ-F for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 15:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99FC14014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99FC14014E
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99FC14014E
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 15:36:31 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so1186803466b.0
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 07:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734449789; x=1735054589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=egdZpnSUbBiC9lyQMSOl4P2o7BPWTTsMSMlwemyaFD4=;
 b=gwuTkDW+2I07I5HFPCfbh76gGRzNbSlAhR+8DtntgNbAXIndCeyC5vs460ZyvaObtc
 qpPFOvTGYExvCJQIG7a5eCXTctL/xf65FpR3AjyI9oRCSBDO5N9un1P8Yl1LdD3okmuj
 Le0WMgD+DW7dHGhVgjSScn5TdjUODJtb7Oph/cLC9f5Ppw+DHNP6Ucd96s/RL0YqzomE
 QbJEd/d+4yh/S9pTAELqDaTzphZYUbqVHSFmSKMYYCfYYFVG7JVpAGEFWu7LoaTirF4R
 4VoQe/q182Ezh/yFUL9l71MN/NsckEWSwTT5xpxbaOJzJ5+cItru/GWHAnh2hdYewjEu
 Z7QQ==
X-Gm-Message-State: AOJu0Yx8IfUVOKv5guiABTtW87LpxxICHjuR43owLgiJIWexeGtYVOLE
 FS/OK7w7O1zwi7ZaPCnQ2DTCV2kVd2TVYQVd9xsAQBWaBWu3dJm8DyFu7g==
X-Gm-Gg: ASbGnct7G3PLldLw3bJmr33h4nhHkGuZM5KlUHBJEnBudAvspnLuyEgzEW8s7oQCvsA
 L7x+1uQE9bvbpo8wCjyB7rbKUH4y0asFkPBUMEo1tOL4RGbQcE87TeSCpOSeKW5zpyv0F/KJMBp
 szSXpW1kZ/khL6Pd1eiC/t/+ThoQsBRcoudnlYo9pbyIEp6omLDXb7re64fKK2UiBREVJzDmbgv
 G9M4r3ofF8y7QvJom20RIQUkZFU3UCX1G5gSkMNXRjrdN2V7weeKjaoszoPO6TquCz9oMpXae5S
 Zw==
X-Google-Smtp-Source: AGHT+IGXmguCVWN23IhHVsky7gjkjVbIWFDmErwTeL1TnfJeMoX7GdBO1TFMOlCwxL0D3FrNYXbJiA==
X-Received: by 2002:a17:907:c23:b0:aa6:acbe:1a81 with SMTP id
 a640c23a62f3a-aabdcba2618mr289736766b.21.1734449788495; 
 Tue, 17 Dec 2024 07:36:28 -0800 (PST)
Received: from hthiery.kontron.local
 ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab960681a4sm456965866b.54.2024.12.17.07.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 07:36:27 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Kulhavy <brain@jikos.cz>, Heiko Thiery <heiko.thiery@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 17 Dec 2024 16:35:58 +0100
Message-Id: <20241217153557.939266-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734449789; x=1735054589; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=egdZpnSUbBiC9lyQMSOl4P2o7BPWTTsMSMlwemyaFD4=;
 b=XWnORMj2P9iRXseaiMhjzWbS/FnfHs8m9kOghXk49UhnPeV1VLoOYGTkIKlWGm2ZZT
 9AUUqTbxxI5cYmfR9vRFhySSL3Ncgi5QU1MOR3eTwjVMwsxK81SC96ImVN11bspqOqdI
 30jxBR67G4Bm4aFuZAxFJf7ZVncL62o0uvXDXvfdYz9VbWEUHnwn7qZFQ67c6Xei6GIm
 hrNIvuDXp6ivafFmiFfeI544CyTqtNC2RMA3PWw6N1SsmaV7IZ5Mpi1vXFkNf+Q1G682
 /QmHKwuMyCfW+M+zqjY9pViopbux2IIaMPJKGClVRJ+YhErros/fS4upFRmzX2xBdkt3
 VJ2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XWnORMj2
Subject: [Buildroot] [v2] package/linuxptp: bump version to 4.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The released package is no longer available under sourceforge. So we
switch the download URL to the official download page [1]. Also the info URL
about the package source is changed to the official LinuxPTP project page [2].

The release note [3] and annoucement on the mailinglist [4] give more
information about the changes.

[1] http://downloads.nwtime.org/linuxptp/
[2] https://linuxptp.nwtime.org/about/features/
[3] https://www.nwtime.org/news/linuxptp-4.4-released/
[4] https://lists.nwtime.org/sympa/arc/linuxptp-devel/2024-09/msg00020.html

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2: changes according review comments by Julien Olivain
 - change project URL
 - change download URL
 - add release note information

 package/linuxptp/Config.in     | 2 +-
 package/linuxptp/linuxptp.hash | 2 +-
 package/linuxptp/linuxptp.mk   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
index c88b7a0619..5f2f267bf1 100644
--- a/package/linuxptp/Config.in
+++ b/package/linuxptp/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LINUXPTP
 	  Linux kernel. Supporting legacy APIs and other platforms is
 	  not a goal.
 
-	  http://linuxptp.sourceforge.net/
+	  https://linuxptp.nwtime.org/about/features/
 
 comment "linuxptp needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index 1d5c590ea7..06ba8eb12b 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  70e38e5d2764e0217443da6f14e8846fe401a472293ac138d8419c07a665447a  linuxptp-4.2.tgz
+sha256  61757bc0a58d789b8fcbdddf56c88a0230597184a70dcb2ac05b4c6b619f7d5c  linuxptp-4.4.tgz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index eea41f0baf..044656aec5 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 4.2
-LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
-LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
+LINUXPTP_VERSION = 4.4
+LINUXPTP_SOURCE = linuxptp-4.4.tgz
+LINUXPTP_SITE = http://downloads.nwtime.org/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
 LINUXPTP_LICENSE_FILES = COPYING
 LINUXPTP_CPE_ID_VALID = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
