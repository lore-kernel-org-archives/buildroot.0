Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9DCC46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 08:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B675E4012E;
	Sun, 24 Dec 2023 08:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B675E4012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tTcTPmOO52gv; Sun, 24 Dec 2023 08:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DBB74032C;
	Sun, 24 Dec 2023 08:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DBB74032C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EED701BF359
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7BF8417D1
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7BF8417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iKySJzKrnUjo for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 08:15:40 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC7F1417C9
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 08:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC7F1417C9
Received: from fli4l.lan.fli4l (p54a1b896.dip0.t-ipconnect.de [84.161.184.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B235EA4C077D;
 Sun, 24 Dec 2023 09:15:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52754)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rHJdg-0001CD-1H;
 Sun, 24 Dec 2023 09:15:12 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 09:15:11 +0100
Message-Id: <20231224081512.19928-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231224081512.19928-1-bernd@kuhls.net>
References: <20231224081512.19928-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1703405712;
 bh=OiN3G6S2U47asGBFaOeFYy+lUgSxnoQf3eszG5m4560=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VvFzvQXZuuXEM9236J89WUiTDANaR1Igx9eWkN0Yx1yjffKUeQboqlOMxa/gtTYit
 JKNPtnkhCKGqXt3TKLlnGnKcydztEIJJh0GaicZfVxPh2rQrPSI/0VlC5Q1jEK0ymK
 ToHK6q/Hp8mO//vvi7SYV8D7wp6UVsbjVQviZfq5QOy34mbTT7uZb9S1XllxezfrQS
 j3pLFLZ7s0AEO0sctUbTSAlyNzB4VsPn9H7Lilws/eXAcf0GPrmsMDxRXnJMrWcjju
 +l5PB9NE8Kp/FsIAQMh7buo58nGg3BhWB9BKlrl0JS9dsJMCJX50gYbvY2KHlx6shY
 3k4mDddy5V99w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=VvFzvQXZ
Subject: [Buildroot] [PATCH 2/3] package/apache: fix build with libxml2-2.12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...emove-dependency-on-xmlstring-header.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/apache/0004-mod_xml2enc-remove-dependency-on-xmlstring-header.patch

diff --git a/package/apache/0004-mod_xml2enc-remove-dependency-on-xmlstring-header.patch b/package/apache/0004-mod_xml2enc-remove-dependency-on-xmlstring-header.patch
new file mode 100644
index 0000000000..8ff7076589
--- /dev/null
+++ b/package/apache/0004-mod_xml2enc-remove-dependency-on-xmlstring-header.patch
@@ -0,0 +1,47 @@
+From 27a68e54b7c6d2ae80dca396fd2727852897dab1 Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Tue, 21 Nov 2023 12:58:47 +0000
+Subject: [PATCH] mod_xml2enc: remove dependency on xmlstring header
+
+Submitted by: ttachi <tachihara@hotmail.com>
+
+Github: closes #393
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1914013 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream: https://github.com/apache/httpd/commit/27a68e54b7c6d2ae80dca396fd2727852897dab1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ changes-entries/xmlchar.txt   | 2 ++
+ modules/filters/mod_xml2enc.c | 6 +++---
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+ create mode 100644 changes-entries/xmlchar.txt
+
+diff --git a/changes-entries/xmlchar.txt b/changes-entries/xmlchar.txt
+new file mode 100644
+index 00000000000..d0e06300411
+--- /dev/null
++++ b/changes-entries/xmlchar.txt
+@@ -0,0 +1,2 @@
++ *) mod_xml2enc: Tolerate libxml2 2.12.0 and later.
++    [ttachi <tachihara AT hotmail.com>]
+diff --git a/modules/filters/mod_xml2enc.c b/modules/filters/mod_xml2enc.c
+index 34f8e8ee090..e8ee2647955 100644
+--- a/modules/filters/mod_xml2enc.c
++++ b/modules/filters/mod_xml2enc.c
+@@ -206,11 +206,11 @@ static void sniff_encoding(request_rec* r, xml2ctx* ctx)
+             }
+         }
+     }
+-  
++
+     /* to sniff, first we look for BOM */
+     if (ctx->xml2enc == XML_CHAR_ENCODING_NONE) {
+-        ctx->xml2enc = xmlDetectCharEncoding((const xmlChar*)ctx->buf,
+-                                             ctx->bytes); 
++        ctx->xml2enc = xmlDetectCharEncoding((const unsigned char*)ctx->buf,
++                                             ctx->bytes);
+         if (HAVE_ENCODING(ctx->xml2enc)) {
+             ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, r, APLOGNO(01432)
+                           "Got charset from XML rules.") ;
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
