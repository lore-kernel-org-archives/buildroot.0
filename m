Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B539CF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 00:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48D1560035;
	Sun, 22 Sep 2024 00:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvEhjQ584a7w; Sun, 22 Sep 2024 00:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38BA06059E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38BA06059E;
	Sun, 22 Sep 2024 00:47:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B46D81BF86D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B08CF40449
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moRMPQ3-SGh7 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 00:47:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8380F400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8380F400D0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8380F400D0
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:47:02 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a0c8b81b4eso9947275ab.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726966021; x=1727570821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vQiGcLQyOGCKmDIi3OvIVNgyt7985tKVMbrXNhlLx2k=;
 b=NLi/WktKOFnIaMsPcIIkCXISL3xlI9JdrCvdVhXU03jN93dxcctDRL57VtfBuXMhwe
 aDvDAyQyKltjD5KQ3VUE9fg/vqoXR1/iA88fBrZraFstcxZBPfLo6Zgqp0+BhYg+FBVR
 qngZyodSY0iu5hgAyl6hc39kj49EQfIxjC/xefUM1W5hDbNivJT8J0jsdr1MFTOXulCz
 8aGXuwY+u4QHZhp1nJuc7/EItNtfrm2DGTI5/lzyljMy5P9mI7aH7eYQh4K1RQT7Kj79
 vpowgDtptzRT8yWJt+KjjF01+8RsOQGyu5hkHMIhWa1kcVcqqiHTujud5o6+HnmavFQx
 vUHQ==
X-Gm-Message-State: AOJu0YzKQGA6Ruhbz3BClF8PAm1804+D6cU2BwNUwyCUaKvl+C3+6Jkp
 hYgBSJmOhP5J1YaUtoLf159NTDZ5ce0Q+ovGwvtyT5MLYhXhy4ztyZPc4A==
X-Google-Smtp-Source: AGHT+IHr2nzH5gnhtuqDJFbfRw4RzwaycCnzkElckvzC0RenXRAj8gv5N8fjIVq0X1VO29uYVFF1Qg==
X-Received: by 2002:a05:6e02:1d0c:b0:39f:5efe:ae73 with SMTP id
 e9e14a558f8ab-3a0c8c7b5e0mr74290125ab.5.1726966021237; 
 Sat, 21 Sep 2024 17:47:01 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed58832sm4379333173.163.2024.09.21.17.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 17:47:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 18:46:59 -0600
Message-Id: <20240922004659.726569-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726966021; x=1727570821; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vQiGcLQyOGCKmDIi3OvIVNgyt7985tKVMbrXNhlLx2k=;
 b=k9WVSvxR4m6N7fFKKehljNPBytcmH2BfaTt0FFB6zg3V0RtGn4hvBNCyAT0BV6ZGP/
 4jXbM4xj1CKLL6vw/l4VgyebqllnIDBYnja76GwD1eJ8vJMIZ1NQnzwpH8AWdewzDgVH
 u3oVLl+jYBEK1Dp5DSdpzZQJo79JjhO2QGXELjO0YIX72R/gyH5zJlJ+KrDKBpa5A0O/
 j6W4aA2CVWwmQRuXQZNg/X+9qPhpzPYMC/BjQujGsZoR++nYk9gIXxd7Bm81r1p+Q4K5
 y6tRsDONvl4TP0V9xPgyOx1eYxDZKmSDGgUJDR91s/U2b5j9v+55h92q+FmW2U4muZH1
 JLGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=k9WVSvxR
Subject: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to version
 3.19.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index 9f96f99bf4..52e927edbb 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  3b334627d870a3c849e1322d18a7bfe7  simplejson-3.19.2.tar.gz
-sha256  9eb442a2442ce417801c912df68e1f6ccfcd41577ae7274953ab3ad24ef7d82c  simplejson-3.19.2.tar.gz
+md5  a198e17c5dcc426ff83ec4a02190eae5  simplejson-3.19.3.tar.gz
+sha256  8e086896c36210ab6050f2f9f095a5f1e03c83fa0e7f296d6cba425411364680  simplejson-3.19.3.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index d5ba3948b7..8a0acf545d 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.19.2
+PYTHON_SIMPLEJSON_VERSION = 3.19.3
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/79/79/3ccb95bb4154952532f280f7a41979fbfb0fbbaee4d609810ecb01650afa
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/3d/29/085111f19717f865eceaf0d4397bf3e76b08d60428b076b64e2a1903706d
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
