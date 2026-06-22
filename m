Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8464FCDB471
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 07:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0702C4059A;
	Mon, 22 Jun 2026 07:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2qUdIKFCcCi; Mon, 22 Jun 2026 07:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05645405B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782112280;
	bh=0zljUHFlMnb4JwmQ0wTVvSHuhofpG0s4voTNrXf4tq4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VtReDP6kRro0OqHA+bMbpnV8fTsFov+cj0yWQv4XgdGDKygvF7yH7mikUbPxvLKDW
	 PB5plnHlDPxzG+IJi8yOxagUtDYd46txWg5UNtpv693fMV8suavugqRV9NPkbm4hce
	 6l1cANJJs04ox398fw5XQ4j+BwmdbBWyY3kFY5GNxQ3/7xnr0lpmSDRWViu9AlH+eh
	 VT9PK/IeuRGuJJBX2vBTPUu8HsZVokpswhujhZtiRDRaeAXqVzu+f8rCUApWYVrY/l
	 T2ufMlwEAV1/jZZluz4Jf1b4aH9Npn4L3gXsajd0UA8UNEI6S5fP4lDmFRaXZzPzIA
	 77CAdULRob7eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05645405B0;
	Mon, 22 Jun 2026 07:11:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEC1E24D
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 07:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D51C0863F6
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 07:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6BrnTHkZBXk for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 07:11:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3530086368
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3530086368
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3530086368
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 07:11:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1301061411; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 22 Jun 2026 07:11:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wbYoK-0000000EpDK-2wpG;
 Mon, 22 Jun 2026 09:11:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jun 2026 09:11:10 +0200
Message-ID: <20260622071111.3533445-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=oC2CVkTwnSDjEGCGJzopXZVX88SN/coM8OXLpn5kjQcU5lu+2auA/4e6jC02Nb7jQ9+m3AvS/CwJcYjZdXmcpEaNyBJiQc02nkyCFDGz4m/Bl8qEZ9Qxfd7rj6PtFN4jYQGcaY/qZCkJvDd1R/bvtSTAQ48Q1CHp8DwlDnz3qxwlkHfuK4zYTg25DtxvuNw4D0hAeywBdGAPdFtmcOxw6GeYKgiBVOLJWqkNQaYr6/suGiHhl9ORlCW/bdg88PQmVJFowNhMdXgFE60mK96g5Ji7HETy5HhcI48gUKUwbG5cD8RTPqK42kmJhQwU21NnnhawZ9c83/+KiX9dlzrHrA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=rFIFlhKaK5oRyUB9RU22USgUUfBBIPIltJdOzGML0LI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=oC2CVkTw
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/jose: version bump to 15
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

Release notes:
https://github.com/latchset/jose/releases/tag/v15

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jose/jose.hash | 2 +-
 package/jose/jose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jose/jose.hash b/package/jose/jose.hash
index 0bee7f46e8..016807c328 100644
--- a/package/jose/jose.hash
+++ b/package/jose/jose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cee329ef9fce97c4c025604a8d237092f619aaa9f6d35fdf9d8c9052bc1ff95b  jose-14.tar.xz
+sha256  1d055c445392aa48d709ecd6e56220384ae2b480496e270818bddf1f219c8659  jose-15.tar.xz
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
diff --git a/package/jose/jose.mk b/package/jose/jose.mk
index 88050be5ed..486765aa9a 100644
--- a/package/jose/jose.mk
+++ b/package/jose/jose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JOSE_VERSION = 14
+JOSE_VERSION = 15
 JOSE_SOURCE = jose-$(JOSE_VERSION).tar.xz
 JOSE_SITE = https://github.com/latchset/jose/releases/download/v$(JOSE_VERSION)
 JOSE_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
