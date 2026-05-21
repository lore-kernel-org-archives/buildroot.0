Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28C7CD4F3D
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 05:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34EB3614F1;
	Thu, 21 May 2026 05:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_bO11C__sTG; Thu, 21 May 2026 05:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1ACC61580
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779341042;
	bh=yKZ++i6WmmcqvS1pyr4wmNZX8zFBNSZgeu+F61ixvb4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=glNlojtKWoqg6tm9dMrj5AJgDq+x24sAg1PWIT1mBo0R06RAgxGFB2Z7OCHvrLc7J
	 IjVcEbU0dS1uMz+DryL9xE0wkZKMUCFEGSoXRjM0TrV5Ad1RbdSDh97ouv9oBkb73Z
	 TG2WR3WLaKhjCOhAUZdfQjEjHhHLmMFvyD+zh8H+E4QexDFRAbaItIeylSw1IFRvhU
	 XzZO8zLZBA5WNE7hmXrZq2nBQEAUY5ojXZNH4GuCe7gmmPZ2g1MwwXiR5Uh3WZtpb5
	 SWDupde6fTtqTGPIhGeq1d9hrUB3l5sXDHtSzqTW+6TTqTB1FdgoT8qxuZWhhD2EOv
	 U3beCO94WbKvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1ACC61580;
	Thu, 21 May 2026 05:24:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2BDC265
 for <buildroot@buildroot.org>; Thu, 21 May 2026 05:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B456A8446A
 for <buildroot@buildroot.org>; Thu, 21 May 2026 05:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhjPRBeN4cCX for <buildroot@buildroot.org>;
 Thu, 21 May 2026 05:23:59 +0000 (UTC)
X-Greylist: delayed 167374 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 21 May 2026 05:23:58 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8127E84468
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8127E84468
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8127E84468
 for <buildroot@buildroot.org>; Thu, 21 May 2026 05:23:57 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id C4B1ABDE0169;
 Thu, 21 May 2026 07:23:53 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Thu, 21 May 2026 07:23:31 +0200
Message-ID: <20260521052333.2780480-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1779341034; bh=Kn1Z3Xh48CRXhIhdqwZAL7uJ0piPA/Nqwa+Zjea8XDY=;
 h=From:To:Cc:Subject:Date;
 b=X+uiACoaCHfHpBhcgWOOnFkWjga1ZhMo0azaNV/RFBl/0P/7DkJFHPE7W4oTbdYJO
 pclZDPI6DEDb4EF4qDAgJV9rXrAKFGp+hZnSObI1d1OctpQnDgmw9vUXRa7eAHzMg6
 bo0K7o5pR+CCxb3QFSVxkdpzueRsyOrMq+wWlDG0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=X+uiACoa
Subject: [Buildroot] [PATCH 1/1] package/mpd: update version to 0.24.12
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

Bug fix of bug fix. Changes from version 0.24.10 -> 0.24.12: 

* protocol
  - fix path traversal bug
  - allow empty URI in "lsinfo", "add" etc. (0.24.11 regression)
* playlist: do not allow newlines in song URIs
* input
  - curl: require version 7.85.0
* decoder
  - pcm: fix stack buffer overflow
  - sidplay: fall back to SIDLiteBuilder if ReSIDfpBuilder is unavailable

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---

Tested on:
  i386      build, run
  x86_64    build
  aarch64   build, run

Tested-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index e3e2cde023..1c02e0fe20 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  867f10fd83cde20c240617222b38fbf6885f902015d0da424a28fbafc675e1dd  mpd-0.24.10.tar.xz
+sha256  14223ca883c35fbf711994bcf745726cecc9d898e3d3964265cf3a2c7519a360  mpd-0.24.12.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index eb40f0ccc3..e94858897a 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).10
+MPD_VERSION = $(MPD_VERSION_MAJOR).12
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
