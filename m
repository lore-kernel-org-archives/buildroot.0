Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88F3CCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 08:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1422685297;
	Sun,  2 Nov 2025 08:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfTgcwCi66js; Sun,  2 Nov 2025 08:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1809E85290
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1809E85290;
	Sun,  2 Nov 2025 08:44:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB1A4222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC8C2425FA
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HPU-xlId7k7 for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 08:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BFE76425F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE76425F9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFE76425F9
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:44:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4B6C7A4C5BF5;
 Sun,  2 Nov 2025 09:44:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50040)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFTh9-000000001d8-1JtI;
 Sun, 02 Nov 2025 08:44:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
Date: Sun,  2 Nov 2025 09:44:14 +0100
Message-ID: <20251102084414.241614-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762073055;
 bh=/TvJMugEfoTwvGe4Xpq4fUHSEkNkhyQvenPk5oVTFI8=;
 h=From:To:Cc:Subject:Date:From;
 b=UWAFhQpnZf/224y1ECMu2imKJvgNB+pJrB17G4HT+aYafLqutqPFAQPAS6hVy1WNF
 ABOSaBtyc3UAhsfbIFcJLNozq/UgnXM7vPXzPQBiaHw2ZwuB7cXiodT7SK+PRNPi3R
 kDOcPJpdG13YKGrT95ceqi7Zo6C7mcGHJMP1LT5DGfVTKr/Sq0diL7olHLpCIFpIIw
 ZXssRk9rM3/OFZREu5zyNlvg+dkUr0AH3mhSqDyzW2cvvETH2erdBcliIPwV1AYKjf
 8lvJkSGyysN23gLM28fT4g9vP6kuMXjrx4caCfsQsbVR+Ywkf/7UNpvxnHGqVXius0
 wJ28x4KVpAn0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=UWAFhQpn
Subject: [Buildroot] [PATCH 1/1] package/crun: link with libatomic if needed
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

Fixes:
https://autobuild.buildroot.net/results/f4f/f4fb970f8d4f2f7966fcbd542768a607ea7ababf/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/crun/crun.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index b4db276602..02d0b3d62f 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -15,6 +15,10 @@ CRUN_CPE_ID_VALID = YES
 CRUN_AUTORECONF = YES
 CRUN_CONF_OPTS = --disable-embedded-yajl
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CRUN_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 CRUN_DEPENDENCIES += argp-standalone
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
