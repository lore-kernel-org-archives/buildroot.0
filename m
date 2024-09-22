Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C468ACF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 16:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5572980B4E;
	Sun, 22 Sep 2024 16:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2t4QnazbMdV; Sun, 22 Sep 2024 16:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D80F080A55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D80F080A55;
	Sun, 22 Sep 2024 16:52:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCC591BF403
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBC5B60657
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUe9JV9odxD4 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 16:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F002B60643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F002B60643
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F002B60643
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 16:51:57 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-206e614953aso34012545ad.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727023917; x=1727628717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wxOfFfuY2PV3RpUQV2LvkFihLOTIvr3Z5MJJoG3+/pM=;
 b=AVy8wcl5jXEn+SyaLa9oESOnhl/gFvjpvKMQm+8C1MO9VcvCoTPsvKv4PM+fhDmBir
 Z1TNg691Md7BExWSG7XLyalaA/3ZZt/ShEzNRtpm1/4PpKWIjKnStv5elJxuswnrmaOO
 6UYIWNDZwK9xsqzM5w8Q5A9Hhxd4Lsa5eY3M3giu15TTplXjpf8ivcMzaAkD00UkrCvu
 /gyVLQdhQLD2R8TGn2Tk50QMvFCc3t28ItlzTSq4NMershiNBKBRGRjdKN+XelevqYMQ
 bNQofrYWIM77I/hFdjoKU5bF8BPls3sktgy1aPaWul6stTtOUWmQbk13X4Z3LgO6bncy
 vQMg==
X-Gm-Message-State: AOJu0YwI25BFTRmE7m1lI/hC0XunEKvVhmCL2g3DSW6w585t6tVdoocb
 JDn/OOcWCRmkfKiqueVRcBrjHtjqKpgUtFCOf2OJ+XGJpv3GZ7qp8vwxghp5sJs=
X-Google-Smtp-Source: AGHT+IHONz9RNR3Psks4E74B2VBWvG+vED7M9tyURxJQqauHaJQ9HkUc1vB7RR8Aas2Ad3AHmhG5ew==
X-Received: by 2002:a17:903:2b07:b0:205:4415:c62d with SMTP id
 d9443c01a7336-208d83b85bcmr92626085ad.26.1727023916788; 
 Sun, 22 Sep 2024 09:51:56 -0700 (PDT)
Received: from localhost.localdomain ([2600:8802:2a05:9000:ad2f:66c:ef69:238f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20794746d76sm120976995ad.292.2024.09.22.09.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 09:51:56 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 09:51:53 -0700
Message-Id: <20240922165153.3086149-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727023917; x=1727628717; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wxOfFfuY2PV3RpUQV2LvkFihLOTIvr3Z5MJJoG3+/pM=;
 b=BQYlbHzggSl5eKWWcIrxPSkA/6tAamcbsx8Bi6eOeBaEtzwhWA6nlLGlBcbCaN5ygW
 nG+wRWIGLlmuNvbDUOTDmBdwAOyk50+n/KVslhAxYSjkdX/qcOQRuua2spcxhxK4s7Ns
 /17LntmZhZH8NEPSRuy2HlpmFuRc8dfe7A91YjYx/rt40vlIP3Y75edv4hoAqGpkbwDd
 iM5vtOG1av7/qR0PcrCTRb8JMtqEMkhnsrMdamQ9NUmQ1BgVQUeu5cXf+7s8H2PISbew
 f5RXKuDR9CE69fmQXB5SkGZsTRaIkLTDVoUuE9xSj8LlmjMzMO+kGULOYgo/NxddNi0n
 ZLhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BQYlbHzg
Subject: [Buildroot] [PATCH 1/1] package/tcl: bump version to 8.6.15
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release announcement (with changelog) - https://sourceforge.net/p/tcl/mailman/message/58817026/

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/tcl/tcl.hash | 2 +-
 package/tcl/tcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index 9e1f8fcaf5..d67a7c4e74 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5880225babf7954c58d4fb0f5cf6279104ce1cd6aa9b71e9a6322540e1c4de66  tcl8.6.14-src.tar.gz
+sha256  861e159753f2e2fbd6ec1484103715b0be56be3357522b858d3cbb5f893ffef1  tcl8.6.15-src.tar.gz
 sha256  c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 8968f0f262..0cd242a2e9 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).14
+TCL_VERSION = $(TCL_VERSION_MAJOR).15
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = TCL
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
