Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B577FA3727
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 23:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A1B40819;
	Fri,  2 Jan 2026 23:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ewS1nA-2svc; Fri,  2 Jan 2026 23:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A01E4081E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767395324;
	bh=WVfFsxOjV4wIPiolVK1KSglb364RE/AZSITgqLFnYOg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bMQYteThToOo/r5E6AKWZXJdxWErBtPC5nsRckucG0SLaBTA3tLHQ8gdo9ZJaaqvc
	 kyDc/8zkxgLXRBqLwoYPk8Pj4Lx5eCqqzFHt/vZoseq7m7wM5YMrZSQ/rTZDOiM0A2
	 OJ6NXxj8Wm7pC14goMVK0NaAB4nXGuHj49wyMn+Hfvfg8g7Dr7DnlmUO1HM/5eSXvU
	 txi1Q2PWpBgUg6BmaLy1MkO0dRLhWbf1hmn58qw8pmtK5iOiZ5YlIRWIDNOPAuU9Hc
	 /6bkwn0qArfzabVcyo4/HvtqfKkYmi4K2baC8+K9xP83igaCyINitXii/Cy0dM7nTS
	 S5roslcdAYP9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A01E4081E;
	Fri,  2 Jan 2026 23:08:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D4DA249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F349260765
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQ3rOCuq6SUX for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 23:08:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E02DD6069D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02DD6069D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E02DD6069D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:08:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 93159A4C1FBD;
 Sat,  3 Jan 2026 00:08:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57268)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vboG7-000000002Xx-0wKO;
 Fri, 02 Jan 2026 23:08:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Jan 2026 00:08:39 +0100
Message-ID: <20260102230839.4010498-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767395319;
 bh=JnVFtrHwsNPQB2cE9t9cGhsV5hMPWWkRBZJmHnyPgvU=;
 h=From:To:Cc:Subject:Date:From;
 b=LaEMuI4jItt89I+AljVwt7Mc1iCEWXQ+MtUCJmn/13cqJFnI61hl9EvI/leFX3WYF
 q1teO6KwgueJV3z+4EkOXnAk+AzNEoIPsmiO2rzicBsxvCiZXk01oE2DAd3b+7h9H7
 JincUnfzSBligHgmYVlWJOS8/SL5i0NwOB/8K3ox1+OIHOA3UsogZiggEuU1N8hEx8
 UPnM1H6MwGd7kCjIyJYbLtcGqXWK2U0HaErgN7FoQmfGg4yVuxbHey2nX6plKlyM8N
 g8cui2xmfOS4AuZ7ETetZzJjxIboYNqrSuFGS+ZhKQlXyNc08CnfQDHevZh1kfvwQw
 a1l0bfwZmsOaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LaEMuI4j
Subject: [Buildroot] [PATCH v2 1/1] package/cairo: Fix build
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

Buildroot commit 29888ab35e047099d239f266b7b565cd4023503e bumped cairo
to version 1.18.2.

This version includes commit
https://gitlab.freedesktop.org/cairo/cairo/-/commit/87f7c60bf7c20079c34cfc54e4db05920d14db56
"Add support for C11 atomics"

which causes build errors:

../src/cairo-image-source.c: In function '_pixman_transparent_image':
../src/cairo-image-source.c:89:40: error: passing argument 1 of '_cairo_atomic_ptr_cmpxchg_impl'
 from incompatible pointer type [-Wincompatible-pointer-types]
   89 |         if (_cairo_atomic_ptr_cmpxchg (&__pixman_transparent_image,

Fixes:
1.18.2: https://autobuild.buildroot.net/results/5d4/5d4cd38d71008f385f92577b07f21dcfc3c19b38/
1.18.4: https://autobuild.buildroot.net/results/0e9/0e962c66e1e96b5899e87c13ace824379adc09f9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: updated patch description, git-formatted patch and pointed source
    URL to versioned git tree

 ...ilence-some-Wincompatible-pointer-ty.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch

diff --git a/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch b/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch
new file mode 100644
index 0000000000..95f7924f12
--- /dev/null
+++ b/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch
@@ -0,0 +1,49 @@
+From 78258169cf0c380754804b5835203a199ba8efab Mon Sep 17 00:00:00 2001
+From: Stephan Bergmann <stephan.bergmann@collabora.com>
+Date: Mon, 22 Sep 2025 17:08:36 +0200
+Subject: [PATCH] external/cairo: Silence some -Wincompatible-pointer-types
+
+Downloaded from
+https://github.com/LibreOffice/core/blob/36e0812a01ae5b94a1bb7549b0db20812d0f821a/external/cairo/cairo/Wincompatible-pointer-types.patch.0
+
+Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/921
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/cairo-image-source.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/cairo-image-source.c b/src/cairo-image-source.c
+index eaf72e2cc..05ffa5660 100644
+--- a/src/cairo-image-source.c
++++ b/src/cairo-image-source.c
+@@ -86,7 +86,7 @@ _pixman_transparent_image (void)
+ 	if (unlikely (image == NULL))
+ 	    return NULL;
+ 
+-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_transparent_image,
++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_transparent_image,
+ 				       NULL, image))
+ 	{
+ 	    pixman_image_ref (image);
+@@ -118,7 +118,7 @@ _pixman_black_image (void)
+ 	if (unlikely (image == NULL))
+ 	    return NULL;
+ 
+-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_black_image,
++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_black_image,
+ 				       NULL, image))
+ 	{
+ 	    pixman_image_ref (image);
+@@ -150,7 +150,7 @@ _pixman_white_image (void)
+ 	if (unlikely (image == NULL))
+ 	    return NULL;
+ 
+-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_white_image,
++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_white_image,
+ 				       NULL, image))
+ 	{
+ 	    pixman_image_ref (image);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
