Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D07C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9154107D;
	Thu, 24 Sep 2026 18:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgKrcDo9vkoP; Thu, 24 Sep 2026 18:58:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7BB284101F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276333;
	b=cDeuXFvrbGjwFKW2Fw/1hvQDp/Us1lVvwUyutqsZbXNGbzY9gkdOibjtbzOXKvVRBOW8
	 g6bShmOTRiMNc/XLYAPXr609GlfaxMJX4idFJCrHe+aC7juhVjzdseIswcF+MZ3ZDssvq
	 CFiFoscrY7rKcyMOC8Xku6CZJnnX05zAMFGX44fsLlDcGZJBHC3l7yQj7M9u2oGtupvSD
	 hdNWvDhv3fhAf6Kb+k3ddKilZ0OSA+CUVd7ZxEHXGSqZzZOnMg3LDi2KfRFn91Npk9VQJ
	 tulqg/UQIGAri761lg5a2vzyG8gJ+G4YaK+7GZNipZTQrl5LRQUGMUGWQXNkSYhcRxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276333;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=b/MND+7NX4z3ZCYGyimu+YlKtfX43KsvUsvKB85oom8=;
	b=H8xnYDFjhdD/hnt2p8e2jO3JUKmfPCs6kwLK0V/GGPrxN9i3QepfdSpMBTNKRF2jjnpQ
	 srBDEJuGOWVKihv2BmSDt92GUTBCjvE8lwTf1OcEzB9CvXJdqnqedJlQetUz96lxyF2ZX
	 3MPxTwTWEaK0rhk9qQSmDlFyQDh6R5TTo/pg7QKcLG0Swiw6wUiZxODfo65EBJKbHtSru
	 ZJuq8AiNsl9bMxPgqLc7oak5/83pQDT3rCiN/UOfRHw4dOZ/6ecnmKsLJ1KC3d5VD7PLX
	 v6hBoBt24/c0gNX5FJDduhe8VcLn6qoeZVYb8U8fB549SubsDR0497Tzl5L4DxidhnQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276333;
	bh=b/MND+7NX4z3ZCYGyimu+YlKtfX43KsvUsvKB85oom8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hdkbEE9aNLzys+YAcCOa5gNQraLqAL4rreEGwCeP4Ck0PI9cICyf2KmDt9/HSfoWB
	 3+owtR1lk7n1YPR2krm4ck6mtyr7JHwUJS6eE5rXtNcvjUiwotcGsSmKN5f3RAB3l2
	 4ZgEoU0K66gHYBwG3Od5Ey97sSdOMG3lgq0+G8lwNBVPtYZCL4JJfFPd6W7yM+ln2/
	 meQtpMS6s+VzHtiWlqP8nFHfZxCQQHncQPlODOKsGfaKrLLa1C5fYH6ciu1V5GP9CX
	 xKtdrINpDvXUNxq1joNPrxOn4oDI/FHvt1kQOzyZ72d54BpYhAZmfOLUAAf0WYQD6P
	 xvsLtDSGiS8og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB284101F;
	Thu, 24 Sep 2026 18:58:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51C8E392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36D6C81236
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThYqpw-fFWqY for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5D9AA81230
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=PzmmWbSqWR2UF+ZELvqo786bAtDbv1l0NsspE/GuPNHIqRsvufmhrBo8+PlexjX1NGov
 t/RzbJTwTL0/DXBe9ggxMN71YfOt1vsiZZ+0moabuGIbopwkMTWQ1kPvn6lykJ07KupRR
 vkYURqueO8yQJX8xxjiaLYZxXjZHsOL+D0DkQ/rZra+CPuT389vQLVXxqjjHM3Kl+HQ8R
 4arJuT44QYte2ikLn71DSQzEPOVIx0IE8i66CY5DCXErsxX/CHV7tD17fb0XOxA7aTfBR
 eNADlLK0MAjSkVDkSILeYk74QIWMEtdAdFMmXgLzMcbOdjtHPuwnVODc/kspC5iol8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jDRqpa5pqZs9NttTSLin9AFYOAMQKET2C0Smp8pdzoM=;
 b=jQRStolRpHW/yqOMaRqm238XcJTso2ucQpaet8faU44mSKg13ceZf5oGgtoqIVQm0KzZ
 XV0cecykYjKGLKka9Ns5ygtmrUtnVnlBMaXRJOxXgkOGhibcxqx34fHNonwPvsCUMjeRJ
 Al3VVz+A2VOYfWEs6KMXJaI8Q9nObtMhZ8+tyPKsZhg/UQJyAf7vdpMi8iRwgLDe4AQrH
 vi/HKxbpxJFekEbwW1T0zeHpC3LUZeztzeOyWkQE5sUYyCcVFzvNUnyZgAvjNFR6Kws9d
 VUBRyNOmWSQyjg8mFOtQKmwg/f1l6eTAUg4iKqVDPuYF7nKwbizZQcgBIzXjg/iZ6HA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D9AA81230
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0079B91122; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:55:39 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 16462dee6624555b50df596af21d7b683051e54e
X-Git-Newrev: 95cec04c18898798f1b4633b1e53a3a39bf63b99
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.0079B91122@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/wpewebkit: fix
 kernel headers dependency due to seccomp select
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
Content-Type: multipart/mixed; boundary="===============1087281079548371397=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1087281079548371397==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/95cec04c18898798f1b4633b1e53a3a39bf63b99
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

In commit
0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
version 2.5.3"), the kernel headers dependency of seccomp was bumped
from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.

This commit fixes this inconsistency.

Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to version 2.5.3")

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5279b2303c53f61d21bd3c682d008df5875906a0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wpewebkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index c4ee5a27f7..03e9eaf59e 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -73,7 +73,7 @@ if BR2_PACKAGE_WPEWEBKIT
 config BR2_PACKAGE_WPEWEBKIT_SANDBOX
 	bool "sandboxing support"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
 	select BR2_PACKAGE_BUBBLEWRAP # runtime
 	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
 	select BR2_PACKAGE_LIBSECCOMP
@@ -81,9 +81,9 @@ config BR2_PACKAGE_WPEWEBKIT_SANDBOX
 	  Enable sandboxing of the processes used for network operation,
 	  disk asccess, and Web content rendering.
 
-comment "sandboxing supports needs a toolchain w/ headers >= 3.12"
+comment "sandboxing supports needs a toolchain w/ headers >= 3.17"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"

--===============1087281079548371397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1087281079548371397==--
