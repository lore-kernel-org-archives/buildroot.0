Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E453C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB6BF40940;
	Mon, 14 Feb 2022 21:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wO5S8Qpzw5cM; Mon, 14 Feb 2022 21:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A1D440936;
	Mon, 14 Feb 2022 21:10:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51CCE1BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40B8D81496
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LavB6EQfFB3k for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:10:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02CC281763
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644873052;
 bh=Nydsiz/RbNo4kCE9IAqWTxwYFKxUOdJFQINdMhsjAbI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=YstM+XQDsQ0OsWFe0aVpy5iSYZKoS/GnTEt4FoooMs5ENHScz+ZxW0MlEflBk9FvJ
 41LPZN5ypaHigs9Vjg9hdQNGrVBCPypx8jDz++eyV0pz3R1DCpyjsjIDG+1tKm6+sj
 SDl2D7IDQ+IJxJ0Ta0YBY26nWVJr5qI4quFl8N90=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.232]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M6lpM-1nMUZJ3dde-008JEB for <buildroot@buildroot.org>; Mon, 14 Feb 2022
 22:10:51 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 22:10:50 +0100
Message-Id: <20220214211051.22421-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:vuVxr/xtj/uJsmKWOPOfbp0zX3Xcjn8EbK057CVzC9E7AVKPG6d
 oiRjYYBAkYGHXzbTVcAYHh24nApPeCNcxhDxox42lp+mZp6oYxHHLLriGHAPFwoMX4Q9sfc
 q87MYWs2LrQee1lR1j6qYQY4Na3/AnZniiTSd29xnh8JcAP9IbdnJBsYfy3D3TF3A8rIzBZ
 KKcAQo30TogEf6t8RBIyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:R34fPQ10Lj0=:WS48JyZiyQuf06XEbvVpRz
 gRrrDc5H9T10irHhqwDgzqg+bURCto2vahj3ywk01g1L8cGSpjfQVivQqFis9VwNIAczCmB8N
 KMMCqDkwfQeghO2kjCeUXkXIe/bljkIKoAzQNYwH0lVBCvHbtEFE3P7gF8iOwEysAy6cw0Xgj
 leAaHBZmX8j9duebhCHzbedSePxCV2hLFNMaRBbGR3slwmMBOrUWKsNIwFYUlMJSqct26C/Xf
 0c4SSz0JBHphNoXqPFwhFAHL2gxXqFGXwr/2tpwTdZrYzwmyVRKMDz1Ytt/5+6duMFSRLDpra
 LBUungdWi5kbeYYs6BziXhtwqsv47pY2BzQ03ZXiFxlfPb+kbxrmD7wpNVHTy2zeJ9OJGy+Ar
 Txucbxs0dRKUL92ig1+t4ypkJ5pRM+BzVnbtzSc1SKUqgNk0g+9u3tmoIvumjCyg7Am0Mrf8G
 MAoRNbi2zpc4E5EOjD8VK8/DN4oxbvhCT3xUgfB+cQTA/0oXv/1ouqPtterIYGyx3OXFXfLL0
 j1ZZPRlx1Zr4nQmdlP3J/Jfybq4z7MEQHqyLZFec+RzolqB5ggggitAD7COm+Z9ZIdVSRFZJv
 yhLGnWZR9xF1x2TpR9wFHkz/LXaZ6rCUq/orMa0LVydCYV3qXsuSzL2d7j/PVxRuOm55Nm4FW
 zplKxsnIO4Jtpe3dqqw9GrA500EL+AXwUbJQSVI5iQlXx2tVM45IQhREvOST+cSXFLiRpywMF
 fOunIKAYEYqwd7fwhx0us/rvsShR91IloxnNRLL1i2y8IaBCaesU5azi7aj5PNPlf2SoeTgFG
 gsPvohihAm6c+yNigz5qVrPXqyjrXS4FPWhrVEtNmDpTyfe0gAiZuAly/COAj57k0a3+HP+U5
 jw28bMopMQliQOV2JeFRXDVAyT8/+28vfbCNV0tVoB5ClknrZU5Gpud7+gseQ91rnC2PD545c
 wqqrwTZMg3uU1UemAaKIN1d7b26W1s8WMPe57tctC+P0Z8rOOg6cj65OnbHRbNET5yRP8V+W9
 lpfOVGus1ndFprEDZyb7Zx5ydjKVY249A7MRdFwap/lkgHZB74qGAWl4P0PGC+6HZ8VU3/Z2p
 2FIkB4dCi7RDeI=
Subject: [Buildroot] [PATCH v1 1/2] package/ell: bump version to 0.48
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Changelog (since 0.47, from [1]):

  ver 0.48:
    Fix issue with memory leaking from ICMPv6 RA.

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index cd724eae2d..4bde1ab677 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  4901a0baac4eb24163ceafb44fd448430361d25d8f17d89ff29f8b0b162b3eb9  ell-0.47.tar.xz
+sha256  9894943042a5d6165d3e5cc354f92274fb1304004d02b4bee682ab6067cdbbd5  ell-0.48.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 3ce64b6f2f..267b44e5f0 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.47
+ELL_VERSION = 0.48
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
