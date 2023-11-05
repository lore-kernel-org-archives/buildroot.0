Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25409C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 04:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3183821CB;
	Sun,  5 Nov 2023 04:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3183821CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNsFngQQjzXq; Sun,  5 Nov 2023 04:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB22E821CD;
	Sun,  5 Nov 2023 04:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB22E821CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D20D1BF5A0
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DDF741A06
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DDF741A06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xUZ8XV_v40I for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 04:49:32 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DC8041A05
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 04:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC8041A05
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-35749078a59so11478585ab.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 21:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699159771; x=1699764571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VwOgPua+IfZh/I8B3Z/WKDX+NiWOnKLFMGETca/usdU=;
 b=KTFj2MaSOxv65J3nQemVj0Ch+b/V/I4IFl6cRUdfhPHQXL5Vj4VgeO9J0kkfUATuzO
 jg70fg1lxVgFygVR07p+9NzTrO9QfM4kwgq/dLzv5RjHnnH/EqEvvA5a7xMf14xxua6i
 eQtfLfHV/9EAO/Fc7rv9OSSECu1QQkinsnjM2fPBJ2gayVDUfvMOQvCe2sUR3wpQx10v
 NwmpHvkWdTspAofMm6/eAuy00QZx1DZGgCkphm203ZbHdCA9BbiZkcx0Bj57pMnPPcAs
 0lRjzJTN51hXwJcgmnk6bPglYQyWjoSG/v29md/Z0U9yVz4aZiBlpwcb5/ll4JLVFSMA
 xTDQ==
X-Gm-Message-State: AOJu0Yw7WTtnU83e7zBnmD5TXuFAf08c1DZWXh2v1vhfvjTKo3ZFF2MV
 f43UtFE03IZR6DLKWGAtB+zmts3DMFg=
X-Google-Smtp-Source: AGHT+IEYSwd/e9+N3C0WDBGOwpfUlQo7kBnsAc46gsvpTZQc+qYt54B9F7cFndyTDj9SIYv4Fs+IRw==
X-Received: by 2002:a92:cb02:0:b0:359:37e2:29da with SMTP id
 s2-20020a92cb02000000b0035937e229damr14983748ilo.16.1699159770746; 
 Sat, 04 Nov 2023 21:49:30 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 r15-20020a92d98f000000b0035134f1a240sm1627256iln.86.2023.11.04.21.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 21:49:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 22:49:28 -0600
Message-Id: <20231105044928.2821038-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699159771; x=1699764571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VwOgPua+IfZh/I8B3Z/WKDX+NiWOnKLFMGETca/usdU=;
 b=NNgCGWqSFRMHuFjJSOPj8OFPTT00J4bmXOZ++E2cxq9FEiY4/qCfcD2RikfY8aFdEb
 94E0G3qd7hoDEIM36kN4lNvTI0YYYkoOTSdyge5zaWqFmyTCmMthP9DkkkEGeAm7/+5a
 2AdEjEWnFiaeLt0qH9hSb+UMjOs1v3nnDZEOUnPCnlP2J1Z6xqRLgXDP6wtWBMycDlg6
 GxV9l2jF82CnsLIAgms6/mIJOUNYWDybbfY2LmV6TXwb1OyTtoiqK27vH5fBV8DSzCWk
 VlglyKcanuaYz1L3/fUXV+Zekdpqt4IDx9lAnZbg9740GRQ7Y1XPQKgRMx16V+cm42Am
 1vaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NNgCGWqS
Subject: [Buildroot] [PATCH 1/1] package/python-dnspython: bump to version
 2.4.2
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...move-spurious-wheel-build-dependency.patch | 29 -------------------
 .../python-dnspython/python-dnspython.hash    |  4 +--
 package/python-dnspython/python-dnspython.mk  |  4 +--
 3 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch

diff --git a/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch b/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch
deleted file mode 100644
index b43217edad..0000000000
--- a/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 53b989e4ce32c941d748ad33502600497595914a Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 2 Nov 2022 14:01:58 -0600
-Subject: [PATCH] Remove spurious wheel build dependency
-
-Wheel isn't a build dependency so it shouldn't be in setup_requires.
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-53b989e4ce32c941d748ad33502600497595914a]
----
- setup.cfg | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.cfg b/setup.cfg
-index 0abd270..2cb3e06 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -46,7 +46,7 @@ packages =
-     dns.rdtypes.CH
- python_requires = >=3.7
- test_suite = tests
--setup_requires = setuptools>=44; wheel; setuptools_scm[toml]>=3.4.3
-+setup_requires = setuptools>=44; setuptools_scm[toml]>=3.4.3
- 
- [options.extras_require]
- DOH = httpx>=0.21.1; h2>=4.1.0; requests; requests-toolbelt
--- 
-2.34.1
-
diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index 29441b41ea..77ffb5dedc 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  c7172f4115cd7b60fd5037cfcd8f9408  dnspython-2.2.1.tar.gz
-sha256  0f7569a4a6ff151958b64304071d370daa3243d15941a7beedf0c9fe5105603e  dnspython-2.2.1.tar.gz
+md5  fac4e1580e5e9dfee722cb97bc073722  dnspython-2.4.2.tar.gz
+sha256  8dcfae8c7460a2f84b4072e26f1c9f4101ca20c071649cb7c34e8b6a93d58984  dnspython-2.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 43030ae476..1459ec8881 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.2.1
+PYTHON_DNSPYTHON_VERSION = 2.4.2
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/99/fb/e7cd35bba24295ad41abfdff30f6b4c271fd6ac70d20132fa503c3e768e0
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/65/2d/372a20e52a87b2ba0160997575809806111a72e18aa92738daccceb8d2b9
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
