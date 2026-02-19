Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5FEE9A04C
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 08:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4182F60BC0;
	Thu, 19 Feb 2026 08:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwKVfq5r7qCD; Thu, 19 Feb 2026 08:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4C6860BBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771490768;
	bh=FwOxPy+71GIRC4WFoKW9aMrwe6UIcMzgMZSfVbJzljk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gal7LQ+Y++YosA3rfofpdc2TZ1p8Bh8BVnAL48HBL48k2QBtIB13qjB24olW5P/3g
	 KE5veIs1pARW0cjSux+w/eFzNdTKgLSfHNvIQFL/F9mQJukojKb0OI2rosC0jWKfdh
	 UFdIYFIq91NGhJc5h0p2nq+js7igRiV9A6XjzU/LM77c8cLbo43B/+pMBCaYp8II8h
	 zmW9ycEbsLuM3GzqWdWe++Fg2HcY994SybqYmK+r/UbSZEf9pYg7431Y4Jgrm7OHDd
	 HG39j65i6/8L1LnXmU5xXsEpTn1PzsUz5dshAu6aDohkthtIShx0h1ZU/ib//pMlvC
	 3hQjYQHqmlXKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C6860BBD;
	Thu, 19 Feb 2026 08:46:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40AD91CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 08:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 263B74034E
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 08:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vmXIcIisAAV for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 08:46:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:102:465::107; helo=mout-b-107.mailbox.org;
 envelope-from=manuel.diener@oss.othermo.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A755E402F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A755E402F7
Received: from mout-b-107.mailbox.org (mout-b-107.mailbox.org
 [IPv6:2001:67c:2050:102:465::107])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A755E402F7
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 08:46:01 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-107.mailbox.org (Postfix) with ESMTPS id 4fGn5v4QS4zDs2h;
 Thu, 19 Feb 2026 09:45:55 +0100 (CET)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Date: Thu, 19 Feb 2026 09:45:12 +0100
Message-ID: <20260219084513.13714-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4fGn5v4QS4zDs2h
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1771490755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=OKL+cQyQ42qdCXuzudYzSM2I80TcwU5VMUpYs4wtLYo=;
 b=oWXJkN4LbufSKUwslXOWl1D9nl+T2gPZYs3msBM+Whuf+/0Nunp1geTq7wyA+Dz9O8fgX8
 u1swI2w7yZpFDXk2JIEWv44W3tpzef2yZGI14DnPQG0tDHZ/erdICYQq9ig7JFlLuSGses
 plwJR6/lup9ulPKK05GjvRy4ZCVwCaOTliOJZWM/vza3LvcWG455wxrAh73P3rgXyOD05K
 JmFsiTa7KVCz49WAibzpGlrxvLo3zJdzxJWyCm19u74mwbT2y6E62C2Yk5KFnPOh4jzfvZ
 ATKD/aQFuWbRyVE4AA4SlT3Sa7U5mYZXMWJnew+HO+pB3hn+q0pfme3SRaywAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=oWXJkN4L
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH 1/1] package/nghttp2: bump to version 1.68.0
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

Includes the releases with the release notes:
v1.65.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.65.0
v1.66.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.66.0
v1.67.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
v1.68.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index 4b60d6d143..30c2c9078e 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  88bb94c9e4fd1c499967f83dece36a78122af7d5fb40da2019c56b9ccc6eb9dd  nghttp2-1.64.0.tar.xz
+sha256  5511d3128850e01b5b26ec92bf39df15381c767a63441438b25ad6235def902c  nghttp2-1.68.0.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 98f837e28e..3db48e7323 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.64.0
+NGHTTP2_VERSION = 1.68.0
 NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
