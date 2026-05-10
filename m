Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF24CD37AF
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 07:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E9DE41F19;
	Sun, 10 May 2026 07:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THb_God046lm; Sun, 10 May 2026 07:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FDC941EDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778398522;
	bh=+0uEqbuvqDxXUQRCpSud4mSj1n6nl74fAj1XVUwM/PI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bhk97z2zx03sRNYuwr1vaV33WxZT7nR0cCi9hlKI/7uX8VJJ1lKi0bWYk74dDDQIi
	 rCmSm2LWw+aSlPpE+h7LjRiiFj7IKelgbBAwYAcuC6oov9AWqK1btKJYeoAZXBiDZm
	 1jwa6ts8hKjIryLHT+AJql5Wq/xbC1nYfEHez+EmbKjyTHay5cJptRAVAyFSkFYZBN
	 8PuGIgy5UaUkjMNBMeewRlfiB+xjz2JkXNVI2ZkogDfgJ8rn15CMJyDhKPoQBZsol3
	 vbuXJ6X38Xt5FqwIcUh1juJA3qdMl2sX5WZeYWyS0IxQ447AvmUKElXH2fgDeXSb0L
	 nT4VSERDmaKkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FDC941EDD;
	Sun, 10 May 2026 07:35:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA349272
 for <buildroot@buildroot.org>; Sun, 10 May 2026 07:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A00A884876
 for <buildroot@buildroot.org>; Sun, 10 May 2026 07:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ei-Hhejt_RbK for <buildroot@buildroot.org>;
 Sun, 10 May 2026 07:35:19 +0000 (UTC)
X-Greylist: delayed 561 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 10 May 2026 07:35:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B4628484F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B4628484F
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B4628484F
 for <buildroot@buildroot.org>; Sun, 10 May 2026 07:35:17 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id A6C82BDE1175;
 Sun, 10 May 2026 09:25:49 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Sun, 10 May 2026 09:25:08 +0200
Message-ID: <20260510072509.280756-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1778397950; bh=J5WrxNwsfeRIfdLmiJeMbzVn5ANSFtLJKQ+PcR+SDNY=;
 h=From:To:Cc:Subject:Date;
 b=N5HmDziagwKebMvDAu2SgpfdSmSfiIitF55M0HOK8yNCJ+LueD24qDoZD1+2hBp7c
 5pf9JbrIYbTeWLiLl5wOn6PRL0wjExKyfp7SeSWH8gr5HfQW3sQVjJFU2LJHNJi/gQ
 1woYJCoRO6YU5O8pCcTkB2GculQ/KFn4HL2M95DY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=N5HmDzia
Subject: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.10
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

Version 0.24.10 change log: 

* input
  - cache: fix deadlock bug
* decoder
  - sidplay: support millisecond-precision time stamps
  - sidplay: support libsidplayfp version 3
* database
  - upnp: allow building with libupnp 1.14.30 which has fixed the API breakage
* Windows
  - work around build failure due to zlib bug

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
index 9cbe7fcf0b..e3e2cde023 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  f3d28b29bbe675970ef205b3d9b835e5691423fed6a89d713dbcbf7839ea92f3  mpd-0.24.9.tar.xz
+sha256  867f10fd83cde20c240617222b38fbf6885f902015d0da424a28fbafc675e1dd  mpd-0.24.10.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index ce7c44a9a8..eb40f0ccc3 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).9
+MPD_VERSION = $(MPD_VERSION_MAJOR).10
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
