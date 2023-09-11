Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45640EE3F2B
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E196C4188F;
	Mon, 11 Sep 2023 20:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E196C4188F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxkTU58gQ2pn; Mon, 11 Sep 2023 20:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 121B741873;
	Mon, 11 Sep 2023 20:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121B741873
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1792E1BF215
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F284A40158
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F284A40158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDmwxlHtBo-e for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:52:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8015D400F2
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8015D400F2
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1ED21BF211;
 Mon, 11 Sep 2023 20:50:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfnrg-00Fn5O-Vm; Mon, 11 Sep 2023 22:50:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230807174515.3261136-1-bernd@kuhls.net>
 <20230807174515.3261136-2-bernd@kuhls.net>
Date: Mon, 11 Sep 2023 22:50:36 +0200
In-Reply-To: <20230807174515.3261136-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 7 Aug 2023 19:45:15 +0200")
Message-ID: <87y1hc8meb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/python3: berkeleydb support
 needs the dbm interface
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Berkeley DB support in python depends on dbm, when missing python fails
 > to detect libdb:
 > https://github.com/python/cpython/blob/d2340ef25721b6a72d45d4508c672c4be38c67d3/configure.ac#L4002

 > quoting configure log:
 > checking for libdb... no

 > quoting python config.log:
 > conftest.c:(.text.startup+0x8): undefined reference to `__db_ndbm_open'

 > Only with this patch python builds a berkeleydb module:

 >   output/build/python3-3.11.4$ find -iname *dbm*.so
 >   ./build/lib.linux-x86_64-3.11/_dbm.cpython-311-x86_64-linux-gnu.so

 > since python 3.11 (added with buildroot commit
 > 738500c296c8b1206f20e94ca3e7c5932a6a0486) changed the way it detects libdb:
 > https://github.com/python/cpython/commit/0a9f69539be27acf1cddf1b58d02a88d02e5008d

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
