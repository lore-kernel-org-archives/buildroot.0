Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF55FA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 14:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02C0780F95;
	Fri,  2 Jan 2026 14:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pw8O61lrFTKz; Fri,  2 Jan 2026 14:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0CC880F63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767363120;
	bh=SDtPEL++kF5EUDGG+jAsksdTN3sML8iZMrEu9zHg/Hg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OJ/F4VRFkaYYjBMkWuUnkpdRtvsjABi204hR758Raw6nJ90EWbU8tTtkbOL/V6CR+
	 gaF7Yutyg2cW8qZpyUK9YNk5Jm3ooTKjab8x3VlbIu7ZP02LC3CbsSmDZ/WHWfQZio
	 NZ7a5OQb9Hils9g12FSYBizbyB6CwdOULAnh3hH/r6tuJgmiT76IcI8HbM0NonnX77
	 10uGn12uz0amYhZrRQ8/+gi6eZQl0GmGhe38Is1K6gHQja+joHH7nPmHmPcTIAjCBL
	 6T0y42gJPGeKh7vIFaCq6G+57sxCSkVGlSzTjKcfIrmXTLLfd16nbDpxWIV9sS2L72
	 Rr5XiPAmWwRPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0CC880F63;
	Fri,  2 Jan 2026 14:12:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 996CD351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B81C80F63
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dz-p2Pu6nw8R for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 14:11:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81B0480EF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81B0480EF9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81B0480EF9
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:11:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B104A4C2A6E
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:11:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41026)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbfsh-000000007Xm-0sj2
 for buildroot@buildroot.org; Fri, 02 Jan 2026 14:11:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:11:54 +0100
Message-ID: <20260102141155.167197-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767363115;
 bh=vfCyKvUXa996TG1hWE3qHBEw0e38u0xHLJU+e+I4PHU=;
 h=From:To:Subject:Date:From;
 b=gIVHpiUMc0r9X4Puoog6ub2c0agErobQMSpTyWEf/SMOLKSwt81IpDoaMmTVQz1M2
 Sw6h5rcb3fYkvgNHRu3LtBFY3AI2LWdVYiQAw33DTmjvJizYxG94YxSmzQRaSr+JTC
 bqlKNvCt39/IUkjWhaF67HzHt0vvHs57BSb6i1A732R/cUHDOkwFjYqODdYrK9YRiO
 3nFswDS/3tvgLALmBu0s/0/9TxvBDTAw5/42lbi5IETziJNE+kad7BASxumw976tKT
 T936FLIQNqRLHPUwK5+s01H+EkgavIs3zeK/Tjel1NrUtEqVef1QS32YMbqgIIDA+x
 LLVY+qQd+sGZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gIVHpiUM
Subject: [Buildroot] [PATCH 1/1] package/ncurses: bump to version
 6.6-20251231
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

https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_6_20251231/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ncurses/ncurses.hash | 2 +-
 package/ncurses/ncurses.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 7369e3cd64..fe9bdbe915 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  fc3871f051e941a637488c07c81d984f731003e65c0f78353606e18296011aac  ncurses-6.5-20250720.tar.gz
+sha256  9796dfb0e790bac2a994a86df83adddc1a96021cbc02c44c4f2ea886069bd91d  ncurses-6.6-20251231.tar.gz
 # Locally computed
 sha256  708999f95527e1ffa670c6fce288c6c600cb477dd04afcc1171422b3dd4ee226  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 864f62b57c..5e2077500a 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When there is no snapshost yet for a new version, set it to the empty string
-NCURSES_VERSION_MAJOR = 6.5
-NCURSES_SNAPSHOT_DATE = 20250720
+NCURSES_VERSION_MAJOR = 6.6
+NCURSES_SNAPSHOT_DATE = 20251231
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
