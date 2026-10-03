Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D06CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 09:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4703C812F9;
	Sat,  3 Oct 2026 09:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JY9lcMGHQ-L0; Sat,  3 Oct 2026 09:16:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8C739812DF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791019004;
	b=UzanH0gVYvPdtj3tPdx8/ZE8qj3kTSv/5SmJzf3JvVDinhDVZk4kYO0+8vEaSotZ6jOJ
	 gLh9id9SWxuntK7Ezr2FgqKTZT8CtKOKhr9yAnfMidtrL3PtNuM2SQ7rtllGcWTlRF/Xf
	 utwrge5HM6R1Q3xI3P4RGy+phGzCt00Dxkw8Dh8Dz9AyyLwpNIRFzrEOTnYTZtGEaVF7I
	 M5BCt4dTjGY9SSLOZ+PsKKiAjuT9HdECnY+8P1SKg1tIhDDIZvH8euZL0wZwvyjX5pX+m
	 EDa3pIF2Ah9BGm7HDNHRdsypy8cf5uG5tVF491QQYL/7hYeIunopkERBIFP8puIl0JA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791019004;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4intD2d6w95/l+kNr6lXX2Hoxwuxg5tT9j5TOWvg3EQ=;
	b=ZEXD01ZOWaukKHrt/CgopDg3pOZzXi4fLauzRidRFYjsQGGYCuaEt97sqXOMC+gQCoDz
	 ZmRQ9oeV22xmSBab7blLpWA5vM1viy51QQoscfzw8zN6NFok6LJKPeK0ydQqo+DPPvAHl
	 RcsmKSyKDHqbFVEJGH7c7zIb9WpG5pWZl54d//hJzO8psyZ6kzGUJfMubs8b3QfDcI4vY
	 2bHQ4jE0XekZjAgphiD+qjKzcsjRFPhISeIyybtr+zImcsVl47DOWOgQhtBdwqIRBGwSR
	 MGm0aCajNN8xyRDhWiUAvJvxk+AOKmYiV9X2fvt8sx2R8tRvCP0zOHeV3kjgSmVVz5A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791019004;
	bh=4intD2d6w95/l+kNr6lXX2Hoxwuxg5tT9j5TOWvg3EQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ysdjs6VlFZhjiwoX/2hRrb/+hfTDCSRVuIaxeHC5l5Hh0KTTb4LJiD8EyhZgbOYy4
	 XyqSKGWr9LCYB32CL66YzvrjbPTC6MmPj6fcUnp4ZYULT+NQYqXo1kv8XbijfVP7iT
	 XM6T/wK8iX6v/l/N7Fx4JCmM3y+bq1LNy8VVrGEQDGRbO+bqPH3owdl3GBP4PZoSoX
	 cahay9IgUrjucLXewD1yi2879oGA6YTsCVgJIJHVMvcGSDKQf0rHJPUuJrCAlWuzqt
	 6iaSo3NnLjCO/n5oyjjdBY4MMHF+2mYYgdaSDFdMm1Wrmna5DHOHQn306qMarMPf7U
	 C6Fp5UYSgaxHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C739812DF;
	Sat,  3 Oct 2026 09:16:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 733E32E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6470540059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvlOmhIWVqwK for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 09:16:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8F675400F6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791018987;
 b=KSciueKJ6mRkf2TQElkAIqgvwzfV8QdA7YveUEJGpz/i8iKRK5m4YZd9Lp1k6gMIEKwf
 R1qSgJMcB3Ze+v/RZXhfAUxxMUDW1XrIDUGzh50DDVBR9nzuzgnDaa0GeyXCGiSzizLcW
 BvalaPXSnPBBDlClm1gvz5U1K0HUF1VSGAyoPaesPmbohd6BFMJaJnTuLb9LHtwVCyN75
 eL6z8j6pXoCft+BWOfQhngmvUwR6VjCf9LCKvT//gS1ZyBUwzMlma/5S1+XaJe7v3ZOSW
 dSameQ42Ipq0z4q685Gka0RQFBmrRa5YsL+2kGcAuQrJxvZhrIi52J3sp9+yMxA1Upg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791018987;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xAwC7vn5OVhW+ilIyoH8Us4rYc4KiLvC3cgee2Vxtco=;
 b=tb1bLWn3gwexwyPPVi2zPHx6IdHwuKXBGVYkWyHF5Yk5RiKFpsH4tC6sArOK+ssPbB0p
 WF16IuJkuey/PBCmjUfRPPnuiK+GrcC2OUTNLkCDrRN6ni6m+imPr+3VSPhZuEvXyOI+5
 IvyLlVlTCGfwJNAgsGAAycUJ/fUqf2gN3le2hucnhTdP6WVbQH9YGlBMTURjXq3rdEKbU
 tE4AN6iH7+6PC0gWv6C9zGlcL6oNX9l/kJ/pkmZVRtemj2ghO2sYGttaoQPV7h47LrqGi
 d80VA2OScO2IzZDPRPN/1OL7DVfuVfGE1hCozbYN95A8z+g7ja64HVzrX0GoAQATtqw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F675400F6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:16:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E44E188806; Sat,  3 Oct 2026 09:15:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 11:06:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2f05a81ad615c47fbf874e5da1e8114368155eb
X-Git-Newrev: 7bb353814c1ed765ec4d634fe47201bd93d60dc2
X-Patchwork-Hint: ignore
Message-Id: <20261003091512.E44E188806@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: security bump to version
 1.6.59
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7bb353814c1ed765ec4d634fe47201bd93d60dc2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pnggroup/libpng/blob/v1.6.59/ANNOUNCE

Fixes CVE-2026-46675.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
