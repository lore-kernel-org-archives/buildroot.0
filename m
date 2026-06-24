Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA7BCDB47F
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 18:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 198EF40B4B;
	Wed, 24 Jun 2026 18:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Dcw-gWjCbD9; Wed, 24 Jun 2026 18:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45AD240BCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782326871;
	bh=wL5XkFCaN3maZGNmWM6r2q2XeA7nDPLTtahVb7alsUo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BIrXaHlAnMeza8pv2l37LMYrt1PV81clHPVnKaFjsqM9xKqV7LE7AR2BchrPYjzdI
	 CtC6Xs3kT1M4XMjNuayyN3kKE4rENSckVZStA6AYNABrhuF/I4301icOo46zgl1OnY
	 rdkDSNar2sC/8yuCtxr3nRAnw6HftIPPGu+HJoSrufMH7YWgMojbqHGmMGjTiSzAev
	 coa1A2gu/oNq+IiZtiaOmXsgOj/jYUmGKw02/YWMKEpeybPYq6z95a6oroRn6/vPLu
	 YWcSWUxxlD/L+AukFm1WT4uVn4IsUTZbuwKwYUAu36/Yf3c53ihG+gahv67RQ2i9jn
	 SyKdYXoSQd9MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45AD240BCC;
	Wed, 24 Jun 2026 18:47:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 181C6367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A1D181EFE
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJ_BlLtaqeHd for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 18:47:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF7DE81EFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF7DE81EFF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF7DE81EFF
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:47:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c817.dip0.t-ipconnect.de [79.214.200.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C512A4C21E5
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 20:47:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42310)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wcSdW-000000004J8-1gBF
 for buildroot@buildroot.org; Wed, 24 Jun 2026 18:47:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 20:47:45 +0200
Message-ID: <20260624184746.1062142-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782326866;
 bh=pOOfvy+bKgnSJCur5HSSI/BKHVuEFtcz/8gjPYcL2kc=;
 h=From:To:Subject:Date:From;
 b=iSx68o3NYi3wFTU9Rxh6nVHkoI8XumafBTIVVap0lYVBedB1SpNQNJQ1YQNZleOuj
 h/bcXqlKJ6dLlEmmXvUKC2bJ1EMGlZMphtjUSfXFdrvgYH7k95zMQynq96HOBGn67R
 efOeCE7mStWsMwxsr/1+I2AwWlUHl0MI7ij8QX+vw+1JKsPFEO4OnFWQw+hiNoUnt2
 ZT2VNywRGU6luser3KMGgSO3ZJWbUoozswniBUOw1sIIkuPuSHjtOlkNvqNTn9m6ts
 ItDfH6Fsu6zSFuX3XeRWEEoI/Ic0d6FBVZJZ6ItOq/MPFiYC48rGPK2Hr2nToEjCB7
 8avHCTa2eOtwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iSx68o3N
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.2.3
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.2.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipeline:
https://gitlab.com/bkuhls/buildroot/-/commits/f3c6f26dcce9d0f92511575ab5642189311fcd57

 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index d4ec60476e..6fbe8689ea 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  48e7b2f6614041a4710f4f4d191a3dc7dd8b86d43de4ae7aa99ec24c3820f2c0  intel-media-26.2.2.tar.gz
+sha256  2e10b1565f45fd2052c9704639bb6144fc56b21979039f3b44151dfe5b281e18  intel-media-26.2.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 778470ef8e..a197c2a6de 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.2.2
+INTEL_MEDIADRIVER_VERSION = 26.2.3
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
