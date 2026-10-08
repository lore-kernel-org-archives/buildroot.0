Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5C0CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68C6660BB6;
	Sat, 10 Oct 2026 09:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTTTOEZgLJ7V; Sat, 10 Oct 2026 09:27:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6639460ECE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624470;
	b=YOQnQppWe9/htSgkv1Qv8BeLbuXe6CWuxpw3ztABAL3CH1CbTwrymm/MzRuwHnkAmrds
	 OojrX60QYO2Y/v5OnNkZn6BplP2LDCoA4jzqPEc4lWVUE4OcdWR7y5pswUWnNswPVGFZ9
	 W6S576JGOR0SiYAyCRxHhXk1aY7wz56Yupl7M19YunggsANFMNtxYBu4kMZh3j9XtPFkG
	 2eOe0S3Kn/+CRNnRhzGmMHVf+EIfjON/9vhKxr/P5siwc8ZASfGDW4s2/mSAOAW5dpG1g
	 xnRomDndLUhktwGmxfEKAVS7dVClxHOUGiV5/1XeIGiT14t5CZJKJ4lqvwcRqAS9Hpw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624470;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=3LMt6T/wCshWfo3E0JvkPdsK8iFO6J2Xi6xmLNfXwZE=;
	b=VZ67zubZrg/7iNnu9LWSaE9AClJ0S6VoFvD2oCmRgAl2TZRcNpE6Za549iFXJnN6fylC
	 TBkGyGocmmj6rFCvaimoIZUVaVi/qIX0M9C3s/ldSz39ta1fq5nel8udJqxYnXPK8YMYG
	 h2LZFrv2kCMb9n0iMwD7UaeR0eF+fgmBk2n+AK9cIh2BOH360N2dbz/NaHwKlDszDBovu
	 z8YaPKUPFvruYCTOBYhqg4fUYL04yY0cW7F0p6A+o0QEXPetiuF/Z6fZyeEgduhLJiNqT
	 ckzR5AMPy5yObM/w/Rtv/yCC9bK36SSPL8uRLBDHkizhZ7LKwPS5exQx3l2+2S7nwxQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624470;
	bh=3LMt6T/wCshWfo3E0JvkPdsK8iFO6J2Xi6xmLNfXwZE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OB4MsdikPtvaTXDrCj93f9k7vtkKfQCu3kPeUM7Ek2NVdDFwQCn5d8mQiS/BnbinV
	 dkvR+vUb4iO/hvgS06l1xW397AdXr2LtrIeucd/H9+epZdQNOlibEgBgKBEyQ3KIX4
	 A4BTIOfF8BF2b27GlLF4E/5C7siX28gAVSUzPQ9953s1BNcjklzx/csSHe836aFiCz
	 qk2GrQ903oUzRXc8b3zVSPISJ/768T45iXU47ZcP+Vjy6hB+n7IeOkNOi1De16tLmj
	 ckbhPv1fwmbKJIPW9r8zJfv+09p39ortvjVyyGhjlnd7NFWkxrANdR0QO7e8ePb1uN
	 fOkVaUaLsJUrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6639460ECE;
	Sat, 10 Oct 2026 09:27:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13346DDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0027180F85
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUx4dDaGYnl7 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EBAD1811BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=i50LaqQhPRJZpNVRRk9vn2n/xrvSvfJ2BRCMkX1HNQVm3EiwAHQb7EQZrj7VpNJtsevy
 OhRbr//M0RUkcSBLBxGXpEhlb9z61+yemeI8nBmVwsIMESnQ7muLn9KgVIViVyAty3gNs
 cFMxtT+qiSMmwWh5PwRjeNSKhrOgaQ0vRDFGQqRgiSvz2vzWay3fpoebMIZaht51GvV6e
 feVDbbAYTkcx5p5VK5bzEDGzcgGTqpAYs5AdF+++uds5vKBJ3EH8D6M+SzZC60lwAy+mb
 iJO10+3L6NB7MLZzpsuNUXT6+ZYGGmYC2f/PoBaxfKHlCklwZIfu0yWrhxZNTFI3Hrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GKNo/z1/jLJ0e8HMQSo0tPkKk9cjCBpj9B0OlAoE3Vs=;
 b=D6wxccRWtAKPBulMaArIdgegcMz8axSDLs5eRenF6tZfAs+V+3HtI3L4ds6hf+oPS+Ug
 3Vh2dqFsLDQ+QTxGMY6qLKhvjWtk5jaTQj7dkk2mJEA50BYIo4MbeSldnQKD3TgZxVc5B
 X26JD2h8OrZuWULx/ojHTXQ428oOxJjHqF6Br6G4Qgraa7v59wwUL3BZnuWkxj7BtWKib
 VlHmBpuIP9TUTWvY83CWvBOfUUOthwfhQfTL/W3nbgoTmWWeVb9WrAklrA0nAohXF4w9U
 Zvr3ukHabfQ3Yq1zSXevYTeC5wKeICa3brmYltWLypUwy9XHwQseZn98YOXboV0M0ow==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBAD1811BE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D51E78F0B1; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:05:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4ea2bdb452b914ce5b3c77975a925b0a42b057ef
X-Git-Newrev: 6a804f7557f22d963dc8eb9b7d20b1fe783498c3
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.D51E78F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpng: security
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
Content-Type: multipart/mixed; boundary="===============4503674629223159235=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4503674629223159235==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a804f7557f22d963dc8eb9b7d20b1fe783498c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 4ab571132f..2581e84908 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.58
+LIBPNG_VERSION = 1.6.59
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)

--===============4503674629223159235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4503674629223159235==--
