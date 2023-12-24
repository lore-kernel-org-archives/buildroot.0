Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE376C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 17:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC82681BBD;
	Sun, 24 Dec 2023 17:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC82681BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9q7rsYAFDK8; Sun, 24 Dec 2023 17:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF15B81831;
	Sun, 24 Dec 2023 17:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF15B81831
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB07D1BF398
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDC1440481
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDC1440481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjdCB01TwJeY for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 17:53:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8940340018
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 17:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8940340018
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75AE382827; Sun, 24 Dec 2023 17:53:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 18:52:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b155cdf60130d1ebd4658a537dc010f5280dc22
X-Git-Newrev: 6d6fe258a68e75f2f310c74dad57f430b748d762
X-Patchwork-Hint: ignore
Message-Id: <20231224175339.75AE382827@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: fix build with libxml2-2.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6d6fe258a68e75f2f310c74dad57f430b748d762
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...enc-remove-dependency-on-xmlstring-header.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
