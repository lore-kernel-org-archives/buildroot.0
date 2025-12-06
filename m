Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B726ED3B7CF
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 09:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 049F740AC9;
	Sat,  6 Dec 2025 09:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyu2_0W3CnXB; Sat,  6 Dec 2025 09:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 350FC40AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765014812;
	bh=D7YCvmmC2EUjeBMcH/tsfNn8n8UMAv4xWb4TR7/FGGc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q8oW6f/ICC02puTx5xOLoYiIbZRKxFpa10WbcBl4GhgUj6+0vbQDJami7e1nrAMJv
	 aZn4dHv8CITAu1y0xXjKhyWUu/yF5hIbs2GTXfkj0dmTYIC2+JN+owPyvZuqfFTHzV
	 /vFJBhk9IDfxdBLQO4GsIo6DhxjNhxb0uWSFHmjbh/8ja26vUGJxo++87E1tUxwLUE
	 sw+5LN7ynvcrDJ9L9CVgW7mZekXsDujUZXSfJ1OmosPHnuGUwmnv9vPROvB0OlI5eq
	 n9IJR8hJQAwYhQN/vXI10U/5PAL7syqXuFeAmJeqR2MWAxHDh7mcM+pZG6seUD65Sf
	 iNuM57nxx2A6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 350FC40AA9;
	Sat,  6 Dec 2025 09:53:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09ED5151
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 09:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E41CF400A9
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 09:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMaSTXDqLkCK for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 09:53:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.101;
 helo=smtpcmd02101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C00F540074
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C00F540074
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C00F540074
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 09:53:29 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id RoykvwkYYlZ8PRoylvk7Ej; Sat, 06 Dec 2025 10:53:27 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  6 Dec 2025 10:53:25 +0100
Message-ID: <20251206095325.2091213-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPHgXQyWW7tuIfvGJGh6Kr0kx+K93f26Qn/3iJVnNIFfjVgjUW2X6NT1jWlVHxejBGukAN1Ulpiq+CXD3tD+xNqu6KBlsspxlym773KcrcRcWGSs7Ye1
 PxS83fFOhxNYaL+f0n40mX1pevfya4sR3o+rnfWkt1Q1U7qUpapV9ulQo5PZ0o3yg2oefMq498kSMqVhbI0p1MHng6SXTUz/ET5Q4HfXt0PKBpkcHzJvaggV
 YmCV2pW1+2NSh418zVG42z6DC2JcLV5e9No5hHq90Ec=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765014807; bh=lVoZSOyJ+vAiMq43dAwSR0SuKJK6HCTXxVrQereqsKc=;
 h=From:To:Subject:Date:MIME-Version;
 b=OMPYZBGqwvWc3rxJwNUxDs1U8+ULcrVL5MU+WRSe54Ht9a/GKm/eHVzeqTY1yCGce
 6uxL/4L6pCyCsJ2RNfXI1zavKK77YnX1fbIN9Fm9gOuFuJFH5I0hiAIGnzo2QYU+zo
 P+w+EdQWIwV4nDQa+bxgZrxBN7Izr0a2zKK34MQ7BPvpER8LRd68JXIlK5lOIK8oW/
 xSWbq0RsWhjJvDmWiF+NiQySDgf3jse1pcoXqELkqDtESl87YjOhD1Y36m6MFQL5qS
 NHa1fXIW95Ten6sZi+aZ30oSEplrdT/xl0Hb0qSzPNbv5oL0RxKT+A2Yr5MXpGdxTA
 9++eDD9v1k8zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OMPYZBGq
Subject: [Buildroot] [PATCH] package/libnspr: bump to version 4.38.2
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 172778540e..9148cf393e 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.37/src/SHA256SUMS
-sha256  5f9344ed0e31855bd38f88b33c9d9ab94f70ce547ef3213e488d1520f61840fa  nspr-4.37.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.38.2/src/SHA256SUMS
+sha256  e4092faeab77bdc9b32db1113e4215948ee768e26c4666db3b5a60b35f2c9105  nspr-4.38.2.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index a045140743..3c7351c2d7 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.37
+LIBNSPR_VERSION = 4.38.2
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
