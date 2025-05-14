Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942A1C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 15:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44ECE40BC2;
	Wed, 14 May 2025 15:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZFWKmHCI_Ci; Wed, 14 May 2025 15:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E9E14070C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E9E14070C;
	Wed, 14 May 2025 15:05:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E193112A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2AB6607DE
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPNpRSD4r0Cd for <buildroot@buildroot.org>;
 Wed, 14 May 2025 15:05:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 293D060A7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 293D060A7B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 293D060A7B
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:05:03 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so72626465e9.2
 for <buildroot@buildroot.org>; Wed, 14 May 2025 08:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747235101; x=1747839901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZMA9eVpraP06wxzZ+Gen4GU1wOwsebM0gT5dwWPRukA=;
 b=AM6mBktqhsZQJRuEe+h+3EGIIqAwQ5RhuoGarMdOhK5UYEfTTkSb0UvtJpwSE2Trxp
 EJa3oM7U7g78Wt792uRuVNEq33ydg6O5lZlJjYPjOiwLKWnJOn9xXnoYVnEdnOFPdV1U
 KTYnMmcHqxwS4U0qRpSHkQIritWKH/85Y45GxJ3fgWBwU8s063hzkvtx73wlSy/7NQgi
 zHAPsFQWHnwdnOSzlnoCTWrcInBNUrBPtBQZjoy+gel4zIOcrybE5PvNa2YQsb0YKXIU
 BCRcIRPj0gBBmSYCeDuWXOuRnCwirj8k8XW5KIOyQrtatkxvrKP7zW6rPWXYfyiEwgwO
 IR7A==
X-Gm-Message-State: AOJu0Yz/BnJc/D4Y1UqtdvGb7r3BZ3sM75zhwvIENBnNq6wS8wHblyku
 VTz3/aBsP1gElM+Ykt0qeb48dIZZr0D2lneRNaKF0KAvhsospTmJOhUjW14vkRsU1A02vnBjyEA
 BRo4=
X-Gm-Gg: ASbGncvQh0wp5Px3CZK9dgCYoB+xhbihmwusfvYkxFox+SAK9xp3ziRqEVecFR9qyVp
 NgAPhivcB0Ei5oFNsoFLejIlkQcJTCKtwo3ySkXfKq9dCIIKghSUDLjuGw4umoHG0gHA+2jbr7m
 T6YH0Wbfzcs+9MDBjAhRyuIHFOt7ch66OqDv2/Bb0GyK9atQ0RyyMS0+zJgnmgg9ItoCChjsyC5
 93PrwE/l6qESi3wccVuLKWssCGLLfQKw+6oPtklBlkL5AkTp6KYRxT6WNd9H/rkihH73AxQH1tj
 20mgw1uqWNvsmnDtyog2DxDAdPw0hvMCKkubynkw0MM09dsC6x+P56PYH8IodoYDCDtlrM8rj9m
 5
X-Google-Smtp-Source: AGHT+IEdhk09C6q+LKgCqBeLTs7489q9SY6d+3XvsQCN2vd7jSoWcsEws9DZr9VwfCE60z7+yltfEg==
X-Received: by 2002:a05:600c:6099:b0:439:6118:c188 with SMTP id
 5b1f17b1804b1-442f2110fe7mr37441595e9.19.1747235100835; 
 Wed, 14 May 2025 08:05:00 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39794cdsm34959675e9.38.2025.05.14.08.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 08:05:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 17:04:46 +0200
Message-ID: <20250514150446.968758-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747235101; x=1747839901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMA9eVpraP06wxzZ+Gen4GU1wOwsebM0gT5dwWPRukA=;
 b=bTQGede0Kmy5s/yDuWkCajOpBcgA9UICSutbID7FOiiwSRkSxOWALx++pXwm9Zudpj
 CfjbAk80jvQwVg/GbXf0EErBAgjy1jEJlNJJp/GBGk6STMIlWTjos26V8nrUvWM4qaJD
 TMufdmPTHdth6BQPRpSdwvdZzoDnTOHPU9eTG4p6zOQhE6ZU3JO1LHbikWzMbQLYICOg
 xbW23sDBMV21AlBUGZp1Tbyk2K/cFMSI3w3DDNDnWhToCTFWMvqgRh+iEiMsZnsmiIh3
 UJegJrII2Moh9fof+AxueXuanZhkOUU1AJ2gWGGbF3OWpFVWVwZdbT1hd2ANYyBI808z
 dA/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bTQGede0
Subject: [Buildroot] [PATCH 1/1] package/python-flask: security bump to
 version 3.1.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2025-47278: In Flask 3.1.0, the way fallback key configuration was
    handled resulted in the last fallback key being used for signing,
    rather than the current signing key.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-47278
  - https://github.com/pallets/flask/commit/73d6504063bfa00666a92b07a28aaf906c532f09

For more details on the version bump, see the release notes:
  - https://github.com/pallets/flask/releases/tag/3.1.1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-flask/python-flask.hash | 4 ++--
 package/python-flask/python-flask.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 97982f99d5..17564e8587 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask/json
-md5  c95d81666442bf04f7de7db7edbe2aff  flask-3.1.0.tar.gz
-sha256  5f873c5184c897c8d9d1b05df1e3d01b14910ce69607a117bd3277098a5836ac  flask-3.1.0.tar.gz
+md5  59dc1b0772bab098aff83e8008e97af6  flask-3.1.1.tar.gz
+sha256  284c7b8f2f58cb737f0cf1c30fd7eaf0ccfcde196099d24ecede3fc2005aa59e  flask-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
 sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index d44c2e68ef..2269b05d29 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 3.1.0
+PYTHON_FLASK_VERSION = 3.1.1
 PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/89/50/dff6380f1c7f84135484e176e0cac8690af72fa90e932ad2a0a60e28c69b
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/c0/de/e47735752347f4128bcf354e0da07ef311a78244eba9e3dc1d4a5ab21a98
 PYTHON_FLASK_SETUP_TYPE = flit
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
