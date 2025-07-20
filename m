Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F81C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 19:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D63DD60E4D;
	Sun, 20 Jul 2025 19:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uijagPYGeCHd; Sun, 20 Jul 2025 19:17:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8CD660BB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CD660BB8;
	Sun, 20 Jul 2025 19:17:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F14561F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E333860BB8
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrQ96b8ldIsp for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 19:17:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E85A60BAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E85A60BAD
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E85A60BAD
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:17:27 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3e2953dcaa1so9964775ab.1
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 12:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753039046; x=1753643846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iOKLuQYb4D7g/qnKzYMERHtaGT1X/naJ+tXIELG1cXI=;
 b=xJHBoRHt/L6ThfVW1oc5fteTMUokeOC96wafqwKUbSo48oVcbkUa0FAfJ4lWQDXV1I
 VTr8MkHl1oIGM3YDCgTJ1XYTKZ/Gv8hcnEOL056ELFFJAPZuedlRuhtlvbexmYHa9Uf8
 NvPrTAMKPKw0e6WlGgTgkgqCSSuMqg1x/lo9Lq/4N1zWzpkqM/pAbNTvUKLmPkhJZS8c
 ZBd754qyfOB5Noi8UUIZeb7dpF7RaPU6DOgMtN4hCmQOowtpc5X72O8Hy8Vpm9S26TGM
 gVZl03LsisEJkeg2cbZnVWqjGGEXB+aXZXftez0zzYlLcoPyfyPtIvg8Wk6d67eiToYd
 f1OQ==
X-Gm-Message-State: AOJu0YwXbUgUQrJ1jbxuNXFCH5Z6t2nv3ekMlrI+lK9qBILuuZrthvZr
 OeIbZQwmniQfI+zj7IWbGCdZsTnlyt+poCXWIDmY54NBo2/e3cB2YEnzQsgQReBz
X-Gm-Gg: ASbGncukXGgErQ5FD4EQtRL0gV5zNS/oHLuJyophFgA3ka5lLCaPqMBD4f/1oVZR/hR
 F9VV/epZTllxTF/yEH7OqPUOW0e86rIMukWdCqJfCwiw3TFzkx4IVrTo0qvvXqxq8hlohfhqvUI
 69xOWSM2iqD723IRqkwhHcn9Net6Nt7YoTbIqHr+e7OwHnaDNHQhoW5W3R/XyypfVk5yKVZIJ+E
 1zIcgh4OedDW39wGzgGFvheSgXo2Z50ICydY1YgI47753p4aw3qAyR6cO9303nS19/WAVV9U1vc
 gOKHZ8sb4f8624EBR/Q1G+Dv/0uki+i/Jm6of9Iw99CR+AhJ/k3cWQz1VRiMhcFMo7mpBI9ESZr
 fuzhV/Jm+Nzy+TzKpEywj0tm5jRDbv8ObWeY5MV7+8mTyIJTaxLC4QNirBjyzwqW0pK08S2Ee6J
 oNjojHh44=
X-Google-Smtp-Source: AGHT+IGXfJ0jvzOFHWWNwW30mbWP5rwur1aeonjbIRnl7Dg+gu/dn9P/JzoiFSuGUkGRwbkXM3TzKQ==
X-Received: by 2002:a05:6e02:1489:b0:3e2:952d:f5df with SMTP id
 e9e14a558f8ab-3e2952dfa35mr126775035ab.20.1753039045730; 
 Sun, 20 Jul 2025 12:17:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e29829763fsm18134965ab.45.2025.07.20.12.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 12:17:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 13:17:23 -0600
Message-Id: <20250720191723.3216187-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753039046; x=1753643846; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iOKLuQYb4D7g/qnKzYMERHtaGT1X/naJ+tXIELG1cXI=;
 b=aN7TswPaXEtRnFafYEi/QPDrC0XoZg4pDIL/rOMZrn8cp6WI620wcWZ94GsbXxk+3N
 srRoHM3bEiKDgpeoY7ffHhGtbcIHi60iq3ICgaKU88GwnPS1ir1vDrf5c3KeA93XKfrf
 Dk7UGQrK5jhJ1JOOWrWMFPEcdF41lUmhiBog2UPbpa9w1vpL/VCM7oz8gOL6xsQS8cUI
 MIvSUVKItknDsCpkub7J4FU9GMkSioY5qc2sJTkKNEWC/jtE9SwRjzOXyVIqmVDRT3md
 LAaVlfAKLSFdMlDNBcYsL15vf3E78h8u0GMUOPx5Tu77ovdykR1eYLVFGBe7aEhCq72e
 N5+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aN7TswPa
Subject: [Buildroot] [PATCH 1/1] package/python-aiojobs: bump to version
 1.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiojobs/python-aiojobs.hash | 4 ++--
 package/python-aiojobs/python-aiojobs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
index d5721dc6d0..b37c0c2a8c 100644
--- a/package/python-aiojobs/python-aiojobs.hash
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiojobs/json
-md5  efad80daa647b6346258f1027da44c8b  aiojobs-1.3.0.tar.gz
-sha256  03074c884b3dc388b8d798c0de24ec17d72b2799018497fda8062c0431a494b5  aiojobs-1.3.0.tar.gz
+md5  62057a870d80ed0d9ebe951ba3457cff  aiojobs-1.4.0.tar.gz
+sha256  463665c75d1fcc46c78d44375c1034abf5e3f087894b0fc5ec4dd16ef90fdc98  aiojobs-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1803dc89455114eefad3b827543343edc2452432fdac29b5edc66c8b66d4cbf3  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index e8ada82305..e0dff3fbe8 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOJOBS_VERSION = 1.3.0
+PYTHON_AIOJOBS_VERSION = 1.4.0
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/c4/0b/d612a769c28bd22bcc52b369a9a10c63eb6e7b5e2e0cfb35e3be7357fe29
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/03/54/751969398e2039b4dc458fa153dc066a0f7337a5b480d58944f59b7b38ae
 PYTHON_AIOJOBS_SETUP_TYPE = setuptools
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
