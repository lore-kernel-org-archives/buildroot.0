Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792EEC5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 08:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38BFD404EC;
	Mon, 26 Aug 2024 08:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fQQNd_VLqET; Mon, 26 Aug 2024 08:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C09E404FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C09E404FC;
	Mon, 26 Aug 2024 08:05:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C15381BF2A1
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 08:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD93C6074C
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 08:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9KhjXkY_Gc6 for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 08:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2F7260723
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2F7260723
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2F7260723
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 08:05:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01E71E0007;
 Mon, 26 Aug 2024 08:05:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1siUjJ-00FrDz-0v;
 Mon, 26 Aug 2024 10:05:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Mattia Narducci <mattianarducci1@gmail.com>
References: <4243551.mvXUDI8C0e@localhost>
Date: Mon, 26 Aug 2024 10:05:37 +0200
In-Reply-To: <4243551.mvXUDI8C0e@localhost> (Mattia Narducci's message of
 "Sat, 24 Aug 2024 18:43:26 +0200")
Message-ID: <87frqrbtf2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/proftpd: fix group name
 preventing server from starting
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

>>>>> "Mattia" == Mattia Narducci <mattianarducci1@gmail.com> writes:

 > Replace the group name 'nogroup' with 'nobody' in the default ProFTPD
 > configuration file. This fixes the following error when starting the
 > server:

 >   proftpd[110]: fatal: Group: Unknown group 'nogroup' on line 30 of '/etc/proftpd.conf'

 > Fixes: 0d887cc2b4 ("system: replace nogroup with nobody")
 > Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
