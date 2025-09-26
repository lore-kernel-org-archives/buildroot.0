Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BC5CAC5B9
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 12:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6060D8499C;
	Fri, 26 Sep 2025 12:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhmgFLxcWplg; Fri, 26 Sep 2025 12:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89E4B84992
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E4B84992;
	Fri, 26 Sep 2025 12:12:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA33D177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 12:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C06CF40074
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 12:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzWvxefOGF0D for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 12:12:19 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=dimitris@siganos.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A598140689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A598140689
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A598140689
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 12:12:18 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so1533399f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 05:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758888736; x=1759493536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xSUSfnhbe1sOAZgMj1YAwRoxwYQj3c7SWW3O62gWJ68=;
 b=ByAj5zkHqJ4QgC5oWhFEljM7pyT6t/ccKZ6nE4IJ8AtaC24zgEz1ulPOPwrsZIPJwU
 O9j6tTFS8LbK/b/TEDAl18cfKkzHXJ6kGfCUa/O7OJnrqI7rUEJNbpxFjsifzempjq4D
 0molqorHWmQ9Dvomo43shruZ14ok2+Wt/Hfn/S5StHjcRxBV7qUkw4bLoxy2vgzvN0an
 RDxJYb2dptPcgasrTZ/3hlO+G7EIBqgqoF+lct3ZXqAuHy9G+ehccvCao4YJDEtB9h4s
 R61ipfVipUQ3DaP9CUbXyDtcVJQY4xgUOLmpWBwqI4JUc69qF4QjTS1BB76fXpkyk5+p
 qcJQ==
X-Gm-Message-State: AOJu0YxSWusaPKPnB3rIpkFm5UK9rd6eTV9C1ZXDy/MzsH69I15zMx1t
 g7ub+yklEW0HL6hJcXyHf1q9+I8lrr+CI/ZgGN/u7X/ALiUr1cQOUVsAWyC/aLBYf/S7b+uhGso
 kh4Vzcvs=
X-Gm-Gg: ASbGnctRW6Crp2igUGMKDLkxYHaeP4/UeqTOI0UvfRnnC0ac6TSrKAbdiGFafheg4y/
 0HbrnF0ACLtvTlgePGbRKwsFzOI0/5VKXZQFY4QPeU7ygJBv5EjrGRxnyT7WuvaIaVdNnD1Eiu2
 Z5geKyB9bFeS3hlZNzLlzw0LQu7cOCwbHMkJptBZHjfcfVvKvykqgXtgssc/aez4PAMUrOVWYo5
 +zAOvIrqZ1ewJxLQMWJfkp0lKsAG5eG5Ige7YiTw98Y7NR8PcY6B6cXNfcTiExv+21Hkkjmj2cY
 47izfmsymbx/04XYVe0nIJTJ9LoN9nBEJWkM6T39esc50S5J7BlDBTOB2f6uaEFyxz8bDl7Kjqz
 OpEAgC+BWPCEPKte23C6G/g==
X-Google-Smtp-Source: AGHT+IGp8cKiUCy9sMimPH0xBDULC25PvyQgOiGcNlcQLarwvRaKUZja4nV9x51dac2EdpZRbfU7lA==
X-Received: by 2002:a05:6000:220b:b0:3d7:2284:b20 with SMTP id
 ffacd0b85a97d-40e458a93b6mr6024244f8f.3.1758888735583; 
 Fri, 26 Sep 2025 05:12:15 -0700 (PDT)
