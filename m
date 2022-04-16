Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616CAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 11:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7076D4198A;
	Sat, 16 Apr 2022 11:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8Awjg3HPf6U; Sat, 16 Apr 2022 11:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D8CD4197A;
	Sat, 16 Apr 2022 11:13:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2431BF59F
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 11:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0859940592
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 11:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id avt2cXXt4oMX for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 11:13:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06CD640414
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 11:12:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2145F1BF206;
 Sat, 16 Apr 2022 11:12:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nfgMI-00ES85-UU; Sat, 16 Apr 2022 13:12:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com>
 <20220324082433.GA3649946@scaer> <87fsn2b4ht.fsf@dell.be.48ers.dk>
 <df314344-f151-7ae4-1e56-b65b8532d6d2@microchip.com>
 <32c50049-ca86-b729-aec9-4893711dbc2c@green-communications.fr>
Date: Sat, 16 Apr 2022 13:12:54 +0200
In-Reply-To: <32c50049-ca86-b729-aec9-4893711dbc2c@green-communications.fr>
 (Nicolas Cavallari's message of "Fri, 15 Apr 2022 14:25:22 +0200")
Message-ID: <87sfqd8eo9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed
 with new seed when saving
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
Cc: Eugen.Hristev@microchip.com, Jason@zx2c4.com, yann.morin.1998@free.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Nicolas" == Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr> writes:

Hi,

 >> to work fine. So it must be something else then...
 >> Thank you for your help !

 > If /var/lib/random-seed does not already exist during boot then the
 > new version of the script will fail and not create it, because start
 > is "init_rng && save_random_seed" and init_rng will fail.  If
 > S20urandom stop is never called then this may explain the issue.

 > I pointed this out before but it must have been lost:

 > https://lore.kernel.org/all/20220324103939.GD3649946@scaer/T/#md433db1bd1e08f3476eefd4e9a83ead5e12b1276

Ahh, indeed. Care to send a patch to fix it?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
