Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F63CC61DE2
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 07:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE3D6061A;
	Sun, 30 Aug 2026 07:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_nnFX_B0TzR; Sun, 30 Aug 2026 07:51:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788076296;
	bh=zWScitgKiOemMhmWfQsjaWQ05hS9RjV2M9UneK3/6Yo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fn7maYSJmS9TRQKkst9wbZljjiXja0jcO6vYG0duc4Lz+VLKV2nKpd1tsed6k04i6
	 jYoyMPXOBXMQZ9QARilgWErTtBM7M0JShskcRcsQWxo/ZkGyurhU7VSn+WBYhwHdrL
	 rnDqosR8MBTltuf593soJiLDJf+XVRXE9Dj2QDGIFL4IiLvEC8a69MiHBa8jCJum4l
	 KQwCG6YG3Q0tzfFSb32cbvuFaw5VKwxQJ1sasMXcxvyoWxEB8AqNI0lP3C0TmIIUFd
	 4chxyTgKJtF8mZWcetb07Umn3AtoHcXNqgh5bc+KPdVx5Ku+JoaIorT7jJpmGtFIQt
	 bB7Z8vbY5AghA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E599E60611;
	Sun, 30 Aug 2026 07:51:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57E1834E
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 07:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55BA44068E
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 07:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_zM4fz9_CXS for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 07:51:33 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=iCs8m8g0
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1BE740506
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 07:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1788076287; bh=2CO+DoStZ1/PqFoYYw3G8Q/fwrlM5ahkT9bJ3NRmCbQ=;
 h=From:To:Cc:Subject:Date;
 b=iCs8m8g0Pu1/vA84Sp/Mo7YmFVvAu7IsNCbj6Y3rE+MmRXck6TxKS14Yybcb23JCe
 Iktz+z/yk7bxWgsyMYGBJtwehZ6QB0ahQilOvZUxxy3k4ZysAJPjDPE8M04NH+zcts
 cI1qa/c/A6Y93wSJBdi+5NyvXSGUUXIMVOwAXQls=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id C4E18BDE2B17;
 Sun, 30 Aug 2026 09:51:26 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Sun, 30 Aug 2026 09:51:06 +0200
Message-ID: <20260830075108.767345-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 0.24.15 change log: 

* protocol
	fix crash on "sticker delete" and "sticker find"
* database
	upnp: fix crash bug
* input
	alsa, curl, nfs: fix stalled transfers
* playlist
	asx, pls, rss, xspf: limit to 16 MB
	cue: fix problem playing CUE tracks in music directory root
* player
	fix noise with replay gain and cross-fade

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index bf9ed653fd..7d0c2072d8 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  367e85debb4427605cccb5415f2858ebb401d849a80615553f59520f4640811e  mpd-0.24.14.tar.xz
+sha256  524c70bce3fcd268016156bdc97abcf5be1904f0c6fd622688999123e3c4c457  mpd-0.24.15.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index d063d509f4..4db0aee7cb 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).14
+MPD_VERSION = $(MPD_VERSION_MAJOR).15
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
