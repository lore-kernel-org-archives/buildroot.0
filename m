Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFBDC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 10:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F9724063E;
	Sun, 23 Jun 2024 10:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9X-ui-7noS6; Sun, 23 Jun 2024 10:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F25C40644
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F25C40644;
	Sun, 23 Jun 2024 10:26:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 528531BF59C
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 10:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40A9C813B7
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 10:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIe0zHsShwN6 for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 10:26:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97F808137D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97F808137D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97F808137D
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 10:26:23 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 47D6CB00583;
 Sun, 23 Jun 2024 12:26:20 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 12:26:15 +0200
Message-ID: <20240623102615.20501-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719138381;
 bh=D9iXgQoAOmpG14pXe9vcjA1co0/TUNq6Mafly6Hbxa0=;
 h=From:To:Cc:Subject:Date:From;
 b=s3VBc1KBE3WKK2V9LCT/kZBCyICXt6GqraDG3+IJuoJCH6zk3yJu02+zYzLCAMsOy
 0Cf1lqPl+889offLDH8CglCWyZ5r31bTBaB/gaBA9KjhrAxXZSYrRP+Vsl5jzH+O2J
 usbD7vAYZo4ilsSvNvFptI0LnR1UmXkBrLLgJMbjArTkFYoWm9cPNiyGY1SHBZ2vzq
 9FnRErICOar91wNuQfUgyF1QTfeYfoP4Yw1Sf5wrnPxAiN+Mg11KkchboLRfqdk0hi
 f8XWqyBgMl623i+DIXenjtDH2orzrjcp0p6VxOIS1mkRzbYmm7Cq6q/Uo7GFgrspTr
 bZVwKMzTrbn/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=s3VBc1KB
Subject: [Buildroot] [PATCH 1/1] package/octave: add optional openssl support
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GNU Octave supports the --with-openssl configure option since v4.0.0.

For reference, commit 40ea68b4b2 "package/octave: new package"
introduced the package at v7.1.0.

This commits adds this optional support.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/octave/octave.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index d879fd67303..0c7c4116921 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -43,6 +43,13 @@ else
 OCTAVE_CONF_OPTS += --without-curl
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OCTAVE_CONF_OPTS += --with-openssl=yes
+OCTAVE_DEPENDENCIES += openssl
+else
+OCTAVE_CONF_OPTS += --without-openssl
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 OCTAVE_CONF_OPTS += \
 	--enable-readline \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
