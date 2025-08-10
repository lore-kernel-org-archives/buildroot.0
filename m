Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E2BC87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 15:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11A6040B38;
	Sun, 10 Aug 2025 15:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZdHOWvwylXJ; Sun, 10 Aug 2025 15:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 228E140A9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 228E140A9B;
	Sun, 10 Aug 2025 15:15:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 026B4154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E895C81185
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EkeEd6zTa_D for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 15:15:03 +0000 (UTC)
X-Greylist: delayed 588 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 10 Aug 2025 15:15:02 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E23C3811D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E23C3811D5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E23C3811D5
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:15:02 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 71C08E00304;
 Sun, 10 Aug 2025 17:05:11 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>,
	Florian Larysch <fl@n621.de>
Date: Sun, 10 Aug 2025 17:04:51 +0200
Message-ID: <20250810150509.13653-1-fl@n621.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1754838311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HY2/JoTCvZVYDT35k5ETI2nabCag4/IXayf289d+GCA=;
 b=eO1VPAgckup0hkolWS8epdN0fSWA0VMT8YgWfio/mwOZO9lGSOrG3JEjLFLE5eRdJhsFYv
 gSriPQCeaEBtUcAPqrReqTAmZWeL4TraqsKHrvRROBXi6sjGU0brJ/GCJVst8B0wxvnH+I
 Dc6fkcC1wm7qA0cYBK3fpAvmg/7Q77U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=eO1VPAgc
Subject: [Buildroot] [PATCH 1/1] package/nanocom: fix build with GCC 15
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

GCC 14 made implicit function definitions an error and GCC 15 switched
to C23 by default, which made "void foo()" equivalent to "void
foo(void)".

Both of these changes cause build errors because init_comm() doesn't
actually take any arguments and the forward declaration for
display_state() was using the wrong name. Fix both.

Fixes: https://autobuild.buildroot.org/results/ebf/ebf500c48aaa357aaac3a88d87ef8f5c07cd78b6

Signed-off-by: Florian Larysch <fl@n621.de>
---
 .../nanocom/0002-fix-build-with-gcc-15.patch  | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/nanocom/0002-fix-build-with-gcc-15.patch

diff --git a/package/nanocom/0002-fix-build-with-gcc-15.patch b/package/nanocom/0002-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..728c56a3d0
--- /dev/null
+++ b/package/nanocom/0002-fix-build-with-gcc-15.patch
@@ -0,0 +1,35 @@
+GCC 14 made implicit function definitions an error and GCC 15 switched
+to C23 by default, which made "void foo()" equivalent to "void
+foo(void)".
+
+Both of these changes cause build errors because init_comm() doesn't
+actually take any arguments and the forward declaration for
+display_state() was using the wrong name. Fix both.
+
+Upstream: Submitted to author via email
+Signed-off-by: Florian Larysch <fl@n621.de>
+
+diff -purN old/nanocom.c new/nanocom.c
+--- old/nanocom.c	2025-08-10 01:34:12.000284003 +0200
++++ new/nanocom.c	2025-08-10 01:31:05.639050630 +0200
+@@ -329,7 +329,7 @@ int main(int argc, char *argv[]) {
+     memcpy(&pots, &pts, sizeof(pots));
+     
+     /*setup serial port with new settings*/
+-    init_comm(&pts);
++    init_comm();
+         
+     fprintf(stderr,"Press CTRL+T for menu options");   
+     display_state();
+diff -purN old/nanocom.h new/nanocom.h
+--- old/nanocom.h	2025-08-10 01:34:12.000284003 +0200
++++ new/nanocom.h	2025-08-10 01:27:59.545821909 +0200
+@@ -56,7 +56,7 @@ void cleanup_termios(int signal);
+ void init_stdin(struct termios *sts);
+ void init_comm();
+ void usage( char *str);
+-void display_status();
++void display_state();
+ 
+ 
+ /*typedef to represent the current line state
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
