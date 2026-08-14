Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E62C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F45980EB5;
	Fri, 14 Aug 2026 19:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M56vkbJ3xNpR; Fri, 14 Aug 2026 19:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83805811D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786737567;
	bh=Vo0hl99pEWGnA87HdEv8htkojxcihh2FNiFP/rn68eU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=amFIqvMO63KxqczmoH78088aGoFMewfMhD5q+FniQaf75316YDTc6NPVbMzPC28+g
	 mv/Tlpn3hNH+FO4M8KRsC+kZ/BG5r6N5Q+Snok+fyErYHww8Kq/ZPR+C5zJlo8R/lY
	 0CaIzK0gZu5pMyzMY1C6VPC4XcgIf+/euqd1r+B/2bMpY5acxXQH9iJ5ZkX0u1/6Wo
	 Oa2fdgEqlXJP34RELs7/hgnkmYSyJN8S0nMRLj0ZuP5TBix3rXJm4tMS45hL1bsMLM
	 wil5NGn0yHm40iRO6ztFX1gqkhETq6exMDMw0GSM2aLc9iWTiFl9eJvluw+Mldt0K0
	 4LfgvQleP5E1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83805811D5;
	Fri, 14 Aug 2026 19:59:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C4D823F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A451400D5
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmU2t8pc4csA for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:59:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03FA040064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03FA040064
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03FA040064
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfUe-1wjwVz15XU-004swq; Fri, 14
 Aug 2026 21:59:19 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 14 Aug 2026 21:58:54 +0200
Message-ID: <20260814195856.3295644-9-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814195856.3295644-1-fiona.klute@gmx.de>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:7e1T+hVoPuGlXIJSwI4+ZNTrgedS8kF6fUGDxCAw1hqZ4oKBVc1
 9PdPZNti9bAYPSSSjswdAnzFV2+S47BUWK09ctfMgQYoS6HllIzHfLCaTKZj8TPkbOosc8l
 OKtZrqh9MiZCsTlM6Qw5XqGm6oErjSlNwzl35Z4FQnzh+z/AfLeRuHp5Im7uFRCfyLxe0lA
 F5RmswAGd3pe2Ifai8MTg==
UI-OutboundReport: notjunk:1;M01:P0:tszJqRuj3/U=;HOCAfXLMRFn9W0fOeyt8UkrgrcZ
 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
 CiUhnP3zbl8G7lpQ==
Subject: [Buildroot] [PATCH 08/10] package/libsoup3: update project URL
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

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libsoup3/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoup3/Config.in b/package/libsoup3/Config.in
index 504cc3bd2b..d3a18ff06c 100644
--- a/package/libsoup3/Config.in
+++ b/package/libsoup3/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBSOUP3
 	  and the GLib main loop, to integrate well with GNOME
 	  applications.
 
-	  https://wiki.gnome.org/Projects/libsoup
+	  https://gitlab.gnome.org/GNOME/libsoup
 
 if BR2_PACKAGE_LIBSOUP3
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
