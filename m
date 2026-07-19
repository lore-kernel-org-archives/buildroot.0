Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A66EC4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 03:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A736064A;
	Sun, 19 Jul 2026 03:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZM1QsECtWQ6O; Sun, 19 Jul 2026 03:24:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D30CE60641
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784431446;
	bh=xLTdtlBUoHZ2SPoTpJ2jt7MVzgQwEID4qUBeW8P+kaM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aImjz8eNopceaib6a2tc9KqvpSwDOaYtPllZMf9Tnkheu5V84lbD8Ag1vT6pKbow+
	 MgVb9r5INgRMOjl7Adc2kWtw7u0K9GnMGvrQacRP+419XbIeZelPWV5SqEpRRNSodt
	 dE9eIxkRqQkRfQt/lVsAM6X+G62Dqt3vWJsCmJt/2SHyVK4jq2cewigyqJAfiMMVnQ
	 1g41Ydx7+GHIxioiGkXP7ZmxWlIOG6vwBZPLq81nPv4fQTeueAnNVigxAmNd4B9cQ0
	 a0ca1y1S7n65XXeAgLIsxLTeETHZy7xZdNSU3Tlbbc4/4mDeHDtWBTSms5INVBMe/C
	 w/kS5kcruMJug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D30CE60641;
	Sun, 19 Jul 2026 03:24:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AA74206
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 03:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5444F60641
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 03:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LD6dVcSgAzZN for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 03:24:04 +0000 (UTC)
X-Greylist: delayed 477 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 19 Jul 2026 03:24:04 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69936605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69936605FC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.65;
 helo=mout01.posteo.de; envelope-from=rlf42@posteo.net; receiver=<UNKNOWN> 
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69936605FC
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 03:24:04 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id CCD48240027
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 05:16:04 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4h2ph40ZGPz6tvy;
 Sun, 19 Jul 2026 05:16:03 +0200 (CEST)
From: Ronan Loftus <rlf42@posteo.net>
To: buildroot@buildroot.org
Cc: Ronan Loftus <rlf42@posteo.net>
Date: Sun, 19 Jul 2026 03:16:04 +0000
Message-ID: <20260719031547.3512747-1-rlf42@posteo.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=posteo.net; s=1984.8680eb; t=1784430964;
 bh=xMCClH0qpOSrdPVHC7H9tDOHpRX/mWbwc/8OzaSQApM=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:From;
 b=NhnS/CUyhwth06wGJolUvr1wQIToYmEcW25kxtS0moaH0UdoLr5JcRmfAJhmd6B55
 kvXrxjksiEYO8ka9Vf1eaWy9ljyS1X852ZGTLxIIt0722YfiV4Nxr222oPKU8hRZfU
 kW3VJWCv/paKSxT7yjbLu8ToWdTgUXA8hVyAprrGT7KWbT07+Be9AEnZ0A2BFb2u7S
 TeTp/3IbkEx+tYMiMlwAxeDrQRNtIxkT7Wgs4TXo2VZ2v+eTtx2JVm2V2pdgLCr05M
 psXVgzh9qLI+DatArK2G5ECKx9XFHUPSNAFZMdaPxZZ6U+Nd+iw/MwJf+YqGq3/ua0
 FnEABPC3yOxJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256
 header.s=1984.8680eb header.b=NhnS/CUy
Subject: [Buildroot] [PATCH 1/1] package/readline: propagate CONF_OPTS to
 host build
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

--with-shared-termcap-library is only applied to the target readline
because CONF_OPTS is not inherited by the host variant. The resulting
host libreadline.so.8 has no DT_NEEDED on ncurses/tinfo, leaving
termcap symbols (UP, BC, tgetent, ...) unresolved.

With recent binutils (--no-copy-dt-needed-entries), any process
loading this libreadline via LD_LIBRARY_PATH fails at startup. This
breaks fakeroot-based rootfs generation when host-gdb (which pulls
host-readline) is selected:

  /bin/sh: symbol lookup error: .../host/lib/libreadline.so.8:
  undefined symbol: UP

Reproduced on Arch Linux (gcc 16.1.1, binutils 2.46.1).

Signed-off-by: Ronan Loftus <rlf42@posteo.net>
---
 package/readline/readline.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index f69cbe45..8c49fab8 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -15,6 +15,7 @@ READLINE_CONF_OPTS = \
 	--disable-install-examples \
 	--with-curses \
 	--with-shared-termcap-library
+HOST_READLINE_CONF_OPTS = $(READLINE_CONF_OPTS)
 READLINE_LICENSE = GPL-3.0+
 READLINE_LICENSE_FILES = COPYING
 READLINE_CPE_ID_VENDOR = gnu
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
