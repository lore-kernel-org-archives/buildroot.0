Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D477BC5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 20:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93E4B60AB9;
	Fri, 21 Aug 2026 20:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lw-xx_NH_p2g; Fri, 21 Aug 2026 20:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787344237;
	bh=BBEFpKZ1mcdow6pD/rXtArEgoqU3wYPLXo5pqSY3lCU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oBrBUOT0Syo22Ga8uPcHQD4Hi+5VXchx+h1yjStYY8ccvBR9cJ/Dt7tmuIiX3ml0o
	 fCzV9gWV/wrFV7s053UWAdgBrsgvhyLoGjWDx9FHqtV6i0UWMiASORd7p78vX+EST1
	 UdRlFjWdkoChbdOm73mMl8ty4Sz1jcvQEKAsO2jZN9siYZuQAnzgs0kk69FKneENWR
	 4QTTXYcE3jgH7GTzF6xU2d6RYJWY/kPGzRa/fe9W/+1PDmRbXbBqusOmqhlynPTAj/
	 U6h2Hqt9omVphe/KQ5YgMuGfOWJ7u5lay63c39IGRfb22hv+tiQwueiTGAVKCsQ9wM
	 nzQM4gvGGg37g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C62E960ABD;
	Fri, 21 Aug 2026 20:30:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E02E263
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13EA381257
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LjgVHEXaV9S for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 20:30:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50CFF8124F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:30:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 964658E343; Fri, 21 Aug 2026 20:29:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 22:13:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7eb4a552c4037581144b1cbcce69daded51f24f1
X-Git-Newrev: e4cf512c394f218cc71eb6b496ce4cb004c917bb
X-Patchwork-Hint: ignore
Message-Id: <20260821202941.964658E343@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: backport upstream
 fix to build with Linux >= 6.19.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e4cf512c394f218cc71eb6b496ce4cb004c917bb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:

  https://autobuild.buildroot.org/results/9b270904b2f7cf9eaa661c98370c582a61ff2342/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../igh-ethercat/0002-Linux-6.19.0-support.patch   | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/igh-ethercat/0002-Linux-6.19.0-support.patch b/package/igh-ethercat/0002-Linux-6.19.0-support.patch
new file mode 100644
index 0000000000..6a6af5508c
--- /dev/null
+++ b/package/igh-ethercat/0002-Linux-6.19.0-support.patch
@@ -0,0 +1,36 @@
+From 2c947e90d93d9c5a0129b62744de9720b48d2a17 Mon Sep 17 00:00:00 2001
+From: Nicola Fontana <ntd@entidi.it>
+Date: Sun, 8 Mar 2026 15:39:41 +0100
+Subject: [PATCH] Linux 6.19.0 support
+
+Commit 89aec171d9d1ab168e43fcf9754b82e4c0aef9b9 (part of linux kernel
+6.19.0-rc1) introduced an arbitrarily sized sockaddr struct to be used
+instead of the classical one.
+
+Closes #200
+
+Upstream: https://gitlab.com/etherlab.org/ethercat/-/commit/c42c9cf8bc31c56cc20ae630605495e3f19f3f9a
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ devices/generic.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/devices/generic.c b/devices/generic.c
+index f6cef9b5..a08af54b 100644
+--- a/devices/generic.c
++++ b/devices/generic.c
+@@ -234,7 +234,11 @@ int ec_gen_device_create_socket(
+     sa.sll_family = AF_PACKET;
+     sa.sll_protocol = htons(ETH_P_ETHERCAT);
+     sa.sll_ifindex = desc->ifindex;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 19, 0)
++    ret = kernel_bind(dev->socket, (struct sockaddr_unsized *) &sa, sizeof(sa));
++#else
+     ret = kernel_bind(dev->socket, (struct sockaddr *) &sa, sizeof(sa));
++#endif
+     if (ret) {
+         printk(KERN_ERR PFX "Failed to bind() socket to interface"
+                 " (ret = %i).\n", ret);
+-- 
+2.55.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
