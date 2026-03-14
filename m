Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587CC107BCF7
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 06:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 211DD60DEB;
	Sat, 14 Mar 2026 06:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehv08RgSssgT; Sat, 14 Mar 2026 06:19:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC14560E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773469144;
	bh=CU6frIQZ/m0vTj7VESbFT4yg450OIq/4vlNZ05FU7mg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E2SUIbiVJIBm9bGKKMH4lCYXcHNHovXpsFywJXxGz8gxTgH+bd99JTo2LpVjXjGCL
	 c5bRgLhoy8/OxD4CSPQkcASqqOxmDWoZgmEvvPzFX2Iki3mTKeYiiwTYbUcsrwtIUy
	 z4LM8qIL8/dzi4I3pS1m2WMSPL8dLi8sisNKn0Ebv8YRZ/qZfDQuYV5RhlPK+6AiuI
	 zC3GMsQU8+8wkTUG1xGuydTIMK1HVUU95nxsFqmGYpT6h98rMA1ljCOpOvbvCEUBT4
	 ldERRKeT9eu2dQxyickQrwYhnTFO5hAW+7MM3/i8zr1ET7DdLWhjC788fpVm2XCNV2
	 8lge5CCj41dbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC14560E88;
	Sat, 14 Mar 2026 06:19:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61CBB1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53AED60E88
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDGoAvAZ1rHG for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 06:19:02 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1EE5C60DEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EE5C60DEB
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EE5C60DEB
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:00 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id E5BF8BDE1EBC;
 Sat, 14 Mar 2026 07:18:56 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Sat, 14 Mar 2026 07:18:32 +0100
Message-ID: <20260314061837.9425-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773469137; bh=rhTNXb7sq5+qDA27QGfZsTFek1eR7t1SlBZ/qR+2reM=;
 h=From:To:Cc:Subject:Date;
 b=WswscmRARJ+2QmxxK0FMH3fnE3ohCDUwCkCxki5ySFoT6NZvv+XZwHQIxFGapRO7p
 OTcqj+bwm0Chhgy+70Ka/BK1rzaQ/Xa4Ke3+ihKWFbIyM8EOS1AkW1t5yjT5FB1HJ6
 Wr3eXqlZaQfJZwrZjOL1xEtbfLuaOwhW6OrSQ/no=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=WswscmRA
Subject: [Buildroot] [PATCH 0/3] package/mpd: fix configuration
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

/1/ Fixes an autobuilder error
/2/ Saves some electrons by disabling manuals being built
/3/ Adds a missing dependency (came up in another test, no autobuilder error

Andreas Ziegler (3):
  package/mpd: enforce tcp for options using http
  package/mpd: disable build of manuals
  package/mpd: add missing optional dependency

 package/mpd/Config.in |  3 +++
 package/mpd/mpd.mk    | 26 ++++++++++++++++++--------
 2 files changed, 21 insertions(+), 8 deletions(-)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
