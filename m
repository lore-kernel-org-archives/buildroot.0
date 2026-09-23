Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415D1C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0212540BAA;
	Thu, 24 Sep 2026 18:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSl343sYdVZX; Thu, 24 Sep 2026 18:57:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7FAFC40B18
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276234;
	b=SAUbzv2mN+3yK4sv7PuhfctopzxJDGGlbF+5UTRHaFcWK485wQFH9BsdH+m5juwx3vAt
	 /dNets2Z+KT4KVYWT+9KmXzUotxOKG5T0msXmaHfpI49OXVrqrc6Yk4iKn1j7dzqL1GtY
	 wncl8f8ILFuMaydjI5syK7/mrc2eVUtALrjqtAmdscmV2XT+T/Zrz+ad656LyuypxDYe8
	 q+BTeQWr5t2H6wqb7fk1/SIMQX9JeR+9t04svDfw6cRzufZwDQDN+s1aRYuwoYAiuJjpX
	 FRoBCvw5ij/6q0bHFutpEVsx/XUJiVHultvcUCmN2ZmoYeOGik/Jr+4nRzCG9JGp7/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276234;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=fczffE14LB44f/yTkamWzChznrEdJNScmbwMIotv8Js=;
	b=bKlHrFXGJwNBEhg9mNkIYtDnjnDWA03sJSRFb+wm+BRrGfyXkf3T4jSycGd0aJ21K0Jq
	 nY43IN4+c40LJiLbmP3is7jmltAKJZKLbL6UUrtDRcbpHdbU/4GhAQL8vz6a+zLMpMqQP
	 AssYwTQgWHuFJoxHOFpZmNWoYoqEOGMfq9/qSGt++9m6T9yQ2LXDlmbWZgkgCREuOM3uN
	 +jTyj5kNuUm2qkvOh3jSf8ZYq64VLnm5A0bplWNvUiN9l2m5bXIUFOLlqZFKPEyiIhmqw
	 Xrxz7XoIEm70XrZYwO4AvX7fPhEqFm/y/FaLxDaIPJDhgPBmDkM6T7XgWbbr9EVxwxQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276234;
	bh=fczffE14LB44f/yTkamWzChznrEdJNScmbwMIotv8Js=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ng3xpwNtHVHz/tAuF9Z4AGDbqBT2FOTRMtftnhMC9x006FNGnEEvakSaajSXkwgNY
	 JH9fzhSQ5czNNe98VdDmbwemNxT2KDMaoezxr/LPO4pNDQhEECTJWwam4pKo4QNUGF
	 TxKMbMRqKkSiTe5/sVuYqf9a1ikRICKzUPLW+Tj0kNIK8QwW9vVOZadkJyh/aEwKQP
	 a7u9uxbqqD55kq5YET7a69EwuWSdewPlzgyDGIZpnNwmFneD1FbYo0pBNmVS8lzN/n
	 R/nt9jF2YXnhSHtoKmMGqdgAUcFGEXZgyfber4Af6D7rDVzBbY5EqZQCsfDHg6O4nl
	 dy9k/xMynzK8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FAFC40B18;
	Thu, 24 Sep 2026 18:57:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C7F4328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E00340AE4
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shq7n5Z0LdbR for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 330D340AAF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=tYcos0cdd+zfnt4/7bFhwFK5IRcXFvpfMmI9CFu7Bd7Mgk0fl9d879I9Be31HZp3K5AQ
 HBZlhTsKraSCNu0WI3iJl76d0CKN1lPMsy+N++0esRylY/qo8d3HSnFKDsPLyLsrapnjh
 zBsvCxXkymXeSDt5R/PpFc2TMHKQM8l6zauXtkSUHdRQoGmrH3misNF1fTL8yuQVqjvFA
 /75zbFMxAiDidkARcVYEV/JJnSrUriTcXeto6sN3uofH4T6j4Q9SGsU5VtN5fIZsRLisU
 5ckGzmptzCt+lcvqiP6b/l5K+pcruaXRXo4Tttbqr9SYh/qa0tUb6h2RnZSSbnliTuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WKE4XVm5D8qgsZPSJKOvRYGeEUO9ZApCWWAd+NLoMXY=;
 b=j5CoQSWSPoX+wyaQFp6JrVdDd6HJJaDnea43Tv047akfRY3QuAK3DAdKnoX/1mBMDety
 JmG5CVR/BBCS2VMp/E8wGngmu+vsjsdyZQkFQboP3szkOsyyx86lI70GOY+GhSeAcw32g
 F7LCUJSL3KC5j9NOUVAgpjEVTRsoai8GRBXD/CBxf7QT55SAC/I94LqiaW3TZtGGCTSa+
 r7EkUmdf78z95nbq/9TOGDaThY+1yjJw7p/Ad42UBjE61DKqEHizyyFO5zN7Ctn5gnv+F
 R17OXvs441DGmG+2WgAJeyKNpIlwW3/ix1PuErc2ukut2/eG/T3B3zMabUF03B9UEww==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 330D340AAF
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB5F698383; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:08:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: df1e103aadc7e5eb1c544358ee09f181e5fba20a
X-Git-Newrev: bef7c59106b55ad8e76aea1db3dbdea87f0f051a
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.CB5F698383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bind: fix
 Config.in comment
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
Content-Type: multipart/mixed; boundary="===============2218013805946067306=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2218013805946067306==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bef7c59106b55ad8e76aea1db3dbdea87f0f051a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The comment should be shown when !BR2_INSTALL_LIBSTDCPP is true, also
treat BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS as arch dependency.

Fixes: 54f96add94901511862df18e527e456982005b8e ("package/bind: security  bump version to 9.20.24")
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 96ac57460fedab7fc0ed23355ed3ecaf395423a3)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bind/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index ab8ddcd0a2..4eb024b260 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -51,6 +51,6 @@ endif
 comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
-		|| BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

--===============2218013805946067306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2218013805946067306==--
