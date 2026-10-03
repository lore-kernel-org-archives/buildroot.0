Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E91BCA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 09:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E93A060E58;
	Sat,  3 Oct 2026 09:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UL_NCvQGktzQ; Sat,  3 Oct 2026 09:16:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1798760E53
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791019006;
	b=HT2HtbAENOW7AzXGo2ME+5R4jWIgIWUVGLnTohHFjJqxJ7+MJOeH/u4l4zU1gdwFBqxr
	 7bZIzAyZ3paQyriLJMj2QYBkcH0H4VdeBWibdr6KVeRpI006XcOKmunfnxWog4Hj75SnL
	 PbBu6RK/tWy+WhAxEwCsp7xGc7eVAFDGkFwi4R5LsiId2xoalZ1FU5IrAUPA/kfmT+k+w
	 ThlbcBPjmRUTZkEMBz2N3VSUhnCDCMiXZXfnEK58aeGD04svotOOkJSaRYsxBHypJjEjS
	 93I4CR+rwQwIqAfivI20jLzRR3dn7gVOIspcmJ/4UfMimq7JBqPMxEow8WK6D6MarNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791019006;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BTevrdYkokJrqRh+GFHpyywjloTT3iZpG7vB3Hw+eCQ=;
	b=sG9XH4eR15Z/LmgPxdYeVzK+lVZARaWeEEnkkfxn0cQKB1G8aUtXcfXxr8tb1oxGMmub
	 r9BjT40/njQsUxV2m58GkNGIJXXxNEscE2qQe/iyUq86xBzxQWKxbX6f+jvq8srYmEoq8
	 PqfUxF9sZLu0lzJqGiHChLb2BYaeZxLLOAN4trROTnZf+Yuqui1cpFq/t9cVEN/LMSwe2
	 3R+YH/EDyX0/rIOG53hsh+TCHjxLbN/8aHfT353TQ6XnkeljiP0lfovm/kgCL6QiAxsVM
	 lwvYqDSEHtEnDhVvVyhfhxClx7FMxeAf3hmW0b57NGBuh56m9W6qttUCRtZvGyZwLDg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791019006;
	bh=BTevrdYkokJrqRh+GFHpyywjloTT3iZpG7vB3Hw+eCQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YIBTjADDUJ9KkgvobN+2JjKwnNoKF5p621LP0OWFq9MYLVnn8FDExoF0+ke74mcNP
	 o9A1GSngMo0wiNxMnB7/MFsx4y1xsJR9OMKjZSEyXycDcBH8L4fGa2V6j43HyqiMzt
	 XWtuoiH540u9Tqdtuo7vjZmohuxyLc06CQbrjBXZI9u607vKcmOSlJzSo7jkYNRQtM
	 9x1R0EfRoMUAGbw/h5/+97hxUOWehONby28zbvnC0puu5sRi8k27aPN8qsMSsirI72
	 mEJaUuZNHiH18JAGekq+z2/JquAk3AoLr8mG6jw7V8DpOjNRZiKQXDnhnK+qQFg65b
	 o0ruks2yoG3mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1798760E53;
	Sat,  3 Oct 2026 09:16:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E235D32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C851B410D0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpuJW5Tv-YZf for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 09:16:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 970DD410CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791018987;
 b=c07o2hfzlbCVAtS1ZgV5F4uTCo1p2/k48F/thdlAadAJ4bNI37sy8A+woqmjhHdDu7EL
 tAMPA3jYyJe1Je9vaR4ncrJyO3uDLesvn+CUThqnIwi7t2SA6YjbOiIjOJPi5iHoX/vDE
 WtnjGCv6Sunte+v/FVXVzm7xodIxNnE3/ppx690xY1q+O/WpyaN68yiEDxnYHBGp0jVRQ
 XPsaB3FOAuvPotWSffNVpLwJgNZyzBr1NFE1p81zpYDPI90RZV4Fr40aVlao5zfyhQSeX
 sMaD0QQg/h7xy2uOXt/ZKgHr8khl5IrjBRU8//518sAgufNRVve8I8JYJXcvUruPlzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791018987;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HQ9SoDmwVzvB/fYpIcBgpJow7tgDGdzgO3gLrA3jTy0=;
 b=maRmj8E3IPFgB/SBArJlhoVzD+Fhe3xy/5dECPusDyCSgeeDKpzDO33QWKfoyOzjSpeo
 4HFAqUowUNbWJmz5Y+irNelISXvC5wcLbsotBRLszfZvFZqB0Ntst/Az1dE15vKoLLsA0
 GJhd00GjvBToH8CDJxESlxhQMuR4hThR8IabLsBN3KfTxD/K1JK+tHEqneAJYfpjsGWBV
 LBIBM1sbxHYHcA4p12TG4xx2fYaqUAy0e3U/lcwd/IhFhmiaTyxoOpyMC02zhyjwf+FBy
 wnbbNMPDpDhaFp1d/VBXOnHd3Cq3IDzNRa1BVGhPRgQM7oqeY6gamste3CK9XeIZ8qg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 970DD410CB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:16:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D709188805; Sat,  3 Oct 2026 09:15:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 11:06:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0691aac1de75377b3dd8d36965ab4a128d5e9cb1
X-Git-Newrev: c2f05a81ad615c47fbf874e5da1e8114368155eb
X-Patchwork-Hint: ignore
Message-Id: <20261003091512.D709188805@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: remove autoreconf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c2f05a81ad615c47fbf874e5da1e8114368155eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 08ad91052b69090b74220d89b13cfc29fb86ed72 removed
0001-riscv-Support-only-RVV-1.0.patch but forgot to remove its
associated autoreconf.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libpng/libpng.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 96afc684db..1915941b82 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -11,8 +11,6 @@ LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SE
 LIBPNG_LICENSE = Libpng-2.0
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_CPE_ID_VENDOR = libpng
-# 0001-riscv-Support-only-RVV-1.0.patch
-LIBPNG_AUTORECONF = YES
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
