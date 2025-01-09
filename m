Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F9FE77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 21:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32174401BA;
	Thu,  9 Jan 2025 21:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdS4MbFpY6F8; Thu,  9 Jan 2025 21:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5ED8401E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5ED8401E2;
	Thu,  9 Jan 2025 21:32:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33F59940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F8068058C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEfN0vJdl3py for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 21:32:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E81E08055D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E81E08055D
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E81E08055D
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:32:48 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a8ed4c8647so7846805ab.1
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 13:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736458367; x=1737063167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=igOHyqDE7U+Y40KP43/NH5mK7qUzjnk+Qbc6e7C5Ays=;
 b=bJ7yWLfXvVHaUAF40B2LeI5KcyDh5piAe1bgKJrTCBVUjQxFLkLsEKo3fTFsDNeQVA
 SHhWqhMVu19p6lw9HzN9wr5ehaAYgIYrCFBw168iVqPJj5HvCFx8VfkKx44Ym0526PYS
 17Ejbo3+BxjhJXUhujBksz6LVeKmcD/AsHY75gs0pTlH/DXWZJ6F4GZGIZuXZFmxLGbW
 lNddF8Bt5/ePZaquKdX6l44woiUE+FWuZw8n3lQrg7X2l7vHVM4wqcFmHVLZQmdOhT/E
 pxsicwRTWkRYlgT0qpAnDTQ+eS0cLSB4uwSfaJ4OGODZ2th7vFUGUm/oC6ZYqLVrHqRo
 171Q==
X-Gm-Message-State: AOJu0YzER8XAssHHRAoDWoytoUXZ9KPFjoUnQfr8aey6xSeNV1BUFZcj
 rRVMDsB0CW7BszFS/hH2Q9xMlyhX0iP8sdJVezF4xgX7hZhVPgJcuG2T2NvF11I=
X-Gm-Gg: ASbGncsClyJw0ohUKb47WdXoQpGg0STuSYl9G0FkH+ZKW3Y9Q/I3gQIccH8c1h7UnWz
 Qj1XFj1TCE8umQ82jYt+o6mEWD6WSQIpNWwT7USEWxKJHOpMsBDxJwrqT83mL1XqjnZge25ZZP+
 LISYJ1Vx4F/ipNCWaIPVScWrXbrU9SgYuNA72Ifnx/grU6zr5yBkBxZ6Q3P7z4ThBzyPbYMWuAk
 NNMC5MrEKiN0E3TSyg7+Rq4gmU7/TRZ3EBjSuRCx36Gly9JffIdA/Fw/Rs5jl90frVHGhOjyjX9
 7DCdXE0rzp9ZYjIsKCviGLiAFHviA7s=
X-Google-Smtp-Source: AGHT+IHLava1wXiauCyL5bP3eRxIDKMIZyjYxiLN2fQkklOpTnbOJH1fReQEE5pxY1VZL/MB1IzVUA==
X-Received: by 2002:a05:6e02:1908:b0:3a7:21ad:72a9 with SMTP id
 e9e14a558f8ab-3ce3a938e03mr64013055ab.17.1736458367651; 
 Thu, 09 Jan 2025 13:32:47 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4adb3dcfsm5957235ab.23.2025.01.09.13.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:32:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 14:32:45 -0700
Message-Id: <20250109213245.2408611-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736458367; x=1737063167; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=igOHyqDE7U+Y40KP43/NH5mK7qUzjnk+Qbc6e7C5Ays=;
 b=OrZF8pNkG8DKo8p9w8JA3x9mgNh4fFZhvoBQzOo0KmCp8+SEjS6Vl0y73a5p88khUr
 bsIWBTyfQhiLRN4jsrKv/kSVIySqVbibn6gxpYVgvm7q9r8CZoNvritcZA8IXLwN6n0U
 YyeR/H2yv1LWzJVMCVlykYU5H53ZXCrTPmFgH/VOOm1GItFKWKGq2aTBU8GtRVmHVjBE
 iwoj3t/o0OWusIvpNG2ffSbc8LG2IvdX9cRZYuccOI+Tv6jhhXwFSVr/64uwXzHVP1sg
 mYNIRoZQVgJIGIBOPkrbOhlzHDFGJxu9GetNdJ0JLNjNvk/GCHB1qx5jPl9MJbt38adX
 DP3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OrZF8pNk
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.31.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index ca2b0ea16c..8186b5c09d 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  728e73b95f7a3078fcbce50e64396bc3  ipython-8.29.0.tar.gz
-sha256  40b60e15b22591450eef73e40a027cf77bd652e757523eebc5bd7c7c498290eb  ipython-8.29.0.tar.gz
+md5  5c629ec6cc81a8d5eecea3956e670d54  ipython-8.31.0.tar.gz
+sha256  b6a2274606bec6166405ff05e54932ed6e5cfecaca1fc05f2cacde7bb074d70b  ipython-8.31.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 7e7806b12d..2bc4b54ef7 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.29.0
+PYTHON_IPYTHON_VERSION = 8.31.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/85/e0/a3f36dde97e12121106807d80485423ae4c5b27ce60d40d4ab0bab18a9db
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/01/35/6f90fdddff7a08b7b715fccbd2427b5212c9525cd043d26fdc45bee0708d
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
