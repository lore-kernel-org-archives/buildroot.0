Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC346E64019
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 11:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C832E8125B;
	Sun,  5 Apr 2026 11:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30nSgAGiDW3n; Sun,  5 Apr 2026 11:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0337E8124F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775390039;
	bh=KRAWGmju/xc8p2qbqdTGbyqWdTCb8LD/h/Wg2xANc9s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f969tiZjf/VBUI7jnw/6OHCr7WtqpxSgT9AwaE8MhVej6akEB0MeJp3+OoIRcabvF
	 yC7gHqDDk018S4tmIPQpB3kAwWstLUa6MHxTCmzVY+Xu9VKxs4ax5Yj3xxMC08DkFl
	 b4TOBSEdSSPiLdY5J7iz8wc3aMVCXLUBJqltvFti2ByzKZNgBgjPqlLiiaCQpSYLqa
	 k7YzE2foglkZyk8hN+qDBqWmUvZkUIGQCjUwpxfDO35j5FqLTuDyaZzHJWbzoeLpB2
	 kOvaurNM6yqPVgNFmzUVbSgCIzHbBAtwyADjG4iaGoeJkgT4gQxg6OmQbH8CYsVPXg
	 3r8AEB+pNNaTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0337E8124F;
	Sun,  5 Apr 2026 11:53:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F65D1EB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9EE88124F
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvy4Nh8a-ql0 for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 11:53:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D06F88124C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D06F88124C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D06F88124C
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:53:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F034CA4C0413;
 Sun,  5 Apr 2026 13:53:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35810)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9M37-000000003vI-2g9o;
 Sun, 05 Apr 2026 11:53:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  5 Apr 2026 13:53:51 +0200
Message-ID: <20260405115353.2468900-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775390034;
 bh=2N+kfskbqSAMvoafypAvNLzLm/L0ZGYLmngt3mz0qko=;
 h=From:To:Cc:Subject:Date:From;
 b=Dkryp9oCG60cyI+YGruTcxsIaHRi7cukhvzCkC3/oDFSvP/8GhIwfhs4EdXu2zIX6
 X4krJwwcd0Wtd9n7wtwdal4ZJlXPobMp11UnzZnif5lnzbmL9wBxXPP/uQU2fLnYh1
 YOlaDIKgJuFXvvKeaLXOdM6fGAKee7Lzslv/S8igmCtEVR1r1o1J+oR91SREWjSbQl
 8EiFem04R5fDOtPF71Hb5NhSwmY4A083C9SyKA89A84r/NGX94/Ow+Vk+SP4rYrrzy
 wlClCrKwIKjJoaHzSZZJJcPKr3/TLsTr8fEFvVWSxwm5+o0WdAYfsgMEkvL3HMvFcO
 bifPA0+q7vpzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Dkryp9oC
Subject: [Buildroot] [PATCH 1/3] package/serd: bump version to 0.32.8
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

https://gitlab.com/drobilla/serd/-/blob/v0.32.8/NEWS

Updated license hash due to upstream commit:
https://gitlab.com/drobilla/serd/-/commit/e864af0d8d6002ad07adc4695894c01e0fe24c2c
https://gitlab.com/drobilla/serd/-/commit/43cefdcd3e7aac63d9009d927ed21a7536dc85a0
https://gitlab.com/drobilla/serd/-/commit/943edeac0cb8e85f42e5d475477546924edbb4a7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/serd/serd.hash | 6 +++---
 package/serd/serd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/serd/serd.hash b/package/serd/serd.hash
index c8a45a0831..6608c02dcc 100644
--- a/package/serd/serd.hash
+++ b/package/serd/serd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# http://download.drobilla.net/serd-0.30.14.tar.xz.sig
-sha256  a14137d47b11d6ad431e78da341ca9737998d9eaccf6a49263d4c8d79fd856e3  serd-0.30.14.tar.xz
-sha256  13b62d3705cabee6a21730eb24f773249271c2d95e9ecbab16069e729d4ae147  COPYING
+# https://download.drobilla.net/serd-0.32.8.tar.xz.sig
+sha256  f47259bc38ba553b0deb8b6dab6b5b73d3630469a7c9439ccdca80e06d7c1ece  serd-0.32.8.tar.xz
+sha256  f04f124b8814edb03cd64fa82d38cc1c1aa32195fabd33c196b02968e466ba32  COPYING
diff --git a/package/serd/serd.mk b/package/serd/serd.mk
index 7922e777c8..97060e5f18 100644
--- a/package/serd/serd.mk
+++ b/package/serd/serd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SERD_VERSION = 0.30.14
+SERD_VERSION = 0.32.8
 SERD_SITE = https://download.drobilla.net
 SERD_SOURCE = serd-$(SERD_VERSION).tar.xz
 SERD_LICENSE = ISC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
