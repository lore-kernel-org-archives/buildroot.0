Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E5DCD8C99
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 18:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 461FE80794;
	Sat,  6 Jun 2026 18:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9troQatXpCQ; Sat,  6 Jun 2026 18:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74A4F80806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780770073;
	bh=ti/7kVLdgYMtwJeCz6E7R4iGHKrghOX7ygekhqtqKoo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EOAITNvEukZkN/uaeFni5bT4VXRw9oMMH0hqs0wfZgnr6NJdx5MIemLcfGV+6ViXs
	 xwo5t5sU88IFCLSE5++FD3KdTf0UzefSzk22EhooGZu/rQJswFklX7kNYJOMJxyrPn
	 ytPU2KQtyLlGWSofqmQXzSyMS8R4VWHgW0sh6C6J8+m6Rj7fsaHVgUkTvXTRhAsqtI
	 3Qr8otO2Rax7F9dGG5dR+4YnsneRPEj+QkDAvfPLYeqDiH/z479PGs7pClqh6qsaVp
	 uCKs0QEIVbMvdxgtQ6+LgiNvGRt/nRsQd7EAniVqmsNuAkBWMPZ4p3tLvNDCPvwFna
	 9F3/54D9aZjgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A4F80806;
	Sat,  6 Jun 2026 18:21:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 259C92EF
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17CF560EC5
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWlvdqFIDeAJ for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 18:21:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 002F860629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 002F860629
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 002F860629
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mo6v3-1x3sl01f0V-00jWaI; Sat, 06
 Jun 2026 20:20:57 +0200
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>, Fiona Klute <fiona.klute@gmx.de>,
 Joachim Wiberg <troglobit@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sat,  6 Jun 2026 20:20:29 +0200
Message-ID: <20260606182032.3803327-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606182032.3803327-1-fiona.klute@gmx.de>
References: <20260606182032.3803327-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:eClUwKuYi/kznVCJxGY4bV+nC4hqcJZezR1Az+sOnhCNIhqgcgn
 fO4GdZdEH1jzahxlKaP5SyOF98bANzX9jXtvtX5zgPGEIumpmFE3EwBqi4bJvsUQPEotzha
 C7+rt/ns3qHkH45A2XTKVDsaLTHK5w3GAacSmNlvo72KJJe5Rm9azRRahyrbAA41yR8q9cW
 ldeeqUlvrrTE/wB9Rlh2A==
UI-OutboundReport: notjunk:1;M01:P0:8hiA2rATxaA=;VC5L1aC/XdqLVEAOCOb735a7kCY
 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
 gei3R/wqfgwjkTZXzjgBJ5kJTJo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1780770057; x=1781374857; i=fiona.klute@gmx.de;
 bh=hpRRLmjOONDCxJix5ztMEz4aWb3pL9SNscHj8K1WZtU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YrEQNS5xAkLNOQ7sTXD+Kty8jtTB+ikZzrlnBF+WN94KW6TR55MuzryRHcCWGbPF
 Y0Rxb6QBLebghxr+O7Tm0rmQV0yemvyBUh9Zv/ccubwYIPfl571XVjMYFmfIWE6PR
 ntOvMtLg+IMNZwdF7vMro2jAb3O0xyN0DgkniD2tBG1qMXHMfCn0J33jamVh6JFu5
 u9pmVx1yPw3w9sJJEyehKqOeW65i94V4lf/9NDdd5Nz+dW+1+fQ81QCR8AL/kyNrt
 XyFhfPaMn2BnQfkOdQu3dfOeWpwqkA7Q4YZ2r8u8Wb4pNyXrBH6t0WmJKcZIly3z3
 t2SrUOv4KXtTG58b6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=YrEQNS5x
Subject: [Buildroot] [PATCH 1/4] package/mpd/S95mpd: avoid unnecessary exit
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The exit status of the last command automatically becomes the exit
status of the script. And if there is no explicit exit shellcheck
accepts unused functions (here: start/stop/... called via variable).

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/mpd/S95mpd | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
index ac971e04a2..e33654a501 100644
--- a/package/mpd/S95mpd
+++ b/package/mpd/S95mpd
@@ -2,7 +2,6 @@
 #
 # S95mpd	Starts Music Player daemon.
 #
-# shellcheck disable=SC2317 # functions are called via variable
 
 DAEMON="mpd"
 PIDFILE="/var/run/$DAEMON.pid"
@@ -57,5 +56,3 @@ case "$1" in
 		echo "Usage: $0 {start|stop|reload|restart}"
 		exit 1
 esac
-
-exit $?
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
