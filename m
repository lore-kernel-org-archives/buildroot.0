Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482BFE92FC4
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E46FB81DE5;
	Mon, 29 Dec 2025 18:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYoGWhyOMw-p; Mon, 29 Dec 2025 18:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBB381B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767033769;
	bh=sR5F58zkUcMrl2n/T1RznDvvFizvOxD/kqkrMhext4g=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BndY71IkNHgyq6qd6g9DlnnoSArdd9diyNECmi9RlvJgQCrFOViGQ4Rx8vUuI+GDl
	 S4I3aIL/ajk7ZvdnONCfPfvg49+9byoV8ZieLr8P1Xa6GTtUAQLeSBPNiJsMhS+Fv7
	 9/ZwLqbsVpsIiZtpsS3dU718OkKV6BTiulNi59Ir/MNpjY6BAJ7LXjEP6EH3JdODAU
	 dmLJJl6NqACGw4Ssn2lU5jP3nNY+Vd6aS2NS0Cn/fciCvWeOa/aNEvfKavjIenoom0
	 Ijs90ownliT1fPma07XHwY9XoZ67ONRhar3srSSzi4/+4eV+RQHYnj/Mlx3r9TKTRQ
	 8ednn5dp3rCcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBB381B7B;
	Mon, 29 Dec 2025 18:42:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25B75B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22BED405D7
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VN5yui8FvG2 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:42:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E5AE405CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E5AE405CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E5AE405CA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:42:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 623F1A4C1FDC;
 Mon, 29 Dec 2025 19:42:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39650)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaICZ-000000001X2-3QYH;
 Mon, 29 Dec 2025 18:42:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Knight <james.knight@collins.com>
Date: Mon, 29 Dec 2025 19:42:44 +0100
Message-ID: <20251229184244.3593579-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767033764;
 bh=5HfChN/mZ39vPRedfnAnICLW4TDtSGxumT9sDdhVIn0=;
 h=From:To:Cc:Subject:Date:From;
 b=QKUdPyg4QQSd5loavNJ8wkiOxED6ShNIkvcuMLTM5qhA27rEVkmTgAb1Vbuq3/nPJ
 yrsTQAVLkfqDMpiHbZOQskh/HEIr0MCyb6DRWza9irOkALzzCHHvNrwd10DUky4L+2
 bLRBXjEvoIussxF/slTYGsLXuQ3tLoiGIX3zPPL5oRUen7zJOkHpgYUhbzdEC7vaTN
 sAp8XTzT/IRnAbQvd0vScQsdsxw4wZ0FPtSQM4bPSyzQQVeGRL9jVotFDHeEjqRqjU
 HTCOMu6ASQB4O5JXqHrQEzu5Xz/IT4mFvGrzl4zOqbtI+u+mLXotivT9rqSnMweTSw
 hVPW+dGqGQoHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QKUdPyg4
Subject: [Buildroot] [PATCH 1/1] package/libpqxx: bump version to 7.10.4
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

https://github.com/jtv/libpqxx/blob/7.10.4/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpqxx/libpqxx.hash | 2 +-
 package/libpqxx/libpqxx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 5fb93cbe63..067a2c8d2a 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cfbbb1d93a0a3d81319ec71d9a3db80447bb033c4f6cee088554a88862fd77d7  libpqxx-7.10.1.tar.gz
+sha256  e578677d0c1b0f7ad37ac2d9ac373bc9738a3732083c70672da5f2c3028e6b03  libpqxx-7.10.4.tar.gz
 sha256  2ccd31347a87796860a6600f57bf97ff4d54c203ecce4ea040425ba79774cf5f  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 4364dd09a9..f19420dc41 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 7.10.1
+LIBPQXX_VERSION = 7.10.4
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
