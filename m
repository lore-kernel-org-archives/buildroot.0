Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEFDCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00FCD60808;
	Sat, 10 Oct 2026 09:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKAuoynTUjEP; Sat, 10 Oct 2026 09:21:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4549C608E0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624113;
	b=Ez00hKrcu2o9PmCwo1gNUluHWObu+tXzy5eAHYtR5jNRE86BXViyrpF2/SN77aSNzDSx
	 yZE1oK/JBxrzdjziQG+sTQlHV545sojCZKSEziUGfwJaxPVcw93QY8Dc33CQ6Mzkt/Czj
	 rA2EoAYpxqgoGGhBlZoUsZ8nMj7sIfi/MgjdD2nOBESoed4ET/XWv9604rW5EVrQNIxwp
	 PEYOKGvqkgjx9dT98D1t8cEIww0aJ1+8XmcGx3uIwuvGpDmzRkaNolZmR1ykyMRzTnhFT
	 cBBgrXQ0wIIsmmRnQK7B4LvseqKltSin4d9HCE+I40+F/v+D6Wc/DMSGiv+C51d5Rvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624113;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=owpS9xISruVnwWGy+0cNiRgaKCVIMK4atLwZ57JWKyI=;
	b=YO7eBb81/IvJaho97qbXGqzevzBAW/tdO7YkAqhjpDG1zBx+/TZmfWlmwiKEKfNRPJ+A
	 DQHmLI4FYsxhvdiEb0aYJUdhTPYIcRapQsGhEsoUIvkA4Ewo/2WwWaN/f74Ad/FdnOy4b
	 DyHJofuPgabwJgLYwXRAF6FScgdShOSmUKy9+07bWNw3f2Pu/zzbvvTOWtG+R6Lgl7RZM
	 0haSM39j3afRkiUBnG+BzcuKbZN8VEL8l6JPr50AmisOLWStMbDZsfX5R0nrPg+sm7BRV
	 byGOAIqJ3QRBhsZQ15i11JnlFLv2s9NHzCxQiSp48y6XsIaxuOF4B1gGnOS2RWARybg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624113;
	bh=owpS9xISruVnwWGy+0cNiRgaKCVIMK4atLwZ57JWKyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pXbaW1SCqnDijbfFo+yyyZh+98KHyN55auvypbk8KfwNYYR8qfDPTcBXzY0OnJk4V
	 qiImeIspuXPGuU34CT3Wg9fvq/BHbsXDcBf2zlopCAMFNcMogibfYmPQuUPRGOWu23
	 COGNszLMWIsJGIBXq4EW41FgS4TEr6ncc7omfpTOlf+a3tKnAmdDtdZCyvuaZGmTt8
	 yJvI+NzqWqITn+M2kC9lpmzEMEVGLMVVcmzX5F2c5sQowPMwbLFnar8JGN16a+KLTI
	 SmBvpcMfpxiV6XhdkZ7y2o0BNoo7lqPV+0u9sDJCttrJk6OeZVrLk+34A/RkWYgNQK
	 M/BiWf/ZJm7OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4549C608E0;
	Sat, 10 Oct 2026 09:21:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25033A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 226D86066F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7Du2nsDSZ88 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 16C9E60727
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=ALiYbkU5aR1MPY4A9DD/QufPMrvWR4atVgmIZiUEh6WzzGOB2aDQMGMAKL3N/pJayLuo
 C5d8tVsvlrOXEGJevJnEstfyzPtax4+at8vaYKd0xFMaC8UusAVRSSy62zf8n6rPjNwa9
 WisdqJDbsnr58MaUo0tJTa6Pt55g/WedaqOATuDZcxsw5gXzipL2gZeZXClsXvxSnDAXK
 KA0PyVlKyH37iKs9JtKaJdozQhxbY0HD4QXtzIp8463JrUJjNXXX9xC1wUymW21UmxaJL
 6s/54zs7hQll0rbCh01lhd7MIpzOLHoUOv83I87ACI522x9rTxkwkW5Ld9RWh2HGLrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dG/BtVvQjYPtYg1wUKiDVNURZvdGkqU/Fi6mS9vFyek=;
 b=IbJvKozLJecn3p4LZe07n+E+m/v55Bwu5O+qgUmoo++aOCuH0NUpw3TVWXd8lt/+BxR0
 5Bkkk1Udkh0iEgwU748FEDXxe1fA070BePw/pDKsZcqFI5SsaQBOLUSCIVFYQzbXb5s8E
 +wBCfUEIy+c+tyPbp485wh20o02HV/+L6e2WoNZRZ5LbnDIQRj7PPCDLnWdLtV91D8Ck4
 4hYR2+m7bAl1pFA8l8PEpWv8RAPGVKmdaqQ3pltMcpDMMRZYInbHPPs52TJmNvDxnWz+h
 aG+U3KcFtj+hz1r/pDTeLY2HhtB+ItK2yApn8O4AkJZxhH07GFuSMWZ8iRMDUKPEqmg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16C9E60727
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00E6B8F065; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:05:24 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 435115dd6ddee08e0847d4496556bd31a2f9feb6
X-Git-Newrev: 17da3206278007e7c44daa62e031760145846454
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.00E6B8F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libpng: security
 bump to version 1.6.59
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
Content-Type: multipart/mixed; boundary="===============6647139004779119386=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6647139004779119386==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17da3206278007e7c44daa62e031760145846454
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/pnggroup/libpng/blob/v1.6.59/ANNOUNCE

Fixes CVE-2026-46675.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 7bb353814c1ed765ec4d634fe47201bd93d60dc2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libpng/libpng.hash | 5 ++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index c387ffbf02..8c3647b8f9 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,4 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.58/
-sha1  6263409a6907d180e7b990827ca84ee944c6cc17  libpng-1.6.58.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.59/
+sha256  d80dd2a38a37f803cb9b6ac7b14bd6e74ddc3b654780a8380bdf93523fdb4389  libpng-1.6.59.tar.xz
 # Locally computed:
-sha256  28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775  libpng-1.6.58.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 1915941b82..eeedd81f8a 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.58
+LIBPNG_VERSION = 1.6.59
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)

--===============6647139004779119386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6647139004779119386==--
