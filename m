Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC08C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 10:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72CF7844D1;
	Sat,  9 Apr 2022 10:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id muhQAT_gowiP; Sat,  9 Apr 2022 10:33:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74854844A9;
	Sat,  9 Apr 2022 10:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED4271BF5A8
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBA2B844A7
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E30sZFADd-kL for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BAE9844BF
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 169088350E; Sat,  9 Apr 2022 10:22:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 12:27:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fabeb698adc3c4006cfa15d439c8a58f0032d548
X-Git-Newrev: 12e33273561b27543c0c3d5d06d28c001dae3c15
X-Patchwork-Hint: ignore
Message-Id: <20220409102239.169088350E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/linux-headers:
 error if headers version is not set
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

commit: https://git.buildroot.net/buildroot/commit/?id=12e33273561b27543c0c3d5d06d28c001dae3c15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Validate that BR2_DEFAULT_KERNEL_VERSION is set when required.

Fixes:
http://autobuild.buildroot.net/results/2b9/2b91cb82a290348843a2422c01b10e49f45be9ca

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: add BR_BUILDING condition]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4ff6a0587fa733ef6ebf131c095226a606c09420)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/linux-headers.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 1102e76f0f..e2a0b7a7c9 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -33,6 +33,12 @@ LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_REPO_URL))
 LINUX_HEADERS_CIP =
 endif # BR2_KERNEL_HEADERS_AS_KERNEL
 
+ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR_BUILDING),yy)
+ifeq ($(LINUX_HEADERS_VERSION),)
+$(error No kernel headers version set, check your BR2_DEFAULT_KERNEL_VERSION setting)
+endif
+endif
+
 # Compute LINUX_HEADERS_SOURCE and LINUX_HEADERS_SITE from the configuration
 ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL),y)
 ifeq ($(BR_BUILDING),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
