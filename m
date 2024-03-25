Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF192C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 18:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A3BC40746;
	Mon, 25 Mar 2024 18:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8MIWqiy2o9U; Mon, 25 Mar 2024 18:11:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 971DF40737
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 971DF40737;
	Mon, 25 Mar 2024 18:11:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACB1B1BF263
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 735CE40476
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3heaLpsy8V4 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 18:11:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE76840195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE76840195
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE76840195
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 18:11:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39F951C0007;
 Mon, 25 Mar 2024 18:11:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1roon4-0090Uf-1e;
 Mon, 25 Mar 2024 19:11:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240317141438.809626-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Mar 2024 19:11:22 +0100
In-Reply-To: <20240317141438.809626-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Mar 2024 15:14:38 +0100")
Message-ID: <87msqmb2r9.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/privoxy: fix build with root
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

 > Fix the following build failure when the configuration files are
 > installed as root:

 > id: 'privoxy': no such user
 > ******************************************************************
 >  WARNING! WARNING! installing config files as root!
 >  It is strongly recommended to run privoxy as a non-root user,
 >  and to install the config files as that user and/or group!
 >  Please read INSTALL, and create a privoxy user and group!
 > *******************************************************************
 > make[1]: *** [GNUmakefile:861: install] Error 1

 > This failure is probably raised since the addition of the package in
 > commit f8a263fe361ab37ec6765b9ff6478c3b15e3d139 and
 > https://www.privoxy.org/gitweb/?p=privoxy.git;a=commit;h=26baf6bcc0b5db47b8cf5c55eece0614712b5180

 > Fixes:
 >  - http://autobuild.buildroot.org/results/28d8ca6f0e2d81d62196a0958c9274ad2c8c9871

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
