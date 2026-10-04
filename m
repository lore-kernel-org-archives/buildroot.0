Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7364CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 19:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D72A60719;
	Sun,  4 Oct 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0Pwr6b8DSGI; Sun,  4 Oct 2026 19:40:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9D02060706
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791142832;
	b=qg18K7biL6AufXe2y+056eGDCGHHk/7HBTDjvg16zV4TkpiuzzN+tE9f8AIynEbHwq+M
	 YwbBnIM4VLjcyELJ4UYgdSe1ehDlxAa34Mp54TnNTec5OHD6ooq/oJLyoWn6QODHIIX4z
	 HWuuZ//BewEZgq43jkH/fFR4PiFQat7SbNaOKyDYipyTuFbAlWmgRC6KGoI4GA+HsipGe
	 oTA4ClAbNbZpTiJz9UsFiNKR/r9nIC7gKjbADsNWqIclD6j9/taabdLg9y2MhmFAEnbez
	 foThUfynwPD4h2Z3Nmiv4JXRHpmg9IMZyGn76Hq0JFcAYyObnDw4tbC1A4kESoCOymA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791142832;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H2OpQshZyVYVh3tOkBFxSRzGpLeNqaNF6TaiRbpFTww=;
	b=UfO88ufDe1s0tWs76Lx54v/mVivxri4HL0OsrJSwNxKqBi7diTUy8BNn8zVNDY4T/BZQ
	 GSE3Vd7aTMaUi1QpvfLwCJsTMT07DGm8MbUEldFzEfcJAejgnl9qgVJTezG3FdmY3jnU5
	 uc6YR3BNvy/lzAz4p5UbJkWwKLsRSk9b4KplzCCs4Q0Z6wYUnOrgjyL4Jdp1WJJ3277t3
	 GUmN3WtdU11t0JEjv09wxt94R+KdTq/uKcGaR+kGS2Lto5RSq7URb9kEP9y+OUCzrWEwp
	 jJ3zGFAvzDszWFWWfnMhyHH5I5tLhN9FbAQa17+RnxOKPlFvbJ59bp+qc99pzk10WGw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791142832;
	bh=H2OpQshZyVYVh3tOkBFxSRzGpLeNqaNF6TaiRbpFTww=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=anj7BM3liJa29sK+CHFSnly+HX0Mimy+Y2C/b9bL/oFDf/HbPByr4DMil65JdlT7A
	 5WUQJDU1tlJ4yQH7x27394SC0aR37LQPdteJV8iJXajyKBAGPvksmJ70wKEyf+QvEj
	 LW/DI5vYUqugZJoifOvtI1LnVKYDe7RUiFZFNK6n5rI+7CXMr8i0aWDM/qMvF1mm91
	 FT8CAbwy8Oc2A4HmdjKdky/sYfsTBnJwmLthQGr5NX9gXwcmGlCMQ2tzjA/m3k3zas
	 4CuN2fLY0CSSFJPBuHkH4LxhJI12TsH4f5gZUZSzfzcpdCsIAsUZ1yFgB1/yOUH62o
	 ksmTTPCtfD/lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D02060706;
	Sun,  4 Oct 2026 19:40:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 252162E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A3BF60706
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jPPLm_0ZhCA for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 19:40:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 146986060D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791142830;
 b=iIG9VTjQ3JiUhB93KBxtkTOfEAXK/KL9Oz0Owvycg575eik75ZaE4+bMJby+YOGySfXX
 j4g3bFgUkvQq2u+cVKmb+/jlNywNpiUsAixiwuoBX+Ly2LSHDEaUC60xtgnWqxE35R8Mx
 DszYf+MgcdWiCvKGE2zog+kEXEPBnjcBI336oqj3vBL5T+SX09FWeEAN+pE8Nj/nMnb1I
 XEADRWpsvs7ZnIfCzFqoiPdXOijPZT5W3ioC4kZVAUoD5kOonCMObcx8z61ppbFEF/MoS
 j11xnVp4EH/BTpRiKCAWhThfeBmXbJkAWWAwOmwnSBZH2ChxZpyXEQ5jYlP6fzMgm4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791142830;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Zh0udPV7C3jGEbxCxuWNKDBLkS6FzpyJ4V2yZ66npgQ=;
 b=pt1yxW9iznfWveJ/vAkk2k6/1GnazilNrmJ0EFKZMkJ62UAYXXPzoebS43W08gElCjr0
 FvYCKyMAapAYI0aK53vpPyMEQW67jIr9+LSJzUPckB23qMU4Oyy+djEQu/iPnBrx8j5ly
 bYwsmmYODTI3Bc4WDfE8DHo2k42Fmi0cn9abC0lKJJwVvG3n9vjoT0c0fSVA82WZzdl2A
 jHTibHl1M/tDDmy8OyanqFaK/cYuSaMslg796En/96w1MgS1fQKBWv4DDyZHG6Pm3Chd8
 PkjhjTEXjAqOXW/YWYdS1Sgo40xrG+3L69l6ftE7IKjUjt6SSemfRhjBNuGvhDe//xw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 146986060D
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A96148D3BF; Sun,  4 Oct 2026 19:39:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 21:31:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8692b78942ce4c1c513f68f3ed0b91c93ca0645e
X-Git-Newrev: c29ff5b9b38e87af3df0c95c7e3d6f51c0c0688b
X-Patchwork-Hint: ignore
Message-Id: <20261004193914.A96148D3BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: bump version to 2.5.24
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c29ff5b9b38e87af3df0c95c7e3d6f51c0c0688b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000516.html
"Note that version 2.5.23 was released yesterday but had a regression
 in the smartcard detection code; which is fixed by this release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index deb7a0da17..f03925bdef 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  4921a199ae868c8dd0478352d2d93bb470489e23  gnupg-2.5.22.tar.bz2
-sha256  96e27b020ad26510388e06f5f07f3f70a4ed8916ee995f1b72b7a024e6d9d87e  gnupg-2.5.22.tar.bz2
+sha1  61949c7a9edb5d9af9682183473b71c8319f1b79  gnupg-2.5.24.tar.bz2
+sha256  bf149d01a2b9fcc0e4589b8ae8697d3d5c557ea48ed95a3fa55dd3b1187e6039  gnupg-2.5.24.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 5b8b30e702..7b1a0e4f31 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.22
+GNUPG2_VERSION = 2.5.24
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
