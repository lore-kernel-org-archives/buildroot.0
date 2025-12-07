Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7901DD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49B1282205;
	Sun,  7 Dec 2025 17:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3Ux-8t7ElY0; Sun,  7 Dec 2025 17:13:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6915D82218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127622;
	bh=DGgjrGEYXZv0UiKHS7D3630Xatb659oBlLTjetNLJb8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pDT9RSzQz6AAUDjuf+qSXzCW5bQQ4f9ye/A6qx7LLzVRgvQTpChwRaUyJuFoyUhjP
	 QUGUUd8BWqOdPvTq/CetOZenOF7u9PkhWDmpxjSd8cPU2mBOqs4GFPErxOO2jofZ6i
	 I/ZzvSiOiYcaUaobWS8h9VCuOVr6BYiTq5zfVmRP813EMv0kgkvkXt0a5D2BiHGidx
	 wH5b674ESPTadH9stHDhLZSPejLV/N617cLi6yeB1tSbS0yT78OdoAX6WFWDqKTEnc
	 C7MqDq02TPIIXmc98VWnP3nz5GHrxQvPYOfvWELjRgfrj/xJwgwsvqY5iwrZzgLSPf
	 LuCEQJSJCXVlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6915D82218;
	Sun,  7 Dec 2025 17:13:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34D0EE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80A644019A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiNVrZ7pA9MT for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C738040437
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C738040437
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2BF7867F9; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 18:10:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c2947eaa5e34c4407a3fa142fbaa051d0e141ec
X-Git-Newrev: 699a4a629fea7ae76dcb06441f11d24feda02763
X-Patchwork-Hint: ignore
Message-Id: <20251207171336.C2BF7867F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xl2tp: fix build with gcc-15.x
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=699a4a629fea7ae76dcb06441f11d24feda02763
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/bac/bac6a0cb3f38b0de5b0376e7eba5e0ede5fce589/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
