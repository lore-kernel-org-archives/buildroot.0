Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02C2CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B80FB60F0C;
	Sat, 10 Oct 2026 09:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyuGstnhFxpN; Sat, 10 Oct 2026 09:28:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4990360F1B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624487;
	b=ASNSKYkla4qxOWlASb+CgCwUS8eMGjvOhlzt8u2ujw3Z1BcUj5U8jY+F/5OsRThx9XYB
	 lm1VcoAa/oKK9VA/jVAqOvis9F9xVdvltMUyScIrouEPaAKox2ZERAO0gBnsKeIuIYMfj
	 G3z0O1bQmU8g+CONiTsYe1ZiFwVKd9mV57FayKIhgokoioxYWwrh5SDR6EIHi43ZehxE2
	 lKAAyHLO6Z52Vc5cAl6xaCnEYC5enXMvp6Gj24wU95GzlSam3SVoHBFWgtP6WngojzeWe
	 DUMZp2A51Cyi1i6WVFt1PzfbucGVCZ3NIPOL9gNTU0a3cqRE/RHjOsrxHRurk2iak2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624487;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sMHDfcWRXOl2DGQVHWdf6eZxXX8tZne0sBWkucRQvRA=;
	b=enGX021c+jgDgJnAY0N6hM5Ec2a9ADXAEu32FKmFchRGlwg30K//gEfPo3rNKaa6JNo8
	 t2AXe/wmSMjeL2UvdgPcwZizehGXL8hzoVAUKdMd72a5L/BJdQohjUMPKkAfkGmBlq0Oo
	 UQlbOjhWBKnafYpSYW9Fi/1f12ZL3QffuydbLqDxneRzWzShse3R3DsmVKYW8NynqCk8G
	 N6E8ITWAApClSb2YKsH8ru3WM+6M9JVbURuFOLJZozs230DQq1DvIa+qGpkY3QXwW88gE
	 w2J4vNP4II4KQyWsvEruoeRd4IHApPfwlti5dc9CwwvtlP+XLvNnwwFn6Xn7WvjuSLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624487;
	bh=sMHDfcWRXOl2DGQVHWdf6eZxXX8tZne0sBWkucRQvRA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vgkc51RvV6r2tyIwzDJwJ3zw+sQixqVLqvQDRHRkSpXrmL12ZAyjnbsWmEfhXaUSI
	 2hMgp0USNoa9/77kQyjNKxfP85dnhyNL3BFflrdCYmNVCWT/UZNKpei/PsrDkm931s
	 8uQdux6jvM97afshrrvRUU4QjAttprLJwfm/N/ErCGey8nYgvsIAGQQIdVhVUrByYP
	 rCT/F0Yc9ckN2WNUk4b4Ox7c2BGp5qS8i/xoB3t0XBwsMaM4tKq/C75sC94xVG/CZC
	 Eg3MUwbQzOEWKetHm/cyEag42RHcFKMX/pKeoD0HDcl1BpEY3QvFXlbba7fRoxp94s
	 WrcvfGfKUmRDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4990360F1B;
	Sat, 10 Oct 2026 09:28:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A0C4DDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87D3880F85
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ibls1-gGUb8M for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7E97C81170
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=H81wzDarR14pAmsnZHPFDiYNGV84fIH7pB4VoCl6Qk+chUYoPOb2ZwwF6J6GjKT6ifuD
 Z1YbZalmCK0OdemMpj4fd9DgjSqYscMOUEnjIXtYrotXbQTG8TsONV2m0tQUTXz6BDHYD
 SfYvE+xg7zPwu2X0AS09W/lsq5PUg8UObA7ZrxSU4HnuE6jNGKMBKmDCVVMQG9I2CwhDE
 42qJ6F245DEUN0X1rezt7g9cMjDCPrmOcmx3cC4JJrqi5BfriVc/7MdTChGhAp3qttDyY
 EoEzO0u4Z6XvbQ9KBDOlhE584DQPHz/CJIDL7LiKdW5P/jTrAYen8MpM3djOGTYiSCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wi3BG8YDYh8xPqvXRXI0Xk5qOlqm3Cj9Y2awloIhT+U=;
 b=ESpqylDJfYCr7PsWUbjEKN7Jv0b94i67p2RvVZUKSB7Q6tNYF5LfivRD0lYD6a5FGJYu
 rjWITqYhz5tpMh7JRrJnZPvl2eFx+bkTrvHIOqd6Aie/bikSB6OCVTz1aG5ev4/8SMiZa
 BTLv8GurSm6+MzaBFzQ+38+RVawt8VV3jaMqjPuhyogfIVFGiM1SLQHsxd148AGPbQsFL
 CyF1dMeaURMzUwv3yhVQhheMhJplAhXS4N0UfMEm+cWDnOpdCOFnDlJFx/wqlxsUkytxi
 QaUe8izowBKERmSdourxHhlN6EOo+HBis85XSJ0wN9vOojCBC+3NHfP53VV6kPU/Nnw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E97C81170
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67BD58F1BD; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:56:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4029acf22e775a3fb2154ed75f333bace90bd392
X-Git-Newrev: c26b6aeb411ac040fadf6015570d548195b7405f
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.67BD58F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libseccomp:
 security bump to version 2.6.1
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
Content-Type: multipart/mixed; boundary="===============3389882951168399798=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3389882951168399798==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c26b6aeb411ac040fadf6015570d548195b7405f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The upstream changelog [1] lists three security fixes (without CVEs):

* Incorrect 64-bit comparison merge in libseccomp can weaken seccomp filters
  https://github.com/seccomp/libseccomp/security/advisories/GHSA-4q85-33p6-j5g6

* Oversized seccomp filters can trigger libseccomp double free
  https://github.com/seccomp/libseccomp/security/advisories/GHSA-46fr-jh49-xvhx

* Oversized seccomp filters can trigger libseccomp heap corruption
  https://github.com/seccomp/libseccomp/security/advisories/GHSA-2hqh-5c36-grrm

[1] https://github.com/seccomp/libseccomp/releases/tag/v2.6.1

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 18f6446b4f29571c3cdd0c241baa975de011edce)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libseccomp/libseccomp.hash | 4 ++--
 package/libseccomp/libseccomp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index aaadc8424e..58aee03e6c 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,4 +1,4 @@
-# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.0 (PGP-signed checksum)
-sha256  83b6085232d1588c379dc9b9cae47bb37407cf262e6e74993c61ba72d2a784dc  libseccomp-2.6.0.tar.gz
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.1 (PGP-signed checksum)
+sha256  501f66c667225d53791b97e1d7cf85ab764c297d04881f60f38f451c4b0ee1be  libseccomp-2.6.1.tar.gz
 # Locally calculated
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 26585b1887..e1d1271d71 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.6.0
+LIBSECCOMP_VERSION = 2.6.1
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE

--===============3389882951168399798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3389882951168399798==--
