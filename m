Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64858C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FBAD40612;
	Thu, 28 Aug 2025 13:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sfwKqLhdydM; Thu, 28 Aug 2025 13:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E9BE40649
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E9BE40649;
	Thu, 28 Aug 2025 13:28:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E30B61B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE44383B61
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxfCoa6FXHbQ for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9076483B60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9076483B60
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9076483B60
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:28:07 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1732657001; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Aug 2025 13:27:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1urcfM-006g2y-0k;
 Thu, 28 Aug 2025 15:27:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 15:27:46 +0200
Message-Id: <20250828132747.1591583-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=O5YStA98HCPKRk1S+SpbeB/pZWYDLP/K6m//RFKEdtFxd4X7NWyZr//vhq50lIaUQY/YdQrzVAa/n6awwYekfMxxZHxBacKhH+sPSwlOq5U4xGjzZ8OAtIfMKRSKtEcnK0+tsK2Tvs3bNI2spcF8uroGlt64PoRYaKiCwkdz1n7/s6ad5hn9VkVOoymM7De5V0Om7iiFqpBEtMg+o5LPr6cjsSzQ39FfI2Kt3MZ6YqhA03rWmstsLRe/EgIHTybPbBETyZy8OUZD47fDafmPR2qnT28C2W8V5rOPY2XROQNgynRV+AC76GrFAhjuJqwJ2IAPiuEHqPl+VkwVkQBm/g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=TwujZRnyjVqayyiNFaHFUMNe9imciRgMQHZw7TU6y3U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=O5YStA98
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/vde2: fix build w/ gcc-15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: https://autobuild.buildroot.net/results/8d14173f31922a737c326be75aa24c9f9471342a/

The vde2 source code uses empty argument function pointer prototypes like:

typedef ssize_t (* ssize_fun)();
extern ssize_fun vdehist_vderead;

In C17 and earlier, such prototypes means unknown number of arguments,
whereas with C23 it means no arguments, leading to build failures:

libvdehist.c:39:27: error: initialization of 'ssize_fun' {aka 'long int
  (*)(void)'} from incompatible pointer type 'ssize_t (*)(int,  void *,
  size_t)' {aka 'long int (*)(int,  void *, long unsigned int)'}
  [-Wincompatible-pointer-types]

Workaround it using -std=gnu99.  Vde2 is provided both as a host and target
package, so do this unconditionally for both.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vde2/vde2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index ab4c32143d..7c7fbfca9c 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -38,5 +38,10 @@ HOST_VDE2_CONF_OPTS = \
 	--disable-profile \
 	--enable-tuntap
 
+# C23 changes meaning of empty argument prototypes like int (*)()
+# causing build failures, so force gnu99
+VDE2_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+HOST_VDE2_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu99"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
