Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA208CD4840
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 18:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AFA84073A;
	Mon, 11 May 2026 18:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhUR7nVejxST; Mon, 11 May 2026 18:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A0E34073D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778523486;
	bh=lEKZ5uvkNL2E6lk/YNDWfCdDIeoy4/YjdzH2pPIWfg8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k14khBsI04VEl2E1FQTDQBQiVAMtnHfa9PdK/B4r8dna5n2MtdHBsf0qjNIxqguIZ
	 G+fxK8PnV+21kuODJcSJhAdKzS8qTNvrBqAGswif9uLOdTq8CQ9WY0a00zNe8joUP9
	 jbnVDdvyXQuyMq6K4wtmU/AGr/8sYZjw82LdVSzRd7um3W1sH6xGL5GsxNOAsHJknp
	 Weh2znDyH7OM433mP4r+B8mYWaCQBhZ8McxJkV+rbRfKpfGZjCkzb0wp/aNM0ht4tJ
	 KAc6bni2Luxs/B2F5u+pqiGBw+5jMMo0DoLjV71cv6X2yKQ6lBpVWwtLBeQ39xdKKl
	 UxYiG+ZxWpp8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A0E34073D;
	Mon, 11 May 2026 18:18:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52881173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38ED64073D
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3S3v5U2nUpXA for <buildroot@buildroot.org>;
 Mon, 11 May 2026 18:18:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 358274073A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 358274073A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 358274073A
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:18:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c559.dip0.t-ipconnect.de [79.214.197.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CB2FA4C335E;
 Mon, 11 May 2026 20:18:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58712)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMVBs-000000006BM-2Etp;
 Mon, 11 May 2026 18:17:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 May 2026 20:17:16 +0200
Message-ID: <20260511181716.2258868-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511181716.2258868-1-bernd@kuhls.net>
References: <20260511181716.2258868-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778523482;
 bh=S6wcBBsn8/7M9F+ou7yy/k6wa+lbMo2YPhEhAadiJus=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YyejBhwNwd9PYT+fksquhLrFvaSxEkoxk5GEeb6LLsth/p38IbKBa7hjQdvVvLMKo
 UkNN4Vhn2pTQELxERT76qt1mMU42eYLZDMB/7NAEAGD+YqhCQM3O0ZU0tDjI3haVGj
 PwGAQGmOnjCYXiInbQMH+Gz21W64zUEZZTmh8LG2PXJhROFgZgLdFlOBVs13oOlrEu
 PXVLOJCknejFhhIjs+ZEfzd5Aius/wzG84z7KxBrGTkvA26ADtbEguNuEgw+B8S+3r
 sD1VvX1gZesQZ300627zNuGh9pbDHSoX18vOBFS79RJBjHrxpmt6v5dR7JLOQGY8es
 qPmKggetdmrtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YyejBhwN
Subject: [Buildroot] [PATCH 4/4] package/pipewire-media-session: bump
 version to 0.4.3
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
https://gitlab.freedesktop.org/pipewire/media-session/-/tags/0.4.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pipewire-media-session/pipewire-media-session.hash | 2 +-
 package/pipewire-media-session/pipewire-media-session.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire-media-session/pipewire-media-session.hash b/package/pipewire-media-session/pipewire-media-session.hash
index e6b176eea2..3559d3c222 100644
--- a/package/pipewire-media-session/pipewire-media-session.hash
+++ b/package/pipewire-media-session/pipewire-media-session.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  26e21852e0834a4418b40eae342ac5178dfe40342b9c5afe204d43ef8aafa14e  media-session-0.4.2.tar.bz2
+sha256  ea0e371b08f9fa158fb070283b04ce1c4c0a3180d6e89de46c206296918ee1e4  media-session-0.4.3.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  77b9c867237ef919e33c0fdbcf22ab84b1cf24a63f9431ec68759026b658c994  LICENSE
diff --git a/package/pipewire-media-session/pipewire-media-session.mk b/package/pipewire-media-session/pipewire-media-session.mk
index cc7317f925..16e12d9eb3 100644
--- a/package/pipewire-media-session/pipewire-media-session.mk
+++ b/package/pipewire-media-session/pipewire-media-session.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.2
+PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.3
 PIPEWIRE_MEDIA_SESSION_SOURCE = media-session-$(PIPEWIRE_MEDIA_SESSION_VERSION).tar.bz2
 PIPEWIRE_MEDIA_SESSION_SITE = https://gitlab.freedesktop.org/pipewire/media-session/-/archive/$(PIPEWIRE_MEDIA_SESSION_VERSION)
 PIPEWIRE_MEDIA_SESSION_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
