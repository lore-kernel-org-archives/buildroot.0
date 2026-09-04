Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCD4C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 20:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B91028116D;
	Fri,  4 Sep 2026 20:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqFZID7hT4Md; Fri,  4 Sep 2026 20:40:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DA05C81156
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788554417;
	b=GsgdjqybV21SNVsECRvKZ9Yu2tBHNr5zuWlTVzuiaUPVVzFo1uF65BE93DrU7facgDCk
	 vCkHhRLfXESNCCC9MmeN2N3QfDgZdWwj7QVz24nLJR6qAQcscaMIqfZ3k9AbOArO8N59a
	 E2YemgB4mWxajxdeIEuqYvBN3hvDrT/FPBeuMG4gykpRxxcr8pwnDjMHXK/od9q+Xgqpq
	 rLNnzdTo+7T9JJUeovCv2lJBELlNmHuLJbXQn6JLuqvR/qnKXQxvKDn4Mqr3lMNxANDwq
	 6QcXTORXHYwdY9tiUvJHjFCWfg+buhKuAa+jo5GsSHtL1z6EFChKXCjFqF/lM4OhJnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788554417;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yXrS6nKpDkae7Tw1AysBss570S14NDexl2V5ObIgOkg=;
	b=fcDMbJwsUhdC5ZVru0UrFWcvS4HHEx5VMx8r3BrDXw3miL1A7sM2g+AaREmoFHPWCZE1
	 uOyszwqdGQQZ7dTqIPbrBoja0dNyIgn0g5XjH5MWYQJd9P2TyQCX2YaH9a8DTdBLk6vNg
	 x3LdtpPZbY/30m1vtB/zlmUxDWtPgM6h8G2xAS506fNP8ZN0idWN6kh6TRCpcE6goufwd
	 j1gzgJYKW5nX32Wy2HoOtJ4h660ZTImYz1f9aPP4k9FfRG4hYh8fngbDHCVcmxV0idbpn
	 g4UL3VqHwejP4XXNABOzeknWT9BlA+MvYZBjRT0p4pkM5G9dJo7Lt9zhh/ACEfj7t3Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788554416;
	bh=yXrS6nKpDkae7Tw1AysBss570S14NDexl2V5ObIgOkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QaNFHKhgmrCKU9GEDgqIrry0DslSrXq7yaowz1zWA5cCyaU3ItCgeRENWKtx+rQrs
	 sXq7g6LJCOvanyfJXZbCGqa4UXYiedXuI/zyWkaAtE62Th9/MjJldqzTOcioLDCrr9
	 t3dVXZmGz0wpLhuh8w2agtlPNn8i+dLQy4pwjV4/RUERx18oCwgBBPfivgo7lty2Mi
	 XFROrs0VxtRoHw5dAxG0kWLh17/VTKcyH6Sz3e8IGwJOorWyOAHCLJud+ssZwn6Iz8
	 KWBPv3/P3ME/nySnhC0kcX/h9xSTlgmnqdPnjO7479GonKYQM14+kFRzj2taniXdLQ
	 ntUQCDtCnrvuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA05C81156;
	Fri,  4 Sep 2026 20:40:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05B80136A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB41E60B8A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DXcKp6VnGGV for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 20:40:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3E6E760B89
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788554415;
 b=bIkum+xZgGwXsDz7Y05wMYwK/jUVQFLSoV3gd0ulwSjiALA1C3N+UkGNRbEcN9U7ch1F
 zEpIrTAtijbO4cyxYAwKnhh3zfd0aGB1VQ3S7mJPedSnXZtcIySrllRdESDhaDuXanJ/5
 LGTISJODRpOEVor3sskSv4mutrNi5RaDD6kox1V9btLVto/XGQxG2ZMgwsPvpkIye4KBw
 c389bZj1HVpsHEu/9jz/oErm3VA+yz/qWnNFnbSQmPLXpq5gj+lTt8U5codBe7turqtZf
 xnl5Kw8oIFqaJpxTYR2ayMX1p/I1LdvswCSxYrD6zsK7ozyMrf9Yygd/yeTKGUF2xTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788554415;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DUhGTHs+DbCS8GxU8BvpeesLrmP6ul0R0VKSFqhDv0k=;
 b=GPvCps+h8b3lnSi2Uv+sgfW9+ueza8nAMTSIz88Fpwq//tG0VsfWZJYzPZ9zfwfkxP8f
 fj5epCmfsM3VvJhzb/dsYTLrIyN3O8YuJ3KzwVYEjCy9y16N31WW1QC8GFNhtEYf8nG3C
 AaB0KQjf2aNMw3QrRqBQQzZX1y9NUIqnUYDiBbqVuMvffTPIR+OQA2Q5BHX3+eCQibZof
 nH2aVAqphazeQ7UdP6pv/GTfHWV6QvarKwLzf4+cd4KK7uhZVSKBHFhLqytOD/5V8jmX/
 mvBoxuklFpZ7OBoBDqlSZ+qGeGBmHoI6zEVIpbpr6rSoMOvNshCKwwdhk7KDk73sU8Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E6E760B89
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:40:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87C1D94D7F; Fri,  4 Sep 2026 20:39:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 22:37:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f2687795595c9af579312c1d504373ece56f43f
X-Git-Newrev: df61b7e9bb460ed0fa017394af4eec7da4f82a0d
X-Patchwork-Hint: ignore
Message-Id: <20260904203914.87C1D94D7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dejavu: add missing license
 information
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df61b7e9bb460ed0fa017394af4eec7da4f82a0d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

DEJAVU_LICENSE is primarily BitstreamVera. The license file also
specifies that DejaVu-specific changes and certain math extensions are
in the Public Domain. This matches the licensing logic used by
OpenEmbedded/Yocto.

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
[Fiona: wrap lines in commit message]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/dejavu/dejavu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dejavu/dejavu.mk b/package/dejavu/dejavu.mk
index 9b57f0992e..bcb8675442 100644
--- a/package/dejavu/dejavu.mk
+++ b/package/dejavu/dejavu.mk
@@ -7,6 +7,7 @@
 DEJAVU_VERSION = 2.37
 DEJAVU_SITE = https://sourceforge.net/projects/dejavu/files/dejavu/$(DEJAVU_VERSION)
 DEJAVU_SOURCE = dejavu-fonts-ttf-$(DEJAVU_VERSION).tar.bz2
+DEJAVU_LICENSE = Bitstream-Vera
 DEJAVU_LICENSE_FILES = LICENSE
 
 DEJAVU_FONTS_INSTALL =
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
