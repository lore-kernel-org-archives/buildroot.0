Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28861C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 19:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6C786108B;
	Sun, 20 Jul 2025 19:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yuPrKaZSIQm2; Sun, 20 Jul 2025 19:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00D8060EFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00D8060EFE;
	Sun, 20 Jul 2025 19:30:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77091127
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6918D41228
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Qe5eEVb_KJZ for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 19:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A693641227
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A693641227
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A693641227
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:30:25 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3e293a3b426so32210945ab.1
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 12:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753039824; x=1753644624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+xvWW2KZlE+8aqUgAW4bIds9lFlettWt+dgh2kKRF5Y=;
 b=nXvUXOznbMwj5DrftTfZSo+lo1cvFM9j+kXSYciBj2zC4oQtMdVymkZho3OPzwsRyA
 z8zx80wXvT/aGsHbfKjYt50HeVHTFlB1oIyrGMCQPMIQqR1zpoj2lLctkGEFgZF/ysRR
 NT5wjivEQuH6tdjp64W/lnBI27bDw0J71LA3tL5uixQokd8+sSnOtf5Qkv/0jCeRSAvP
 qH2b1aKYvSEahfh9z0FYR+mPerGmgwKP498v5KcoXFbeTdx+TNPV1ijdqOzvYkbeRM8X
 AqjAo/BYCZgAtt3wwApqZNk5+/UQ6mIdRrV75O1C/1LsV4cRPsd3Um036Ndywt2oaLQh
 gBYw==
X-Gm-Message-State: AOJu0YwPa1hTsLehiTb+lfm+8ZlYUoN8uzsNk4VrU+km9O41GlK+ZL5t
 wVNWlvdGxK4AqbozrY+WKY+1E676fgXwtkCxQwgqV7NplCYTXL7+Gpvp/huckcAK
X-Gm-Gg: ASbGncvQsXGiYoTuFzmSCmZX7L/sFylg3OGt8cvY//dj+/YnbwGVbEOXTyI9auWZx4Z
 le37PC7K4vmu7MhapZYGCMQ0xWSrQ9O0e7HlqzaIbuE4iT3KrgcfJ00cfcAadYpgIRpOZmEtKbk
 /iLPuLBjkmo6SM7aVgVf9SKxihi+TKZXai8pjYEunIcKi9LSurHIA7h37u0OrEvOgOsWC3vWfsa
 7AiZ4+0F+2EIuHDp1D06y4H4aMbUkc0nfKq2RLKRmwailrlwitlkvCvcL4/4NXX8GU40cAza6pp
 zrJiAskOyb0t63T6eNOyyemsBdEzPlMTvAJ/ssxxK91KfiqN02v6qOpb2X7NbAqMvX1sX8t4/Lp
 CSsuOHggqIeWRqPY2EQdArVrxLSAbKdm1LLc6QEZo4ZDbCmBjnmaOtYy46xxuAsesOvnAC8zgRE
 X7JXEDnnc=
X-Google-Smtp-Source: AGHT+IGHzcy25UTOFfb3DWLiR2+TWXHA9B4xrY2/2NwRQLLUa48Uy6Gd/D0rD450io+jT4XlodqgYQ==
X-Received: by 2002:a05:6e02:1a2d:b0:3e2:9f01:a87f with SMTP id
 e9e14a558f8ab-3e29f01aacamr84210495ab.22.1753039824301; 
 Sun, 20 Jul 2025 12:30:24 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e29826d45esm18438215ab.36.2025.07.20.12.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 12:30:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 13:30:21 -0600
Message-Id: <20250720193021.3217820-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753039824; x=1753644624; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+xvWW2KZlE+8aqUgAW4bIds9lFlettWt+dgh2kKRF5Y=;
 b=iWQCoXyOt2TQiYab7r6gSUDrSc2b04I906IYVtdOLe2qkAjzcjJInVZEKXp18NIDex
 8KArL0Oi885KRPvnz/9H98riheqVtbWpJj8/yqPxk8MaJVYWCiDcXXy9tQQCa+EJx8O1
 OvTrS9xBqaFSHTsmI9tf3jvqWIrKQHNQbLJhRjPuhNzRzMy9daUMbt3H3ZKsZnX1kWie
 HRYtw9QfEAiF/H1hUGHPYTiuB+DCl1+4bUzMGVaZHFwHwMkR2ytFBaa/WJCOTUn1LdxR
 uF0BqYTYAO2Lajp0OmSBl2/2Ay+5rvj6z0kV5NAku+2TOJ+mhvpVVLj9e2FxYdyrQgBE
 IrnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iWQCoXyO
Subject: [Buildroot] [PATCH 1/1] package/python-aiosignal: bump to version
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
 package/python-aiosignal/python-aiosignal.hash | 4 ++--
 package/python-aiosignal/python-aiosignal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiosignal/python-aiosignal.hash b/package/python-aiosignal/python-aiosignal.hash
index 53c7bbf51d..d4e5f9ad5f 100644
--- a/package/python-aiosignal/python-aiosignal.hash
+++ b/package/python-aiosignal/python-aiosignal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosignal/json
-md5  b40f0e0d5d442b6c1bc79e4e4c8eb7a6  aiosignal-1.3.2.tar.gz
-sha256  a8c255c66fafb1e499c9351d0bf32ff2d8a0321595ebac3b93713656d2436f54  aiosignal-1.3.2.tar.gz
+md5  9c692735b1422a94f16bd066ebf1fb7c  aiosignal-1.4.0.tar.gz
+sha256  f47eecd9468083c2029cc99945502cb7708b082c232f9aca65da147157b251c7  aiosignal-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-aiosignal/python-aiosignal.mk b/package/python-aiosignal/python-aiosignal.mk
index 9e8597f504..f143558d70 100644
--- a/package/python-aiosignal/python-aiosignal.mk
+++ b/package/python-aiosignal/python-aiosignal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSIGNAL_VERSION = 1.3.2
+PYTHON_AIOSIGNAL_VERSION = 1.4.0
 PYTHON_AIOSIGNAL_SOURCE = aiosignal-$(PYTHON_AIOSIGNAL_VERSION).tar.gz
-PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/ba/b5/6d55e80f6d8a08ce22b982eafa278d823b541c925f11ee774b0b9c43473d
+PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/61/62/06741b579156360248d1ec624842ad0edf697050bbaf7c3e46394e106ad1
 PYTHON_AIOSIGNAL_SETUP_TYPE = setuptools
 PYTHON_AIOSIGNAL_LICENSE = Apache-2.0
 PYTHON_AIOSIGNAL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
