Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C667CD4F3C
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 16:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2244E61164;
	Wed, 20 May 2026 16:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Clj1SY8gqMts; Wed, 20 May 2026 16:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE4461151
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779294954;
	bh=Lh/TfRtv7dP/tFXtLRgW03qI+6dZSvaFZUanlOWYXyw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZMwXWH91VOSrUM80xNAzhywBxDLzQVFTToufTPZt/+LifwbRrsF2qf/8U0vizqoy4
	 a1Jz7tlg84acouzNhYfiqU+HKJi1fd/XhLqTYXLBj/i0H7l/7BFHjoHEoD1Z2hxRTn
	 h8xeCfw8od6vs2M1OoNiXpC+EnsVIIDaeZTFP5aUjXpbB9unSb0WWW9pfpvrilAexR
	 a5wXlRkOcjmpbERL96a8PDvo74bZ2Gh/ve3DD9A1u5hZYsQR1w6wXFiOUOOzOlbtLf
	 8ZXNJfTzAPNvjH8gXC54PK1u3nhH6Oz9GAg3EVU7dvESuYMhTnOs9SndVjKHnZlKu3
	 EOHPCpRCCDjqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBE4461151;
	Wed, 20 May 2026 16:35:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C8E4282
 for <buildroot@buildroot.org>; Wed, 20 May 2026 16:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DF9583CF9
 for <buildroot@buildroot.org>; Wed, 20 May 2026 16:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NW5SCDDjv1JY for <buildroot@buildroot.org>;
 Wed, 20 May 2026 16:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A57683641
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A57683641
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A57683641
 for <buildroot@buildroot.org>; Wed, 20 May 2026 16:35:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ef6.dip0.t-ipconnect.de [91.58.14.246])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 58684A4C344A
 for <buildroot@buildroot.org>; Wed, 20 May 2026 18:35:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42692)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPjta-000000005Pi-3jbX
 for buildroot@buildroot.org; Wed, 20 May 2026 16:35:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 18:35:46 +0200
Message-ID: <20260520163546.1067214-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520163546.1067214-1-bernd@kuhls.net>
References: <20260520163546.1067214-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779294947;
 bh=RGk6kHRyqT2E+kSYmocdtbIEiPwX8ND1a9plS5IlrsA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=hDfQyXHZqYyoN2Om2dwrzMYgAK756arAKr7DFJgZ2TPuvnnW9wMcL6DuGtO5UL5u9
 +I5f0Dn/FNa6owlSgiqBsvyZT1pLuO6wJ5L1spZ5YmjxGr5EqiMVOCS0hS8HLRgVzr
 bSEhayTWr/0PZ8np8VUqSkCP79vJJcrSLHjZm+23lgwRKMkDHfQGSx5lqc2DWdehWP
 26jBOfS+4Z4IsHL/0F+5Wcmsnvm9RdS6XlOYLJGLYUF9Z6VBwC6zfPUjG8kekZ81Ir
 xqzqwEzLyTc7S6gy1grcAXPgEKO6PAE6d4jGbFgr62fi3uiZi4AQ4cnVQBxSRpNGqU
 ri8PdIL7hJDXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hDfQyXHZ
Subject: [Buildroot] [PATCH 2/2] package/libde265: security bump version to
 1.0.19
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

https://github.com/strukturag/libde265/releases/tag/v1.0.19

Fixes CVE-2026-45382 & CVE-2026-45383.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libde265/libde265.hash | 4 ++--
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index d977af5521..0412936d42 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libde265/releases/tag/v1.0.18
-sha256  800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8  libde265-1.0.18.tar.gz
+# From https://github.com/strukturag/libde265/releases/tag/v1.0.19
+sha256  bb19a0b485d2643e0eeb7e91f3ab32d1ad617e7c487dbedc91214ca3dbd8d7eb  libde265-1.0.19.tar.gz
 # Locally computed
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index aab86ab3d7..8c2fa4a3c3 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.18
+LIBDE265_VERSION = 1.0.19
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
