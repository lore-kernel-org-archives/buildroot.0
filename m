Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7E6C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 16:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE39660F68;
	Wed,  2 Nov 2022 16:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE39660F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ohn8Nqzjkfc3; Wed,  2 Nov 2022 16:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D0B60F64;
	Wed,  2 Nov 2022 16:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11D0B60F64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C58C1BF307
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 16:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16CF360E5E
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 16:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16CF360E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYPhshfdbbXK for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 16:56:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1263760E5B
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1263760E5B
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 16:56:35 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id h24so11702290qta.7
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 09:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M3CCfYg4P3PF7kTLNj43OI/R3GeRtWgV6+cnSNFFhq4=;
 b=eURCQncmb1fvnEKALle0To99VWVMe1NoJzjFV2sEF+adShWzb+zjQG7HLnVSi3l1tg
 1sC/vsWWLT/09RLnyDei74vuMQlSZ1q7c7ciLs8meq69OnuzH1fCI6d+o0NiRX4no56U
 6pEs2YR5HwjuxI6j3hdm98f0Wikc2Q4bUjo0uc2ydrRLZtdwjVUOgy9G6UM/aVYPDu8M
 5mIsR1M2PmhUPDsuxQpCUCz08WvJVsbPDkD9xrmwcRe+1YDK9NYpU/pk+ouDdvtw1vcd
 H3MrXzPX9ZUBK+x8mvlIwCkymVmOw5Jmu/Vvg4syTzxpDqkkXvr51/EFLgrLWLuBrn4R
 Hw+A==
X-Gm-Message-State: ACrzQf24HkylosfDzf75CwO0nUMPtbeOxlYm3RxP+j8bcAOIoo6UfcGo
 6LjYdD6ljTpfTJAoHZ23Q2bpMpxCe+MB44Bn
X-Google-Smtp-Source: AMsMyM6+M6pSnpCJnmr4DcF7qKSqz9VqS+nysSF/BIdbJG9GFDf89D/xp3SWuo/RAYqdkJbSVJYt3w==
X-Received: by 2002:ac8:5fc5:0:b0:39c:bb48:e42f with SMTP id
 k5-20020ac85fc5000000b0039cbb48e42fmr20602563qta.586.1667408193995; 
 Wed, 02 Nov 2022 09:56:33 -0700 (PDT)
Received: from lyra.shivnet (205-201-16-55.starry-inc.net. [205.201.16.55])
 by smtp.gmail.com with ESMTPSA id
 c17-20020ac853d1000000b0039cc944ebdasm6810542qtq.54.2022.11.02.09.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:56:33 -0700 (PDT)
From: jwood+buildroot@starry.com
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 12:56:29 -0400
Message-Id: <20221102165629.755750-1-jwood+buildroot@starry.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M3CCfYg4P3PF7kTLNj43OI/R3GeRtWgV6+cnSNFFhq4=;
 b=Z+y7v5/VgyGFRSXcMyYKox9MuL12tvOrkrtPPK+NiQ1dLnKb6VFMK7mQpdwXsHW7Hy
 ZzRa7ptkICjAA+9s7//IOj1f+jV0Kk+PDB6SUR8Ip3nzDSmvrmIMyhX7qxjcBYnKYxmU
 YuG5xE+dg+7WEZScc9k8kqth/Y3jr365jx6qc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=starry.com header.i=@starry.com
 header.a=rsa-sha256 header.s=google header.b=Z+y7v5/V
Subject: [Buildroot] [PATCH 1/1] package/ca-certificates: add support for
 cryptography > 3.0
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
Cc: Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Justin Wood <jwood@starry.com>

This patch was originally submitted upstream at https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1008244
by Wataru Ashihara <wsh@iij.ad.jp>.  Minor changes by me to account for the Buildroot change in 0001-*.patch.

Building ca-certificates with a newer cryptography is breaking without this patch, and building buildroots
`python-cryptography` package first doesn't change the broken behavior.

Signed-off-by: Justin Wood <jwood@starry.com>
---
 ...2pem.py-Fix-compat-with-cryptography.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch

diff --git a/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch b/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
new file mode 100644
index 0000000000..0537da9224
--- /dev/null
+++ b/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
@@ -0,0 +1,29 @@
+From 5e493ca307a031e81528ceddb96f3da40bc062cf Mon Sep 17 00:00:00 2001
+From: Wataru Ashihara <wsh@iij.ad.jp>
+Date: Wed, 2 Nov 2022 12:40:05 -0400
+Subject: [PATCH] mozilla/certdata2pem.py: Fix compat with cryptography > 3.0
+
+In newer cryptography packages, load_der_x509_certificate is enforced to be 'bytes' rather than currently used 'bytearray'.  This fixes that.
+
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1008244
+Signed-off-by: Justin Wood <jwood@starry.com>
+---
+ mozilla/certdata2pem.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
+index a6261f8..c0fa52c 100644
+--- a/mozilla/certdata2pem.py
++++ b/mozilla/certdata2pem.py
+@@ -122,7 +122,7 @@ for obj in objects:
+         try:
+             from cryptography import x509
+ 
+-            cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
++            cert = x509.load_der_x509_certificate(bytes(obj['CKA_VALUE']))
+             if cert.not_valid_after < datetime.datetime.now():
+                 print('!'*74)
+                 print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
+-- 
+2.38.1
+
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
