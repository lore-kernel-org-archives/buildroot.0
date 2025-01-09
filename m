Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE22E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 21:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AACD8606C5;
	Thu,  9 Jan 2025 21:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2WccG2wb1aD; Thu,  9 Jan 2025 21:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA65560716
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA65560716;
	Thu,  9 Jan 2025 21:08:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D22E6942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B331760716
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIvb_fVWlaKS for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 21:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D68A4606C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D68A4606C5
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D68A4606C5
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:08:50 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a7d7c1b190so4209145ab.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 13:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736456929; x=1737061729;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BgZOZXu+CmaX6cj56ni2bucNED2WBIpA2UQAoNDCrXw=;
 b=hsytNIlrTEARCblXP+BqD/qJMYtn75tnhHfRDju5b/vYyisHUewlyXzg4bkGQ126Su
 OUzYDi4xzUGfqOppNEk+88GHYaWeonZnI08E/lpcz4PaXMaZwtZD+KP1sNGnc9RkQtHM
 xH3k9igozT9qx49vDBpChPZwT2ObhkgOeI8TT6VWeYeEqNpu2KDkPdH35vjEjO9GXTBD
 qLT0XtMaB1k0RPQFzivakxYFsEh+6PC45d7Izq6V7vYr5JdeNQmjqDCTNmz2YQpe+xqa
 5z9jRXRm5dAxIiUPMGH8HotGGndBVx+lW1Mpb8bDOkCj/lf+dslUF/aFKj16RrjZjzGd
 wbzw==
X-Gm-Message-State: AOJu0YyX4x6/w1fEgxhOQRekgFWn/MKT/7Y8c8WT2zKXrftoOsQGg5dM
 SpIT+j4JUxGCZNUpRScr1MOzC1nWJ5AzDe9qQ36Yrlqu+NjgtuOWdfNzLU/HMC0=
X-Gm-Gg: ASbGncscY5Ryw2QihhEk/s3MU1YMS6ni8sozegTW/+9XBaNr2D13Cs2l84P9bvgJdDX
 C12SLUxSIQ+07+7fcmIGr6UceCLnyhRrGNsGm/hxRyAq1ICvZ/IL2b4AhjYhtHpKkSKk6Tpne7y
 l43Xo68DYGnaLFCWBlJC5a9BSaSVtao8GH6+sroWxmKgy4+iFXF3YQiYF72bTAq2ZnWYWw4cfbu
 3L6zmCVLsCddD0vvdV3tleRr+U/GyPXNYOM7wOi3RE9T220T93rxKQtwqmO/LfVQz5Y+M6GFbTm
 FHX2EkMt9gRWC7+O6W7myrspve7q6fc=
X-Google-Smtp-Source: AGHT+IHxx2Xw/8J68J20h7AdWXJ8XF3Ow43U1i7SXW6n2kUm7Rxw2A7O30fZt3BvKBS51ihXwn3bww==
X-Received: by 2002:a05:6e02:308b:b0:3a7:9736:501e with SMTP id
 e9e14a558f8ab-3ce3a9d0941mr60304625ab.14.1736456929576; 
 Thu, 09 Jan 2025 13:08:49 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5f8e7csm508385173.8.2025.01.09.13.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:08:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 14:08:48 -0700
Message-Id: <20250109210848.2400151-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736456929; x=1737061729; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BgZOZXu+CmaX6cj56ni2bucNED2WBIpA2UQAoNDCrXw=;
 b=iYDsMGxXSYB2ql2nrtvGSuRNj7GVqXAvM3H3IEAEs9IB7HkZ6li+vdrvkESIbm9+eK
 Xjjf7rdn/V4C0kvIi95pC50Heo4zQIE2BSGHOveJ1K2KNviXoV3vywtF8W8WxmCJxyLG
 dTRL47eFsRvfG1MxrUb4yXiw+tRpPyuztVTTLhxgK9PDDGSuBXJPqvOLfQg5Xxdfj2Sn
 74B8SnOkPCxsYYCN2vkYTV2Sziq2qkd+RCPPLnB0OfTh/mYDIDBgCS7TcSKClkRSEDUz
 URunknkzgZJNCVEgUfoXq9ptjV2cz6iKzMq2AYi7oLXmH8aLC/hB2yf76zNMsXWTq5eg
 vh2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iYDsMGxX
Subject: [Buildroot] [PATCH 1/1] package/python-gnupg: bump to version 0.5.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gnupg/python-gnupg.hash | 4 ++--
 package/python-gnupg/python-gnupg.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index 5d722a1b95..9f3ba63721 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-md5  48c77a551bed992d19f7a99e3c6fb9d6  python-gnupg-0.5.3.tar.gz
-sha256  290d8ddb9cd63df96cfe9284b9b265f19fd6e145e5582dc58fd7271f026d0a47  python-gnupg-0.5.3.tar.gz
+md5  8358b54f2c76b714545f04df3f33df28  python-gnupg-0.5.4.tar.gz
+sha256  f2fdb5fb29615c77c2743e1cb3d9314353a6e87b10c37d238d91ae1c6feae086  python-gnupg-0.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index 00c1b9edde..ae5548660f 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.5.3
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/85/61/2df3cd6f49dbb2d4a6a567cac1d803e3a50d86207e196d0f9e67a48664f7
+PYTHON_GNUPG_VERSION = 0.5.4
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/f1/3e/ba0dc69c9f4e0aeb24d93175230ef057c151790a7516012f61014918992d
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
