Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA1FC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 17:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94B5C408B0;
	Sat,  9 Aug 2025 17:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xc_nqQ2CvGNy; Sat,  9 Aug 2025 17:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A806408B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A806408B5;
	Sat,  9 Aug 2025 17:26:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5451231
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4644E405F5
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cmjl0DY2W6NY for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 17:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B52A402A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B52A402A9
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:26:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A79C8707F; Sat,  9 Aug 2025 17:26:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 19:22:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbe67e4b115eeb7389906f73fe8345b22eacbf37
X-Git-Newrev: 432cf9be9f43b26dbe7856feb3295b8e25c85048
X-Patchwork-Hint: ignore
Message-Id: <20250809172625.7A79C8707F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: make pre-built compiler
 provide target support too
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=432cf9be9f43b26dbe7856feb3295b8e25c85048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
