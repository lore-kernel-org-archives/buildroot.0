Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB32AC79F9E
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 20:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 133A280AE8;
	Sun,  6 Sep 2026 20:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBUCzvfJFfSq; Sun,  6 Sep 2026 20:40:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AC7C380ADE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788727202;
	b=TEbtVwY9ZRCUaqYVraNveEUUvyNS8FZV1PVbU69EGHqtGcZYwrtM/pA2BIwxr3J4pqOe
	 dUvqXTwj+oqRN3oSghxPA47IJw3qkBl6cWU+RR3TLvWgl0p7F/pKR9Vl76pDpzZuZYX1W
	 8ijnu8n97eSx9bo26MMGE0/CgP6/Jsi4wkt55JZKDst5A8kGcl0VTjqgNtqHrtoSWrIvW
	 +U7Gxofdu0492RQLOyawNjz9Uur0IzzkX/bx7XDWlayvXCovmfcZEoVHzZMXzMRlgztIf
	 4LkwmabfDc9Hl6cG4/pZIyMzyOcRSV3MHPRtOvo55OD6wbu7wrGfuAp3wW5G+3jyqcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788727202;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ntIaL432GOB97ujCEAX29F7Mrs1peh5C5fof7p10iZw=;
	b=D4y9k/6to4aQr28p6g1gcqYyukGDrIVvgw3k/t/FAZu1ejgX7ouacGtjGiuY9Ai9G0Dn
	 g020dKn9iMlXczDWkzOtsfwlRBPtE7KiJTAifKAyUn1ehf/NgQ2DKUf1CA0hbq7U9M2Ex
	 DlBdpvwNTddZcEvREXtSsJbG6TxK5AR5wom2cTJYai3vCrTmfEOUWepXLqKCVB7ZmLD0p
	 3kKG+PWor8h0zsuumwq5ixTmDb9DdG7TGxVZZy7ajrjkJz+RLzoHr8pa45hSIgVDMugN0
	 HOQS1Ld85APLxp0vMmaB8leM2QGCVFWLfGACSgh52Thd4lQJXF29PG20LldmCuk4RXw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788727202;
	bh=ntIaL432GOB97ujCEAX29F7Mrs1peh5C5fof7p10iZw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W1MkxakrspaRDEiGQomFvQELFLA7+WVlpTiEpjqXB75HHJH6BscgiyURT1On+x9Lj
	 7QftWD7KrCEfRm6ys0CSbUEbmTZZjFpE7NXEotL11tJNvt6u6aMdCE/riQjD0X4xCt
	 EJ7pesLYavvqeQVu5r5MfVpQfXMV+gHoDcuKzb3dVdyxZuw4qpXpvYdjxy4NCceHjz
	 gAnkdFPhCg17SQ83R0yhmBBS3ANLWGzH08mThLeFjt+nx9xv9v+wGmKo051GrMLCHF
	 4PanDaaxYSLQhuBrBQ03OFz35RWJugjlCyGYt5XeMCmULbzOGaSLQoXf945A8wz7q+
	 zvmr6zFhE4ASw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC7C380ADE;
	Sun,  6 Sep 2026 20:40:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C4FA970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DC1080ADE
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMisAbPpEwhf for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 20:40:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 66F5A80998
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788727200;
 b=f94f+JsKUo61BdF+zRKbkLZGlFVMtvoRhRdyJLQ/j0FhDIx4k5etb8x0+CQuPzLv520H
 jb4Gwua1V4N/RaRAKLukI38zXfegJPZfvGmvlGv1EQHS+52LJvYoCqRFn1SwbDgV6uZ3u
 kzWijcFOBTI1FeCN2RHNOotcek4pSvg5sl/vVuxusuFWasey7uCcx3P3hHGVc2XJbIACS
 mBEo2FliEP2lUL9nT65OTX08f/74a0Jf98coNnzeDf/FdR5djLligYyQHsxiPbX8Y/LW7
 FHRbwlc0x4O+q/ls8pNZ8vimi+6N4raY1QquWjGhFcvF+je5rd5r5GnI7e5O7n+RGHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788727200;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=e3fTyuOceKYiBlRGJvcbULnCLQgvJFmw3UgWWtfzjlA=;
 b=k91yvbBJLi7M48jRyTuY/menio3+UwQz4UXqlj8pFa9N4JJ3BQbGeuhy0G4CASV1Sbkp
 43cM0C/8QFIgjpm7Z+fTv5X+8lG+0CL3rb38hNEJ9UEu58CheutHKuzBZExVcHHymsFGb
 bUIqjns7LvMfboPaSA99s2xtvcNepT9a336EnWP+7kZKAIrMosIpgEZi4xgDvhmbxYVa6
 bfAiddE4w03cygY1S0XpFDeVgeu91hugi777vfqO2yVUYUeoF9GuD7wnTLsfAbRnPq0EV
 ou5TH+2Vb3xGRkk+dpiWvgAwLWdNk4DugrIq8sKIp4StA6o/vDS/w8zEy150ydbIxjw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66F5A80998
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B94F595479; Sun,  6 Sep 2026 20:38:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 22:35:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0c5a20073a8899a29f6e27ab191a36c56196ebb
X-Git-Newrev: 531be778bd4bfc98142f372d1f4136d8a0759d8d
X-Patchwork-Hint: ignore
Message-Id: <20260906203858.B94F595479@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: bump version to 1.26.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/531be778bd4bfc98142f372d1f4136d8a0759d8d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://nlnetlabs.nl/projects/unbound/download/#unbound-1-26-0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 85724ca243..a6bab2218a 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.asc
 # with key: 231018690C4D903EF419146AA144323DEAACDF45
-sha256  0d92275c703d5f5f8baba3dab22117dd8c29b495588a5c229768ed6581566600  unbound-1.25.2.tar.gz
+sha256  77458a7156e275c0b7b17fabcb357cb12445d95cfcb26fb9bb7d5ecba45e0b63  unbound-1.26.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 46fca5e2d2..a3a1baaa94 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.25.2
+UNBOUND_VERSION = 1.26.0
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
