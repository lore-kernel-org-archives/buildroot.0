Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BB5C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 13:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1100C4028F;
	Tue, 26 Dec 2023 13:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1100C4028F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-BwmA2xdb7Q; Tue, 26 Dec 2023 13:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41599402F4;
	Tue, 26 Dec 2023 13:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41599402F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 333061BF2C5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7B6A812E3
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7B6A812E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yk4jWNGv5eSu for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:42:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13102812B2
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13102812B2
Received: by mail.gandi.net (Postfix) with ESMTPA id 60F38E0004;
 Tue, 26 Dec 2023 13:42:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 14:42:48 +0100
Message-ID: <20231226134249.2780393-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703598174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dUxhWuzeLNcaX0M+3RPSL107xCLpE7M9Bal+lPxLZ70=;
 b=fKzID+fhABn0Km/n2fR4hN3yuc74TqmLB05iaq/9nr+z8iBE/SuUoYvLFd7v3D4uD4lpVN
 hbOBQ678I2G0fUAMEgOoT0Aw8oW0IkP+uwEMJ6dHOWWLORoUkICQIkCRO+xd4NjamobFEr
 euEqe4C6OzMuU4JDXXYOQLD/F/ag2j7TREsomE7girytkHQoG+Ko88hXiP+Mgu9i7/BTi7
 XmxMKQUFgf8csxZmRC1XJSMw1BnniJkfnrfI6Uc08qzdKi6Dnt/rc6VxNxYDAl6CNBx8QY
 DhS03oBieqOX6PC+Yy0z1kTVISPVs673jkay6IUYy6OWgL9wmvxEthhPfZcHQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fKzID+fh
Subject: [Buildroot] [PATCH] package/libsoup: fix build with libxml2 2.12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds a libsoup patch that fixes the build with libxml2
2.12, only due to a missing header inclusion. The patch cannot be
submitted upstream as libsoup2 is unmaintained, and libsoup3 no longer
has the problematic XMLRPC code.

Fixes:

  http://autobuild.buildroot.net/results/4c3152720d64b204101e1611442e535b14adc41c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rpc-soup-xmlrpc-old-add-missing-libx.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/libsoup/0002-libsoup-soup-xmlrpc-soup-xmlrpc-old-add-missing-libx.patch

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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
