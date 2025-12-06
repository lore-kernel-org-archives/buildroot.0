Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AD9D3B7E5
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 21:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E04174092D;
	Sat,  6 Dec 2025 21:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IT_SWRjzMX6D; Sat,  6 Dec 2025 21:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C25840872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765057355;
	bh=Y/OOtiAV40lAiFWytyOPFh8MY5FWEkII0tfbmkDNngU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MolGmwyNphoPJ0e9E3beSRpZjuaHZ+/IdInCVEZu0kPeFtAiuNDBYc7R0QoT77mge
	 alLYqskMLoxmpmGd8sOD3vJR8obV4NGIjbMe0DdYaPxvxfgu8ctBUplYJvSLmUAZek
	 7PC1qfcDvFChhk4sqiMirc0p5rXG4EGeK39SkyYEzL5MsBBZtYR9u+qJuPfILzoPi/
	 9ahfguGkpnFKeU9/6b2W8rO5s/NlOid75x172VagfNbdLsXOe7SIUPfuN+cJ5tS6fX
	 b0xtAER9rLfqmiwdVrkzz/3OjPRKWvqbbSpBXjAIskBE78k+QbSJV1srGiKFE2NZE2
	 gBD+HCeUxtRQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C25840872;
	Sat,  6 Dec 2025 21:42:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 614DD1A9
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47D704080B
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkEnIbiWFjVA for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 21:42:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C340F407A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C340F407A6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C340F407A6
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:42:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79B09A4C02C4;
 Sat,  6 Dec 2025 22:42:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32818)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vS02u-000000006xV-38oL;
 Sat, 06 Dec 2025 21:42:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
Date: Sat,  6 Dec 2025 22:42:29 +0100
Message-ID: <20251206214229.2306995-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765057349;
 bh=n2GOj5mMhIi706VVngRjnSWTe3EIDXz16Kc1CR0bNWI=;
 h=From:To:Cc:Subject:Date:From;
 b=onHJRaV59BGTYuhUjHGLHsR3sPxB59F2iIRd8OC9tPQhzHDFerllSEXZXNJVdoFSf
 3SwNl3AvTBqVct6qciTfGjldq95HzCmZYENS/atBtPez7/UzmngWK+AGWx5UbAfXg4
 1QnurLUuimbpKmZKnIWrxYv3Rv4c7U06CImiGQxwLKsaNvdw9QJfxiIlfHxL23GQbb
 dtia7MKoaYZACvUU2etmip9OoufwaX3K3pEZ8dBODr4hZwZdsGP5em2S0fxRv/dZXK
 s2USTsOxFyYNerLYjKGmQ7gYTlQtmCiON8LwrQNKQ3gUvNg2vd7R0cO4DkTs3pLp1Y
 jyJ1Ke5GFI1ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=onHJRaV5
Subject: [Buildroot] [PATCH 1/1] package/mosh: update SITE
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

Old URL returns 404, update SITE according to https://mosh.org/

Fixes:
https://autobuild.buildroot.net/results/c1c/c1cf4568c82deb118aad0171bda356c7f59f17dd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mosh/mosh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index 3c41a17401..bc1f382a9f 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MOSH_VERSION = 1.4.0
-MOSH_SITE = https://mosh.org
+MOSH_SITE = https://github.com/mobile-shell/mosh/releases/download/mosh-$(MOSH_VERSION)
 MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
