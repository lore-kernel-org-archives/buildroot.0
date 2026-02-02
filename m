Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E5AE7DF11
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4032A407BA;
	Mon,  2 Feb 2026 17:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIMFJ8-QpX8t; Mon,  2 Feb 2026 17:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5536A407EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770053390;
	bh=gSue59kSkayqWohUO1f+K2WFzHciIXUmXGyfJB5c3fI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CWywJ+7/hB4MUvIKpv7AxOxpOfVSeADbT3D0YBvUrM7cgvIDbcsiTxNQVHdiSjmu7
	 ta+iHKj+RRssZbQYqigz8j+m4oI3OifObN9WSHRs3vjmDfCZ74vYUMphC8rSGLgUmp
	 KKU5kmK05L5mnu0zpARN/l8M6NFPOSBwhy/GB7VXghDNcMfFlsYUAwfloh4v30eVXK
	 TSdueXpYFfzwHoWotgaSIj+q6ho8a3002iTYHnBti7wKGzmWQsDdqWsYP9q114U169
	 wLC+IU3InzbAMXZUxM7qrM1aP5oz1LRJ0d0bAmMXxVlyPE2CqFwWGR02L2yBAlOcaY
	 ANq7JidqdCsNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5536A407EE;
	Mon,  2 Feb 2026 17:29:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9EEE23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A73746076C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ll3EwaIFTUf5 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:29:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 878FB605E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 878FB605E5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 878FB605E5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:29:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1982549942; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 17:29:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmxjw-00000007GVJ-0HkZ;
 Mon, 02 Feb 2026 18:29:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260115194549.1208078-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 15 Jan 2026 20:45:48 +0100")
References: <20260115194549.1208078-1-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 18:29:31 +0100
Message-ID: <87a4xrxddw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ZXhhh6baWP24u0zalyh8y2+Paf8QfqZg5jauEMle8go2NvGWBgt8WJOyRB9HyUcVEHYvh2U0yTdz7n8q3OPb8jbnnY7d40zpGGv+yZTwkigy+6k7nMtGjWADfYCEIlwIc4cql1j2XxU1XgmhS4t8awn9r0hIUGKgfm5JOkMm6H2rkQ1T0zGrxDS9Z4rnZFs1q+3IG0hRHq1CUF2IvmI6yP6vz0VXnyVOs/8eZOBPIAQG8yJcJ65tFHckUT0hhwAObqyXuSS9JZfBF5LQWom6TuoXTtcz68qWoHK3c1SYqFBVU52M8xUVuCt0rZ5eLOMQgGR4MMM7BxCIXGhrsOlH2A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=dI4ObGtVPjyd4VeKcsLw1z/xxTpv3q4AgyLrpvNAN9A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ZXhhh6ba
Subject: Re: [Buildroot] [PATCH 1/1] package/berkeleydb/: fix non-threaded
 build
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

 > Building berkeleydb is broken with a non-threaded toolchain with gcc >=
 > 14.x:

 > ../src/rep/rep_method.c:1740:25: error: implicit declaration of function
 >  '__repmgr_get_nsites'; did you mean '__rep_get_nsites'?
 >  [-Wimplicit-function-declaration]
 >  1740 |                 return (__repmgr_get_nsites(env, n));

 > According to src/repmgr/repmgr_util.c, line 503+, the function
 > '__repmgr_get_nsites' mentioned in the gcc error message "may only be
 > called after threads have been started".
 > This source file repmgr_util.c belongs to REPMGR_OBJS according to
 > dist/Makefile.in, line 249+, which is, according to dist/configure.ac,
 > line 956, only build if thread support is present.

 > In a non-threaded build '__repmgr_get_nsites' does not exist causing the
 > build error.

 > To fix the build error we disable replication for non-threaded
 > toolchains.

 > Using gcc 13.x the build error does not occur, tested with this
 > defconfig:

 > BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 > BR2_PTHREADS_NONE=y
 > BR2_GCC_VERSION_13_X=y
 > BR2_PACKAGE_BERKELEYDB=y

 > Using this minimal gcc 14.x-based defconfig

 > BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 > BR2_PTHREADS_NONE=y
 > BR2_PER_PACKAGE_DIRECTORIES=y
 > BR2_PACKAGE_BERKELEYDB=y

 > the build error can be reproduced.

 > The oldest build error of this kind, afaics, dates back to 2024-06-13:
 > https://autobuild.buildroot.net/results/e0d/e0d6bdbef01bee277b0da83605b2906af876058a/

 > Fixes:
 > https://autobuild.buildroot.net/results/792/792ed942d17bb8d00cd321536a102f6dd63b6a8a/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
