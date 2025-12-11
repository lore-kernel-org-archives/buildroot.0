Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794AAD43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52047811B4;
	Thu, 11 Dec 2025 19:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpaSZZhTbg_r; Thu, 11 Dec 2025 19:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87609811C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481416;
	bh=pivNM7miHB3z56hr8Siek8tbbPHLrM1jBbFYKU2Bozg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JDKjR7OV6LxvpnScux1BbBNx9fykg0ZEqTVfhHxtOT10Nutzryd3UqPDu4cfthVKK
	 uBPuDf7Zcw3awcnUQfRbiG+3hAI8c4MzCmZr424HLkeiq+selO1sW4nFhI1SyHVYt9
	 lQz8obfsfvNQqJlYC1bbu9lnm+Kw0Ogf9EcjtKhrAri9pDHmavARhCAxT6BaKXLDoN
	 2SwavfetOhaLlPuZZMi2j+hJIDVtl3eDK2yBxiSS2zERauSf4ZS4vMgudI9bhhp45C
	 23xKQVG1W2W9ckRxMutJn+NO9iXO1I3zzOjUo0EzpvleeMXwVHhrTKRPOw1C6oAZoB
	 e3vGz17JT0vdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87609811C7;
	Thu, 11 Dec 2025 19:30:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16B8B2E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C02180DA6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJejLw4iMnpr for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64BB080DC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64BB080DC8
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6402086BE7; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:42 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: e5722ae60666ddfd683ef13f956981f297786244
X-Git-Newrev: 8162a09cfede8d76cb2587d6ba0301c1e3c9abce
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.6402086BE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/xl2tp: fix build
 with gcc-15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=8162a09cfede8d76cb2587d6ba0301c1e3c9abce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/bac/bac6a0cb3f38b0de5b0376e7eba5e0ede5fce589/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 699a4a629fea7ae76dcb06441f11d24feda02763)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xl2tp/0001-Fix-compiling-with-C23.patch | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/xl2tp/0001-Fix-compiling-with-C23.patch b/package/xl2tp/0001-Fix-compiling-with-C23.patch
new file mode 100644
index 0000000000..6f32e7df35
--- /dev/null
+++ b/package/xl2tp/0001-Fix-compiling-with-C23.patch
@@ -0,0 +1,38 @@
+From cabd67927d8ed565c36cdd0cbf9b9dbd71606009 Mon Sep 17 00:00:00 2001
+From: Jaco Kroon <jaco@uls.co.za>
+Date: Thu, 21 Nov 2024 00:12:29 +0200
+Subject: [PATCH] Fix compiling with C23.
+
+https://bugs.gentoo.org/944070
+Signed-off-by: Jaco Kroon <jaco@uls.co.za>
+
+Upstream: https://github.com/xelerance/xl2tpd/commit/cabd67927d8ed565c36cdd0cbf9b9dbd71606009
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xl2tpd.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/xl2tpd.c b/xl2tpd.c
+index 791d5a4..4bf15fd 100644
+--- a/xl2tpd.c
++++ b/xl2tpd.c
+@@ -74,7 +74,7 @@ static int control_handle_lac_hangup(FILE* resf, char* bufp);
+ static int control_handle_lac_disconnect(FILE* resf, char* bufp);
+ static int control_handle_lac_add_modify(FILE* resf, char* bufp);
+ static int control_handle_lac_remove(FILE* resf, char* bufp);
+-static int control_handle_lac_status();
++static int control_handle_lac_status(FILE* resf, char* bufp);
+ static int control_handle_lns_remove(FILE* resf, char* bufp);
+ 
+ static struct control_requests_handler control_handlers[] = {
+@@ -1549,7 +1549,8 @@ static int control_handle_lac_remove(FILE* resf, char* bufp){
+     return 1;
+ }
+ 
+-static int control_handle_lac_status(){
++static int control_handle_lac_status(FILE*, char*)
++{
+     show_status ();
+     return 1;
+ }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
