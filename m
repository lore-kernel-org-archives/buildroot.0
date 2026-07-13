Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C65C44501
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 11:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 887154057D;
	Mon, 13 Jul 2026 11:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDxCzqYd-2NH; Mon, 13 Jul 2026 11:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75C6840576
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783941629;
	bh=iXM+V7QEVWwHWxv27nk0H63qb7yCV2dumN21kcXKP3o=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SIZOT5MGzY3K9MPNFW9d+0BmuugOZr1SQmPv5e91J1nqaDEU/ca4XAWO8HulAC7hM
	 iols57ZlOOnWbNGWSozM1o9aPRv+wK3i2Kn3byYR0WB9Xhw08KhxlUFFN97Kl1DffC
	 7VMAbfBAtCWxKNt6hgC89R7fsm4XKqd6x1Y9YvKd+RC+x21Ii5l/0QWRp/2ng3R6dV
	 eYRKAeuvFphl906HWH2pebulhthEVz7mWLX7QU559FTpSenM2Q/sbvjdoo9gvDKSGm
	 zVUydeBF15avCesd2LkjCLQ5wQTmut+erYDz27COpgS7MVgoWgQ1ImuG7mVaA0iyDl
	 eiOuaTCGbSwLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75C6840576;
	Mon, 13 Jul 2026 11:20:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B683F128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 11:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C9C940576
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 11:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4Od3RR2feMh for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 11:20:27 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CA704052A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CA704052A
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CA704052A
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 11:20:25 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id DC8A3BDE10C3;
 Mon, 13 Jul 2026 13:20:20 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: bernd@kuhls.net,
	Andreas Ziegler <br025@umbiko.net>
Date: Mon, 13 Jul 2026 13:19:53 +0200
Message-ID: <20260713111955.47733-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710075124.126624-1-br025@umbiko.net>
References: <20260710075124.126624-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783941621; bh=DlXunIc/Ohg8lZUBGswzKNjxIlBrBuxXAVeCQUppBx8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=qB98DTHd9Ui6+lZVFmRXSDE3qAS/pUqCNRMDBgEEdNQdVS1RllIcIwrMFDieLkFQ8
 B3o4yuJCml4NA9IcK1sfJDl4/1PABnQoXOWyzDiyF3IwHafQzc/LEDC7/TpD7r07Ps
 ej3v0ZqwSGnig92Q/K9+BLhzgFO358t/sVUecmt8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=qB98DTHd
Subject: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.13
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

Version 0.24.13 change log: 

* configuration
  - add range checks to number parser
  - copy replay_gain_mode when creating a new partition
* storage
  - curl: eliminate auth probe requests
* decoder
  - opus: do not add 5 dB to Opus header playback gain
* tags:
  - id3: limit ID3 tags to 4 MB
* output
  - pipewire: fix file descriptor leak bug after connect failure
  - pipewire: support the "media.album" tag
* systemd: allow AF_NETLINK when UPnP is enabled

In addition, the fix for fmt 12.2.0 is also included in this release 
(https://github.com/MusicPlayerDaemon/MPD/commit/88d5b52).

Fixes:
../src/net/ToString.cxx: In function 'std::string ToString(SocketAddress)':
../src/net/ToString.cxx:80:37: error: 'format' is not a member of 'fmt'
   80 |                         return fmt::format("[{}]:{}", host, serv);
      |                                     ^~~~~~

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 1c02e0fe20..4d3d63215b 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  14223ca883c35fbf711994bcf745726cecc9d898e3d3964265cf3a2c7519a360  mpd-0.24.12.tar.xz
+sha256  9f215a081cc1f7c98fcccc6620f4cb705b14ba2d87fd99e062dd0804e2e3d96e  mpd-0.24.13.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 2014488520..390cbcd8f7 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).12
+MPD_VERSION = $(MPD_VERSION_MAJOR).13
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
