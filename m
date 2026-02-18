Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA95E9A04B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 19:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C090A80981;
	Wed, 18 Feb 2026 19:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mn7r-6n6oJrK; Wed, 18 Feb 2026 19:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64FE580875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771441766;
	bh=ZMZl9W/vLxaKgX+vDhn/NnAQ7ejORAkjhzdsaRlry1o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=foyLaABICoR7P0quhjx19wrWj4oItuuPFTRUqmXxYD9tdct8UWgJYFjJlI4F2nUze
	 JoSi70juoW4DHIy4aklI2dbe4XP8YLmIOhlQzjZUCMMgNgkQyHAtdLAeBJuRjyLoXm
	 MRXoD85b9QReZl9DNGKLT29m5KveNo0Bn8u6P0PA/emK1fgNZWkowJrkfFxvfOmrnR
	 /yWFHNV4dGh9KTW4N8kOrHao5CRImqvY5B0Vz+rhEZat/ZqhiwIyWTcbo3g+509Ne8
	 6VoakjjV8mrp6ldW11SV2HqKHG0UDs1/NDBUr3ioioSyFWDC5geI0B5FQllatE/6Hd
	 15YLs71Jg5Xzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64FE580875;
	Wed, 18 Feb 2026 19:09:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3760F183
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29235404CD
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BupXry2SyKZ for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 19:09:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6643E403C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6643E403C9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6643E403C9
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:09:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5ce.dip0.t-ipconnect.de [79.214.197.206])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5BD2A4C0E8D
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:09:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54112)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vsmvG-000000004Nh-1IlU
 for buildroot@buildroot.org; Wed, 18 Feb 2026 19:09:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 20:09:17 +0100
Message-ID: <20260218190918.2574524-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771441758;
 bh=BXycen7w63Kl1gh16HLQeXfjVsdhzpHY/VmnCNAQLOA=;
 h=From:To:Subject:Date:From;
 b=QJ7gAwvQGNK8I6AUT0zBotjdSUCMgeEYJvx/KUnIgaPtRhzHSQApAz6PQCcMpm9Gh
 pcG7YMZGEVuuUGR5KmHz7PWIShR7LwGtFzhakMq2IPoQR1wacVUHDZqoXaVJAXwskY
 dYnFKzuSYkCCDC3sPSABRjrWoNHE0bXDCujY6a7LCixNFNn1l95vrhI5o4tMWjnyGF
 fzm+a0C7yRLEZ3DEkWynl93aXlfHIvUccCWOpweAYr9TbwxbxmieHgPnSxZKVxdsq0
 3NGQsUWIFiHbkthwxW6Ivh+OS9VBm14D4xE2VU2duKi+Rp7JT9n7CUy88q9U9Cslno
 C3jak/T67np2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=QJ7gAwvQ
Subject: [Buildroot] [PATCH 1/1] package/libzlib: security bump version to
 1.3.2
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

https://github.com/madler/zlib/releases/tag/v1.3.2
https://github.com/madler/zlib/blob/v1.3.2/ChangeLog
https://7asecurity.com/blog/2026/02/zlib-7asecurity-audit/

Updated license hash due to copyright year bumps:
https://github.com/madler/zlib/commit/570720b0c24f9686c33f35a1b3165c1f568b96be
https://github.com/madler/zlib/commit/9e35567064baded660f61732b247ef5abc809014

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libzlib/libzlib.hash | 4 ++--
 package/libzlib/libzlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index cbd9313870..bc8b046426 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
+sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
 # License files, locally calculated
-sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
+sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index bc5092d9a9..c73328deee 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZLIB_VERSION = 1.3.1
+LIBZLIB_VERSION = 1.3.2
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = https://www.zlib.net
 LIBZLIB_LICENSE = Zlib
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
