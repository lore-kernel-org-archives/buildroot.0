Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC72CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 398A460B3A;
	Fri, 16 Oct 2026 13:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsfJcg5mfVXW; Fri, 16 Oct 2026 13:09:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2EAFD60BB1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156150;
	b=Q4nUoHBuNihRQbls5V7fNqSUTrz3elaiSb/xlls0pVThdA++VvnsxIBAv8oXew8vjM8d
	 HoBpa54CgHWvgd9V67YlJqNXit532ZoJx5zW1JQYWjI2nAA6s2bo3UOVQ3YXn91clxRGK
	 rghpr77ePmQfAiYUak4PzgYFvESnYHjgAWBdr2sf/5PavALaDBtAOe9mbYMIWuxtv7Hs4
	 3TdANOWT5W9cmaq+w+3onKZaDUzWV3ckPNLHUThjuw1YYU9GYIo+X8Kgki/iM4oq6yjZP
	 NnglN2Gv6vjhu+7zgcgLBxFNm7TdMTAn5Lma4QTL2NlM9Pkf5TmwfzWfzjnXCc8yFJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156150;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=pvuJ80EhApa6gfs71/X2kzEVybM2TyMq2KtVe3sCjRk=;
	b=hILaLSmbl1zd0goZcykTiYRPzV76GI7kVGxEas1Gja+s6FJ+vnEHhfb2mzfHURcSDgQT
	 mZRieb716ezZpEE1UE6VHsttpakG5n07GmjwWDp/um+zE8fX6VgKIRV8R3BowQBJ2oueA
	 ENSUkqA1hOus4ZYw/FQe6aXEe/SpVjecWzEWsEGCpSjUwQKLr3jCIuCTm97jzSW+r7/Ob
	 OAjFgKP7zj8e7vYcfJOGmm9xENS5dhxc8Y/EelL3QHboa1FVqmlN2HIZvoaqUZsGi1qP0
	 e/6P3s1RxNfHetIEaCkiAhVlR9nT+2OmbkTctxyQAU64O/dVsK7WdLBp5Jcc4omZrjQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156150;
	bh=pvuJ80EhApa6gfs71/X2kzEVybM2TyMq2KtVe3sCjRk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jK06Uo+ZtneVgeQ7NXFmB1/+LU2se0ZLi25PMbFbPu0pPOc1D7LO6a77AdjZHlMEv
	 mFVmc1w8++f0s0paUcekWhPg2WNYkXs7tFQ2X7HRzLyPXLInaCMYLFUiSrMvImFzH/
	 xPlRqWZ6VKRGK5zawffDfzoIthkzFHWOsXiNfJvFpxVHVFYk61WG9RGPkGao0GfXr2
	 LSQNnca/rIfIN1eOJPg9zxpDHLMxQJ9mJ12pRm6qDIv/HSSSiHcMlkST3fLjZULf7T
	 WQRFmIDDIWCh9l0x55Z5HegqZ44EmRjKi4/vUHON6PdkcPLHCyXqWoSZL++q93a8w+
	 K7L0KwKpqSmww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EAFD60BB1;
	Fri, 16 Oct 2026 13:09:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8A52F45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C645140A12
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bj5GS3PZaRx7 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 28363409F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=frpyXRlxeLpnsWuWMg5mEf+dFmewJyYMs8mOK687gZY42a1GuydgEWDKJn5FHryTEzI9
 VvTgsHpEfBWqdCTzPrc0CMA/kb2kFCDnSssaAOWjAWh58H6XjUqxEu9WbS8Tm/oWRII3Z
 m9ft3JaX/x1HnVTWUeD2V9ab+rmWa8+3a1nt4uAJUfWxZ0LLGhhbxonw2yCtktCCStWKP
 TcldTWz4OUPfpJ5X2sFMMvKX7iMArayk706zq5N6z2P9JiZ/A46IYYJ41oeCX0ppg7UQa
 qWiG2Xs7WFofEg4T3ObGYIj9IjchEGEdmXViP9W6GncdW7Z98tyz3/lplWBa8lW2rYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LBZMH4Sl1asretEGoLsD8qSTUyYRZTgmOpdmYnklexg=;
 b=RtjodOc5We++oJk3VykuZU7K9DCbJzdZcLa1L2PJ4UorUSAkSNbxAJ5N+fzTd+hu9NA8
 bSPF0ENiHZnYewXwr8qavaikrow2UlRJy/cerr25H5vz+uB1d7aUIixgGhOoLrTpcZiKM
 LFim6varGEI+TkAjQjLrwozl1Nbu16a6P6QKnidsMHj393/CQpUTXTKe3kLqksDTRzI5h
 5nQEhERcFp8Dy8oHToMZJDKzqfNDc74JJkZ2fNVgz9R7xEdJvqNoJjyXlY47NKKJfNBw2
 l6ROyeM/+2gj59EseKivQQKC320lBFn3kQASnN4tv9pudpOgPlpt3HPqbWTrnVbmITw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28363409F3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 196EF960D8; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c9e3354ba2bb2a73c86dd4bb25151b2ea8160989
X-Git-Newrev: 12d1ac304ff5703f2f3d97dd0b1de3fdd0a85b42
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.196EF960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-generic.mk:
 drop RAWNAME variable
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7363019525799716478=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7363019525799716478==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/12d1ac304ff5703f2f3d97dd0b1de3fdd0a85b42
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This was added in commit 7a41cbf938 ("package: fix patching procedure for
host packages") to figure out where to find patches, but this was reworked
in commit 99d4180eda ("package/pkg-generic.mk: factor out patch
directories") to instead use <FOO>_RAWNAME, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ade0757d7f26314b421719e12e3f51b04d53fb3f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pkg-generic.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7d808ea834..ab47721e66 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1085,7 +1085,6 @@ $$($(2)_TARGET_CONFIGURE):		NAME=$(1)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-$$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)

--===============7363019525799716478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7363019525799716478==--
