Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37D2CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7126960ABD;
	Fri, 29 May 2026 18:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHmZXeBhVoUH; Fri, 29 May 2026 18:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 985C56134E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780080581;
	bh=NYeVzqUz3hlJGmP+ecfPqC5veEZDzZ1MnkGXcNzCbgY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=szuSKZkFjtFvhWpfnLsfWp7a/dGyGemM/0SUcWko9lF9e++vymCNxiLjTaF230Sh8
	 FnIwoVHb8r5gesHfbOkimduV+dB7cNcQfHnrlcUUYt1k80vVd8VmBVhD+j5ti4WzBr
	 D+r9KUgs/ZET0TKqNKkErysJ71SWPOqx2c4iSIYyIOpBRJOdPotFfH0LbxRPjeqtX9
	 YrqmhvZhzSpAIbgxPyks/uXTGQX2gCsgwPGfdOtjpFaMLsT9lUS7sg55IsnG9h8LAC
	 3U+tztwLa5wqB2jcSATFynU+i1UPG/af5SBLRtFJxyTnXxA9kzhOfsKy3WjmCNRWD6
	 b4oEheoKJ38cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 985C56134E;
	Fri, 29 May 2026 18:49:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9086288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A139404A2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id neeAKq5m6X43 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:49:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94DD140449
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94DD140449
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94DD140449
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:49:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1450696126; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 18:49:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wT2H1-000000041IJ-2XtB;
 Fri, 29 May 2026 20:49:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:49:33 +0200
Message-ID: <20260529184934.958274-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=IeZSrLA+thHC708vmMq401XNsJNiqC1DxXS13J29QR3oQs1XfyQWAQ47x6AFvA+hGPlZX0UJn+yYNE7PREHti8Zc3cQBUFcZzJ4lT8x3rsbKP91BNgUQx3FCcA6j+9Y1cTooaRZA6VQbrtDdaEMrUuFLUd6hI3xjtG8NYqLa706Dr00mpq/ecjVqYZv/IW7L6otMZianGo7D5IKfwmT/RS7oj88F9mAHLXeoTF3GYz1I3hMPQBcVJl44hAW3YjoAxcXp2LmqOTVLbS/gcOStSk0KZx1hLs+BLBxMKNswkaCQ7Z9MNFCu9mAJU43EE4UunRipK//dXKVFcpatut3Hug==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=sfYW68Ifqby49yLgBf2M370TaZucmv7gEP77rDOd0Ys=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=IeZSrLA+
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/{aardvark-dns,
 netavark}: security bump to versions 1.17.1
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

Fixes the following security issue:

CVE-2026-35406: netavark has incorrect error handling for malformed tcp
packets

https://github.com/advisories/GHSA-hfpq-x728-986j

aardvark-dns and netavark needs to be bumped in sync, so update both.

https://github.com/containers/aardvark-dns/releases/tag/v1.17.1
https://github.com/containers/netavark/releases/tag/v1.17.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aardvark-dns/aardvark-dns.hash | 2 +-
 package/aardvark-dns/aardvark-dns.mk   | 2 +-
 package/netavark/netavark.hash         | 2 +-
 package/netavark/netavark.mk           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index b3b742089a..d0a42c2ca5 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bf046c3bc7bc9f1f04220a89393b9189bcab1c61c204f247b3a5415d0ac27117  aardvark-dns-v1.17.0-git4-cargo5.tar.gz
+sha256  9742d4a31d2136028221f386cf21f377cbad129626a70813f2bedad1162174ad  aardvark-dns-v1.17.1-git4-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
index c0dc7eb2a7..3f2a32ac88 100644
--- a/package/aardvark-dns/aardvark-dns.mk
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update netavark in lockstep
-AARDVARK_DNS_VERSION = v1.17.0
+AARDVARK_DNS_VERSION = v1.17.1
 AARDVARK_DNS_SITE = https://github.com/containers/aardvark-dns
 AARDVARK_DNS_SITE_METHOD = git
 
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index f7ab17de3e..b53311c574 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9ff98fe9bcb6478ef558ae277b32aad67dbd7e7b72cac66df24084cb4f9038d9  netavark-v1.17.0-git4-cargo5.tar.gz
+sha256  3bfc0d3bb40965ecd4908f9a03a4fcf59228bacfaf6a7b73736b5019181e8499  netavark-v1.17.1-git4-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
index d47cee0fe1..e7126e3d4b 100644
--- a/package/netavark/netavark.mk
+++ b/package/netavark/netavark.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update aardvark-dns in lockstep
-NETAVARK_VERSION = v1.17.0
+NETAVARK_VERSION = v1.17.1
 NETAVARK_SITE = https://github.com/containers/netavark
 NETAVARK_SITE_METHOD = git
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
