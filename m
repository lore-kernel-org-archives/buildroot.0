Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F9AC47072
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 21:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C6F8837D2;
	Wed, 27 Dec 2023 21:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C6F8837D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNWUJH1xuF6t; Wed, 27 Dec 2023 21:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD2A83A50;
	Wed, 27 Dec 2023 21:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD2A83A50
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 255121BF2A3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3357610BC
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3357610BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mIk4hvo5r_gu for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 21:42:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32D8861090
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 21:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D8861090
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21DCD8373D; Wed, 27 Dec 2023 21:42:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 22:41:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 030497be18cfb4dfae6494ada0c202f6c7c0f5c0
X-Git-Newrev: b45c2a048d02a0e30da8534b5c048d048b252452
X-Patchwork-Hint: ignore
Message-Id: <20231227214203.21DCD8373D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoup: fix build with libxml2
 2.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b45c2a048d02a0e30da8534b5c048d048b252452
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a libsoup patch that fixes the build with libxml2
2.12, only due to a missing header inclusion. The patch cannot be
submitted upstream as libsoup2 is unmaintained, and libsoup3 no longer
has the problematic XMLRPC code.

Fixes:

  http://autobuild.buildroot.net/results/4c3152720d64b204101e1611442e535b14adc41c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...p-xmlrpc-soup-xmlrpc-old-add-missing-libx.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/libsoup/0002-libsoup-soup-xmlrpc-soup-xmlrpc-old-add-missing-libx.patch b/package/libsoup/0002-libsoup-soup-xmlrpc-soup-xmlrpc-old-add-missing-libx.patch
new file mode 100644
index 0000000000..cceff2d2ba
--- /dev/null
+++ b/package/libsoup/0002-libsoup-soup-xmlrpc-soup-xmlrpc-old-add-missing-libx.patch
@@ -0,0 +1,47 @@
+From 8a21b58b45edbf11d9041f884bb9c42e6440104c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 26 Dec 2023 14:38:58 +0100
+Subject: [PATCH] libsoup/{soup-xmlrpc,soup-xmlrpc-old}: add missing
+ <libxml/parser.h> include
+
+Since libxml2 2.12.1, including <libxml/parser.h> is needed to get the
+prototype of xmlParseMemory(), causing a build breakage of libsoup
+with a recent version of libxml2.
+
+Upstream: Not Applicable
+[libsoup2 is not maintained upstream, and libsoup3 no longer contains
+the XMLRPC code. We are keepin libsoup2 in Buildroot for compatibility
+with packages that haven't moved to libsoup3 yet.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libsoup/soup-xmlrpc-old.c | 1 +
+ libsoup/soup-xmlrpc.c     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libsoup/soup-xmlrpc-old.c b/libsoup/soup-xmlrpc-old.c
+index c57086b6..dd51de53 100644
+--- a/libsoup/soup-xmlrpc-old.c
++++ b/libsoup/soup-xmlrpc-old.c
+@@ -12,6 +12,7 @@
+ #include <string.h>
+ 
+ #include <libxml/tree.h>
++#include <libxml/parser.h>
+ 
+ #include "soup-xmlrpc-old.h"
+ #include "soup.h"
+diff --git a/libsoup/soup-xmlrpc.c b/libsoup/soup-xmlrpc.c
+index 42dcda9c..b0132d26 100644
+--- a/libsoup/soup-xmlrpc.c
++++ b/libsoup/soup-xmlrpc.c
+@@ -18,6 +18,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <libxml/tree.h>
++#include <libxml/parser.h>
+ #include "soup-xmlrpc.h"
+ #include "soup.h"
+ 
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
