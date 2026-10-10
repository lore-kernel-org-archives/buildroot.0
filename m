Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6978DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE1A40695;
	Sat, 10 Oct 2026 17:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CD0WJifETVqn; Sat, 10 Oct 2026 17:28:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 287E9406A1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791653297;
	b=WaC1JnZ0idyWczMhTmw99zcoHIpzga17rMyJCZB6nUgv86MCMJva/jb2+0hcxOuYR8XG
	 H9vWyAwqeGsXIgeWniHaLE1DYjnOR1xLOKt3VnEPwFKA7A2+zQI3r7/M8crURTYclQCJ6
	 BuSIjWC1p+Mkj5T4ez6jwG5s2gZcaM8MTqsAe/aMMdog661mLbyyap4vNdQyVp+j8ZUxR
	 a/auei5+5moVIjCuUEOxFSh2BYyAONDsODciGl/wQHv1bD6O+oloRFACj4nX+3s4TaDmZ
	 WYDXQ+DNnS29LDhHEd96MMCeQaiJ3N7rX4G+Vwi5Y6nvjCnWR7xfRJqgfWRsK/+8vSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791653297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1K6GEy1QX293ehRHEVpwUu2G7t+zNTfUiCWXmJGjvAw=;
	b=piFfywyyIPMLSwfRQklOUKfs0GqZAk33TUkLQ7gaGjJOZcQGyLzNdyNKTXj1yDlXUKvE
	 chmtD2TA9dnCi7plafGN7P3Tl2aDKxX+RDXe8Q9f7YOuxJwdLbJaP17CO5KsHRdT2SCy2
	 9E7Oqiyw/0yQvEvuppr6e5xszGp8Dw3wTikezulBRnxwgtN9fJMEbM7xfLr9AKeMv87i9
	 J41o58zzZBbBAC3tWUXmoZ7JmeHy9gBcJcBlyYYqKFp1zgJdItRL9LOSNQ5SLPDqQGTsK
	 hU8DzBzpMhoTBcZDPK3SpP1mFkp8tnPR5oOoWcupGhlJ+O6qMY0PFGhea7XZAsI5ikQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791653297;
	bh=1K6GEy1QX293ehRHEVpwUu2G7t+zNTfUiCWXmJGjvAw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mMWmvwXqVJcO0ONo0SZe7cjm452vVN18ZbOLXr1DOMFRtEaU57+sYGR+5LJHnXjZn
	 PRgXGrb0G632GGwEZL82yd65GH32OhvcLBjidt/YjssmvwhjFry5HDTi5ujN4LtyfQ
	 /cXgKF5Z1FwS3t+AxWBuVzqYvZ2PnVV99jCkcH47piI7vGmr7qTxARlR84O2RJJdwm
	 oMYCYrgqJPgABa5IThcCvOaKkg5E1QJHtDyHA3wyYkHZTHcVtUACJaSBm2AGeW6jLp
	 YwCDXwFL1LHGX7dDxdsepjkFWRKsmjmrCjGmrNT9N30LrB5MKP0TgymgadSBsS5yKN
	 YlbSC4ut8ASGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 287E9406A1;
	Sat, 10 Oct 2026 17:28:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03A8E317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDC804005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cb1FONhaMP-J for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:28:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 32F4340004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791653294;
 b=FDsqt9trImtZ7pnsdK9AF68yipkGNbMehxG06ialu/TpWfcfAqut4bVOH7izRWxzVtf4
 3HYa+n9gL9gXY6hOGY5pFmyA0473nYmCe7J6XWRykrlTKzlCG87exPCzwA/g8u355P6te
 CndpADeYCciZYl9yDqAynXCDPzFzGA4e6+90+k94AbYLOKKRrU7Ejk0bkFJvkJJ5k61/P
 N7Epylwt9j/HmBKkDm3CJHJ9ODjK5cAjC4/YvMZ1Df+1GGe8x8K1JwpBLMu95iec3nJem
 J0eth4d83sx14eUEqk+K7DHwfEiqh1+Uk8/3n46PF5PzSt1YR1zzAVkVSv/c1TpJzpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791653294;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qvypcqE+03yFFI0TJ3G8iZ1/0XXJin+1xOyYKE9ecns=;
 b=SxTJcafG8PEJaU4trevzmd5fZKZZygYYNt0ZtXGUYdogr28jXvhAIplcdgO5TvLanut2
 hQnWbvrj3w/0yZNeB07s562t/ATT4tHgFg4yuJoz8XAyn5XcKcL7sSTiZu8VzhKB2B076
 nrI0XAd/XMHOSLpUfHUPZS0FFdnU6EMXWfSnYtPpLfhttc+ncU034wuK0U5LF7lqZcgon
 f4P7zqsPcpHN/tCBHAQX4VrIvhKAS3XGsjjxd3Bw+bp7UxMf26znR2LLavZrRwjiuqqAb
 hkUir7VEv6YdKddEr05KOPQ+6w3B7NGL2jYpHXids4p33Ij44EaDVwJyeA6Ncct/L7w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32F4340004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:28:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0D779346C; Sat, 10 Oct 2026 17:26:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 19:27:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b8cd6665bdb6d8f67b71b859a0d78e3a2584875
X-Git-Newrev: 0bca001a5ffd60e7d4c071a25090b9ea7c56d6bc
X-Patchwork-Hint: ignore
Message-Id: <20261010172655.D0D779346C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/runc: enable uClibc support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0bca001a5ffd60e7d4c071a25090b9ea7c56d6bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

fexecve was added to uClibc in 2019 in commit
858ffad217076227089cc17eb832db0bd1497792.

Also containerd and docker can be used with uClibc.

Runtime tested on a Raspberry PI4 (64 Bit).
System compiled with Bootlin Toolchain.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
