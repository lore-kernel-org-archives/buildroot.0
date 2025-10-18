Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197F5CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 16:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D231583806;
	Sat, 18 Oct 2025 16:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CmCndAiZReB; Sat, 18 Oct 2025 16:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E956383807
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E956383807;
	Sat, 18 Oct 2025 16:15:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9664B43F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93C5D408F1
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzBiACOTIAaE for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 16:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79D22401C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79D22401C8
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79D22401C8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:15:15 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-63c45c11be7so1885826a12.3
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 09:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760804113; x=1761408913;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NZSFkFkUhYxYhLL0LDy38rtVZOxImCPy5GvGCMHATKM=;
 b=hvw3hCwQJp7MCSxVO4od7nwu+tuMoyy3CnYNwu2TNlNxd94laAZC7jkEzY0fWnhpB8
 LQ+uS4RoPSXmRltlSRsIiRHql+arEpf0SMkzxEmQSXB6WpGBpbhHzPIPRBAvGFrmem0d
 DQ7gQfOAf3CJ4bWl7Yo2vhxl9QOtqtqxNVdKRjHkL0nYP5iONxYjLLm8gO22YXGx8P3P
 XETZzJcWEwQnwblcWA6vZik8Gndrzzh+TyX8aEzRijOktNlbdvc76CNqiPkjXhql8ViC
 hEXGlt2QB078wzddOKpqjZ47HLPXHwQkoSWzbWy7EVrQnZ/cpQXYnFehBewjI6XdqvTt
 f2cg==
X-Gm-Message-State: AOJu0YxQkGh/khdLV9zhYTqWCdbQMZLYn5/dbhTnG3cMQIjkq46RcwAj
 EjNKuQpB+IpKRFXW8xZz4LsMftq01SL2I6ZEPtHs+KcvSQ9kbpXKd8tb2tWtbii669iAowugHZu
 XlIUcV3k=
X-Gm-Gg: ASbGncvZyoII+QdrPVpM8ZrzFwo2XiElxO5OqToWxiNFe9pMypJfOkfr1h4R94GNrK2
 vdvuFN13Z7hDl67LrrqcrPpt8/BKOrLkLsTwFWWfoLjmJBejJqTdgzFSiaEDWO12cUegPS0FzRZ
 mFpWwAUdhmg1ofgO+iZOOhvB1gTJyAJSbYKlqDlkTEzl2t7y4TQrRxCmgaacXVGeHgo88NIB53i
 X/g+T7E6W2jBytHadaQWL2qYPFct3xY86WNoVUS713rcBtBKcISD4L8wOmWplYCSdbQY1GBSZrr
 Q1M4DKj6zGHFhIgf6lRnjaAp6VxLCGCAmlarByZBUjeI5PcbobXNh5DzwYKXl+WjYuYlxVw0Gbx
 L76zqwwvhAYohW2EuocKLD1Yv20xSgSci0awIVKyNdLLc9Nd7EW3LrJuX9sfD796xTRYbyHOKe+
 4OiwPpkBSYfkjS9KluZi/et5Am80ne7KMC8iGxOP7Jg9NVxB9PBsU9L//NQK7vosiaEGlMABI5a
 SC54hHqtMj5iTqBIb+/+4x3mb5701QeDD3yf9VPmdAh
X-Google-Smtp-Source: AGHT+IHLXn6raS3waSXs8wSl5wQrYOE7RdAzBlTrRnY04CneAd7h7LAbDpqG3i48vAdhkbwYSuIHFA==
X-Received: by 2002:a05:6402:26cc:b0:63c:1514:67cd with SMTP id
 4fb4d7f45d1cf-63c1f6da983mr6612545a12.17.1760804112907; 
 Sat, 18 Oct 2025 09:15:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4949bf40sm2453251a12.39.2025.10.18.09.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 09:15:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 18 Oct 2025 18:15:09 +0200
Message-ID: <20251018161509.1061905-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760804113; x=1761408913;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NZSFkFkUhYxYhLL0LDy38rtVZOxImCPy5GvGCMHATKM=;
 b=f9cDD1757ELIGN2DpCVeVXUfJsivtReVpsw1nadI2JUgZZRayFmmL4S7DOuFQozVnP
 0lPKQ9zuaTP3GEw/yXdGbghFckSoZJPZRXbhJduyN+JZDfsdXQfx96lDN63qzr9HYGCv
 J/CI/ItbDHt8SUABLc+Aj+pODE0FrQBxCKIhs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=f9cDD175
Subject: [Buildroot] [PATCH 1/1] package/leptonica: bump to version 1.86.0
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

Release notes:
http://www.leptonica.org/source/version-notes.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/leptonica/leptonica.hash | 2 +-
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 698342ae997a..293eef47417b 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  3745ae3bf271a6801a2292eead83ac926e3a9bc1bf622e9cd4dd0f3786e17205  leptonica-1.85.0.tar.gz
+sha256  1fa08e40bb37fd45802d5e6e7b43927449a5c47d4608ef99d3bd3f0fa76baedc  leptonica-1.86.0.tar.gz
 sha256  87829abb5bbb00b55a107365da89e9a33f86c4250169e5a1e5588505be7d5806  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 58db93d34ca6..a957e05616cb 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.85.0
+LEPTONICA_VERSION = 1.86.0
 LEPTONICA_SITE = https://github.com/DanBloomberg/leptonica/releases/download/$(LEPTONICA_VERSION)
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
