Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D19FC369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 21:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D15C6411E9;
	Wed, 23 Apr 2025 21:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uc-sUB_NoPB2; Wed, 23 Apr 2025 21:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D530E41265
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D530E41265;
	Wed, 23 Apr 2025 21:48:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C8262A6
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 21:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52B4F606E9
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 21:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Yp9ox9vBnN4 for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 21:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19AA760621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19AA760621
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19AA760621
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 21:48:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B60DF42E79;
 Wed, 23 Apr 2025 21:48:27 +0000 (UTC)
Date: Wed, 23 Apr 2025 23:48:23 +0200
To: Ayrton Leyssens <aleyssens@idtech.be>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, Gilles Fouarge
 <gfouarge@idtech.be>
Message-ID: <20250423234823.75225cab@windsurf>
In-Reply-To: <VI1PR06MB89261C88ECA6A6ACC6D9FFCCADBB2@VI1PR06MB8926.eurprd06.prod.outlook.com>
References: <VI1PR06MB89261C88ECA6A6ACC6D9FFCCADBB2@VI1PR06MB8926.eurprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefgjefgtdffhedvueevvefggfejueelhfetkefhhfevgffgveetvdelvefgteejnecuffhomhgrihhnpeeipggrrhhmpggrrhhmqdhlihhnuhigqdhgtggtrdgsrhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghlvgihshhsvghnshesihguthgvtghhrdgsvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhil
 hgurhhoohhtrdhorhhgpdhrtghpthhtohepghhfohhurghrghgvsehiughtvggthhdrsggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745444908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4QGaZ7/t+d3MZ4WXrP4bHWXx37yJThLVKkK1Lz0hXw=;
 b=CrjIsHZFPVce46cSkC4RkKPvLZbmB4QoCRTaYVzXwJOKx6IXxyQd02O8HrW5adjPyFiG8V
 KE6gAp48jIkAHVrrc6QzCJUrtAXfylm5FsSK21ykbLzjcWiXUSYBbGQssrng/x9gB+3q4C
 hNkaZP79GrPSNcPOsoht7gJIc51deYNvS7+SyPkGo4wkiOAR7pvSVuJbMiowqCXpXIf+31
 swL8X5WfbBDXVOGVPj8l/oaetkZBNjo5ogBQqq+caH25JKNMvgxTjwW2teyeuItaSnGg3w
 yOIsSEQARlwP1s4bWowAkQpysCYb32xK+A5DJC55FstxccL9MFTIDPNR+E9PXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CrjIsHZF
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss fix buildtype
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ayrton,

Thanks for your patch!

On Tue, 22 Apr 2025 14:01:24 +0000
Ayrton Leyssens <aleyssens@idtech.be> wrote:

>  LIBNSS_BUILD_VARS = \
> +	BUILD_OPT=1 \

Could you clarify what this does exactly? Indeed, Buildroot already
passes its own optimization flags in CFLAGS, based on the
BR2_OPTIMIZE_* settings, and we clearly don't want libnss to override
that.

Without your patch, when I look at the libnss build, I see:

/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -o Linux2.6_arm_arm-linux-gcc.br_real_glibc_PTH_DBG.OBJ/tstclnt -g -g -fPIC   -pipe -ffunction-sections -fdata-sections -DHAVE_STRERROR -DLINUX -Dlinux -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 -D_FORTIFY_SOURCE=1 -Wall -Wshadow -DNSS_NO_GCC48 -DXP_UNIX -DXP_UNIX -DDLL_PREFIX=\"lib\" -DDLL_SUFFIX=\"so\" -DDEBUG -UNDEBUG -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE -DSDB_MEASURE_USE_TEMP_DIR -D_REENTRANT -DDEBUG -UNDEBUG -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE -DSDB_MEASURE_USE_TEMP_DIR -D_REENTRANT -DNSS_DISABLE_AVX2 -DNSS_DISABLE_SSE3 -DNSS_NO_INIT_SUPPORT -DNSS_DISABLE_ARM32_NEON -DNSS_DISABLE_ALTIVEC -DNSS_DISABLE_CRYPTO_VSX -DUSE_UTIL_DIRECTLY -DNO_NSPR_10_SUPPORT -DSSL_DISABLE_DEPRECATED_CIPHER_SUITE_NAMES -I/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/nspr -I/home/thomas/projets/buildroot/output/build/libnss-3.110/dist/include -
 I../../../dist/public/nss -I../../../dist/private/nss -I../../../dist/public/seccmd -I../../../dist/public/dbm  Linux2.6_arm_arm-linux-gcc.br_real_glibc_PTH_DBG.OBJ/tstclnt.o  -z noexecstack  -z noexecstack  -z noexecstack  -z noexecstack  -z noexecstack  -z noexecstack  -z noexecstack  -z noexecstack /home/thomas/projets/buildroot/output/build/libnss-3.110/dist/lib/libsectool.a  -L/home/thomas/projets/buildroot/output/build/libnss-3.110/dist/lib -L/home/thomas/projets/buildroot/output/build/libnss-3.110/dist/lib -lnssutil3 -L/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lplc4 -lplds4 -lnspr4  -lssl3 -lsmime3 -lnss3 -lpthread  -ldl -lc -lz

So -O2 is present (from Buildroot), and the -g0 (from Buildroot, by
default) disables the production of debugging symbols which are
apparently enabled earlier by default by libnss (using -g).

So from my perspective, there is nothing to fix, and things are working
as intended. Could you clarify what optimization you are missing, and
how/where you spotted the issue?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
