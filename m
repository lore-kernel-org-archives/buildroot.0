Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C058ECD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 20:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7274340294;
	Wed,  3 Apr 2024 20:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Acwnbrxb9Apy; Wed,  3 Apr 2024 20:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32C1B40295
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C1B40295;
	Wed,  3 Apr 2024 20:39:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0710A1BF408
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E802F60750
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9s8Bj7VDtlmw for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 20:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F90860725
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F90860725
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 20:39:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AB65848D4; Wed,  3 Apr 2024 20:39:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 22:38:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d8f9c73a2fd087dd2e8d8853a80da605fa64e4b
X-Git-Newrev: 02e30af0d059aabb694daa54cbad4cae900af29a
X-Patchwork-Hint: ignore
Message-Id: <20240403203909.1AB65848D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm/intel: Remove dependency to
 x86
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02e30af0d059aabb694daa54cbad4cae900af29a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_LIBDRM_INTEL was dependent on BR2_i386
or BR2_x86_64, which made sense for integrated GPUs.
This is no longer valid with discrete GPUs so remove
this dependency to allow building on other CPU
architectures.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libdrm/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 3cb0e02a41..fab8289be6 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -20,7 +20,6 @@ config BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
-	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	select BR2_PACKAGE_LIBPCIACCESS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
