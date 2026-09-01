Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C990AC61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87B4B60802;
	Tue,  1 Sep 2026 21:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_HgoCSKyPu1; Tue,  1 Sep 2026 21:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788297598;
	bh=JBtVa7Keur0MotiTRsom3vPXHZg3s5jn9luAgejnTWU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J8I5cPYh7Axr1KzzBg3WEtsxG4gGKH99WOBFDRBOy06vlbldOxdODUM7jaNduibOH
	 a7UPWuiyLOh/bfYyE8r2dOpw4NyDlc1iQQUc5ZVdSlK3lzGxIkwDpwd68jWh27Yz76
	 DlBzjFQZ4MP1kJVwdLEIZhuOuPalviLJ5YcfGPFH3NNt9vuhAHFHE/jsbwc6UbWX5z
	 GdW3pxoacEsRG4JeUtZqVi1BMXevhWgrgzbfzIhM3s/9C1A33ADAcT2N5VDO62V8W8
	 ifdjSA7PWnpOG+vf6Y3iDNEKkuMfpLzzcXKRy+jKaOxuttjdVbhsqjzBJ6gv+zwFyR
	 cwsZdToXGhskg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A63806080E;
	Tue,  1 Sep 2026 21:19:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEAC3127
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94DB86080E
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RROHA6Yw-oGz for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 897E760802
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1788297593; bh=8tTpGORgPceGjNyzCMuXuz9sqZ5bX8FD7c3vGZNyg0c=;
 h=Date:From:To:Cc:Subject:From;
 b=tDLnmrpWpvzV7DVTOdmFxmA7dpb4N6fgkGbrRBpEsWAuPwSLcMom83fN1ugZX0Sj7
 JI3HBqyFwBQ8rcISqvczDrFbvL6mI43TSuY/xuVFEjZfCpP0UD7cj4FWBxwOnWWys0
 ecYWyCwQsly/ZTs2GzJ/jYCZfVsjZmdmLPYu6E5QTTwuCGSOO0POaqUwnPizDCxv7R
 joetXmYKdtMfqwqf1Zvv0/CamZGaw0Jj/A8kW8Bz82IwmBi7H1UV7Aee5Q7XwaIA4a
 zG17PXy04dWwXxAg/229YkE1OWiDMtt5n5oNxDTtNeMEpzhQgwYvxBwnbCkKZrWzAl
 wE4yzJCXHNp1w==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EEFC931E0CF9; Tue, 01 Sep 2026 23:19:53 +0200 (CEST)
Date: Tue, 1 Sep 2026 23:19:53 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>
Message-ID: <apdBeSPwf13pL2Cy@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH v2] package/runc: enable uClibc support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fexecve was added to uClibc in 2019 in commit
858ffad217076227089cc17eb832db0bd1497792.

Also containerd and docker can be used with uClibc.

Runtime tested on a Raspberry PI4 (64 Bit).
System compiled with Bootlin Toolchain.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - fix comment in runc Config.in (Thomas Petazzoni)
  - also check recursive dependencies - I already
  had that prepared while testing docker on my rpi.
  (Thomas Petazzoni)
---
 package/containerd/Config.in    | 5 ++---
 package/docker-engine/Config.in | 4 +---
 package/runc/Config.in          | 5 ++---
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index 9712b11b1c..1f9cf5b1b4 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_CONTAINERD
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # runtime dependency
@@ -62,8 +61,8 @@ config BR2_PACKAGE_CONTAINERD_CRI
 
 endif
 
-comment "containerd needs a glibc or musl toolchain w/ threads"
+comment "containerd needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 541472d957..37d7f7928d 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
 	depends on BR2_USE_MMU # containerd
 	depends on !BR2_PACKAGE_CGROUPFS_MOUNT
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
@@ -79,11 +78,10 @@ config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NAME
 
 endif
 
-comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 5.2"
+comment "docker-engine needs a toolchain w/ threads, headers >= 5.2"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on BR2_USE_MMU
diff --git a/package/runc/Config.in b/package/runc/Config.in
index 73eac72527..4c6664d6f7 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_RUNC
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	select BR2_PACKAGE_HOST_GO
 	help
 	  runC is a CLI tool for spawning and running containers
@@ -11,7 +10,7 @@ config BR2_PACKAGE_RUNC
 
 	  https://github.com/opencontainers/runc
 
-comment "runc needs a glibc or musl toolchain w/ threads"
+comment "runc needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
 		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
