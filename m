Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C404BD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 12:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 756D74081D;
	Sun,  7 Dec 2025 12:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlV-ZDLSyBDr; Sun,  7 Dec 2025 12:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D1F7407B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765111756;
	bh=yqMHFS3eE0HIhKEnq9AWqOrgO5Jk8GDXe0zkgFFezA8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xgg8LS3Md75kqHi6HI68h9TkqNEzZYwcaeBZE4WJOV+fOFWprWYTcCvAMVXm7TPwk
	 I1ZhdvfKSV661MjKr9PlVQsFYnsgRP5K59lVVZ+H+4Yc0DliqJKZpoT96U/+2gbyPy
	 FRkPKgSCPC9xLPWGq6mN4wrgJ09FUUBGAKJJxxIwyvpu3f4snFIa4QvnYFlmIboaNZ
	 D5Nx4BoKT53RWjH0R8LrjCvkKdblFUQSTTYx6Ukzj5HXGLuuBkcniNgmQHaU0gdjBF
	 aCWvPfaJq7JxbcLrJbdl13THyWPycaqJcUU3U7JRLvsRzfAp8Vd2dGDi0k8dICpYee
	 S40sgxz+lqaWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D1F7407B8;
	Sun,  7 Dec 2025 12:49:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FDFA151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7174360739
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEFbm5Wupfxq for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 12:49:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8EFAD60723
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EFAD60723
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EFAD60723
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 49868A4C02CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 13:49:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39682)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSECM-0000000010V-2d5G
 for buildroot@buildroot.org; Sun, 07 Dec 2025 12:49:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 13:49:10 +0100
Message-ID: <20251207124910.3563028-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765111751;
 bh=7PlXfFq3bfPnYc9Ym/3iC9TVuvG1dUSe80GTAe35Cao=;
 h=From:To:Subject:Date:From;
 b=u523T1Sm2sfzrOB2ekXVflIg5KIy4ALQBSFA2T9oU/RHSqs15CzkmkTh1oyW2zWbm
 sJyliaKDSNB6+0jBN0smLzXwpwXrsxzoy0URxOVJ1CI0R3y5mYsmECz4k85a6jk2Xd
 2qnwV9g+D6z2KAETmyFuKKbWBvCbiM+2LlXcQkDhFZ7wc+FgmvShRpSDwBqiWKFtln
 fLpKC1jj8/Zm/vbZEA91U2qFH3Yqj51O6PrGO/VWBkG145eMQJtcZjSIZAKE/JTiu7
 cEroth+LqYhekFRdYf9+uDlbQ5sJylUAsyw1OfrxyPFhkMC1VaECLt35x2GudUnPAw
 AAGlQzy9T4U3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=u523T1Sm
Subject: [Buildroot] [PATCH 1/1] package/xl2tp: fix build with gcc-15.x
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

Fixes:
https://autobuild.buildroot.net/results/bac/bac6a0cb3f38b0de5b0376e7eba5e0ede5fce589/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xl2tp/0001-Fix-compiling-with-C23.patch   | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/xl2tp/0001-Fix-compiling-with-C23.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
