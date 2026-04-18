Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A43F99C89
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 15:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7526940A3A;
	Sat, 18 Apr 2026 15:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVzfSbx1r32E; Sat, 18 Apr 2026 15:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98F0A40F2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776524934;
	bh=mtolm6l42m+Y93flwcoNSqMXDRwHnHQUlTgA7nA/39k=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hoAmtzKySOMZ3pKdIBY0dhRf+MsenrVXg8UtO1LHOYyJQWldjGzwxorvdyNDjc80X
	 Gs2EXQ6GjdWfdQ7b5OZUmlISkvvvyRhoQT5ntW00O/fR4EOrlBNIkGs0aQz6HRweVE
	 B8aNJS8MWtIAXvwsY/JDIyqcepdrbWaYLH2vosE18bubzR2wvNO3hlUkt3h4ZXkl9q
	 g8gPOZjI5nF3hgm7qLtUBF/1YsMzLPabfC+akRauJwgwKWmInubV4yqL9o2fDBXMLN
	 r97F31UuqaNZim6fJGXjkfmeZkawwnIeP6YXMrXWaXZxzv9IJJ7xTC2EfTz0aNPgs1
	 qWMKS+0WIjFKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98F0A40F2E;
	Sat, 18 Apr 2026 15:08:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8075C347
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E06760E90
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyXGvQkOlyQD for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 15:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2930160E85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2930160E85
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2930160E85
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:08:50 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DDE746012D;
 Sat, 18 Apr 2026 17:08:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 18 Apr 2026 17:08:41 +0200
Message-ID: <20260418150841.947385-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776524929;
 bh=exDJeNZCsUSzKsTK7HE2RVqr6OcEsF67lRopyo45RNA=;
 h=From:To:Cc:Subject:Date:From;
 b=YN4o/wj8KegloCQM/QYCiMceviJaN8hrP/9YvRp2MyYfqje/7UHwRT0vAASc8dA8N
 jo0p3AzpV1kcyghB1BUn57QyEV3NvFG7GvH7PE8o8dGUtWej2iO27x/7qJLHU8xdP8
 RAcdhe/aECosEV8DV9jb9YD5cnhDffi2ndGybYAZtvZ3foWH/KvCnVqMcOQFYdpgBb
 eAZPdZCw283IjE+QraK8Dmb1NXvi6mwz7TOD8S1YVB0WYrM3bwRvNDOjYug/iE6DHH
 SqCj/YLHfNK2bQGJjNAi46oZ1YZ01h1zQierWVCOZ2Z/wjfYsKVPHg6Wki+lxqKniH
 aRcqQ9kMhMjjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YN4o/wj8
Subject: [Buildroot] [PATCH 1/1] package/octave: bump to version 11.1.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce:
https://octave.org/news/release/2026/02/20/octave-1.1.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index 4c4c457b65..354c362dcb 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-10.3.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-11.1.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  68bc82885a3ae67a806debb14eb229506d2fe398c969dd42e2e38cc1c35f2aff  octave-10.3.0.tar.lz
+sha256  fb48e9bb9e3e7c6a4755cc90789ecfe54a00f5c59089cf6d50bb32d964bc1abf  octave-11.1.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 155dfc8427..737f26a771 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 10.3.0
+OCTAVE_VERSION = 11.1.0
 OCTAVE_SITE = $(BR2_GNU_MIRROR)/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
