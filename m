Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF85CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 15:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7D040542;
	Wed,  8 Oct 2025 15:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myAEma5XFqyq; Wed,  8 Oct 2025 15:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40BFB40928
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40BFB40928;
	Wed,  8 Oct 2025 15:15:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AC8E119
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 15:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E525D40542
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 15:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnukpjJ50PBt for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 15:15:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1564E40AE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1564E40AE1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1564E40AE1
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 15:15:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b31b.dip0.t-ipconnect.de [84.161.179.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4714BA4C638D
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:15:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46586)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v6Vse-000000006At-3wqe
 for buildroot@buildroot.org; Wed, 08 Oct 2025 15:15:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Oct 2025 17:15:04 +0200
Message-ID: <20251008151504.20176-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759936505;
 bh=Lt5gkF1DnKBboVb588bCNaywjcfS9oTCaD/a+wiyMWo=;
 h=From:To:Subject:Date:From;
 b=j3jM+AXToeYA5shIRul24SZ4FSS7oGvRQl0TqUF/B9+tGn8rasC57pWBCAG9nduSR
 kd2Kvou6qBfPsw/3xdu9fpeVgS1GiYZaKfKGJ5sYK0xeEs+g9Bn+CbdLp6baqpuqgk
 Y/vQfdhFp168FhFrlw3MwBN9fJAR/RrJnDfQbEDmq5EHCVCTYd+MmcBB8p6vaL/YE1
 rk91hau0a2av6McnQIJpMWNItZDihEvjODGUHHQnLqiWatDEEDyp+FDAa0tTJjb+JA
 lmnn9C/aNFsVwG1J4nnd3FRBpQ/5/azYR3dNuU4gWu4NfoxvT3qwkEDh6hLMqdqRzc
 DDsAIXoxU1Teg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=j3jM+AXT
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.19
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
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/stable-release-0-4-8-19/20648

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 95a3a26eb7..ca2d49fb19 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.18.tar.gz.sha256sum
-sha256  4aea6c109d4eff4ea2bafb905a7e6b0a965d14fe856214b02fcd9046b4d93af8  tor-0.4.8.18.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.19.tar.gz.sha256sum
+sha256  3cb649a1d33ba6a65f109d224534e93aaf0a6de84a5b1cb4b054bfa06bb74f5a  tor-0.4.8.19.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index f9ff4fbca6..208e71ae51 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.18
+TOR_VERSION = 0.4.8.19
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
