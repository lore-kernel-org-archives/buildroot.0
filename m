Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1283FFF8860
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 14:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B46483EB1;
	Sat, 25 Apr 2026 14:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mb-sjMOGXL2; Sat, 25 Apr 2026 14:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7DA683E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777128213;
	bh=K68AcMpadZk68NdX4PcQQBGz+pkeesNXYMhmkKdZGl4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=tILjWmNhLmJHMSR8B1Mgo92wl7y8C1UT8XUk2ZAu8NoS23mKASxvoNU777SHEpM/V
	 Hg2w5f5s41v5MNZHZA3AhW++4X8Dw2H3mMQGNLhi+cXafrpIAuIkTcgfIkqOK+kERy
	 L+JcruTNGg6aCdPOfRO1mGtx+SS/NZqxG/SvPxjHXQpDsMAf0rkISrALSrU5AflROv
	 teeK35rioBFGCQf1PnVDV6qTQO4rZSojh0YHKE/X9jVujLGO5tGOq4tFA/c1mwIRdn
	 j9jLlJ0IyYcCpnMu7d0PSxUe3QB1C2bYVYzSrI+jqMkIHsIKy5/8Fy5RR3RgnDb48b
	 FybfxvVxzuE7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7DA683E95;
	Sat, 25 Apr 2026 14:43:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52B55231
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 14:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4156B4082D
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 14:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7_5OiVldbDX for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 14:43:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABFCB40815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABFCB40815
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABFCB40815
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 14:43:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5QJD-1wFpHS49Sv-009EWs; Sat, 25
 Apr 2026 16:43:24 +0200
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 25 Apr 2026 16:43:04 +0200
Message-ID: <20260425144306.881411-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:5hcQmTEVVywZAd0E+tvoEiLDg81UW1Far4ZcIz1SbNLgJovKZ53
 fzrQjO1NIgRcNDm9ibDSAfHZvbn734VnjpDtBrXRe/VnKCnwKddrppDHGDNWs8YhG45rLZD
 16gErl9FqH7UNGuCq59o4YuI3vtnGxg4ETBKygiD3gFob4Kk0yPdZKYVBUcJKzPgrIEyplQ
 zNTbANFmnKCmHoMY/UPSA==
UI-OutboundReport: notjunk:1;M01:P0:inO+8F98jQM=;keEQyhgsTPIcJjt5gD72HQMb/Ff
 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
 CIJi0wuuIjOrF5cYH7nraUgwBBOD7/hT1JVg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777128204; x=1777733004; i=fiona.klute@gmx.de;
 bh=2lwBQIJkjGVz4ywEiMA5lJdDe2bd+SfwhmA/5PkIGGc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FAWPHH0dAE9zJ+cZ/WHQ/NUGYy0w+ti/oxQ055YD16UvkD1SAuAltpbVqABlGgAw
 AGct+k3r0T26hdNUt//rONyjICq6B84S60SclFE2II498WSk6Rhw3SQ81Wg9tIdXy
 BA0osDngczmP1rQB1HHSmhAAVdfF/j8nAs52gUIoDga5EsKIgeMFluVWP7roxPjHA
 i/Pnws8QvGgv1IS0kerd/UMwNdNJBbUDgX2L0XliJMkPdvShEAMXgbbs8VdUJHrua
 EUawn9ETG4v2njwmUb4jVeWDu3dxGPgoVRSP5b8odO3cT25M5twXW/UEISC+ma7We
 wIZHd29MXqf6+8rhUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=FAWPHH0d
Subject: [Buildroot] [PATCH 1/3] support/scripts/pkg-stats: search only
 Config.in* for URL, autoclose file
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

The previous Config.* glob also caught linux/Config.ext.in and
package/php/Config.ext. Using "with" automatically closes the file
when the block is left, even on error.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
This cannot solve the problem we have no structured URL information and
don't look at which option the URL is listed under, but at least it's
slightly less wrong.

 support/scripts/pkg-stats | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 55aa63c861..1d50c86d40 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -149,16 +149,14 @@ class Package:
         """
         self.status['url'] = ("warning", "no Config.in")
         for filename in os.listdir(self.pkgdir):
-            if fnmatch.fnmatch(filename, 'Config.*'):
-                fp = open(os.path.join(self.pkgdir, filename), "r")
-                for config_line in fp:
-                    if URL_RE.match(config_line):
-                        self.url = config_line.strip()
-                        self.status['url'] = ("ok", "found")
-                        fp.close()
-                        return
-                self.status['url'] = ("error", "missing")
-                fp.close()
+            if fnmatch.fnmatch(filename, 'Config.in*'):
+                with open(os.path.join(self.pkgdir, filename), "r") as fp:
+                    for config_line in fp:
+                        if URL_RE.match(config_line):
+                            self.url = config_line.strip()
+                            self.status['url'] = ("ok", "found")
+                            return
+                    self.status['url'] = ("error", "missing")
 
     @property
     def patch_count(self):
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
