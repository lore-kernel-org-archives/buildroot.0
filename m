Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7A3CD5BC9
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 19:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01D926070B;
	Mon, 25 May 2026 19:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXopEqzv5dJa; Mon, 25 May 2026 19:57:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEF52607EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779739023;
	bh=uDKemkLk+OgW4ttMFB1N5TMzNjcRYJD3XdZpQM2ApIM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DuA1q0Cf2NzFp25wNYT0AWUTeL0p2ke/zCxpwM0YzaabcH7xA/UEEMh0heOz68xL9
	 D2o5oDHFyuaxJSZCfJDdxOcOu5lieLZgw78swDS8pc6UW+5Qi//WzbqdgDdTfk3Sjo
	 92EefH8X1TNDrCCj22y5hYhQzDkbMP1lZ5CTl3MQCnDa1K+eHHqnwov1ioO0R2+Q0w
	 p6rDvx0mYJQvY6IiAY6SheSVlbS2ZgHTenHhhBrdzbc8EZ0MT8WS+ffQF8cKODzXE7
	 vpu23ys7GOlOhjDltKuYoC84l3CPGdK+yq+66HRbhEO3ibcDPINPX+2Wv/i4pwJ1Tt
	 g1JxhNHIYkyWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEF52607EA;
	Mon, 25 May 2026 19:57:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1C7E297
 for <buildroot@buildroot.org>; Mon, 25 May 2026 19:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F988607EA
 for <buildroot@buildroot.org>; Mon, 25 May 2026 19:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XhJ4haf6eIo for <buildroot@buildroot.org>;
 Mon, 25 May 2026 19:57:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3643B6070B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3643B6070B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3643B6070B
 for <buildroot@buildroot.org>; Mon, 25 May 2026 19:56:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 85B17A4C1465
 for <buildroot@buildroot.org>; Mon, 25 May 2026 21:56:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRbPz-000000005Eb-3IDz
 for buildroot@buildroot.org; Mon, 25 May 2026 19:56:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 25 May 2026 21:56:56 +0200
Message-ID: <20260525195656.3833500-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779739016;
 bh=V3DponFeqx0rmeO/jpgLDmM2z1YOpGxN8xn+fkkc4k8=;
 h=From:To:Subject:Date:From;
 b=iBtfzV8c2sJedXzTSAnFtxg15ycck/pfsKG4/wJRmsmZYABYP4oxvKiqilQmNrPb+
 iQf/it9XyK2+zuKQwHMcUYRh5qomfKT0ZQce1mMtM8bLTOcdq21RXlHQYOU1IxNXyM
 CIfw4YKfuZAUn/dAFbAhzvQzs/B8SnMDs54+0vbgZnmanB8EPsMh0y8EMa3VVLRPvj
 eTYuUXLTFGhWcROkdJ7uKl307c6wVL4WewIrKFIjLpKkq2B/YdSCs1qErHXwbkKJKG
 T1UCUcqfl6m8QeGNyNQJwW0OfZbvKL+e8TZQdQHXSqk3kKs1L8/Ng/S+R90GxmICpP
 5mhsQoshNRcHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=iBtfzV8c
Subject: [Buildroot] [PATCH/RFC/next v2 1/1] package/pure-ftpd: bump version
 to 1.0.54
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

https://github.com/jedisct1/pure-ftpd/blob/1.0.54/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added result of Gitlab pipeline
    https://gitlab.com/bkuhls/buildroot/-/pipelines/2551634401

This is my first try to use a gitlab pipeline.
Does it help to reduce the workload when reviewing patches?

 package/pure-ftpd/pure-ftpd.hash | 2 +-
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index b31afb2956..dfda62f0c1 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  329a1d524476d7a137dcf65af04ec79ddf1c225e2c4ac4a2e884663ef4897fa1  pure-ftpd-1.0.53.tar.bz2
+sha256  c2bef41f9635c3a87efd65f089c16ca5df9fd02db199d9fdcf12b206b93d41a6  pure-ftpd-1.0.54.tar.bz2
 sha256  b0bc52c61f9265bc00c509bd40dab60950371166b59416a1484bf226f480796e  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index bf2599ecaf..daf8e6eda8 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.53
+PURE_FTPD_VERSION = 1.0.54
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
