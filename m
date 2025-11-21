Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D611BCFC50B
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 22:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 419B58345D;
	Fri, 21 Nov 2025 22:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jm3tyEmVfSn; Fri, 21 Nov 2025 22:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 076D48340C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 076D48340C;
	Fri, 21 Nov 2025 22:18:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CF281CD
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 22:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EB8740666
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 22:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcKqZcSBpv1Z for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 22:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD29440276
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD29440276
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 22:18:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C744C85D80; Fri, 21 Nov 2025 22:18:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Nov 2025 23:17:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c06826342448c113c569a5bc4cbd8850f2388e9
X-Git-Newrev: 8ea6c20cecbb51054aeef110ac3c05daca9fcb08
X-Patchwork-Hint: ignore
Message-Id: <20251121221819.C744C85D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/enscript: Fix build with gcc 15.x
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ea6c20cecbb51054aeef110ac3c05daca9fcb08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/7fd/7fdda216e2ec57b9bcc1d2613b6546db35a29749/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/enscript/0002-enscript-c23.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/enscript/0002-enscript-c23.patch b/package/enscript/0002-enscript-c23.patch
new file mode 100644
index 0000000000..707674935d
--- /dev/null
+++ b/package/enscript/0002-enscript-c23.patch
@@ -0,0 +1,19 @@
+Fix build with gcc 15.x
+
+Upstream: https://savannah.gnu.org/bugs/?66845
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff --git a/compat/regex.c b/compat/regex.c
+index c6907f3..87f2840 100644
+--- a/compat/regex.c
++++ b/compat/regex.c
+@@ -336,7 +336,7 @@ typedef char boolean;
+ #define false 0
+ #define true 1
+ 
+-static int re_match_2_internal ();
++static int re_match_2_internal (struct re_pattern_buffer*, const char*, int, const char*, int, int, struct re_registers*, int);
+ 
+ /* These are the command codes that appear in compiled regular
+    expressions.  Some opcodes are followed by argument bytes.  A
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
