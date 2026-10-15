Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B36ACCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F41A26143B;
	Fri, 16 Oct 2026 13:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMXUaekWWZHH; Fri, 16 Oct 2026 13:14:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C5B8F6144E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156450;
	b=geeBsZcEMMcgvoGHfn0XMM2ZPtpLSX2sMSs94jcRMY0l3qydfvWDMVVraRRunQi7VKA1
	 oq54AKCw1SVpyoHUB9eTrYLxT7Sz2skhqHIg0YRMo25i2dcvjA0ohHytvRMP/vfCwD7Xm
	 TESt5fvaB4eHYF9rCjRwFtzEECMhzjYD3zVpLx1YCLkyPgvCZxu8OeqhWu3w2lTvBX9Vl
	 y1bRQdFa4w8i4RvQvw6TF/lh1gZgf0DKhfkWWHMWk2ycKAEReNBDZGBd8p0BTlBVMBgf4
	 GnOigJNReH12E1h0uCyNO4INzxCDLUsqGxWq+DyAPziC0/X/Gb6iajoAQdjl/HF87uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156450;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YVFLGS7ojbZp5VsHKmX7Jndstb6BQQeRl/8kRVWNgwo=;
	b=XtML5ssWst32AESPFwo8M/GoXtlJDUodfSV2aLewzzk1u9jQD7N9XqXgeuhIdM14m5S7
	 bdgoAd52jzDR53PgcgOhAEd5T3KLEz5/BX0y+B93HwoUfJqM3Ix6PABg7lzjXliITn/C4
	 NCxq8Rh40nNn+xMB00GBUwSXS2xluRAPwkrYJcTZOxkohu0pwBMKik1XxxZEbPOEwVXxU
	 0lYUTP4bFlpdTimXCpQtZaNohSstxOSXwE/vZskOroG2fI2LFyjkFZzI5xK7ohqG+N37B
	 vVu8CtZpVlrar+IDxviBcCYsQhBYD1i/rezJ3/6YtBPHHs4V0KdfI9+GQ5k3F8lA3Mg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156450;
	bh=YVFLGS7ojbZp5VsHKmX7Jndstb6BQQeRl/8kRVWNgwo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LXe3MuS7QPWAmuQxwG8nxYW+GZB0mMfp3wP5sK7wgpr1Ye4Axovn7qeVZfiKSQWtA
	 8qvbvofwQZbLQgrDsIiOunw6B3BuYJWa4FnwRtNVnH0S9vUiqHB+VsQgCmb93vFroe
	 DRImARi04P/GITiF9jPEfMBB9ZBVbpGMBiOwQrYgjBeW2e1lpXKotNafTcyrq2M951
	 YKgNpYT1Qd42dba3u5SAWTqvx7lcrG3YUwQ5WI6ju3Fo8IRWe0jFSInTlY+5jRnCnQ
	 +VTvW8pu6WGSJr60FpLrLI6SurkFiNvajHUBDcxe5J4sykX+aYnx7yErdWBbBtf1xW
	 vFnapHRS3rbKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5B8F6144E;
	Fri, 16 Oct 2026 13:14:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F1C2920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AC8160F22
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoxS6Lnx8X40 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 73A2B60F08
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=bNpWq0ffiDRbJO5x1EKulX6pqi1jIHbvLc7Mmw9u8Y8LcHeph2Oxap52eiJyWD7VjlLv
 WCw3N0JJ0QyJ33kelb2EtIp9+hJs6ntCZjbKAXDcv36LhAHwSGQ9acTWavSmx5qRMVV/q
 fkkTsJFeE88iSuSQEhBnETBNU2X97Y35AueXk/+W6oXRnTJAhZaWazoysa5DWSN9RTsYO
 6onknh0Z8tXupVL65PCvizkQFGJLqT7oItLAPeHyJvnLiBQIVCSBq9z/8vK/TFeY+I3Gz
 8Sckwr5H/5OyavQ8rg/UvSuRFgkbUI4MCC+RmNwMJ+ca6LZQkKuU+ZIE10tKBeBlhvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IlMSRbbCrMlktNiVuixbcI+CtV04XiuqgtgQw4QpgHI=;
 b=JfHWhWkJ1jMUJI7rVidsRPsLVZeqsM8pD03kJ1tpvz15uwDN/s7IY6Zs/Umln2Vu/1nM
 moUWJVNed8jjEzDfsDDFkLlG5DjxdGYdRgKvh55sKMLKy0fzQPSsD4Y16FGVMt6PdoOZh
 K//wZ9+V+nc11rmm+HJkz1WCwdjvFA7iHuJVeWgidPFF4gF5I0bZ3BSYz9NM5eIVrr1dM
 +8Yd+1SUrBzVgmsgpKkKpQR9H2TbsAz+YwaJCwFkyqXxq7ZhPhNt4qRk0JwT8afXoKDsW
 116d+8e6wyQARKpAc9k/RBpXHO1daGbL+0qlf+oyY1oeEa6eeA2tkohbk+D6y3ugdBw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73A2B60F08
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56822960CF; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:46:23 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 849098d88602d378876451cb6ec0e8d4c8e19f4b
X-Git-Newrev: 30173a8c58e7ecef04ef139fbccaa30a9f549198
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.56822960CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/qemu/Config.in.host: fix typo in comment dependency
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
Content-Type: multipart/mixed; boundary="===============5548862435496820707=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5548862435496820707==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30173a8c58e7ecef04ef139fbccaa30a9f549198
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The "host-qemu needs a host gcc >= 8" comment depends on
BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT, missing the trailing "S"
of the actual symbol BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS,
defined a few lines above and used correctly everywhere else in
this file.

Because this typo'd symbol is never defined anywhere, it is always
considered false by Kconfig, so the comment's "depends on" clause
silently loses one of its two intended conditions.

Assisted-by: LLM
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 280e9755d5241e634b897fc07010b7872fc65eee)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qemu/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index fbc989b003..0efb48ecfa 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -42,7 +42,7 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 
 comment "host-qemu needs a host gcc >= 8"
 	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || \
-		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT
+		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	depends on !BR2_HOST_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_HOST_QEMU

--===============5548862435496820707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5548862435496820707==--
