Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDE1C19F2A
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 16:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A4360BBF;
	Mon,  1 Aug 2022 16:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98A4360BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuow1pfpM0iq; Mon,  1 Aug 2022 16:50:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4D1E60BA6;
	Mon,  1 Aug 2022 16:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4D1E60BA6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF421BF315
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14ADE409EB
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14ADE409EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKNssIg732ve for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 16:50:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E037409EA
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 16:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E037409EA
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 18A7E86B0A; Mon,  1 Aug 2022 16:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 18:49:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 559648a25774ae2be8668a871b1a8a8ef673b2d2
X-Git-Newrev: 9a6ed21a4b8f0be79fde4cb3dd53d1c4b55c44c8
X-Patchwork-Hint: ignore
Message-Id: <20220801163619.18A7E86B0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iptables: add nf_log.h
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9a6ed21a4b8f0be79fde4cb3dd53d1c4b55c44c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iptables generally bundles the netfilter header files inside its own
tar-ball.

Since iptables 1.8.8, it started to make use of netfilter/nf_log.h, but
didn't include it in the iptables tar-ball. This can lead to build
failures.

Add a patch that rectifies this for iptables 1.8.8.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iptables/0003-netfilter-add-nf_log.h.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/iptables/0003-netfilter-add-nf_log.h.patch b/package/iptables/0003-netfilter-add-nf_log.h.patch
new file mode 100644
index 0000000000..50112faf86
--- /dev/null
+++ b/package/iptables/0003-netfilter-add-nf_log.h.patch
@@ -0,0 +1,38 @@
+From 15ea3fa147dea25d8cae3c2ac417142f2e0f029e Mon Sep 17 00:00:00 2001
+From: Markus Mayer <mmayer@broadcom.com>
+To: Netfilter Mailing List <netfilter-devel@vger.kernel.org>
+Date: Thu, 16 Jun 2022 15:29:58 -0700
+Subject: [PATCH] netfilter: add nf_log.h
+
+Since libxt_NFLOG is now using the UAPI version of nf_log.h, it should
+be bundled alongside the other netfilter kernel headers.
+
+This copy of nf_log.h was taken from Linux 5.18.
+
+Signed-off-by: Markus Mayer <mmayer@broadcom.com>
+Upstream: https://git.netfilter.org/iptables/commit/?id=9ea7e6aa638d0dfa14613f6f97e6dc06c857e609
+---
+diff --git a/include/linux/netfilter/nf_log.h b/include/linux/netfilter/nf_log.h
+new file mode 100644
+index 000000000000..2ae00932d3d2
+--- /dev/null
++++ b/include/linux/netfilter/nf_log.h
+@@ -0,0 +1,15 @@
++/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
++#ifndef _NETFILTER_NF_LOG_H
++#define _NETFILTER_NF_LOG_H
++
++#define NF_LOG_TCPSEQ		0x01	/* Log TCP sequence numbers */
++#define NF_LOG_TCPOPT		0x02	/* Log TCP options */
++#define NF_LOG_IPOPT		0x04	/* Log IP options */
++#define NF_LOG_UID		0x08	/* Log UID owning local socket */
++#define NF_LOG_NFLOG		0x10	/* Unsupported, don't reuse */
++#define NF_LOG_MACDECODE	0x20	/* Decode MAC header */
++#define NF_LOG_MASK		0x2f
++
++#define NF_LOG_PREFIXLEN	128
++
++#endif /* _NETFILTER_NF_LOG_H */
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
