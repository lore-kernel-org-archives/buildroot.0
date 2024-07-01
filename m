Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F40C3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AE8660A8C;
	Mon,  1 Jul 2024 18:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbgMwBavC3aX; Mon,  1 Jul 2024 18:09:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27EFC60A99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27EFC60A99;
	Mon,  1 Jul 2024 18:09:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69CFE1BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57B6E60A99
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHiCKqIhkP7l for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:09:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1EBFE60A8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EBFE60A8C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EBFE60A8C
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:09:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8733FB00572;
 Mon,  1 Jul 2024 20:09:34 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 20:09:30 +0200
Message-ID: <20240701180930.793992-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719857375;
 bh=KUN7D2ShTyZEznADtDY/sHeK5EtPP1GPMhZrobBPpVs=;
 h=From:To:Cc:Subject:Date:From;
 b=K9hA/QCco6pK+dvJuCd53edjsmktY558lhog9z+BJzhz4gXJsqCQzIjQP9NlsgReU
 EXwQyLQlWSn0eqqqOSpMYiOp/DtTu9g8YeSxcyh9co94SFEBpS/WzFPDleIMmW95QW
 xLhaz5Kx7E2PvrjeadgIMYwm6qvPHpnkAp6mZ/wPkQQcBWQvYaYa2RlIYfs9Km8AM7
 EXeR/9UB3piU6QnaVb21SiudTM9SVreHK6/YDnvZg9gWxGFgc7sjyxHBrrmXcIMEhx
 o4GjoAEfd02l2FiaztVdvg1AIarwwBOOCr3Qb3J6U7A4siWQgYo1YJ3QBxTUUBH15C
 40OQg58RanREg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=K9hA/QCc
Subject: [Buildroot] [PATCH 1/1] package/sylpheed: fix patch fuzz
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, sylpheed fails to build with output:

    Applying 0001-harden-link-checker-before-accepting-click.patch using patch:
    patching file src/textview.c
    Hunk #1 FAILED at 2885.
    Hunk #2 FAILED at 2922.
    2 out of 2 hunks FAILED -- saving rejects to file src/textview.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...n-link-checker-before-accepting-click.patch | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
index fe3375bc91b..46b45058372 100644
--- a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
+++ b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
@@ -1,4 +1,4 @@
-From ac286a71ed78429e16c612161251b9ea90ccd431 Mon Sep 17 00:00:00 2001
+From 876c54b2927e48ab6900e5e6b9395742f75e840e Mon Sep 17 00:00:00 2001
 From: Paul <paul@claws-mail.org>
 Date: Sun, 23 May 2021 12:16:40 +0100
 Subject: [PATCH] harden link checker before accepting click
@@ -6,25 +6,27 @@ Subject: [PATCH] harden link checker before accepting click
 [Retrieved from:
 https://git.claws-mail.org/?p=claws.git;a=commit;h=ac286a71ed78429e16c612161251b9ea90ccd431]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Julien: rebased patch on version 3.7.0]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  src/textview.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/textview.c b/src/textview.c
-index 62ad46eaf..3cdf5d911 100644
+index e55eea9..6fbb8a1 100644
 --- a/src/textview.c
 +++ b/src/textview.c
-@@ -2885,7 +2885,7 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
+@@ -2689,7 +2689,7 @@ static gboolean textview_uri_security_check(TextView *textview, RemoteURI *uri)
  	gboolean retval = TRUE;
  
  	if (is_uri_string(uri->uri) == FALSE)
 -		return TRUE;
 +		return FALSE;
  
- 	visible_str = textview_get_visible_uri(textview, uri);
- 	if (visible_str == NULL)
-@@ -2922,6 +2922,8 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
- 		if (aval == G_ALERTALTERNATE)
+ 	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(textview->text));
+ 	gtk_text_buffer_get_iter_at_offset(buffer, &start_iter, uri->start);
+@@ -2725,6 +2725,8 @@ static gboolean textview_uri_security_check(TextView *textview, RemoteURI *uri)
+ 		if (aval == G_ALERTDEFAULT)
  			retval = TRUE;
  	}
 +	if (strlen(uri->uri) > get_uri_len(uri->uri))
@@ -33,5 +35,5 @@ index 62ad46eaf..3cdf5d911 100644
  	g_free(visible_str);
  
 -- 
-2.25.1
+2.45.2
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
