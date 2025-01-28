Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EC8C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 190EA81453;
	Tue, 28 Jan 2025 17:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KO4IDHwzoU7j; Tue, 28 Jan 2025 17:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64993812A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64993812A8;
	Tue, 28 Jan 2025 17:16:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A664D31
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8700D40438
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ii8ZB65o_7f9 for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:16:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 756BB4035F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 756BB4035F
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 756BB4035F
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:16:33 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-844e55a981dso155054739f.3
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:16:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738084592; x=1738689392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3H3cqRck33UYcPuWzg5CtMFJ4QQgU0QbupBCNz8AgHs=;
 b=xJ/tDU8cG/FyDvCwL0EGyl91pBde3zXjGH58jQNq2nx4KRjWT352aI4GDaDnobT/Ii
 5UkNhkYKs8nSUNk0ZvSMnJAWsniBAPGoK64009308lu/6xIhNnbO5WDknrtNLanmkG1Y
 yw8/P80SKvHL/IFY26MipwSbSTS9HYyFm3HvovjtVZFWnci5p1UhFAHUCaXgHiPj0wKQ
 btB6FGPntz/PFkxngjENfRRLw20u/EYoOSRLXmVoNhbpE1Z5yJCDQQ6lb3sJMK5vZdXD
 qYZulMdx8ae9v/OrjpC5lghtfxcCiWb2Z9gNGmkE4N1epsHqz6JEP25FOtIC7fTLUJMG
 I46g==
X-Gm-Message-State: AOJu0YzbWhWDs92L7q7lsPWb1CVJWFsVSfS7QzmPRtZsUZjxCxeodL1/
 NsgQotKF7R7C/MvPFXKHAduEvSrPkdJZjVZgfR8XQA+jSUwhQl6mnPxVLp79
X-Gm-Gg: ASbGncvomnja5UcvqXE0lcvNJ8Fvy+/nvvHtMacmW3Fcj/Rujobt8KtZp1nLPHY5FNA
 SEwUFY+9SvMChRZsCV5TFID8Wf+bs5ni8DXG33Ib1N/iaa/8ONVqBzKDfsaeZ+4dW10sGdkQLTo
 IdjTYh5A3QDMqYXoHnQyWTYCAEpaaox0nVi3gV6RG6uFQTV1JKJnDD4cWU9apoqLnysgNd9HQP3
 azjOYitI1rc2jBg0hyW94TSLNUX6qWpkOl+q6bxCs1x9N1qLukF5HeHAAb8s/D/OB0+X/l3XdIt
 fbHMjNMZbJfx40Di+zxnOIACCX5dMXi4e55CGdo9Sqz4pjyIIHpK8eY7I9DBOIOxDg==
X-Google-Smtp-Source: AGHT+IERQKdNUYJqtwe30w3Yzu/pz//m5Ofp7WB+2YqhmIhYr27SOtSp68da8mNmjqI2S84V538b2w==
X-Received: by 2002:a05:6602:608c:b0:84f:54df:dde4 with SMTP id
 ca18e2360f4ac-8541110d4f1mr9993539f.6.1738084592289; 
 Tue, 28 Jan 2025 09:16:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521de11161sm342743839f.15.2025.01.28.09.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:16:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jan 2025 10:16:30 -0700
Message-Id: <20250128171630.2446611-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738084592; x=1738689392; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3H3cqRck33UYcPuWzg5CtMFJ4QQgU0QbupBCNz8AgHs=;
 b=hdyM4Zw7VYZQ9pr/IrXEJkGrKGp5+qKvn8vrrcteKG2da/sw2H9cbgfmPe171BhWFO
 1X6OkYg/U4/beM4yquo+XPpMVdess/rUvWHRIq5tjgZNr6zaDqLGIgiOP6zjBq+3QuvH
 930QMmH0RT738e3Aqc3K12YEjyqMoQ1rn+FHHai42qm+6+7trc8Bd+T1fcoP1X86cxIJ
 VLAA5kwZeXk1V/ATc2Nl0HUM0ar87LAktn3HbtA3A6dD88L15Or3NIa6WwIK87+TRfN9
 YCbpXwNckA3SKQlH8NjH8/8574G5xOl7Z2qHkbNXBqrEnqiAP+cqkhQ3yX9nAJq8mtQz
 pueQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hdyM4Zw7
Subject: [Buildroot] [PATCH 1/1] package/python-proto-plus: bump to version
 1.26.0
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
 package/python-proto-plus/python-proto-plus.hash | 4 ++--
 package/python-proto-plus/python-proto-plus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
index ebf3426886..fc8c1ad2f4 100644
--- a/package/python-proto-plus/python-proto-plus.hash
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/proto-plus/json
-md5  f1465151dcad7bb3c4ec3271e4afbc3d  proto_plus-1.25.0.tar.gz
-sha256  fbb17f57f7bd05a68b7707e745e26528b0b3c34e378db91eef93912c54982d91  proto_plus-1.25.0.tar.gz
+md5  12eab5f7e789e1153cd0dab5018bda09  proto_plus-1.26.0.tar.gz
+sha256  6e93d5f5ca267b54300880fff156b6a3386b3fa3f43b1da62e680fc0c586ef22  proto_plus-1.26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index 734c6b2003..1fe4fa3431 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROTO_PLUS_VERSION = 1.25.0
+PYTHON_PROTO_PLUS_VERSION = 1.26.0
 PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/7e/05/74417b2061e1bf1b82776037cad97094228fa1c1b6e82d08a78d3fb6ddb6
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/26/79/a5c6cbb42268cfd3ddc652dc526889044a8798c688a03ff58e5e92b743c8
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
