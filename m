Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908C8C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C3BE40DA7;
	Thu, 24 Sep 2026 18:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hmMtD6QxqvC; Thu, 24 Sep 2026 18:57:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5F4D440DB8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276258;
	b=soGQErToPANbKfCqR/NF8L4qadetlWxLJa6FfSDSzalnZGGvwUNqJF0MC4z+pP7jc1uy
	 iCGEv7ZBJthDRIFJQ9Y/7Diyd8ydmhVgDfvD/pxxnJds47aKZIP2U9hflGeLkXESFknMw
	 xNvJvWP6gy8ud6a2XPnbVt54Rwn+1ydXP2WcMGbisH3IF0thlJRWPOYbk/wg3dAOoxfLi
	 f2Hrw1zrTrP2EkM1SSXzCNXxmdEOZeDPPkfqkGHuty5PMYT+G6lN8t3SpQfKBcmW6hwtH
	 cMGadIPQfaq+aB2XJUBYnWH5tJ7NbIr/ohqD9hNm1m10AaA7a9lmCZb1CkqAEOEI0kA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=315D6B8lj4t45Lgv1jL8bV0UXQhCBAwn9JAoBQ1sPMs=;
	b=T4GhJ1qRb43saDeteMeEmyxu37ZM81JaDZf2PVO3QILNyD8pRgl86+Uf4PtvuVveiOpo
	 9V0cPuygH5RTIRT1fhliLwX1WD1csFx/V/Kxhsd9W0wYyDGL6CXYBnxrbJCFy8djJIPXw
	 x6UxJ3oLrKnH88cBOEmu7rc61oAkLswWMNW9PMcXy59YjPQaOx5lnf1FI+BUDManH61m/
	 l/MBuS1ob98oQM6eGkp9rH+DBEpyRMqbpdPXooKP6hlodHzAgWMcvvaUmwcARk7tcAP4y
	 DlybgA+NFEvEtutvISLMy35ETOYnHgRFQmI70H16tNHrAQEVuRMMyxa1AzyZwBAnHaw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276258;
	bh=315D6B8lj4t45Lgv1jL8bV0UXQhCBAwn9JAoBQ1sPMs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GbGD0eRtPT5qyXE6i8WLpuBIDMLTq8Mso3tL2W/EODi+0FdqvxJv1yoSqzyY0piI9
	 uZX0T0FC+1aybejqcLEsO3R2T4Kyw4kZJRqpiJ21nZKoYh+87gd+hwO7sHiQsDMAa0
	 GXTGH9asH0Nj4shObDjhQJJ780St3bz6Q+/zPn8Ei1aiq/9ykkgqyUHVHjH1ra1pOs
	 Ty96mIXMzRDnNwGDFOk9yTXZZlTV1aps+1rnyjaGrY0SY19lccQ/g7UAcsxUxM/Umw
	 HtVOtez8a7j+HFVNPyDIir4JdHfugSlHQ2a2wYbNF4ly+3BhPcLQsby6ctMak68BUg
	 PEs1JzE3XVjWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F4D440DB8;
	Thu, 24 Sep 2026 18:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C2AC332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E67540AC9
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlxVgxsTQupK for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DC92B40AD1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=O6ZC7IJBhVrP1UXIcfJsy7Pmky28PhMkFWu1QnI06b7VQlGqX4MiPRtcBDejVMazqneO
 82C2To5ad6wtk7j5KS4PKebIfha0ZHojDKt2VylcGD0pJ7kiRUkvF3ZLP+qYgqM/inDZb
 /5M2kb5LYZwMS93akPI1fc+OBPzvfHddYOEPUirrKhqzOusK70dZzKB8FlPKNIOMP5QhF
 xR9eKV670EWDSCDWPptgDPFKMt6zGs8vhZAU23sroCOvinBt/sfMj3r+NwS2PZD8DvGVY
 /E557TgVM6+/5LO1FfWMpqnATnYZ35qV1l7ylvRZJHOtl3GlG1B5i5cAA/jdbSkyoqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0ZJwvP7SCgtNl1GeNjZunJURqKcN+p3FMl0Pcq8K3Q4=;
 b=UKn7dIKvGnCLf3VT+Z1ruQFEYalInzbdrNm1so5f06+bJjAtTzAJzfGkKs3RMUX13rSy
 9ePt2b5CTxaykorgXOFOsoehbhcC3nj0COlieVON7hGRe6xGbVgZ1VETFG8eJkhrLFyWS
 Veo496B5gwM6hYxO71EZuBz8QzTlKbC/JrBAimz4OKAwcI5q75uo/oKsQjTTFn7BTkcnW
 69D/cYm0ePYJPdlWhHyjB2tSIsHTxtQQprUMeqIiR+O65Mo05EX1z7lO71dQI8vWI5Gvk
 AfCEEuQ+rZo6PU6iYJ6kwdTNnUy9S/z5Qinn6wu3DbA+B35m7IfAm51ybkli3U/KnqA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC92B40AD1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80C0698385; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:16:30 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9147fc80287e1adb0769ad235e00c418868521b4
X-Git-Newrev: 0d4e164503be248290a25843d87e56bb83696004
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.80C0698385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/fcft: use release
 tarball instead of archive
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4251057405025305762=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4251057405025305762==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d4e164503be248290a25843d87e56bb83696004
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Codeberg has changed the way it generate hashes for at least some of
the generated tarballs (see [1]).

This change affects tarballs generated by Codeberg, but not release
artifacts.
fcft turns out to have a proper release available, so use it.

[1]: https://codeberg.org/Codeberg/Community/issues/2861

(alternative to commit b7cfa2371bc1ebe83ea1c74db7fa45f360a2138a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/fcft/fcft.hash | 2 +-
 package/fcft/fcft.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
index 431f2218c6..86d68cb047 100644
--- a/package/fcft/fcft.hash
+++ b/package/fcft/fcft.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f48c793f354b8be95477e475dde7c98ac9d2628c52ecb42029dc6d20b52d787c  3.1.8.tar.gz
+sha256  028099126692625873410889a1d76cd82d5a71b5e350bd618320e48db15a8636  fcft-3.1.8.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
index 62c85a15c5..cd31ca5153 100644
--- a/package/fcft/fcft.mk
+++ b/package/fcft/fcft.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 FCFT_VERSION = 3.1.8
-FCFT_SOURCE = $(FCFT_VERSION).tar.gz
-FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
+FCFT_SITE = https://codeberg.org/dnkl/fcft/releases/download/$(FCFT_VERSION)
 FCFT_LICENSE = MIT
 FCFT_LICENSE_FILES = LICENSE
 FCFT_INSTALL_STAGING = YES

--===============4251057405025305762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4251057405025305762==--
