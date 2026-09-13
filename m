Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16EFC88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 07:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6319A80D88;
	Sun, 13 Sep 2026 07:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hO3OHXDWZFSe; Sun, 13 Sep 2026 07:49:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 557EF80DD1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789285771;
	b=kvAX5HVLhc8BEDrIHKdGHgkggQLkQd4A/0WbfqaOnI/c218tobHXKSHye9DU/ZhX0Vto
	 Br5y2XaogFNAEX+V2Sa5cJwJfzJzqsh+1aC3dioImvE/zA98vMA8sFO4+CvaHKViFUv0R
	 bZbKbYxQU6IRW+JKGYVde9ARZ6A8pzzyUwPBt7EdahG0tR0ng9/B5vL9zhHr1HDj/yMP5
	 AzKXAt10mTHYtpDGGh/CpnYWEA0W3e1xhpmsijDhWLDPZqTL39fL7eqlDIp2Er/0ESruu
	 x6bXG//O3LOio8xwS6L5FooOdTT+3R+gJWtJNg29yD03riB+j72FO5/e1GH0nqrFuWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789285771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UfCavAGpiQr1hvKFjDnghz6Bboqf47w8DXixOA6C9Ts=;
	b=X3XX3PNiSi413D3erHmCnXudQdkW1ht8DI/fN5JsItR4s+aroK0wrwzvE2fhhwT5CnKY
	 PNvVh1eDYvroTSQ5oG+utER7PEy8dg3oqOS1fBN7nG1bcYrfLTBsgQN5fLQ5lhks/IUcl
	 VjVyufQZUvmsGNY6XSiaCVd5vD8VEsguAy6vlQor1eJqy8cmqFM8p54nXNl7+fLN5nrRI
	 eEbeCMHBvlCdH8qbEzGNf25pn340obmtN47MJ/J94DYVCYltR+hqyqM26GA4ZFZjR4FUF
	 uxR7ATDZuI9ngDGuf/d7S1RPgCL7aAPZOiCodqS94+0nUb77SS0HtJhnRzrIuIBbqQA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789285771;
	bh=UfCavAGpiQr1hvKFjDnghz6Bboqf47w8DXixOA6C9Ts=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dRdUHT1HipYrGqYJ3bRDx2scHrQxrD4zl8JpkUNOiGfeyZq3iO1k065uGWBPhfr6e
	 Ky1TnexTD7OUxb//257p+efxDPBhFqmIkMAvBm5jYY5MrsUgfD4zbu3vzzOBbvGBYQ
	 zuhZ+BD9U+QpNuz8SamLkK28VVeLu0g1eQIWGCJvvf+DIkiXiNQNMdjMfzWibXql+e
	 WDx9ROm/D2yLitSk5hYrNai1xOxSMuKy603xIG/smZCM8v9+QJfcSQXpTAw2qgfP+q
	 xGPb7q3b4n1p3UN7h2luhcEJPV8hu4cKlZv4G0FUx0fB7mZMoDY3q1suv3V2TTESJA
	 ZQ2xwXrS47l0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 557EF80DD1;
	Sun, 13 Sep 2026 07:49:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3E992E3
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5D92400BA
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_uTvY9JRYh7 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 07:49:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 040EE40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789285769;
 b=AmIWgGiC4jNUM9GQNVgrq60DhR2GpzaqYDiw1yQVlTk9Euo6ppSPDdBwRrG6eeeyVVz3
 030I3+cLgMXrS+gJzfdX2xCy1eHhop/cyH1JsW+XEcuraBg509aeisXK9yAkzn0jqR/jb
 hicG3b54N1nJrm3U+ZSkuNmtgUw04iG5e/Xf5NKvUClGWwFIsRNTZ5PlhaV9nxszSVph9
 dWvRpW+cYyI1ajc9FYytyjDnGQ+RmBnYPh2GvnFA+TMulkzaIzoqXO3anZxhgqLzgHSe+
 TfdtXaAnLyrt7dAe4bfRweRNQebPhfZeI0grOTfNgp7vZ6M5tI1rgq4xPrpRnqDcejw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789285769;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2C+NltvwRJTHNMAliNVO1rpLzzvPqH25hUVi4hRFLZc=;
 b=QBSl71WTb0kbp+fzIZmG5QNe5wRRRc237qA86MGUdE+cbH6ZAPs+90dDJnUld0DQA++u
 QD43JBdPMUPdxZiRusFQ4RS5DaDsgoZcCekhfvNLTHPWPwQbaIWA06MXg9EFE0SuoBnmP
 EgvJsHProUtA3rJCGGlYz1rTgYujV1NUJaCfSFWsYSx1jfzkvfA87OSwWTvN7+f/ZAL4a
 9XKXZa3X2p/Uc4bvX6E8ZylqmREInMC2CyawvjaHPBydPBm4ltrZ7OhDUVgEP9140YdE7
 RTyvNLT/g3zwEesppLPg+++7U49x0PiwqVt5v8vEBzU3jzK+l2bd5SeahUBpNrTcVow==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 040EE40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:49:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20C178D3F2; Sun, 13 Sep 2026 07:48:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 09:47:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36b2b3f561541da00f62b6714985ccb34ae9e20b
X-Git-Newrev: 71d3ffd3727f44331c7a330a9b687f503852e839
X-Patchwork-Hint: ignore
Message-Id: <20260913074824.20C178D3F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: use
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/71d3ffd3727f44331c7a330a9b687f503852e839
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS redefines the conditions to
determine if a host go compiler is available for the current host
architecture. Instead, make it explicit that those conditions are the
same by re-using BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.

No functional change.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
