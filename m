Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0DC106ACCF
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE3A84DEA;
	Thu, 12 Mar 2026 16:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yz3gq6uReE7M; Thu, 12 Mar 2026 16:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDA5984DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773333902;
	bh=3Hsjc//fUTqogO9A1v6vxzHIpjqFPdZCXh2jDpmT1zc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WnRP6WBIADaE28cZncLmHLdiw2CbHY4sUigRmRvMnCTdYtK2Wdyzk6SMXhibOjADN
	 X/szDS2pbcCr5zCgPfw4KAlYnn080Eoij069rms7L9ZFr8USHz8mDsI+TvTc/VCv2C
	 XBjtuEjZO8GrsDLtR0csoXyR7v0W1Cf23k8kiZfeC+pOg0xY4GoKy/OU0J1cIk4SuF
	 yWZOadznZ2ZVNU+coitZLv+n1qidJzIAKIyp+8CTvcdhD31n1t3qQIUL+NHAfjLvAv
	 ohIfvUPOuLSBvZLoi5+eTr9YP00OlAvNr3I6Rn369jO5jT9IzsEU/rwdxYuvyGqjP1
	 mkyXmRRwH4K9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDA5984DED;
	Thu, 12 Mar 2026 16:45:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D39D7282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4A39414DE
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q077oSA_t2zS for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51BC8400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51BC8400E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51BC8400E4
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:44:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6BB2CA4C066D;
 Thu, 12 Mar 2026 17:44:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55052)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0j9c-000000004Fx-1mQj;
 Thu, 12 Mar 2026 16:44:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 17:44:55 +0100
Message-ID: <20260312164456.3185719-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773333896;
 bh=6u+FMq17rMhmDykUeQxyWOb08RbhW+kKBQfFA4VSWjo=;
 h=From:To:Cc:Subject:Date:From;
 b=p3dlypwlqdBejqMkmEOvbcA7KHES3uhJ9xyLHl3484w0KCCIXDYoangBG1KfcXNiw
 a1aYdGlW5ENgSuGErKyhk7KVXpZM/YLmtOndRkl/lX5/GRWRN/E2CFakBlPQq+s4UM
 jUIGuh+9dCFHI+b9LRle3K31jHnX8j/gJHwUdMNz/9qRVuamceVVy+EA1EI116xHOU
 5p/LmU4yrWbBuo5RZFtLIE7ZUvpMKqUipcBSqmmcm1be1wKbPCVa1W0jb/z1lLlgvF
 YK5R57/hU3NxCqRFD9vn/JFssBrLPc/nDJnhKI1RcyaQiYoFfI1Ioem5DGKAd586AD
 RtP9hfbb1Oi4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=p3dlypwl
Subject: [Buildroot] [PATCH 1/2] package/mpd: bump version to 0.24.9
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
Cc: Andreas Ziegler <br025@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.musicpd.org/news/2026/03/mpd-0-24-9-released/

https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24.9/NEWS
"  - curl: fix build failure after CURL 8.19 API change"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 91995c5b4d..9cbe7fcf0b 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  1868aded6aabe6a02a6427ef1d3856b11370612afc53d28184533db53991d2f7  mpd-0.24.8.tar.xz
+sha256  f3d28b29bbe675970ef205b3d9b835e5691423fed6a89d713dbcbf7839ea92f3  mpd-0.24.9.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 94decd8460..3df6276a11 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).8
+MPD_VERSION = $(MPD_VERSION_MAJOR).9
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
