Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49318C5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 06:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16FB280BB4;
	Mon, 24 Aug 2026 06:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ORxSYWRYzpi; Mon, 24 Aug 2026 06:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787554728;
	bh=YCBoj6p2PODZui0oUbBhYcDY0z4UzWiY5yB1RdF+zZs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X0lcqhU2UMTXQ5I9eRyuq3X3pyEk7AmP5yc1YAI6t/hH1cq2wRCgq3bMzgOaubk9A
	 O3a89MNlURUt42sf7JHg4pbUpxp5LjL2TRQkeITYrh/WufBKcl+5SZa8iDcP9xdB8i
	 +Lnym10iTztEa5dlR86px6dLHIH0gr5TW2/TnwO/h1YxB1ZF5X5IowCjimpR6SoCm+
	 MqjP9owYEnqgIGa6Y8Idggij2Lh58+GXnk7GBUVXZEbqL7pqQYjEcKS/SBs//c6sIO
	 LuTztk6SCDmWy9u4WEdsbmfsKFA/rWM5XzKks7JMYCRpqqbxBy8RViTgU0aKqsriBv
	 ERmCCpbN8RFOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D7480B42;
	Mon, 24 Aug 2026 06:58:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 466483DA
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 387C380B42
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZjs_waf_e17 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 06:58:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=TODzGT3M
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CA4E80B32
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:58:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=TODzGT3MzFhig0liM68UlK3qHPxrVn5iKeCP0lvnnA0tosHImctoqQNPGpwNDPSBz6pKPektYBkb0CAJ11OlszZSRQZIkNLXsH7sT90Ye//jmG6lvaF3GivrxJlMejZtMSBMDTjOS5VllyLwCme2Xj/EMHOkh450okisIaR455Zaq8ej5OUj0btUJWPKtDEjmw6fP4Wgo4DaztPWdQRAlg2j/4mAIDKj1d8j++GnuyKpBJFwU8G570RLZQYRsV7iTRaH2lCREb8iL22kF4+lQ8yEz3kC1EoGfP5qNrmrYKVsh1kmON7M3neeE6u7KUy4o4m6kgenD0E+fBtS9BXnCA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=NAlxzwUNtlQ67Y+tpwK1tG9hjco4dKJzXGjYQxAWgFU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1382373120; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 24 Aug 2026 06:58:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wyOdj-0000000BbWs-29YO;
 Mon, 24 Aug 2026 08:58:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Murat Demirten <mdemirten@yh.com.tr>
In-Reply-To: <20260726212249.155140-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 26 Jul 2026 23:22:48 +0200")
References: <20260726212249.155140-1-bernd@kuhls.net>
 <20260726212249.155140-2-bernd@kuhls.net>
Date: Mon, 24 Aug 2026 08:58:39 +0200
Message-ID: <87wltg80o0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/jpeg-turbo: fix libm linking
 issue
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot commit bb38f6f7208497cf5a4df922e833492001170111 bumped the
 > package to 3.2.0. This version first included upstream commit
 > https://github.com/libjpeg-turbo/libjpeg-turbo/commit/ed00e0f4b39291e954958b96a8d941ca4a9e03a2
 > which removed the dependency to libm causing build errors detected by
 > the autobuilders.

 > Disabling the build of tests by the previous patch of this series is not
 > enough because the build will fail on other tools like

 > [ 98%] Linking C executable djpeg-static
 > /home/bernd/buildroot/output/per-package/jpeg-turbo/host/bin/../lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 >  src/spng/CMakeFiles/spng-static.dir/spng.c.o: in function
 >  `spng_decode_image':
 > spng.c:(.text+0x4c62): undefined reference to `__fpclassifyf'

 > Add upstream commit to fix the problem.

 > Fixes:
 > https://autobuild.buildroot.net/results/981/98114d4ea7afe62bb4cef934a06bf289d863ad3f/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > v2: add upstream commit instead of -lm

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
