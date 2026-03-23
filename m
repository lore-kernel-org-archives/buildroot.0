Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7169F4611B
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 13:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4552760776;
	Mon, 23 Mar 2026 13:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_HNKqVPtRWS; Mon, 23 Mar 2026 13:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5361E606B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774274206;
	bh=P3Dgzc4CchjpuRBn6KcXyYTgbInMdYNT8VDVJfhGTxs=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=cknmjBmSRfN9XEJrah06rRBxl0+Cdn2pvMMwHrEq0Zzbf64UhVsx2P/MTIBoyHHb3
	 qtL8iLx8HMNCM347PHZhX92kCV8PmmvXCbCpQnGo+tcP+Uuh97Xmq8ux//UoynaBA0
	 7jM+FxoptujCbJ6xEvJjSTC97TLgoOtzkg0W3SfdkgE28+IDsQ8obqtXLYUJjzdexp
	 MtTtqrX9Ca3y1HaAEY9NHwonSg4BGm66RSwsQW0i/jRzEFgJiMwNDGC/EYK4HnqWrg
	 6BNjcL5ZS1KFvWVkqYwMYw8I4TL7nuKyHa/R1RNy9KKTHrqXzk/XgM7kdzr58r+wTM
	 JOkAlBxP1oj+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5361E606B4;
	Mon, 23 Mar 2026 13:56:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13A31353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9FE580AD5
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1kle35RI-SA for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 13:56:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.15;
 helo=smtp-bc0f.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B43880AD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B43880AD1
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch
 [45.157.188.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B43880AD1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:43 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6b])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ffZJ31kbyzvWQ;
 Mon, 23 Mar 2026 14:48:19 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ffZJ25SNQzpTp; Mon, 23 Mar 2026 14:48:18 +0100 (CET)
Date: Mon, 23 Mar 2026 14:47:52 +0100
MIME-Version: 1.0
Message-Id: <20260323-qt5-5-15-18-v1-4-3cf8da16df10@cherry.de>
References: <20260323-qt5-5-15-18-v1-0-3cf8da16df10@cherry.de>
In-Reply-To: <20260323-qt5-5-15-18-v1-0-3cf8da16df10@cherry.de>
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774273699;
 bh=PE6m/sBrw4DUx722Ffe1eWeJcxg+J4hFUS+OEL38/7s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lMGKQsXPNvhoquI8ILdGDiHdqEq4c++QwfDBBILCIVqd3EMzCbuzb94RyjCn/7FD5
 2DdUL/CYowdjYv6tjXWwyLCOntuy5sWDi7iR4BzeBljJCWxpHWX9CoxEeSjC8pEAHr
 ne/NPFkp0TOXLu2Y9WIr+bqQPdgUswPYKHIlDH6iJHA3VfQ4obueakWVBY/GI9V8GQ
 jExI4m8OpEmr9MPpTttMsU1UyjFVH6EGtwlJ+xWBdyHxqI/Hmy1KAompdacr52MU3D
 zq2wbGEBljnj96ahW+wPHZ0bF4jShM4ulgWhs3PTQPr/QyoUTTkO41y4/Tv2lXx2ca
 nJIqcwuc3myqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net
 header.a=rsa-sha256 header.s=20231125 header.b=lMGKQsXP
Subject: [Buildroot] [PATCH 4/5] package/qt5/qt5webengine-chromium: fix zlib
 license hash
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
