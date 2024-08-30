Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A75FCA0FF3
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 13:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA91808D8;
	Fri, 30 Aug 2024 13:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhmMqKQOHeP5; Fri, 30 Aug 2024 13:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F9180A52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F9180A52;
	Fri, 30 Aug 2024 13:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9577F1BF20F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 13:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DE8F403BE
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 13:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8b9NOD6RZ_7 for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 13:59:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C68AE40224
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C68AE40224
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C68AE40224
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 13:59:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DC2220009;
 Fri, 30 Aug 2024 13:59:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sk29t-008XoW-1t;
 Fri, 30 Aug 2024 15:59:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240722104859.1092677-1-fontaine.fabrice@gmail.com>
Date: Fri, 30 Aug 2024 15:59:25 +0200
In-Reply-To: <20240722104859.1092677-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 22 Jul 2024 12:48:59 +0200")
Message-ID: <871q262jsy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/apr: fix musl build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > strerror_r on musl always returns an int since its addition back in 2011
 > with
 > https://git.musl-libc.org/cgit/musl/commit/src/string/strerror_r.c?id=0b44a0315b47dd8eced9f3b7f31580cf14bbfc01

 > As a result, setting ac_cv_strerror_r_rc_int to no results in the
 > following build failure since bump to version 1.7.2 in commit
 > 783cd8d90d37b5e0b59d6f0bfca6667855b2b9e1:

 > misc/unix/errorcodes.c: In function 'native_strerror':
 > misc/unix/errorcodes.c:385:9: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
 >   385 |     msg = strerror_r(statcode, buf, bufsize);
 >       |         ^

 > Fixes: 783cd8d90d37b5e0b59d6f0bfca6667855b2b9e1
 >  - http://autobuild.buildroot.org/results/9a42a4427ff64d47da61c731abb99d7585781cdd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
