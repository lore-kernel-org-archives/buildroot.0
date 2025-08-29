Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE9DCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 09:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03E70822E8;
	Fri, 29 Aug 2025 09:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zZ2k8PSv0I9; Fri, 29 Aug 2025 09:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4458E82419
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4458E82419;
	Fri, 29 Aug 2025 09:46:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E66669
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FC74412D1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wb-y4n3hSjO0 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 09:46:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93005412B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93005412B4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93005412B4
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:46:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1129126245; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 09:46:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1urvgg-00BTdd-33;
 Fri, 29 Aug 2025 11:46:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 11:46:25 +0200
Message-Id: <20250829094626.2735514-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WDU59Cw5h1t616EeMNKjEvcL5tkezrYMbGeBAXdtia547lRhJH4YTioRLW+WWstJgql57jIVjCzY7ZnzQiAM+Mvc4HSsanvJRYCAOrLRPlkPvUZ70kPS0hVF1fOhqD58QLerbpS6St0BFkQNM51DzidaPzGfhayIdffwBalMuUTSEKTtTfgXlwIalEQ+l4XlMRzQS7ayOO0Yt50zAUeRrbt+vQLRUzQvf2U9Dh7G0N386+OTNDEzE8d642yaro16eCs4C9PNNsfjNKJHq4nlfFW0LL9m1VpVNUwGIVE2R7/TAkW8AqKn5+sQBoVLLKmEEwgw/AsNUlu0q42vFR5/Yw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=nQRT1FMjBuAQE+RzKKDDyHZjLjirAqOFSiNrYkgBdqM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=WDU59Cw5
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/brcm-patchram-plus: fix build w/ gcc-15
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
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes http://autobuild.buildroot.net/results/2058934e442c0b3f3d0bd81bd7ed080c2eaade31/

The source code uses empty argument function pointer prototypes, which
changed behaviour in C23 (default in gcc-15):

https://gcc.gnu.org/gcc-15/porting_to.html#c23-fn-decls-without-parameters

Causing build issues. Fix it by forcing gnu99 mode instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/brcm-patchram-plus/brcm-patchram-plus.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
index d873330769..81ffc47aee 100644
--- a/package/brcm-patchram-plus/brcm-patchram-plus.mk
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.mk
@@ -10,4 +10,8 @@ BRCM_PATCHRAM_PLUS_LICENSE = Apache-2.0
 BRCM_PATCHRAM_PLUS_LICENSE_FILES = COPYING
 BRCM_PATCHRAM_PLUS_AUTORECONF = YES
 
+# C23 changes meaning of empty argument prototypes like int (*)()
+# causing build failures, so force gnu99
+BRCM_PATCHRAM_PLUS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+
 $(eval $(autotools-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
