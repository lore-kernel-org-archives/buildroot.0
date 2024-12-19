Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94867E77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 531D361738;
	Thu, 19 Dec 2024 02:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFQPWPgPziym; Thu, 19 Dec 2024 02:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49C4261AD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49C4261AD8;
	Thu, 19 Dec 2024 02:36:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13CA8E9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1B24426EE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WF4goWXjXujY for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6604426EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6604426EC
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6604426EC
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:36:19 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a8c7b02d68so2203725ab.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734575778; x=1735180578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Asaa97hnOW/UfApqWuwt+9cn5GctPdLHgEKh3hfBLyU=;
 b=DnJVfCg2xKbj5pVv9TASZMz7HZEg/21/GHCA6+iX8ojPJKhS6h/Ai+AKWTFnRg3Cs5
 XgpskzLL4rr/+0QUQetla5cEFEyBucZeewJqfrJ5bAVi7zcmagfK1zKUtAvZujGiFtQ8
 nridXmKOsYSgaOgXWG5a8rtYGgcxzN4rKL6KRYxN3qQvU1Xmpfqj61WndHJ7enzyBB6s
 ETusaDcEbChStoK1JXR361UQFXyFzaw9O0D9eEJRMODrj4pvzE0+rBH7SD4OMo3fKey8
 046jsoL1XPAKs0lYb0HQEoxKWbJIGu81DagWieVmubzlGECGhUf3Q0ViLsNEIH7idR1l
 mSYQ==
X-Gm-Message-State: AOJu0YxWDJLR1XjuDSuM/Iy76oYDPrRupZ9zjOzifDYFB6cJmDDLIs4z
 2ymj66n3Ah/BBInNQkPMJlmgBZ4jMYkdiWrNeFPJq9u8JZ5GMkfGkU+9/emqvSk=
X-Gm-Gg: ASbGncsvLxQQChmfhJH/b3FOopLZkuwrR/qwOUAnKD9wFlPm1K/UCspJtwDdSIGC8qE
 U+5GFwCdkIM7LO2ogOJG7BLZxC4dRCEjbtzIZUF0OVbQYvGFku1zAhQiszjzcOJZn2N6jZEtMkX
 AG0HFZTsbPECqMp/0j46I80tZ3HNgTaUAq6EDmK6bx0aLvOc2Yfqq5cHXkfltnuB/ICIj8E2AEN
 tlRGj/KkFKlwxIvhMJTtTw5JPgciUmtsMVjO3gDGjxO51a39S3lDJFSoYofKLsMX32OjM4pUDAL
 /AveUWqQBZYAGT0RfYceCYCykz6YDT/ARw==
X-Google-Smtp-Source: AGHT+IHX6bs5C8HfOhEdkE115iJpnlWHnYpmySnbm86P1s0KrR3FRenOuZ2ZOtDsXVWIrFDuwZtdlg==
X-Received: by 2002:a05:6e02:1f08:b0:3a7:e047:733f with SMTP id
 e9e14a558f8ab-3bdc0133223mr60334095ab.1.1734575778393; 
 Wed, 18 Dec 2024 18:36:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0debdac77sm737085ab.19.2024.12.18.18.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:36:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:36:16 -0700
Message-Id: <20241219023616.288769-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734575778; x=1735180578; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Asaa97hnOW/UfApqWuwt+9cn5GctPdLHgEKh3hfBLyU=;
 b=Da5xj80ZRz6+b1r4y02Eosxk1VB8GPujR0n7CtronZ2LAmHq8MG8iCJkOAK7nOVJxU
 luUwXpKUoMZXT0P8lXoc/hL/e20XLV/+C7i9w/txL71qmHCPxddUw/yJ/lWXQ8KqgoCA
 0lSkL+4QPbEsWGgUNICXXvOVUe0bCv6e3HfRYn0s8X3e6XU93SvLtnHBmi5jDNQcmjdo
 3hytGP/8DW0SbQBe9/1NOCiJEqV+EsCYvcwfQs1dtn4KVtFSDS+DzeE+m3LVAD2x1O+H
 bfibHlerUYbP0z+R76qACiQF/GHCeaKGalz/h8wmTuaG/+PTgz6SXHagvmfnkGwIozo2
 HoNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Da5xj80Z
Subject: [Buildroot] [PATCH 1/1] package/python-six: bump to version 1.17.0
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

License hash changed due to year update:
https://github.com/benjaminp/six/commit/8cb688f32f24b6ebe94938b15e92ec5c75dd8f12

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-six/python-six.hash | 6 +++---
 package/python-six/python-six.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-six/python-six.hash b/package/python-six/python-six.hash
index 17615e8699..bb636c9634 100644
--- a/package/python-six/python-six.hash
+++ b/package/python-six/python-six.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/six/json
-md5  a7c927740e4964dd29b72cebfc1429bb  six-1.16.0.tar.gz
-sha256  1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926  six-1.16.0.tar.gz
+md5  a0387fe15662c71057b4fb2b7aa9056a  six-1.17.0.tar.gz
+sha256  ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81  six-1.17.0.tar.gz
 # Locally computed sha256 checksums
-sha256  8bb850c565aa389fdc16f3a46965ad23d82adff60f2393fc2762b63185e8e6c9  LICENSE
+sha256  4375ba20e2b9c6c4e7cad2940a628fd90e95cc3d50ee92aae755715d8ba1fbd0  LICENSE
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 9e3e5fcf50..84ba78161e 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIX_VERSION = 1.16.0
+PYTHON_SIX_VERSION = 1.17.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
-PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e
+PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2
 PYTHON_SIX_SETUP_TYPE = setuptools
 PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
