Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E84CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B63B409BB;
	Mon,  1 Jun 2026 19:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJ8F9UdiDkpV; Mon,  1 Jun 2026 19:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25C8E409AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780341724;
	bh=uSbAsntADr6+FkUyYzwAg5pz2YHido/nIN4q3CLWvTY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KT5Hfv2GHQR6GSDCHgMZD2MupNHwGLlsdnb6TJrlpf+uQPRm89rwFEsAKU2mIsCQM
	 GkQYCCo/P+PCcSbFZ1ciSDRPLwgPhQ3MO1/gBkF0GQtR7wApcWmBilwnYWswzLgvEk
	 5uIU0UrWUn8tRrgBN+Lxq2cZBKnxQbVWqojI8H1mwYfjoC2k7QgWM3KRanEYzLW4E9
	 HmEjWTXlw0/UI8omOsmJbqXEW5TR+nXKU/Q9fxze1sfswIqTGBkGn0v6LIwZkznVO6
	 eIx0aTLslZ/Hu3mbzhpQ5LwQCSb5QWoAqvo/Ruv+QBxQ/IGmG/sdAwzUgAOMkMPXnG
	 9BUPNDotklUBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25C8E409AF;
	Mon,  1 Jun 2026 19:22:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B3DDD3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 602D1810B1
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opkvpRgiXg3y for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66BD7810B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66BD7810B0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66BD7810B0
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:22:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90908A4C1842
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:21:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57206)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wU8D0-000000007KD-2cpb
 for buildroot@buildroot.org; Mon, 01 Jun 2026 19:21:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  1 Jun 2026 21:21:57 +0200
Message-ID: <20260601192158.3687045-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780341718;
 bh=T+dlL7XfUCZr84T3OXwpr7SFYYJxjBsxgAOcoiwblJE=;
 h=From:To:Subject:Date:From;
 b=CG9Cl83qF2MXLsD8wWMEt3zZV0PiAR6qs9SRPze2CC0abcoVVv5rpuvSpYQVOGVZ0
 RZcIwGILhGoMtckM38o0y9Nfb8TWuq5NgpweX9rqz8RXjqQ6dRamvePIWN7JpDtH3O
 TKf6OJNpAJmY4hqlNNkF7vnUj4cvM4rZzIvTff2YMEIAwaZFFVJ/SpSu9rWGlmyErS
 5KstvBmKBaz/ilun03KHB94eR65TVdW519nHWGDfwlkUPXC3ePQv1tjLUK3OaHETZh
 3rXCb2r+abraWEns9A8jngV+AoI1YUit7Q0qW3N5fBzmmn7lOg1EroD0ylqht/FYxN
 aavVofdAeaogg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CG9Cl83q
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.9
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

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.9/ReleaseNotes

Fixes
TROVE-2026-013, TROVE-2026-014, TROVE-2026-015, TROVE-2026-016,
TROVE-2026-017, TROVE-2026-018, TROVE-2026-019, TROVE-2026-020,
TROVE-2026-021 & TROVE-2026-022.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/48fe2acd75c1028cbe94598180882493ecd33550

 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index f748afecfc..a6771b1fa1 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.8.tar.gz.sha256sum
-sha256  ac1f394e2dd2ab0877d27d928fd0d9e86662fe3ca6afdffb9fd9b6f0f96d05de  tor-0.4.9.8.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.9.tar.gz.sha256sum
+sha256  bd75ba7fd68f607c7806fcf70156a300aa926e9ad69a5e56a8e6414f5227e833  tor-0.4.9.9.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index a24708ddad..ca5a4d026c 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.8
+TOR_VERSION = 0.4.9.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