Received: from tux.home ([2a00:23c7:e1e4:7401:ee23:fd19:8f56:daae])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc92491efsm7040109f8f.62.2025.09.26.05.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 05:12:14 -0700 (PDT)
From: Dimitrios Siganos <dimitris@siganos.org>
To: buildroot@buildroot.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Date: Fri, 26 Sep 2025 13:12:08 +0100
Message-Id: <20250926121208.2217060-1-dimitris@siganos.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siganos-org.20230601.gappssmtp.com; s=20230601; t=1758888736; x=1759493536;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xSUSfnhbe1sOAZgMj1YAwRoxwYQj3c7SWW3O62gWJ68=;
 b=UD/zT9ru6zhrJJXWDhFjZG+i6hLUV93XgLXQMLkzioUFC6FTeFiMEu+bHYwdWLhXUb
 oZleqO45ydh2Cx7c44+exlueMa2cmLzu1Mp37iNlhJJvKl+M8i3w7vhW9Lvf/C4Wq5mv
 B9aUl4Bt6VN1CVlWUX+SR9X7kL7hyROF1PzK5+0HuN921zPyUWiu3ko84vXpxzUuQhpx
 zJKdwqDLWG+zC7uMMuCH/uq0WubuC+yRwDjpM7f0UAxdm87f6qbxECVemizV8YZYd5BD
 FCSsfFJet6UCM0tSWHR4oMrLVUeH7Qj13ceSvb0uJ5IKZhvatytImJOs0zdsyykgvPeH
 xZBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=siganos.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=siganos-org.20230601.gappssmtp.com
 header.i=@siganos-org.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=UD/zT9ru
Subject: [Buildroot] [PATCH 1/1] bvi: new package
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

A visual editor for binary files. Bvi allows the user to edit binary files
with a VI-like interface.

Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/bvi/Config.in |  8 ++++++++
 package/bvi/bvi.hash  |  3 +++
 package/bvi/bvi.mk    | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/bvi/Config.in
 create mode 100644 package/bvi/bvi.hash
 create mode 100644 package/bvi/bvi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fc561eb1ea..ea452ab693 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -874,6 +874,7 @@ F:	package/wolftpm/
 
 N:	Dimitrios Siganos <dimitris@siganos.org>
 F:	package/wireless-regdb/
+F:	package/bvi/
 
 N:	Dmitry Chestnykh <dm.chestnykh@gmail.com>
 F:	board/qemu/sparc-ss10/
diff --git a/package/Config.in b/package/Config.in
index 85928509f8..c54be6275e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2950,6 +2950,7 @@ endmenu
 
 menu "Text editors and viewers"
 	source "package/bat/Config.in"
+	source "package/bvi/Config.in"
 	source "package/ed/Config.in"
 	source "package/joe/Config.in"
 	source "package/less/Config.in"
diff --git a/package/bvi/Config.in b/package/bvi/Config.in
new file mode 100644
index 0000000000..654fbf9cd7
--- /dev/null
+++ b/package/bvi/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BVI
+	bool "bvi"
+	select BR2_PACKAGE_NCURSES
+	help
+	  A visual editor for binary files. Bvi allows the user to
+	  edit binary files with a VI-like interface.
+
+	  https://sourceforge.net/projects/bvi
diff --git a/package/bvi/bvi.hash b/package/bvi/bvi.hash
new file mode 100644
index 0000000000..a65daf0612
--- /dev/null
+++ b/package/bvi/bvi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  6540716a1a3b2b9711635108da14b26baea488881d4a682121c0bddbba6b74cb  bvi-1.5.0.src.tar.gz
+sha256  3e59ea99615003174426e1321df7a804f1d5bfe61bfaba7ebbb2db0e358f93fb  COPYING
diff --git a/package/bvi/bvi.mk b/package/bvi/bvi.mk
new file mode 100644
index 0000000000..8bf6ac5c0e
--- /dev/null
+++ b/package/bvi/bvi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# bvi
+#
+################################################################################
+
+BVI_VERSION = 1.5.0
+BVI_SITE = https://sourceforge.net/projects/bvi/files/bvi/$(BVI_VERSION)
+BVI_SOURCE = bvi-$(BVI_VERSION).src.tar.gz
+BVI_LICENSE = GPL-3.0+
+BVI_LICENSE_FILES = COPYING
+BVI_DEPENDENCIES = ncurses
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
