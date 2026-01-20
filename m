Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E1CD2ED0F
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 09:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 970BC4EE8E;
	Tue, 20 Jan 2026 09:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mex4Tox_om3Z; Tue, 20 Jan 2026 09:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C18B4EE75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768900648;
	bh=ET/LkTa86Fhjr7p89dXRq6WD85Hik8Nd7d/sW73ZX7Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZzFTqYTe01YMUX/ruiKtoSnE35vGz4/Nqo0Ik/sO+2TB2IFf3+eRWL87svldVZEf2
	 Wqy3U9AIvseMIe+SoUSB67bqHNIlrnp9AYceGHwEeVlj8MqqHyPLh2qy+MmQt/BSS9
	 5A+2LgTftOytaozcAX8o18PH8WkqilpX/cz7gNbunBZxpIroOjwr/2KZCPjd9CsKs2
	 a3vGX0iafGibjfD7RFkeIdB2mYAQSY9Xz6EezIUA82WdVQLa3slgysNQQivSqmW2nJ
	 AawKguI74M0QsVTy5eT8A5AU/Tw5uwrqGAJixYLD5CNgh0Wc1XvejxJpIJOjTthNM9
	 fkc9QFpVaPatQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C18B4EE75;
	Tue, 20 Jan 2026 09:17:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC19160
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 09:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01B5F8586A
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 09:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FG9fpCxyHI_j for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 09:17:25 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 979CF85869
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 979CF85869
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 979CF85869
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 09:17:24 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id F3026BDE3906;
 Tue, 20 Jan 2026 10:08:00 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 20 Jan 2026 10:07:24 +0100
Message-ID: <20260120090726.43100-1-br025@umbiko.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1768900081; bh=TUd6tXmasqBU8ZozELda2QcFIA7TsfZmm39xow+ho/Q=;
 h=From:To:Cc:Subject:Date;
 b=05tl8jAELrbrRjFqoUXPkO9yyPpc9Mkbul9VY7xlurFBTSLur/MTyQ7UkYmehUfJF
 d6iMEb/fkh/iJJBDswGtK6CKQEXLxpr+we7joIh/c36OcK/U1QMklv24FEGtvAHD9D
 MwSpR2BD05nKvJS1vERrkf5iEbIdnBGC8sX+/vFI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=05tl8jAE
Subject: [Buildroot] [PATCH 1/1] package/mpd: fix shellcheck warnings
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

Shellcheck commit 4f81dbe [1] added SC2329 (function is never invoked)
and fixed SC2317 (Command appears to be unreachable). 

[1] https://github.com/koalaman/shellcheck/commit/4f81dbe839091a06a5cfaea695cf1c451ff07565

$ shellcheck package/mpd/S95mpd

In package/mpd/S95mpd line 13:
start() {
^-- SC2329 (info): This function is never invoked. Check usage (or ignored if invoked indirectly).                                                              

Change shellcheck exception number in header of S95mpd. 

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/S95mpd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
index ac971e04a2..481ee70a20 100644
--- a/package/mpd/S95mpd
+++ b/package/mpd/S95mpd
@@ -2,7 +2,7 @@
 #
 # S95mpd	Starts Music Player daemon.
 #
-# shellcheck disable=SC2317 # functions are called via variable
+# shellcheck disable=SC2329 # functions are called via variable
 
 DAEMON="mpd"
 PIDFILE="/var/run/$DAEMON.pid"
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
