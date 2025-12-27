Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BF0E92722
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48C61406A1;
	Sat, 27 Dec 2025 23:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwGazPB7HRgQ; Sat, 27 Dec 2025 23:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63BB5406D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878803;
	bh=Gd3QJ6JO96O4A27jV6TaoJFvyhJeHKnzr/JlF1fTp3U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MX218m3k2Y4vWF8hAIDdTgoLGALUYDomp45WN+iBYDGYUYRk3QNpNNyVsGJhmdNph
	 KgFcrFgrquPlrmuZwqZF+nlmOUaDKKAU37M+LVhMwlWzK0hGKw8ZeaJazcXxrrdlXV
	 jz2yRT0XvWo/smWJb69jnikYcgYOuEJ8ycXaj5pC63lUkr4jSr91i3Gj6y91RgMjTO
	 WHrf/IzsNbPMRS1LYGmmN2HaRuMlYFq4LtQk4KdB9QqOWRlXXum2l3Gxx3XIOEhIgd
	 dtRR1X5erXU85N9Lw5IatwK7wa4cNouq8Z9tZjXxZmozo46ho1Kk3R54kK5nJUCx2F
	 Zaa+CIaSAQ0dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63BB5406D2;
	Sat, 27 Dec 2025 23:40:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D18430D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BD8E40678
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqLJnYlMX9iy for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B4CB40689
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B4CB40689
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3ABF387902; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 00:15:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 446fea34aa5d41976f4b60aaa2ae7b7ad21536ed
X-Git-Newrev: e235a191dd8bd6d5bdb9434352deae86953cfa49
X-Patchwork-Hint: ignore
Message-Id: <20251227233954.3ABF387902@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-panel: fix build with GCC
 14.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e235a191dd8bd6d5bdb9434352deae86953cfa49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No autobuild errors recorded due to download errors with dependencies.

Patch not sent anymore, original project has no updates since 2010:
https://git.yoctoproject.org/matchbox-panel

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/matchbox-panel/0004-fix-build.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/matchbox-panel/0004-fix-build.patch b/package/matchbox-panel/0004-fix-build.patch
new file mode 100644
index 0000000000..bed7e84b1f
--- /dev/null
+++ b/package/matchbox-panel/0004-fix-build.patch
@@ -0,0 +1,16 @@
+Description: fix FTBFS with stricter GCC flags
+
+Upstream: https://sources.debian.org/src/matchbox-panel/0.9.3%2Bgit20100816-2/debian/patches/fix-build
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: matchbox-panel-0.9.3+git20100816/src/msg.h
+===================================================================
+--- matchbox-panel-0.9.3+git20100816.orig/src/msg.h	2020-06-16 16:04:57.000000000 +0100
++++ matchbox-panel-0.9.3+git20100816/src/msg.h	2024-08-09 11:22:54.986036009 +0100
+@@ -17,5 +17,6 @@
+ void msg_handle_events(MBPanel *d, XEvent *e);
+ void msg_handle_timeouts(MBPanel *d);
+ void msg_cancel(MBPanel *d, XClientMessageEvent *e);
++Bool msg_set_timeout (MBPanel *d, struct timeval *tv, struct timeval **tvp);
+ 
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
