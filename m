Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E58CD6E6D
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 14:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65FD98500C;
	Thu,  4 Jun 2026 14:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5glsDITtL88; Thu,  4 Jun 2026 14:42:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9083B8500D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780584173;
	bh=slEUeXhLAHaozqHmpqC4c5Y/vzITVUtHVXpbPC0ROQg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M40DaLjWQb1LnxO0NpLXII3pL7OBfl8SyLxFOiaLoL1h7SCKwkhlgNzeE0twHufhk
	 IOBtNfEp8n7lritcW7qrpDpjStCY1Wq/UBrp8wLHIgoWX44EYwpAjoEeRtFxxfZta7
	 5R8sjje5bgpFjJsK+QYpoOtMVkhZThj1xG4TtMX+o+std9ZNVMIa0rrTY1XW6ImU0Z
	 j+UCVSia/EjOTac2B8zZuSWntCFoOB3r2T6Oq1N0Rqw2BKjBeIp79Yo3lTWkrkLTxM
	 wYSM2kU332tsgMhOCzHqLc2n3kiCKvGmEGRLulYmuFnqE3m2LxWDBFC6DdI2iRu1z7
	 3HfjdmI7Bhihg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9083B8500D;
	Thu,  4 Jun 2026 14:42:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF2A3192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 14:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0DDF8500C
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 14:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdQ0wecfiZmi for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 14:42:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74F328500D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74F328500D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74F328500D
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 14:42:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KTy-1xDesl0EmA-00xv4b; Thu, 04
 Jun 2026 16:42:49 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Thu,  4 Jun 2026 16:42:29 +0200
Message-ID: <20260604144230.840387-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604144230.840387-1-fiona.klute@gmx.de>
References: <20260604144230.840387-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:gdmS6299X0YFs7Puc2IqCLRu7GFzlWMCsbDb/hnWU5ZjComMwbT
 XKJRf6XdAiXp0IUxeg3KeNoHdA5LoXnOXxkuT/U4czZcdDvvv79YIaXZNsWnMH+rmieU4xs
 WAk5UtHhz4r39tY9wbJwRbr57bGZg+NYr3xVVTiZh58/rn3qtdAF74yFII+l1hmprs8xPEc
 Wd6f7mDDijxin0b957WDg==
UI-OutboundReport: notjunk:1;M01:P0:mfwzJnXlLAE=;CXA9A3kC3VQ/rDZIB9BveMbZ3YH
 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
 lo/jcPpDx4qgsKfkCQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1780584169; x=1781188969; i=fiona.klute@gmx.de;
 bh=faGuu8HTPTimz8Pt1RbnYaovYa8T4hWpykyfMhM0ORE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=M3CQaS0xefFT8vmSyCFmCvW3TCX8AHfbp+jTXDyeF8HreSgrUF33cRoivFUT1gKX
 SFnUazwoSNOV5xD3To7+JtKVhpysBZtwFdaAjq81mrWFxNLBnMi7Ci88u74qUJhcs
 wZ7QzqoRc+cEAUl5lYMLPMJJByia/V1tub6yNjxGxE8NDz+I5A5WkMXpbP2ii1j8j
 lGJF7ygz4cKE7sU8gp+qvyPyxATjWM5UI64bvucCAg97f+edgxv0w5LKnlIkd7FUS
 9bcNzl6uQB0OioIvZgWTQpGZLACREtu0DxQS+n+kouYdznRY3qui2UgXVBUvQC0uG
 5jNugATLL9vsXqQG3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=M3CQaS0x
Subject: [Buildroot] [PATCH 2/3] package/iwd/S40iwd: on stop wait for daemon
 to exit and delete PID file
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

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/iwd/S40iwd | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index 978912c67f..c329f3bcc7 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -26,13 +26,20 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon --stop --quiet --pidfile "$PIDFILE"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/libexec/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/libexec/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
 	return "$status"
 }
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
