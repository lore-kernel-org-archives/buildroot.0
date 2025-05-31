Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FD1C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 14:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31EAE83DFD;
	Sat, 31 May 2025 14:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9p1lHcl5Krj; Sat, 31 May 2025 14:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73B7783D22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73B7783D22;
	Sat, 31 May 2025 14:39:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 179C3117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08C5483D22
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCTbUGJOXXhB for <buildroot@buildroot.org>;
 Sat, 31 May 2025 14:39:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 512F783BCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 512F783BCA
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 512F783BCA
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:39:34 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 84780E001A3;
 Sat, 31 May 2025 16:39:31 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Sat, 31 May 2025 16:39:21 +0200
Message-ID: <20250531143928.25446-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527152342.4288-1-fl@n621.de>
References: <20250527152342.4288-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748702371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Az7F3QDMe4WqfPFmdNhj/MDFOvFZVmmHGDb3hFazDd0=;
 b=JO34Qr3AXS0R0774RXNybhwZjt6wyyC++ackthrXpiim62X+lciKa7xLUt56rTLTL6ErGL
 nopRo8oNo9o5xBuPcESNRapvQKJ8qrbRKK2hf1Yo8dsA2x7LR2hulB+QywJOM4gexUjWq5
 jGh1vv7KIHAjg2hqxgLQ7XwWUDqte7w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=JO34Qr3A
Subject: [Buildroot] [PATCH v2 0/2] package/network-manager: make crypto
 library optional
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

This is v2 of the patch that removes the dependency of NetworkManager on
a crypto library.

As discussed, I've done away with the Kconfig options - the package will
now use a library if and only if it is already present. That breaking
change is also documented in the manual now.

Also, I've changed the package from linking against libnss to gnutls if
both are present. I've split this out into a separate patch since this
is a somewhat unrelated change after all. Even after reasoning through
it, I'm not sure if this is worth the churn though. Feel free to drop
that particular change if you feel the same.

Florian Larysch (2):
  package/network-manager: make crypto library optional
  package/network-manager: switch default crypto provider to gnutls

 docs/manual/migrating.adoc                 | 8 ++++++++
 package/network-manager/Config.in          | 1 -
 package/network-manager/network-manager.mk | 8 +++++---
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
