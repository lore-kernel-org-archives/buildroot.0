Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D84C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 08:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 022E742A5F;
	Sat, 28 May 2022 08:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQNE8mo3zOpc; Sat, 28 May 2022 08:41:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D57AE42A3C;
	Sat, 28 May 2022 08:40:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E33E41BF962
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 08:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2F4942AE1
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 08:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVJ0tS0qL-kx for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 08:40:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB5D842A3C
 for <buildroot@buildroot.org>; Sat, 28 May 2022 08:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B61BE84130; Sat, 28 May 2022 08:29:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 10:07:46 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: bd0a915b965f6d594678a588f229e524262bbd86
X-Git-Newrev: f32875ede7cf9111c126a7c24991c45bb617ab82
X-Patchwork-Hint: ignore
Message-Id: <20220528082902.B61BE84130@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/linux-headers:
 prevent invalid custom headers selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=f32875ede7cf9111c126a7c24991c45bb617ab82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

If BR2_KERNEL_HEADERS_AS_KERNEL is selected and the kernel version
is known we should not allow potentially incompatible custom headers
to be selected.

For BR2_LINUX_KERNEL_LATEST_CIP_VERSION and
BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION this means we should select
BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 and for
BR2_LINUX_KERNEL_LATEST_VERSION this means we should select
BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15.

Fixes:
 - http://autobuild.buildroot.net/results/816/816d7a3ad77ba051fff7fba7f2a38fc31549c360
 - http://autobuild.buildroot.net/results/3c3/3c3a9fc1a1e0002ae8169fd47b3003ebb86935f6
 - http://autobuild.buildroot.net/results/188/18883459577dc0fdc01149110ffb81bf1a28c94a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c457bf9cb43c9a64a3ff4b38e117c71ba4b56500)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 3 +++
 package/linux-headers/Config.in.host | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4b4ea8d92b..82f5675f6c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -29,9 +29,11 @@ choice
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.15)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.104-cip3)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -51,6 +53,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	bool "Latest CIP RT SLTS version (5.10.104-cip3-rt3)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index decf02d175..43a116974b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -127,8 +127,9 @@ endif
 
 choice
 	bool "Custom kernel headers series"
-	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 if \
-		(BR2_KERNEL_HEADERS_AS_KERNEL && BR2_LINUX_KERNEL_LATEST_VERSION)
+	depends on !BR2_LINUX_KERNEL_LATEST_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
+	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
+	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL || \
 		   BR2_KERNEL_HEADERS_CUSTOM_TARBALL || BR2_KERNEL_HEADERS_CUSTOM_GIT
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
