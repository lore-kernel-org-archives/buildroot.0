Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAD8CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7400780D71;
	Thu, 14 Aug 2025 19:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhOsX4O4Crqe; Thu, 14 Aug 2025 19:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB1F680D73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB1F680D73;
	Thu, 14 Aug 2025 19:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FB8A1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F316280702
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGM2rYxyQSIq for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B8638073B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B8638073B
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D8EA87606; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7164962e9067c61738d998ca08bf418a492439f2
X-Git-Newrev: b83b90c50b501202e69f338ce44e2625cb0b113e
X-Patchwork-Hint: ignore
Message-Id: <20250814195612.3D8EA87606@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/go: make
 pre-built compiler provide target support too
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b83b90c50b501202e69f338ce44e2625cb0b113e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

All Go packages must depend on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS,
which ensures that we do have a Go compiler available for that target.

BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is currently restricted to the
availability of a full host Go compiler bootstrap. However, there are
architectures like AArch64 for which a full bootstrap is not supported.

Thus, currently, on an AArch64 host, we can't build Go packages (for
target or host), because we can't bootstrap a Go compiler.

However, note that a single Go compiler can generate code for all the
architectures supported by Go and for some host architectures, there are
pre-built toolchains available. When host-go-bin was added in commit
7b2a164b7460 ("package/go/go-bin: new host-go provider"), the host
dependency was properly accounted for: It is already possible to build
host-go packages with go-bin. However, the fact that a Go compiler, in
addition to its native target, can also generate code for all supported
architectures, was missed at the time.

Thus, we can fix this problem by relaxing the condition under which
BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is set to allowing go-bin
along with go-bootstrap. This allows a situation where the host can't
bootstrap, but for which there is a pre-built toolchain to build Go
packages for a supported target.

Signed-off-by: Florian Larysch <fl@n621.de>
Cc: Yann E. MORIN <yann.morin@orange.com>
Cc: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 432cf9be9f43b26dbe7856feb3295b8e25c85048)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 7e354b3298..a42e37f90b 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
