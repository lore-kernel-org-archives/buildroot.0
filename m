Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813D9C78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B8E403EB;
	Fri, 20 Sep 2024 10:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9mPhLvpq4e1; Fri, 20 Sep 2024 10:39:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8B5D40692
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B5D40692;
	Fri, 20 Sep 2024 10:39:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C54B41BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B31C840692
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bvn1YKYEO7K1 for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:39:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09237403EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09237403EB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09237403EB
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:39:03 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6E1A12C80CF9;
 Fri, 20 Sep 2024 12:39:01 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:39:00 +0200
Message-Id: <20240920103900.169718-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1726828741; bh=1ZBegahZWPNwJtHLg6OH+AYfMYQ3xNddphD8TtjUW7c=;
 h=From:To:Cc:Subject:Date;
 b=DBOrF3Lctcu/Ya+MqMY/Cx/KKqBzDWzWEucxfuX7P8gnm2jvJsi6NTHypH+Z1/Ojt
 yymkMIFKdPSUOlZd/TUdP7T1+tXfOEBAgADM7dmfup8gflAtEGVVMpWk8APocF4wer
 HKsU70XlYnCC6xCT4QaGjPgXcSJwXnAQ/cKCF6oiFqtuk3MmAi7btdN/SKvM/wBDhl
 FvNGXJb+ApYF05jJiL1VWY948j97yg9aHz6cn8bQgpG5LaSgeGYiolM9ddIGB39ai7
 lA6DVjjvBUn3bd4tDMVVE/fmAceHEGk8/k5a4B9hMYMyJog7CgNsEOm90TGkbt6N0H
 Xl2kjJvh3KwWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=DBOrF3Lc
Subject: [Buildroot] [PATCH] package/nethogs: add patch to fix version
 generation
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes nethogs being built with the (mangled) buildroot version
name from the outer buildroot git repo.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...termineVersion-sh-prevent-traversing.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/nethogs/0001-determineVersion-sh-prevent-traversing.patch

diff --git a/package/nethogs/0001-determineVersion-sh-prevent-traversing.patch b/package/nethogs/0001-determineVersion-sh-prevent-traversing.patch
new file mode 100644
index 0000000000..6f39c53128
--- /dev/null
+++ b/package/nethogs/0001-determineVersion-sh-prevent-traversing.patch
@@ -0,0 +1,31 @@
+From 6423bdf05d51efc5441c82248098f99e4c1f59c3 Mon Sep 17 00:00:00 2001
+From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+Date: Fri, 20 Sep 2024 12:06:26 +0200
+Subject: [PATCH] determineVersion.sh: prevent traversing into outer git repo
+ for git-describe call
+
+When building nethogs inside another git repo (as is i.e. done as part
+of a buildroot build) the version is picked up from the outer git repo,
+which is confusing as well as introducing reproducibility problems when
+rebuilding the same nethogs version produces different results if the
+outer repository changes.
+
+Upstream: https://github.com/raboof/nethogs/commit/6423bdf05d51efc5441c82248098f99e4c1f59c3
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+---
+ determineVersion.sh | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/determineVersion.sh b/determineVersion.sh
+index 7c5f1de..3d80d9d 100755
+--- a/determineVersion.sh
++++ b/determineVersion.sh
+@@ -1,3 +1,6 @@
+ #!/bin/bash
+-
+-(git describe --tags 2>/dev/null || pwd | sed -e "s/.*\\///" | sed -e "s/[^-]*//") | tail -c +2
++if [ $(git rev-parse --show-toplevel 2>/dev/null) == $(pwd) ]; then
++  git describe --tags 2>/dev/null | tail -c +2
++else
++  pwd | sed -e "s/.*\\///" | sed -e "s/[^-]*//" | tail -c +2
++fi
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
