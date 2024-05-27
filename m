Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BA3C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 13:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C214F81007;
	Mon, 27 May 2024 13:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BLfpI2zBMEK; Mon, 27 May 2024 13:14:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D720C81008
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D720C81008;
	Mon, 27 May 2024 13:14:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBA2B1D1276
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8A61401C2
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKvcJ5A77Auh for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 13:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74965401B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74965401B2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74965401B2
 for <buildroot@buildroot.org>; Mon, 27 May 2024 13:14:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6003E1BF203;
 Mon, 27 May 2024 13:14:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBaAy-005LOP-2a;
 Mon, 27 May 2024 15:14:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240430204744.1014238-1-romain.naour@smile.fr>
 <20240430204744.1014238-2-romain.naour@smile.fr>
Date: Mon, 27 May 2024 15:14:08 +0200
In-Reply-To: <20240430204744.1014238-2-romain.naour@smile.fr> (Romain Naour's
 message of "Tue, 30 Apr 2024 22:47:44 +0200")
Message-ID: <87h6ejbdnj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/perl-dbd-mysql: fix runtime
 issue with MariaDB
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Now that the TestPerlDBDmysql can be run normally, a new runtime issue
 > appear due to switch from oracle-mysql to MariaDB:

 >   # perl -MDBI -e '1'
 >   # echo $?
 >   0

 >   # perl -MDBD::mysql -e '1'
 >   Can't load '/usr/lib/perl5/site_perl/5.38.2/arm-linux/auto/DBD/mysql/mysql.so'
 >   for module DBD::mysql: /usr/lib/perl5/site_perl/5.38.2/arm-linux/auto/DBD/mysql/mysql.so:
 >   undefined symbol: net_buffer_length at /usr/lib/perl5/5.38.2/arm-linux/DynaLoader.pm line 206.

 > This is fixed by an upstream commit [1] from 4.046_01 release.

 > [1] https://github.com/perl5-dbi/DBD-mysql/commit/0f0cebe87fab335873fd3701bc304922da826940

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654506

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
