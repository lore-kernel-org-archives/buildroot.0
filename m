Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09CFC3ABA8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 20:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88CCD80AD5;
	Sun, 15 Sep 2024 20:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhfV2nX7AC-S; Sun, 15 Sep 2024 20:56:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CF0880AE9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CF0880AE9;
	Sun, 15 Sep 2024 20:56:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 72EDA1BF5F6
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 20:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E72840464
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 20:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jRD5OysfdWF for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 20:56:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27B4D400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27B4D400A4
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27B4D400A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 20:56:37 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82ade877fbeso168030339f.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 13:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726433797; x=1727038597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qSxTt5FFV9xckF/A6vrIzTdjDGsklJNAMSiuT3U9jJ4=;
 b=JPbpw4UPz4jKxd+IbQdoy6VZZNxPdQm9Akw/Iwa3+W/Ay0PlLr2M1EqGXs1K5bp9nZ
 FWOUViAhu2MgKI4M57uaShflgMaGfm519Z1aLfVsImCpY4kRLPvWqtT7YWary4URCL1/
 hG45daGNPV66AcsEOCu9yUx7laaBNvDxS97i4IXsaOmAtvNkb7pwS0TQJtlHLO3xShkD
 MBnHZ52/6wwsp0i2tT+DEVxtyotysBJI0oL5H2FgA/ebdbrno9u8EEvpmfmaToAndUFw
 robxONXTiB18vkwCrn+7HTlMXIU8McekAb6RaPnfzoXdxywwHjIPzt9zW7njkrFxYOFE
 52Sg==
X-Gm-Message-State: AOJu0YyxsxhwuOPEjopVYOPEFwJ3UYV12/WF8EfoNOteVUSYncSoaC86
 8+Jj17lDrrAsH4w14Fnrlx6JYIJvSFSb5cI1DEG7SMFxqboSme6JCaKUXQ==
X-Google-Smtp-Source: AGHT+IHrSNANMoRmZH7V8WWMpw1PGXqfkWAwbeYibgbdBlhi8owaZx5NE/jheLAxytVyKOh5IXa68w==
X-Received: by 2002:a92:b705:0:b0:3a0:8c5f:90c0 with SMTP id
 e9e14a558f8ab-3a08c5f923bmr61731505ab.10.1726433796653; 
 Sun, 15 Sep 2024 13:56:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfdc18sm12473185ab.1.2024.09.15.13.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 13:56:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 14:56:34 -0600
Message-Id: <20240915205634.1601319-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726433797; x=1727038597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qSxTt5FFV9xckF/A6vrIzTdjDGsklJNAMSiuT3U9jJ4=;
 b=A0aPKJB3bt3PP2mrBSsbN9x7/lQfwPSJft99NCWIWojjMPl+3VghltRkr+scL222yQ
 LDBtXyWcFI5l/N6lZR0C37eIor+SK5kNIqYOSEBoJcB+N1WagFPNuYdz+y10tVDoSgYl
 Dpm5+VZdtQS2QUE82MhTZdrbAvT5cymeEyR13YjTAq11aiEKxVW+dSyRpLLmGISw7mlN
 NkhzkJs8KKDGLWlE0umAi67BdaNUpjM5/EfN1DZ90uAK6B70fjxLH0tY2+HyrCofwVE4
 fIQ08/G6VGJX6FqXCMnnqCvmx3aP5EhD5HqXd1dIX9oB//yvygH+TCh8o7fkV0bP4Eii
 bHeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A0aPKJB3
Subject: [Buildroot] [PATCH 1/1] package/python-kiwisolver: bump to version
 1.4.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Esben Haabendal <esben@haabendal.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/nucleic/kiwi/commit/e8702fc0dee8233418891c7927b33b2663d6baef

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-kiwisolver/python-kiwisolver.hash | 6 +++---
 package/python-kiwisolver/python-kiwisolver.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
index 900027a88b..c4ae255377 100644
--- a/package/python-kiwisolver/python-kiwisolver.hash
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/kiwisolver/json
-md5  20dea6992699d6be8a563995d7fe0309  kiwisolver-1.4.5.tar.gz
-sha256  e57e563a57fb22a142da34f38acc2fc1a5c864bc29ca1517a88abc963e60d6ec  kiwisolver-1.4.5.tar.gz
+md5  3e1406c57a4fdce3804096f57a9b4855  kiwisolver-1.4.7.tar.gz
+sha256  9893ff81bd7107f7b685d3017cc6583daadb4fc26e4a888350df530e41980a60  kiwisolver-1.4.7.tar.gz
 # Locally computed sha256 checksums
-sha256  26da8d49744796f2601fb5fe9e5d8b9e8102064ca60a8dc1825b6177cb05450c  LICENSE
+sha256  238e69906d7e507a94832b9831131862c4176d58c002b388e2e99db5d83677d2  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
index 04a0779b37..4220e1c890 100644
--- a/package/python-kiwisolver/python-kiwisolver.mk
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KIWISOLVER_VERSION = 1.4.5
+PYTHON_KIWISOLVER_VERSION = 1.4.7
 PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
-PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/b9/2d/226779e405724344fc678fcc025b812587617ea1a48b9442628b688e85ea
+PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/85/4d/2255e1c76304cbd60b48cee302b66d1dde4468dc5b1160e4b7cb43778f2a
 PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
 PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
 PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
