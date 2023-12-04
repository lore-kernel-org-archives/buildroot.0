Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0020C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F05D41769;
	Mon,  4 Dec 2023 21:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F05D41769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ju7Vz8FiPaKA; Mon,  4 Dec 2023 21:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BDCF419C3;
	Mon,  4 Dec 2023 21:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BDCF419C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDFFC1BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C483760B25
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C483760B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-_b6EbhjurY for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:16:25 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF5E860FBD
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF5E860FBD
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2777AA4C042A;
 Mon,  4 Dec 2023 22:16:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58136)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGIg-00077J-2v;
 Mon, 04 Dec 2023 22:16:22 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:16:20 +0100
Message-Id: <20231204211622.12687-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724583;
 bh=UxEQuAIbI8Lv62RGPGu84+eYz/T4WArvgZRYJdsvg7U=;
 h=From:To:Cc:Subject:Date:From;
 b=Bto9xM26TGY8skHnAc1j3oiBFwPQ8FQykzowv74gewz2rAeLELKplwO68/iV6vZl6
 MCkbzJuXfRoXKz3QO4FvLau3PEolfzqMQcTG+oCd/Csc+ojPLfynbtz4V+NkUGW0iB
 cfauqzJf5tXcU5NAP0FClUfptWjhZjLhywVypxL+Tc3KJ6Z4aNobNn07CTuxhMocsM
 BXfJm3AfZ5atYbq2JVShOn4rVdeNV2Xe8lzPvfd40Tr4/S4lFNi3NK3IzRwJFtN110
 N05etELUWplb957cUAERFn9zMIw6RVGyxY/RuCTlFOEvPepTE6UsxdzVrrA2YMKEIZ
 7q32JjiP2hHYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Bto9xM26
Subject: [Buildroot] [PATCH 1/3] package/squid: fix build with libxml2-2.12
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...0001-ESI-Fix-build-with-libxml2-2.12.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/squid/0001-ESI-Fix-build-with-libxml2-2.12.patch

diff --git a/package/squid/0001-ESI-Fix-build-with-libxml2-2.12.patch b/package/squid/0001-ESI-Fix-build-with-libxml2-2.12.patch
new file mode 100644
index 0000000000..c369651aba
--- /dev/null
+++ b/package/squid/0001-ESI-Fix-build-with-libxml2-2.12.patch
@@ -0,0 +1,36 @@
+From c50e5fd11744eb2cdfb90fb7e8180880160927c3 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 25 Nov 2023 13:44:49 +0100
+Subject: [PATCH] ESI: Fix build with libxml2-2.12
+
+libxml2 recently made it a const return.
+
+Fixes build error
+
+Libxml2Parser.cc:147:40: error: invalid conversion from 'const xmlError*'
+ {aka 'const _xmlError*'} to 'xmlErrorPtr' {aka '_xmlError*'}
+ [-fpermissive]
+
+Upstream: https://github.com/squid-cache/squid/pull/1600
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/esi/Libxml2Parser.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/esi/Libxml2Parser.cc b/src/esi/Libxml2Parser.cc
+index f03752885..73def2dbf 100644
+--- a/src/esi/Libxml2Parser.cc
++++ b/src/esi/Libxml2Parser.cc
+@@ -144,7 +144,7 @@ ESILibxml2Parser::lineNumber() const
+ char const *
+ ESILibxml2Parser::errorString() const
+ {
+-    xmlErrorPtr error = xmlGetLastError();
++    const xmlError *error = xmlGetLastError();
+ 
+     if (error == nullptr)
+         return nullptr;
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
