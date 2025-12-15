Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114D8D5B86A
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA75C409A8;
	Mon, 15 Dec 2025 19:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DXWqXBuDfqq; Mon, 15 Dec 2025 19:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADFDC40986
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765827449;
	bh=zCuTwDWXauN47f9k6Tgr1wTUM8Det4xhlIlhZApVyqw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pR33Ldk7fG8YOaAVXC2XcIk4On4GIWpHyl4SAuPt7nwBflxXTZBPT1TeqZWapQVpT
	 02cjpAp9QssEBcKoexF6Uc1QK/eDJrjVWtV4d305D7YTmZ58pG0CZRvPagqLGk+2Ss
	 pm2f+lXbnWsw9CxZkqwRMpvbqLXl2eY4Fq8Nso+aj3VPhu8F6xqUtIimkM3jDFqVmz
	 v6XcCCGJEbpRRHQk/ABfCjIs1mp23BFHF3zjUAJaLrPfcWxtX+cc4NsF+SPnA9EqjS
	 MsHUZK7vTi+12odX48NSlwzAL3A8ExmBp2vGndCFLq+8/T3EZmLeXgENPJCAtzN8+j
	 1Cc8626Pjn/+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADFDC40986;
	Mon, 15 Dec 2025 19:37:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95649255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85F28810E5
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHyPxjVj9S2E for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E1B080F79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E1B080F79
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E1B080F79
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:37:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1FD4A4C421C
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 20:37:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVENp-000000000t6-0Dt5
 for buildroot@buildroot.org; Mon, 15 Dec 2025 19:37:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:37:25 +0100
Message-ID: <20251215193725.1735453-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765827445;
 bh=AhbmKkqICSHZso3W20tX+Pyl37zAVJW2MAu5gZeWLv0=;
 h=From:To:Subject:Date:From;
 b=G+0Ac0BmPQy0VFT46wCLw+xYf5qQEAnl4YXGYp/cumFNM1HK8RZXMfdC2VaNOxAhj
 nLmjaNqreTg5A8b35YTiHTnfpHuJbZFQuDl8MNnGdxZBdN0rtOjoNl9FZjurSWB/Z0
 m+NJLHuPJ9r5Ft+uswMvENTvtcM4DmYvfJvXDi8Iv/Mv7kQldqDuncsnYA/w2sF9Q5
 RTispTE+qFKyHWarHM/RZiESsxnnCy1BMQ0IXWdz/52nXBn+U2si2iuwvnzHeJiqyZ
 NS1+X0BuiClZzofYUXd3pBs/LOfKbXckX8BmJYjM54hlkiA5h/a1GhPq+mMQFqQTi1
 /aTMbjhw2axsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=G+0Ac0Bm
Subject: [Buildroot] [PATCH 1/1] package/gkrellm: bump version to 2.5.0
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

https://git.srcbox.net/gkrellm/gkrellm/src/tag/gkrellm-2.5.0/CHANGELOG.md

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gkrellm/gkrellm.hash | 3 ++-
 package/gkrellm/gkrellm.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gkrellm/gkrellm.hash b/package/gkrellm/gkrellm.hash
index 27ba276efa..2f0fbcbeb4 100644
--- a/package/gkrellm/gkrellm.hash
+++ b/package/gkrellm/gkrellm.hash
@@ -1,4 +1,5 @@
+# From https://git.srcbox.net/gkrellm/gkrellm/releases/download/gkrellm-2.5.0/gkrellm-2.5.0.tar.bz2.sha256sum
+sha256  68c75a03a06b935afa93d3331ca1c2d862c1d50c3e9df19d9a8d48970d766b55  gkrellm-2.5.0.tar.bz2
 # Locally computed
-sha256  6f83665760b936ad4b55f9182b1ec7601faf38a0f25ea1e4bddc9965088f032d  gkrellm-2.4.0.tar.bz2
 sha256  691de85c3c6eeda5b6982c751548575344739ce4b4418d78905e599359f6c435  COPYING
 sha256  a4bb0b604fe7d40ca4469ffd5e2e2de70ff8ece43e47980ab2c8962d5e913330  COPYRIGHT
diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 257ebadfc4..6ee00858d3 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GKRELLM_VERSION = 2.4.0
+GKRELLM_VERSION = 2.5.0
 GKRELLM_SITE = http://gkrellm.srcbox.net/releases
 GKRELLM_SOURCE = gkrellm-$(GKRELLM_VERSION).tar.bz2
 GKRELLM_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
