Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880FEC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 21:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3068C40319;
	Sun, 18 Aug 2024 21:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdVqOY9XQ2Nu; Sun, 18 Aug 2024 21:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4989403EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4989403EB;
	Sun, 18 Aug 2024 21:43:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9281BF407
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 21:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 277F6402BC
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 21:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQY3V_Oc10aM for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 21:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E8FD7402BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8FD7402BB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8FD7402BB
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 21:43:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E00D660004;
 Sun, 18 Aug 2024 21:43:08 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 18 Aug 2024 23:43:03 +0200
Message-ID: <20240818214305.1051667-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818214305.1051667-1-thomas.petazzoni@bootlin.com>
References: <20240818214305.1051667-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724017389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YhNvGwBzyJnlGN9RVJQnkBKkyA8U8rT7XLMz19Imz38=;
 b=HXcJQ2uRhlQUXOAb55MvEdEwg/dVoFyuDByClGEMJfB6AfsJw3Aj+YNFJtcxf3WO8DEwNo
 0Kq4mSicjIJyLvTxJRqYGdkdrPmCgNNibyQnd3MawI6y8JZQ5aRNlwrSLhxoxYg5zED2O8
 epoUKaNHfXVpZoBEd+MfnTHqvwMKB/1YTIirfgpDnsS+rupmUzKdRLarROujgDOZ+g3ynB
 4QwfYATPu4HpR001fGi1D5DZSBMJUbPGJeLr+UZAG4/WV8DyYIwsiqz1hRsMNyQo+lLwhZ
 y4riTGEicrT2VIKJYKkEBnsEDFm3TTmd6lkW7RnrKozwie5ha8b7udP/hNtVQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HXcJQ2uR
Subject: [Buildroot] [PATCH next 1/2]
 support/scripts/gen-bootlin-toolchains: tarballs are now xz-compressed
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As of the 2024.05 toolchain release, the toolchain tarballs are now
xz-compressed instead of bz2-compressed. Since this script is only
meant to update to the latest toolchains, we don't really bother
supporting the older toolchains that are bz2-compressed, and we simply
assume the tarballs are xz-compressed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 4344221213..ef034058e1 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -293,7 +293,7 @@ class Toolchain:
     @property
     def tarball_url(self):
         return os.path.join(BASE_URL, self.arch, "tarballs",
-                            self.fname_prefix + ".tar.bz2")
+                            self.fname_prefix + ".tar.xz")
 
     @property
     def hash_url(self):
@@ -416,7 +416,7 @@ class Toolchain:
     def gen_mk(self, f):
         f.write("ifeq ($(%s),y)\n" % self.option_name)
         f.write("TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = %s\n" % self.version)
-        f.write("TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = %s--%s--%s-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2\n" %
+        f.write("TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = %s--%s--%s-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz\n" %
                 (self.arch, self.libc, self.variant))
         f.write("TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = %s\n" %
                 os.path.join(BASE_URL, self.arch, "tarballs"))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
