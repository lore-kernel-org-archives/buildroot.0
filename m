Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79794C61DD9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F0A8112E;
	Fri, 28 Aug 2026 14:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bUfN66HcJLeU; Fri, 28 Aug 2026 14:25:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927155;
	bh=P2FDEdw0gjNlgXDO0PhZs8WuurlK0VaJJlNGvjhF2f8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DZ7EMeuVff2Ov1G1Q5mybn3icLunKMMr3QRwaVKOskW81ViPupNwVf6S10XH2YwmT
	 3p+2YIesI00TBiis8Sb0q/7dtq5ZZVQRTAUtWfvnb16UU2vcLbS6eRgIlpmDs/4Ktd
	 hN2JlCME9bunWz0N2rA92RFBy+sL08TpxrnRGaOV1I4r+L4cDrtTcUMyFsiyy8k6Bq
	 x6slz+eznrf3P6VRkuvX05yOMs+iQpU4MXNEoHZaVGinfF61tjN+fXMLx1Ar29DyVX
	 NkEqaxYFE9aSqGg9P250zLnfd3uQgszv+QH4km7fVWfuwzlvSWxtdBP07RVxjr//GD
	 7Ez/Kpok+kDnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C33681112;
	Fri, 28 Aug 2026 14:25:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA600127
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D045E6082A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v069aP6_N5kM for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 324C960823
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30BAA921F9; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 424d201ab6b3b1ec72954564506ec3f1cfff6875
X-Git-Newrev: 848e36f65b631e80fc2713a3c796d59e125880d4
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.30BAA921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/igh-ethercat:
 backport upstream fix to build with Linux >= 6.19.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/848e36f65b631e80fc2713a3c796d59e125880d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Fixes:

  https://autobuild.buildroot.org/results/9b270904b2f7cf9eaa661c98370c582a61ff2342/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e4cf512c394f218cc71eb6b496ce4cb004c917bb)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
