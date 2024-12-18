Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C58E77188
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 23:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 855DB617BA;
	Wed, 18 Dec 2024 23:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Drad06SAX1Bh; Wed, 18 Dec 2024 23:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 750A4617A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 750A4617A8;
	Wed, 18 Dec 2024 23:03:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AA01E3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 23:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEF6A617B5
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 23:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLqpMAbwYeyA for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 23:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B45617A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2B45617A8
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 23:03:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBD5A87403; Wed, 18 Dec 2024 23:03:38 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 23:49:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19ec245339e79ebcb2d23295fc9febfc9f55b7bc
X-Git-Newrev: 3645e3b781be5cedbb0e667caa70455444ce4552
X-Patchwork-Hint: ignore
Message-Id: <20241218230338.CBD5A87403@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dpdk: security bump to version
 24.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3645e3b781be5cedbb0e667caa70455444ce4552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

CVE-2024-11614: An out-of-bounds read vulnerability was found in DPDK's
Vhost library checksum offload feature.  This issue enables an untrusted or
compromised guest to crash the hypervisor's vSwitch by forging Virtio
descriptors to cause out-of-bounds reads.  This flaw allows an attacker with
a malicious VM using a virtio driver to cause the vhost-user side to crash
by sending a packet with a Tx checksum offload request and an invalid
csum_start offset.

https://www.openwall.com/lists/oss-security/2024/12/17/3

Release notes: http://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/dpdk.hash | 2 +-
 package/dpdk/dpdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
index 27c06476e7..e9a22736b0 100644
--- a/package/dpdk/dpdk.hash
+++ b/package/dpdk/dpdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9944f7e5f268e7ac9b4193e2cd54ef6d98f6e1d7dddc967c77ae4f6616d6fbbd  dpdk-24.07.tar.xz
+sha256  bcae7d42c449fc456dfb279feabcbe0599a29bebb2fe2905761e187339d96b8e  dpdk-24.11.1.tar.xz
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
 sha256  e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  license/exceptions.txt
 sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 2200f5fa00..0cbdc67e87 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DPDK_VERSION = 24.07
+DPDK_VERSION = 24.11.1
 DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
 DPDK_SITE = https://fast.dpdk.org/rel
 DPDK_LICENSE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
