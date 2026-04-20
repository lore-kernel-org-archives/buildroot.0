Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDD2F5A8A1
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF9BF61116;
	Mon, 20 Apr 2026 17:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ddNdln1LTwbU; Mon, 20 Apr 2026 17:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B58B6107E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776706473;
	bh=wv4pWxaM2DmcXz94Xt8K2VmSyh68582vb+xQy+ajbyU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LhqWmE4g+1bkynV2ONOo+W1Nzkdu+oo6cZSCy0TvJysglrrmzk92YD2wr/TkzEnMA
	 DuwRSZESO0AWArDVxpl5XpBOsjC91kKhd/WQfzFQE4GOkpvjwPs/QN8voHN8HuYy5z
	 9bwoc0pTNh7AyU7sCs1+5eq2BSCqPHxI8rqpIJ5aImBm3jWabxvmlRW5zoHUdzZRIU
	 TJ0MqDHi5TrNTrZv5C1xaYeyF8nAlzQhK5tF4llGgf5w8rqn7myGBQTR9nPMlZ3lLw
	 uJ9tEg0Kr0zOmzdmRUKivyleuGFEmps1aedKKTxRKpW8jYQ8w6ihqdxLejqaGyhAoh
	 BfRIxJQeW/kcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B58B6107E;
	Mon, 20 Apr 2026 17:34:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D594624D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB4116107E
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njXb5A-Qp-7j for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:34:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D76761010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D76761010
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D76761010
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:34:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cdab.dip0.t-ipconnect.de [79.214.205.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D6827A4C0D6A
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:34:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55302)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEsVh-000000004Fn-08XP
 for buildroot@buildroot.org; Mon, 20 Apr 2026 17:34:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 19:34:11 +0200
Message-ID: <20260420173412.3572945-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776706454;
 bh=O1N1XWfrfqYTM6c3vTwYnQrPnqWcGwW8+2HUh03l6Sk=;
 h=From:To:Subject:Date:From;
 b=LJvPgyM4H55JEUwDMlSQTodjR7h39Xc2stEKVnybyTTj1LmcHJRyzbsa3dXbH4gC5
 3r4p9RrcA2h4VplagnAYq7Wu/PmxMCIiYRff6CuXU7rUgs5UJDhRQpfNBtUcfle4yW
 eXmxdacjkckYcwQ9QfeS3nFFH5WV3IAq4PVLf3MSstsSIha3pFfYSrCFZBHvjeBHl7
 wlDTBWeVs2RXXiYw17WbXtGM01wSdNdC+fP3B/AbV8TzM4E5qxFUQj9NZdFuy+W2UZ
 OYfnXgToQ9JuXOjgzs4hMPYkt+zQcSyF3bgFvMXt6C6xFN7PxG0KfIEC8dGe+nwYMN
 DLYrA48zoByLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LJvPgyM4
Subject: [Buildroot] [PATCH 1/2] package/p11-kit: security bump version to
 0.26.2
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

https://github.com/p11-glue/p11-kit/blob/0.26.2/NEWS

Fixes CVE-2026-2100: https://github.com/advisories/GHSA-hq85-3f6c-jx84

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/p11-kit/p11-kit.hash | 4 ++--
 package/p11-kit/p11-kit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 43a566a82c..943ad9c22f 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256  04d0a86450cdb1be018f26af6699857171a188ac6d5b8c90786a60854e1198e5  p11-kit-0.25.5.tar.xz
+# From https://github.com/p11-glue/p11-kit/releases/tag/0.26.2
+sha256  09fd9f44da4813a3141e73d5e7cf7008e5660d0405f13d56c15e1da9dcecf828  p11-kit-0.26.2.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 42de3e1065..68b1894183 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.25.5
+P11_KIT_VERSION = 0.26.2
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
