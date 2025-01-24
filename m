Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBCCC0218B
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C521A6090A;
	Fri, 24 Jan 2025 20:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2iFz5g0UXIz; Fri, 24 Jan 2025 20:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C59DE60A62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C59DE60A62;
	Fri, 24 Jan 2025 20:05:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16713944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 031C7407A8
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yoXbnrhnEvrx for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:05:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE20B40733
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE20B40733
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE20B40733
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:05:54 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3cfae81ab24so7007105ab.3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737749153; x=1738353953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SlnTLKPHs2X0bE4OuFAb1XJX2JMuUOzNpie9JMdiQWo=;
 b=qLJEeVG9KAYV5+HFZdnhwnHr/BvrEgmbz7n40wZkN8xsIC504c1k+DfgngctGWUc0b
 edG3BL8HYwoG6k3PRd+pyVeieY5Sb1+vU7QSS/ra+SEJdhLXSxDL74LeErBjUr3kTwcM
 JXyAgOPG66B4tHLlMVCwURpaZOxqw4N6iyFsxqcBp7i8yQJ/mT/bAAxvGgg8g9Y9qqLX
 fO+zgSGvNP59keIK0WlnQ4x84F8gUb3FYqBP7T5ktuNM20XQm3AZrPNietSA15gKRB9a
 +kc3lsrWr6curoVKVIOHELeHie3G1+i5rGqz9XsCHELtXF8AgkbFJtpilU2T/uazT0OF
 F/sg==
X-Gm-Message-State: AOJu0Yw1Lq+UfnYXHZNOS88+hXcfYLPxb4i9pfmi+RrtsZE0MeHwGBN5
 YyCsyQgogCcr5qCgV9UYqQGpG+b86hqESBqHKwbvTx9FCaspdKVpECM9BOAL
X-Gm-Gg: ASbGncs2XT58fwCzCicoorCrKMbSQLsoEg6vsGHwd3yU5jcYwqC3kuLnR7gX0UNUJ5G
 DJ04a/jUncQZvI+1RBBstIuLr9t4KBVHBPMqoU4NAAM2rkoMqwbt5sJl9Gjrc6/Bzzdn4zLfMaz
 TqxwXpYegyUKpa9uShJ7o5dintkv/crZ2TVCNDRzQwXWHO4P+a4PAabq3dH/VxYNWKQWYCdlXhC
 /8A6ZxuoMtZjxRZ0CCp/X/66TjJy6ADiR0IF11zFcezNAJK2SLncX/pHdYbYT2s2LBGlNLwwrSL
 v1Rr7iog/ihRGUbW6Eg9itJUHmOiB/aiFROlJ3iu9Vca92W0KyXXR0M=
X-Google-Smtp-Source: AGHT+IEWBMfn2Wa8SMO83ChebtOtLVV0rR3ToW9CVIK0yNomQccRVypVRRWqEUEgWqfvQgBw6sW6JQ==
X-Received: by 2002:a05:6e02:218b:b0:3cf:cdb8:78fe with SMTP id
 e9e14a558f8ab-3cfcdb87b31mr25522165ab.22.1737749153590; 
 Fri, 24 Jan 2025 12:05:53 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc7433c97sm8799205ab.27.2025.01.24.12.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:05:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 13:05:51 -0700
Message-Id: <20250124200551.3841757-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737749153; x=1738353953; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SlnTLKPHs2X0bE4OuFAb1XJX2JMuUOzNpie9JMdiQWo=;
 b=F6lpEVnm1GA7IbQyZ6FoeJYqhwwl5SJblqziMl2GIWDZ54elWm132NfAcggI4JY9ES
 mTbgcYfArMg4DhQ8uZg/1gIMUhzsA3Zy1/ET5gaI3p2mYWXwZy3Oqy3IdozLNrxNBKPh
 6zogD3ynqQjJ5yRynDpxyq4kdpp7ZC2hS74LEIMnrDUVY0KgT2q1HdI82+Yhp1Iz349m
 l2BfGeTWT58ViYXwkS8H2GWkVoWc69ekiEITLmj6zpRfnVk5XQ7zpEHKjTTB0m7t4i67
 tKwvZ73YEt5OBBgw9PI0aFUo54K/LK7CIn3LAMZsVuDedW2yaOs6b9zCLBUDgk1R3vs3
 ijdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=F6lpEVnm
Subject: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.50
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
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index ee8237c7b0..6c531cb49b 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5  2448470c36f2f250c9decefcc337b9f7  prompt_toolkit-3.0.48.tar.gz
-sha256  d6623ab0477a80df74e646bdbc93621143f5caf104206aa29294d53de1a03d90  prompt_toolkit-3.0.48.tar.gz
+md5  c272c222da72fd7a854589a8059081af  prompt_toolkit-3.0.50.tar.gz
+sha256  544748f3860a2623ca5cd6d2795e7a14f3d0e1c3c9728359013f79877fc89bab  prompt_toolkit-3.0.50.tar.gz
 # Locally computed sha256 checksums
 sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index a03f76dcad..06fcc925a7 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.48
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.50
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/2d/4f/feb5e137aff82f7c7f3248267b97451da3644f6cdc218edfe549fb354127
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/a1/e1/bd15cb8ffdcfeeb2bdc215de3c3cffca11408d829e4b8416dcfe71ba8854
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
