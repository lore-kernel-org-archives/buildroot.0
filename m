Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F6ACD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 18:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71DDC80D1F;
	Mon, 11 May 2026 18:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IT78dDyFQZUg; Mon, 11 May 2026 18:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9805A80D23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778523467;
	bh=1qThaqUEmfhLNG9HaQrmZp2eO/DUFRmtQonUKNAu+gg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a3ja2Qwh3YXvZMRLQmMp82D+H1cwUsiwyXzxrmVR8raqZrxdFlfxHA9/4pT0nNHhX
	 nnDa1afQVwOx6OGhnyFM+9L2MZitI03W9fr66tuV94vMXwtIJyYXIcn8x2/K5ExKYx
	 4pFxtgnPwiqxt6Qhv0OmdhAntnl/m5RC94wm/ZF/Gu5c2LPkaRrNwFA/t0eDs9SHkq
	 9jNFOCpdGX/xnAzUGyMzeODfprFfejW/88UQPpCQk4IhWRY+t4QNci28lzSZd83zZ5
	 Z5ef2xbgy6XedAQOH/OA+F+i0hvO8byIu2vWje31IjfNOrN+iOGe3PIpjXma5qEhy1
	 +iayDBoxyBxXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9805A80D23;
	Mon, 11 May 2026 18:17:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5527173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB7524073D
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uD2lfT7dMpf for <buildroot@buildroot.org>;
 Mon, 11 May 2026 18:17:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A748E4073A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A748E4073A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A748E4073A
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:17:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c559.dip0.t-ipconnect.de [79.214.197.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 28682A4C379B;
 Mon, 11 May 2026 20:17:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58712)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMVBs-000000006BM-1xMD;
 Mon, 11 May 2026 18:17:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 May 2026 20:17:15 +0200
Message-ID: <20260511181716.2258868-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511181716.2258868-1-bernd@kuhls.net>
References: <20260511181716.2258868-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778523437;
 bh=uz1lEKIhowCVlPqkC9SuGJrOZLE89BnelrzpXgX7DO4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qSz+SbnugjxMsTgMBThKXD+mDrpXZGcUEs8BUzO70XUl7CzDnkQDXrQygOF5nadlW
 FhCtYn20CqNpkW3TPgbK68991mM2sHUHnwqyG2Ar+2y7dVT4BUQybvskIe4djPzEjZ
 PyCIsbxraycoSjOWORoxOc8tPk0ACY/GtG4Q7J/rZhoKt7XD0PDzqAFSMBfq5Xw5N/
 axH0p9FhkGkybE0W/QtS6DcuXFE0RCwjkB8fTPWLTl/b/+cWEaS5bth4ItPd09v1Yl
 +GqHc42JgfJhVQj6ZOpe3UHncTM9mUFFQEzMyMiV/BFfd+xuYtQiavfaAwLe1iVtJ0
 puQXuVjBYe5Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=qSz+Sbnu
Subject: [Buildroot] [PATCH 3/4] package/wireplumber: bump version to 0.5.14
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

https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.14/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wireplumber/wireplumber.hash | 2 +-
 package/wireplumber/wireplumber.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireplumber/wireplumber.hash b/package/wireplumber/wireplumber.hash
index a254b68cca..b180d9d2be 100644
--- a/package/wireplumber/wireplumber.hash
+++ b/package/wireplumber/wireplumber.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c89fa29694e89939c0e57cade5c9a7da8e5da21c19071862978ef5f3a346f1e7  wireplumber-0.5.10.tar.bz2
+sha256  2807a9d1e97075ba10f8b7b8156e31175817d620fa7fc84442b5474123eff5db  wireplumber-0.5.14.tar.bz2
 sha256  ff2eb9af5b05d92ac3a38cffcad27582ef555a31ff1781e1c1d4e087f77c9c81  LICENSE
diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index 8818662059..2fc9098108 100644
--- a/package/wireplumber/wireplumber.mk
+++ b/package/wireplumber/wireplumber.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREPLUMBER_VERSION = 0.5.10
+WIREPLUMBER_VERSION = 0.5.14
 WIREPLUMBER_SOURCE = wireplumber-$(WIREPLUMBER_VERSION).tar.bz2
 WIREPLUMBER_SITE = https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/$(WIREPLUMBER_VERSION)
 WIREPLUMBER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
