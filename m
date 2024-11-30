Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58F5D735FC
	for <buildroot@archiver.kernel.org>; Sat, 30 Nov 2024 09:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 298F142B84;
	Sat, 30 Nov 2024 09:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6i0VTs2Cjf6; Sat, 30 Nov 2024 09:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDACD42B7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDACD42B7A;
	Sat, 30 Nov 2024 09:25:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5BAA712
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 09:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEF6242B7A
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 09:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PC1oflenvKGK for <buildroot@buildroot.org>;
 Sat, 30 Nov 2024 09:25:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C42FC42B70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C42FC42B70
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C42FC42B70
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 09:25:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2B58240002;
 Sat, 30 Nov 2024 09:25:38 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 30 Nov 2024 10:25:33 +0100
Message-ID: <20241130092534.819113-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1732958738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dLqK6HUQvhM9iXrgKvy3SwV9rs10/m5klsQ3ui/CVdc=;
 b=iIzMiN546mug7w32g55TqzVGt3oxbWhB6e4ESwm6yr5H5e2RqV0Q2Umg3xtYCibpnMK0wh
 K+g1uhNE/n1tZqA3zRzXtY3SAoLnQICQ7UYr31FsqF2rF/PMXNaqKB504BosrfAFqFMIYo
 PXjfV3m6Dc/BPhsN+K/C5ku2Yy8xJ6ZjwSqzhSbe/b4caJDzoodXOGmUe0PSH+4ciO859S
 GF9cnmv7t65afIz2qsPyqd2kS2/WRBVjARgJEsj+tx+dVyvBJa+iW8PjiQK8MbqPSuPFkQ
 RXAXavfrKbXGoFysit9A8DPglMhvfaMUYm5N72Mkjdptcvl0yqvK+Jp5rmeKxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iIzMiN54
Subject: [Buildroot] [PATCH 2024.02.x] package/systemd: fix bcachefs magic
 patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: bastien.curutchet@bootlin.com, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Norbert Lange <nolange79@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 29409c9d345a2536f6b72c605cda0d13f306200f ("package/systemd: fix
build with recent kernels") added a patch from upstream that adds the
BCACHEFS_SUPER_MAGIC definition if not provided by the kernel headers.

However, this commit from upstream was bogus: in the case
BCACHEFS_SUPER_MAGIC was defined, it does an assert_cc() to verify
that the value matches what we expect, but this assert_cc() statement
lacks the final semi-colon, causing build breakage on host systems
that do have BCACHEFS_SUPER_MAGIC defined in their kernel headers,
with a weird error occuring in another header file... because only the
next statement after assert_cc() was considered as having a syntax
error.

Fixes:

  http://autobuild.buildroot.net/results/9f99a97df2efd5e4ae4ad5cc5882607f0c8766bc/

This issue only exists in 2024.02.x at this point, because in master
we have moved to systemd 256.x, which has dropped entirely this piece
of code related to defining BCACHEFS_SUPER_MAGIC (and we wonder how
systemd can then build with slightly older kernel headers, as
BCACHEFS_SUPER_MAGIC is only in the public kernel headers since Linux
6.10).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/0002-basic-add-bcachefs-magic.patch | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/systemd/0002-basic-add-bcachefs-magic.patch b/package/systemd/0002-basic-add-bcachefs-magic.patch
index e7f4b1cbb7..372066ebef 100644
--- a/package/systemd/0002-basic-add-bcachefs-magic.patch
+++ b/package/systemd/0002-basic-add-bcachefs-magic.patch
@@ -1,4 +1,4 @@
-From e5ff9b585d7dc54f50085d518d7d588c250b0690 Mon Sep 17 00:00:00 2001
+From 48c1cd62de0339722fd3b72ef86aaaf1c38ff3dd Mon Sep 17 00:00:00 2001
 From: Chris Packham <chris.packham@alliedtelesis.co.nz>
 Date: Fri, 31 May 2024 09:51:38 +1200
 Subject: [PATCH] basic: Add BCACHEFS magic
@@ -34,7 +34,7 @@ index 1cd66b5a5f..c82fe98227 100644
  binder,          {BINDERFS_SUPER_MAGIC}
  binfmt_misc,     {BINFMTFS_MAGIC}
 diff --git a/src/basic/missing_magic.h b/src/basic/missing_magic.h
-index 82d71c8ad1..b3d2ee9f57 100644
+index 82d71c8ad1..c8ecf44357 100644
 --- a/src/basic/missing_magic.h
 +++ b/src/basic/missing_magic.h
 @@ -197,3 +197,10 @@
@@ -46,8 +46,8 @@ index 82d71c8ad1..b3d2ee9f57 100644
 +#ifndef BCACHEFS_SUPER_MAGIC
 +#  define BCACHEFS_SUPER_MAGIC 0xca451a4e
 +#else
-+assert_cc(BCACHEFS_SUPER_MAGIC == 0xca451a4e)
++assert_cc(BCACHEFS_SUPER_MAGIC == 0xca451a4e);
 +#endif
---
-2.45.1
+-- 
+2.47.0
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
