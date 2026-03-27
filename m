Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0883C10F2853
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 16:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C46D26139F;
	Fri, 27 Mar 2026 16:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9z5wd_hWSXd; Fri, 27 Mar 2026 16:53:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34793613A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774630411;
	bh=P3Dgzc4CchjpuRBn6KcXyYTgbInMdYNT8VDVJfhGTxs=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=JFGW7PLt/4G+NoKggkI9UzOasD105+WVFeuTEyju/SIrH4vgTB1sX0Lnz8ERJRYoA
	 gdF4F991hiOnnqhwxp7RCfKnfhjG1SBL5mwZOZkH7oEtKDc0ZdJe7AyVa3v8grA2F5
	 m+/dSUvcP0WHs3ffnkb392p4O7dQdNNcE6iGS9fo7louWDo+tywwm12eJiyTST4vxh
	 wCFMlJiZUG3WRc5yQ6VZwd1yyFKHUeygbwCkwiEXopna2BPqdo8CYK/2ozFajpKyFT
	 fu68dUNArlNyqrPAxah0y+CGrDHAXJy4OwvAQL2LyMsPktnsc4i388frty17nyoN22
	 IJb66zQyKtBEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34793613A2;
	Fri, 27 Mar 2026 16:53:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B8D9249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 897BE83E98
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id em85MzmWVi83 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 16:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::190e;
 helo=smtp-190e.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CBB083E9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CBB083E9A
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::190e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CBB083E9A
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:27 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fj6Cm5xBvzMT8;
 Fri, 27 Mar 2026 17:53:24 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fj6Cm1WhXzNjS; Fri, 27 Mar 2026 17:53:24 +0100 (CET)
Date: Fri, 27 Mar 2026 17:53:05 +0100
MIME-Version: 1.0
Message-Id: <20260327-qt5-5-15-18-v2-4-4c98e853266a@cherry.de>
References: <20260327-qt5-5-15-18-v2-0-4c98e853266a@cherry.de>
In-Reply-To: <20260327-qt5-5-15-18-v2-0-4c98e853266a@cherry.de>
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774630404;
 bh=PE6m/sBrw4DUx722Ffe1eWeJcxg+J4hFUS+OEL38/7s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=W6b5KHwnz5PgfZPN/3PTBHKGtv6zumhQKaM18bL/leqn87ligZKMOZku0JYJUkN6q
 63hfdqBLvVrv6LoCjZPybmqEWdTV4UBbAYYXo27tRhBSVV7uGIDRU8SMBLOQNifprp
 MnUhUlTQSqKtMQym74QzfKNcJcWGc2OFQBYUHK07/MTHE9A0kmCz8yvoZRtpAoXrLP
 SPrZCylU3QMV6OYrlxKX0nXnBhq3aziObpQ/GDe7E3KTpCdIAFMJ3X+i8vu+N2MZvK
 hPDRnwKY4a5/F7592bIaCpKtrZue9DU1eQfKpt4NwLty1SWHpU0vsr5/UJ4LWcPs5o
 BNBvlUwbY0LTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net
 header.a=rsa-sha256 header.s=20231125 header.b=W6b5KHwn
Subject: [Buildroot] [PATCH v2 4/5] package/qt5/qt5webengine-chromium: fix
 zlib license hash
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

Commit c53455ea4ffa ("package/qt5/qt5webengine-chromium: bump version
after qtwebengine bump") bumped qt5webengine-chromium but forgot to
update the licenses.

The diff of the license is reported by
git diff 0ad2814370799a2161057d92231fe3ee00e2fe98..18c9261dc5b8aa57a0bdd5b62ce6f648cca1ef5e -- chromium/third_party/zlib/LICENSE
as the following:

  diff --git a/chromium/third_party/zlib/LICENSE b/chromium/third_party/zlib/LICENSE
  index 9f056865b57..8aca25d8c7a 100644
  --- a/chromium/third_party/zlib/LICENSE
  +++ b/chromium/third_party/zlib/LICENSE
  @@ -1,6 +1,6 @@
  -version 1.2.11, January 15th, 2017
  +version 1.2.12, March 27th, 2022

  -Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler
  +Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler

   This software is provided 'as-is', without any express or implied
   warranty.  In no event will the authors be held liable for any damages

so it doesn't change its actual license, let's simply fix the sha256 to
the new value.

Fixes: c53455ea4ffa ("package/qt5/qt5webengine-chromium: bump version after qtwebengine bump")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
index 270da153c6..8026c3f697 100644
--- a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
+++ b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
@@ -1231,7 +1231,7 @@ sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  chromi
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  chromium/third_party/xcbproto/src/COPYING
 sha256  b244f73c3d21edaf44ec253b9a7c389ec43313c417f52f8b71914b0c40d87325  chromium/third_party/xdg-utils/LICENSE
 sha256  1cf71700f3403ca26f002e2dc1d1861dcb3d2af9bb9d98d529a903be9d7f06fc  chromium/third_party/xstream/LICENSE
-sha256  942755efa272dbfbcd7afea7a38556801e36c16dcad002d572378367094a2593  chromium/third_party/zlib/LICENSE
+sha256  e1cfcc55c325b3f78cf55df9664abaa066e2271dffe8213347d9fccdfbac8f2c  chromium/third_party/zlib/LICENSE
 sha256  1744e977d24e20e77b1e97d745fe43779430a1b84247b6c0e89d16e116e7ff92  chromium/third_party/zxcvbn-cpp/LICENSE.txt
 sha256  a4c8c5abf82b36c22f8c9f8bd6229584f32eb9f7a2429dd9664dda43e63e9fda  chromium/tools/grit/third_party/six/LICENSE
 sha256  63f0c0039b477857e54708d9501ed91b7a46e828ac3c623bedbc318129ceb174  chromium/tools/origin_trials/third_party/ed25519/LICENSE

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
