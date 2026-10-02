Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E4CCA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B508D40DC4;
	Fri,  2 Oct 2026 19:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkxL-M-GpNiw; Fri,  2 Oct 2026 19:59:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D10C840DC6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790971174;
	b=Qr1++egEndAUMEFvMsO5bxs2wWttzyEJ8YVgDWs1Rstu2UCuaYgLv0VhE6d1TAORNpxm
	 wI5iMCnPMwRusrfc/5aEBrVV1w9vic7I40XHdYjJ9cUYAFAfHcTviw9reNLW7+b1C4c+n
	 EEV/1QBVvoI6bVhUTpzqgRxauzaOphEJ97py0CmPuexK8RiNvVnthnhKTTSOlALUO+VhR
	 tjZAw8RX4NfyNo6DycoB1XSzSpwi4TVd6eFKEKTF41qFxYnwrOZHBDl7uW3HvkOAySyQK
	 44wTL9vclsNuQSRWSiz+0f/IMbQ1wLnjDUxmEtEIay148NOsP9Zu0GZ/lI7L0jUMPZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790971174;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RlNrIjtSvYAe9PAYrqqd5pkWrA5VvhhG6/FtH3RKuoQ=;
	b=mHDeMTHJsT1z9ZhHluJwYaQm6T0venVKxedijT3AVEWWH4LWaBl+E+OgaCe2dxINmajZ
	 NajJxBdDSFXk2bDb1ibEJUSOhOuZ1jANLObnsVz6FHb2/WSmZqZLtxKB0vkGldLOAxU0g
	 mMbTzLUT1A6y1ZVAyBqrQ8PRolOylZxXn6J0GtY0948JEGQpZddKSzXIQDl09ZIwJ2aUP
	 WaV4tHIqpHrK6G3ydiYGIr16StBlj8/sQ/duUma5ZJnjRV1gA1CZqn3+yumgqfYne4h/b
	 vgyX0vS0Lakou/B+BB4Xx2XzeNhenvDFAlSVW3Tz7IwGl7WeMLeDAUyCGTYl7syp5mQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790971174;
	bh=RlNrIjtSvYAe9PAYrqqd5pkWrA5VvhhG6/FtH3RKuoQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f+mgzjdp5+NAw0Lz3SMm6KVHppb0w4e84roGyLLh/jswywIvY8iiyUOEGDoK1jkQg
	 kCcok/jVp82c4ub/ZaRUr1crpDuL+5uStohrwQZHl0Y9CDXWTiOwGu8CpXnCxcpunE
	 bggQlcHMX9f+5kStlsoWJkPGnT9fgmBY+MTEK3gs+s7m/eqDIHHYXFh9bJdIbcC6jr
	 Lfi+Y9SSCmkT0P87tdn3QeGI5hWDn1HHqnwhxswR/dgwjvd9TyvFPMXp3er8E4tsxa
	 VPDxB+MxGviH+wopAHKcx2ennW6e1Mbb5N5/Sn6Aufopub/znSSKHtCnh2M6t/YWY6
	 SkxhwTUPmsl9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10C840DC6;
	Fri,  2 Oct 2026 19:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5506C34E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B407400BC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbFAynrrn1DW for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:59:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 40D574008C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790971172;
 b=fsAotRXTilquT3lb1tq5K1DmKTXkphB1NYNKxBCi+720jTbMTbGG7sGC9o7A8aBz6KDh
 kze89egPoZ8wOBghgvLK8fBxPnXwwrK79/Qg/Xi9xqOfIDaIYeRbb9hSMDGVU0l+RU/OE
 Vid0s06NnQatx8fz+7u4pQBC9Cgy3e0JyBMkelNUH8H7ICJaM1Zn5A0oH47ghP3ReYPo6
 yWCBvg9lPA6xV9LSu89bk/+/w22QFUgS/gPWBPaSQtAROZQcYtok5uZRwz3mgGwm2ExQq
 nmDO8uidOOvxs0QOD0LBgdc7nVRAW/gFHQFy+sxp+DUAR3ArZ+yPJxFJ/k4HaIndYsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790971172;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=v+ucCdz38cn0KtHABy/Nq4zxSrBjAt1GbB9dUBgqxI4=;
 b=sTs5cYIZwsW4pRRqilWeuAEdUefKohlOpARfMaoPg68doxKc08dCu9gqSGnj4TvV4TmL
 Om7j4+C7ghPh2c7RU0NirkNPzKDzgBPAVsd+Ve1DwcbpkcFyic+hPPJSwMOrOCZhBlY4Q
 uJnMhYy7imtR0kPZkiuU2Etz0sBAFwFwcl00evlxV/uc2sD9gDmh86W88fZCrWHxjhvrC
 Hjv7PEk0W6bzAhwCKm9zjM8DyRkaPCFmHQBp2EXmy5tud1OXgNsKl49Mez+K7X1C5xzU8
 EKJafLQxTQWPoIkCwkUDDmiUjvcFWWV0QaYSZ1ATIU0BCQFPfBxslAbSyNXeSn4B3vA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40D574008C
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:59:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4C3E886C2; Fri,  2 Oct 2026 19:58:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:55:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a43f41e10cbad241a6ec693e041446206e8928d9
X-Git-Newrev: 07518e6b6903cd40729b892c3f969f3e584eb015
X-Patchwork-Hint: ignore
Message-Id: <20261002195817.E4C3E886C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-mythtv: bump version to
 21.3.20-Omega
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07518e6b6903cd40729b892c3f969f3e584eb015
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/janbar/pvr.mythtv/blob/21.3.20-Omega/pvr.mythtv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 4e170fc10f..9ce2f1bdd0 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3ca903e325edd82d86ece135f2d669562c7bbeb9399c6605c91e920c32975512  kodi-pvr-mythtv-21.3.6-Omega.tar.gz
+sha256  fff61cba963647e81ae273a974b31c2aab054e1a8c0e20278bb52623cd244921  kodi-pvr-mythtv-21.3.20-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index a37328fedf..1270fa5871 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.3.6-Omega
+KODI_PVR_MYTHTV_VERSION = 21.3.20-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
