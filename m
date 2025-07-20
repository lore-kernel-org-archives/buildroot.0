Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF293C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 21:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BFE41000;
	Sun, 20 Jul 2025 21:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2x7MqB405jpW; Sun, 20 Jul 2025 21:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7A0D40F4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7A0D40F4B;
	Sun, 20 Jul 2025 21:59:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA17BDA
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC9D26105B
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3hPHLmFzqaI for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 21:59:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE5D9610D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE5D9610D5
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE5D9610D5
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:59:11 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-86cf3dd8c97so350828639f.2
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 14:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753048750; x=1753653550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0CC0MIB6DCYLFOjh5xoPYCjcyH9oqBwx+3kWPvNzJE0=;
 b=KmgKpvlY+8whKcw9GETEGfyCNAV3P3AMcDabiVWOXIVS9hKPqCYLTC1iTcS1ExG66M
 2pUSLsZUti3gHRbySNYzhmyQoUIE62yFJBbZ0hXUKGDJvMyuRVd1fH0ypCd7WMOYN9VX
 ysNRSr0XkGuldaFubCEN0g6cVryTdga7a9yYl9uHeb7h4tRZVro/sEZ4pO+Bi1I7NMWu
 liSYQcU3awxwPMBIy4dyboer5MLiYFAODHmj63RTombvmg1efY+q1xrhi5WyOKoGd+4o
 DHUezcG5C4Zs9T1tUg11SjB0iMXKO+a4td4y6BoTNLOvf4jQoC64tREIWbmXY47YTc+E
 5WSQ==
X-Gm-Message-State: AOJu0YxTJ/RkKNQSnVhDWRKmRhcNES4+6cYRGXe2J66mGAUGPpnorNTO
 AXFaBCwoxBDq2BL29yW+DwhmW7lMV+W8UXJWg7Ml/PSwKWaUBNVauZeUZhCVRAog
X-Gm-Gg: ASbGnct8KxDn/8+Js1jybgIMyq5g87WHTchhU8XRJ2Yx+6YB9sJ60sqKZGfH4J3knU4
 II5pzWm/7hFCx/ClZRapdu0Z8lTUCGw05w3+fVd0I6K17Qc6ZOg0M/zD5SIj3xawgGRSCFbM4O6
 y2NKocomQ7W+Y8RHVon8EXluULtRruT+Jh8TW5SL+w1yQ9jgxC4wQ7GPi97/CfCFZtCUdX30unQ
 N+RWgpXdyE+HmGTxPW+OT0xu5I3bGNTkedoqMBueKrqSSNGu38YWDpEPi83sgC5Z9V0Ydby/Egu
 DTpCuBP1p7M+/X1exSu/jLdaOOk9D6LRlkQp0625V+rSlAFsWa0lvdczm9ajD7YkXFQsM9ZPX6L
 qoslP9wdEMXLRcETl6/f9MiT8EIdhLPGPanbqihSltaeM5vfNHl/Pwgz/yrM9kI1lg5FzldyXTb
 3TNgJNy4I=
X-Google-Smtp-Source: AGHT+IEc8SrgP0HSU33UgcvK2El0e0Jmcx19DmzOnk8k2ZyzoE4NXAr/727QlkDXpXhqrXSO1VdO4w==
X-Received: by 2002:a05:6602:488a:b0:87c:a93:da20 with SMTP id
 ca18e2360f4ac-87c0a93dc07mr1330503839f.10.1753048750338; 
 Sun, 20 Jul 2025 14:59:10 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5084c9b4e34sm1519655173.77.2025.07.20.14.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 14:59:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 15:59:07 -0600
Message-Id: <20250720215907.3303734-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753048750; x=1753653550; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0CC0MIB6DCYLFOjh5xoPYCjcyH9oqBwx+3kWPvNzJE0=;
 b=j95f789W3XL+mxAoXghX3hxKQyj+Ne3me/cBtNgVA+GWctgWCMIjzsfvL4Dh0kSGzE
 hJWv+2tOYaNcK1GcxUp4AqR2f1U4ry7QcrDCBbfwARA2rLL+Ra+fUY1sqPpld1c43cNS
 lr0dfzRGafwA3qW5kIqDGEzk/qVuIgk6uuVVqfceqQ/nnYO1BhPUNt83x4Qs9cbjFcxr
 5YRoUgygvJe/npkrETGI184AyFVo7toND4/PULE8wEjYppmwErQJJ7tjSVVhZ45U4pS4
 Oe6nw37Mr9+sPsic78HJids08TdFRsk0NIxvFs6WX1xpgbzgBQT+xVQ+hx0Uhdjs2r7M
 ToMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j95f789W
Subject: [Buildroot] [PATCH 1/1] package/python-propcache: bump to version
 0.3.2
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
 package/python-propcache/python-propcache.hash | 4 ++--
 package/python-propcache/python-propcache.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-propcache/python-propcache.hash b/package/python-propcache/python-propcache.hash
index 1bda1e96fb..6e89eac6aa 100644
--- a/package/python-propcache/python-propcache.hash
+++ b/package/python-propcache/python-propcache.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/propcache/json
-md5  c642caac1415818205011277008142ea  propcache-0.2.1.tar.gz
-sha256  3f77ce728b19cb537714499928fe800c3dda29e8d9428778fc7c186da4c09a64  propcache-0.2.1.tar.gz
+md5  1c073b491620a9f6d568276d61f80277  propcache-0.3.2.tar.gz
+sha256  20d7d62e4e7ef05f221e0db2856b979540686342e7dd9973b815599c7057e168  propcache-0.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
index 92a31a19af..e1050c4919 100644
--- a/package/python-propcache/python-propcache.mk
+++ b/package/python-propcache/python-propcache.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROPCACHE_VERSION = 0.2.1
+PYTHON_PROPCACHE_VERSION = 0.3.2
 PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
-PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/20/c8/2a13f78d82211490855b2fb303b6721348d0787fdd9a12ac46d99d3acde1
+PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/a6/16/43264e4a779dd8588c21a70f0709665ee8f611211bdd2c87d952cfa7c776
 PYTHON_PROPCACHE_SETUP_TYPE = setuptools
 PYTHON_PROPCACHE_LICENSE = Apache-2.0
 PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
