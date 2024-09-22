Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81937CF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 03:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09EE140124;
	Sun, 22 Sep 2024 03:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZIXqRsJKAYF; Sun, 22 Sep 2024 03:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3C184036A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3C184036A;
	Sun, 22 Sep 2024 03:06:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B350C1BF299
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A213860643
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFCFoylUB-Xs for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 03:06:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A397A6062C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A397A6062C
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A397A6062C
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:06:36 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a08489f757so14994035ab.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726974395; x=1727579195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iTEOK8eXQSomFLU4AaXrBfW5n2w2Dlgt1U86MzV6IBo=;
 b=j2x29BzSC96ykDCGV42DMG8h8Np27C7fKOIeJtUsc6Uj6LiOL3g5GVGRoot5hsIpSo
 0xcpiI7WX5tHA4BrFGt6vPYym70EpnZ3XxVKfjNX00UoyMjSHUfoUZjRwN+/k0i+azTq
 LjH4PJMjBr7qQ0eXZpdiCKv81/qwJ/C/iulpB/SgtfkaVLgWEJJDusNEduWmwLh19LfF
 YR6SR01ihZrO0c8kO4Hq73smJk1nMlRe42g+oHizqivLeTJxhwHzaOYEA7FCmGWBawwB
 ysuXQs+bVg7rnA0pSwbgdjBLAL4mFgMBEYYI/X808hLhZ2jdFcq2TaW92sT7WPlu5BNP
 mykg==
X-Gm-Message-State: AOJu0YyUy/zSwVWWFtqhHxGcyZklaU7q5beSrvH1D+Up18lUIeXYB5xv
 pxLUgne4lMLMH0WpbHrIXU27tN0DzVXSUdZoWvS6eEAm76im0zKPyqsv3A==
X-Google-Smtp-Source: AGHT+IHm5edn9euFqazLG2DCfY7eT7GzzDrzikPD6bpSMr9iXl7EXJYq7YKE1hod6Ogubpd9muc0ZA==
X-Received: by 2002:a05:6e02:1d87:b0:3a1:95d9:6f36 with SMTP id
 e9e14a558f8ab-3a195d9710amr13009075ab.13.1726974395294; 
 Sat, 21 Sep 2024 20:06:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed1add8sm4331824173.119.2024.09.21.20.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 20:06:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 21:06:33 -0600
Message-Id: <20240922030633.752714-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726974395; x=1727579195; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iTEOK8eXQSomFLU4AaXrBfW5n2w2Dlgt1U86MzV6IBo=;
 b=eZxdAc9RCXNSdJxQHq2tglHgvm6V9MtZ18NszQhXXPV2vXUry4XL834F2KQg18uP4n
 l8X06qpC9jx83y3514+KfTT0s0oBolSeIWFrkHi4294gWkqYgXjUYqAaFQdotqHtIezE
 1SbGs/s+hkupUgzsAazjJ/AxRR+Ls3MdY4jb9iBH4gaALQEqV15Ola1Oe/NU8TcKYhp/
 Zy/JMScOFtJzQzZe2GMZhQAlvK5LAM8Ne7tOPPzArW16UMf5LXfhbbTOi9oQ+wyQi5+s
 7WIeGtUOkZevFroHR4BqVbwBcSh71uMYlDfRVKu9DOz3xsYIIK0l7jPv6n65VlFPLRf+
 i8Gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eZxdAc9R
Subject: [Buildroot] [PATCH 1/1] package/python-starlette: bump to version
 0.38.5
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
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index b5ba43c061..ea5cb4799e 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  7861ee7609e649508792a4ece854406b  starlette-0.38.4.tar.gz
-sha256  53a7439060304a208fea17ed407e998f46da5e5d9b1addfea3040094512a6379  starlette-0.38.4.tar.gz
+md5  e2e61f4def1d357e73795c646bda57e8  starlette-0.38.5.tar.gz
+sha256  04a92830a9b6eb1442c766199d62260c3d4dc9c4f9188360626b1e0273cb7077  starlette-0.38.5.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 1a2b7532f7..bce75a1957 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.38.4
+PYTHON_STARLETTE_VERSION = 0.38.5
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/b4/9c/d85721508122ae927aa7064e10a3f47f8dabcd4fd162222afcecd0d8d7b7
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/13/aa/57975da16ca0c368bbb5687daa6ad79561c2328a44667a1d6802e94df3e5
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
