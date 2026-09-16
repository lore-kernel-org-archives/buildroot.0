Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFCCC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3759E60DB8;
	Fri, 18 Sep 2026 13:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FgKBnyyxbTO; Fri, 18 Sep 2026 13:07:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0F78C60E68
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736840;
	b=rPeDCM/04CYYdipHDivwX2d6c2/34HuLr3YiZfLYqdLOXC7I4XOWwCED92nDPldAhsOZ
	 70nvnjBRX3/T7WrrRqWx0tPgmNgynik53fS/dF26WkXdOq571j64EWxWDnK//9VANZbPy
	 wBBdIZoU8OFLXxK+M4XHR5qOiDmZNZNNwiXBfDEl+WI+uUoAJsjnlBf1nOuJGXpfqDLbh
	 W6q5gsxgOB93WMIzvu1+h6utWhuim++CZkxIndP+fR2lz18nMf49OiRw11324jX7Zzs+/
	 IXXoc0PLsToqsgPAOlt1IrIYX1YiCZ9QaEGiB5frbP+jCeJb3Th08IQLPQtNFrS0O/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736840;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rr0jX/ETtbwv74ri70L9/uN6+tGMD5Yb2ELzDyC+YOk=;
	b=WF4eLwHP05ljTg78+ADGOtiyOEut1pv8PcRoiAh1AQL5O0xiTq2hLp2sTnpwJKf5YCYk
	 wS2wcXkfTCQW2zTEgmhF4pnbpeQf4Po5XXodvRM3S0zLnvy3/AkhK9H+6zXXHvIBXEsP2
	 eMsZf8vFMmiBeqyM8CHVqlIiyRrbxJn7LUXFnDwBGL4aYRSwdl/mtU2n4QZAWm4/dW+eF
	 8UGR9V+c6BiFVWuJL6XOiPqRyJDzWCl64DNmCqi0kRkh8t3W0lKTni2R13V2jkHKQb+LR
	 /LP0+0CQa6i2lt9rss5TFlEZmtrni0YYhMzs5BVUotvpE7jKwzoy1ERTgbFLa9SFaYA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736840;
	bh=rr0jX/ETtbwv74ri70L9/uN6+tGMD5Yb2ELzDyC+YOk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mciTnaPZm6Yc7z1l6QRh9l+wZPESEc4gYsiUluae+PUC7Yltsk3tzkRKDdVKwMftC
	 cMS3A1bBLn2Myrce9HYAxhBLP9DM5s3jLkgTEUdtVvB1eEltXWCb+hZHc4GwbgWSLH
	 Wt9i8NOYHgewiEr11gPGJLfmF9k1uOVYA28yQ/Ic3Fn/jr6YSF00naYkMa6S5eN6wu
	 RV/mEFJJxBUVeacf5HHFoJgibBtIuIkMIQXNbh8QJsC+vBXPWcz6EWnwyqG42xcq8H
	 JAhilelBCiRW780lBIMd6bJMAHyvpOkRU6UJST1n1ywi4qwEpiCCnFysELp++dmnjh
	 Zx/H3ICEfa0FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F78C60E68;
	Fri, 18 Sep 2026 13:07:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02B6C12FC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5CFD40BFA
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T078k5ql5gMO for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F2AA940BFB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=KaqOJdwn41faBEUmzfTlFI881e2/tjZoHciiMnQr7GgbN7MKu3sfMf7lB73+5dZUV1Y2
 aGjIfx0Ec3jO/bWvPmb68Ro/xVTqHWP39XkQe6WhE8tNrmKiCKJ1C1gtihe+5Cjdz+HwX
 IwCBH/5mfTFJQZXXBAvImyBlEf1W85NCXxEqHFjcoMBKQxbjGrAv2TWAVYUHLRM8eYTwX
 v5KGB5s7XAq4DWybrzC3vdJI82DQHg1x5gRBhevUcXT84RIlY9k8wbMktFqHSKEOa3fiY
 j4rmgg8CYbvfoSba2a5w9LLZeXtKhdAHEaL/mWszvsle0toYEl3TdwAhWTKlk2Hs1IQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nbFClsJwT2jtQqNjPGZFqhY0fu8XSqC/gZdjH50CHp4=;
 b=J3OKIulHm3Pn7pwW4glX7ZGy9C5+ZCLJDHfLPcAJ20ByGGu3jLzOXBWM25sjmskJ5jCF
 zFEGlLoJ8Sox1L5CMF304Ur3IOM3qS5YRt9GYE1EJNjiJ3cavHGU4M9KaIlg2oSQNJ+kg
 8mNOuc6nk/EZdr1Qfw1JXXVsmo5bEKXJXRWiCA/QEwYQ8I264hCboy4PSxWhmqXYCCDfn
 n3YpTlqbin+yPYdeVWd2I6uRw2fZh8pupIRxOyV9jIpUBxUV3EaK0N2drXtLvoaXq9NjD
 PTLzuNbugST9ICo/k+Ue+q2VqmgBSZ/22JSqFKzXZuGm3hVfZbp8lWhlfu6Gh6uIZmw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2AA940BFB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABCD797698; Fri, 18 Sep 2026 13:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 11:56:51 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0ed93ea283d216b9c89b81e9308a55948fbf49b6
X-Git-Newrev: cd8637f4ec3a5c07200828000855d07f053f0c74
X-Patchwork-Hint: ignore
Message-Id: <20260918130544.ABCD797698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/go: use
 BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS in
 BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd8637f4ec3a5c07200828000855d07f053f0c74
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS redefines the conditions to
determine if a host go compiler is available for the current host
architecture. Instead, make it explicit that those conditions are the
same by re-using BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.

No functional change.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 71d3ffd3727f44331c7a330a9b687f503852e839)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/Config.in.host | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 79950983c1..47c7e5d075 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -1,8 +1,14 @@
+# Host go packages should depend on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+
 # Target go packages should depend on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
@@ -30,12 +36,6 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	# cgo supports uses threads
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 
-# Host go packages should depend on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
-config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
-	bool
-	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
-
 # CGO linking for the host. Since we use the same compiler for target
 # and host, if the target can't do CGO linking, then the host can't.
 # But if the target is not supported by Go, then the host can do CGO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
