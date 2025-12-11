Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AA9D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A84F240F2B;
	Thu, 11 Dec 2025 19:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hli3h81BJYjS; Thu, 11 Dec 2025 19:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE9A4110A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481399;
	bh=RJ9yV1NuHU4/qNCxISNEFu5VJboSW8uE5e4j7QSXkqY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h6CD+4kflZk7yoCFT3RGxvLDaiVC5BT8mgchAcXiSs9W4GNfeijORFAh7cRnybxhX
	 OY9aYGIcgJZjb/j2NOjA4XGaIw0Ksd01OI1esNibBTbZgubEwhtwRqBO2QoDQ2CAda
	 1d76UBvmdapmkwaIYjOp8tkDDFxbb0vSIWd/uTF9HbKorJV4h5dyEZc/nG7WUo6oR6
	 mLED+mYLuqAiqINkT2JQzxQKbKYxp3BVhjAhGr+gM41UMUphylS5v699Zg6vLMsrSE
	 e0ChzL02dCOG/2uDdyuucuXAxSpdlH1hDUMaVoACi/tO4GAXFMNbFMkWQVKQSDS1QO
	 X+jtkQ4d4E5GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAE9A4110A;
	Thu, 11 Dec 2025 19:29:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1532D2EB
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F00124006E
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a67DUFXuhUnC for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3A2040012
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3A2040012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D37CD86BE2; Thu, 11 Dec 2025 19:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:06 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: dd1b0c2aafefaf9a0459257f654cf2cd6487ad3b
X-Git-Newrev: 105d8f9f2e91f3e49e7d0d0cbe6936ba2aedecc3
X-Patchwork-Hint: ignore
Message-Id: <20251211192953.D37CD86BE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/time: fix build
 with newer gcc
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=105d8f9f2e91f3e49e7d0d0cbe6936ba2aedecc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/2d4/2d440a31fc49366d77289f1d21080e1861c6ee21/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 08a638d49ffb956e759f1b3950dd2b11f6fea483)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...001-time-fix-sighandler-prototype-for-C23.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/time/0001-time-fix-sighandler-prototype-for-C23.patch b/package/time/0001-time-fix-sighandler-prototype-for-C23.patch
new file mode 100644
index 0000000000..8d4e1d7033
--- /dev/null
+++ b/package/time/0001-time-fix-sighandler-prototype-for-C23.patch
@@ -0,0 +1,35 @@
+From 218cd7ce34b6dbc86c80f1c781639ea7661d1252 Mon Sep 17 00:00:00 2001
+From: Marcin Serwin <marcin@serwin.dev>
+Date: Thu, 2 Oct 2025 19:30:12 +0200
+Subject: [PATCH] time: fix sighandler prototype for C23
+
+In C23 functions with empty argument list in the prototype are treated
+as taking no arguments. This means that the `int` argument of the
+sighandler must be specified explicitly or the code will fail to
+compile due to mismatched function type.
+
+Signed-off-by: Marcin Serwin <marcin@serwin.dev>
+
+Upstream: https://lists.gnu.org/archive/html/bug-time/2025-10/msg00000.html
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/time.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/time.c b/src/time.c
+index 7b401bc..88287dd 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -77,7 +77,7 @@ enum
+ 
+ 
+ /* A Pointer to a signal handler.  */
+-typedef RETSIGTYPE (*sighandler) ();
++typedef RETSIGTYPE (*sighandler) (int);
+ 
+ /* msec = milliseconds = 1/1,000 (1*10e-3) second.
+    usec = microseconds = 1/1,000,000 (1*10e-6) second.  */
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
