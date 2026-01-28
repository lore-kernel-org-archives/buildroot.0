Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F249D35690
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 08:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CE2C81E9D;
	Wed, 28 Jan 2026 08:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJVLHQ5EhJIr; Wed, 28 Jan 2026 08:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 422BB81EAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769590706;
	bh=V2alG5Elg9+cydHr2m9hm9HOoGOzNjkqbviDe78ffWc=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Xzctc4pHN2q62Fbm3nqODbReJjegzlD8AmVlErYIZ8lrgKaQhp49Mwlg9EmFEjoyd
	 MGogWiPgZr6VkNwq9PVMOpOzLUpstgW6FpOZCxULHmGns8mkiXacgaQDGFe1zwRXbl
	 DdgsVMGYZhp+K86vcKUnaPKeygrIIOGsRvLgCFBoNGA8VApaelXQG5C6zEnNU31YWh
	 ZyR2qXtOvVLqwo2Lir/f6NMkGqu8PyzMZrVwNIAVXj6ozaLQsoTaS7NxjzjaWtTOsZ
	 G5j4mCKJmgSS1l2KCbh8Qhjw3c7JGbRLjpqQzC8b3g9kc7UduVBUXMjJzyuKcuKDFC
	 AxfHntlGSoTkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 422BB81EAA;
	Wed, 28 Jan 2026 08:58:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 345C6118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 08:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EC50401F4
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 08:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CC6X6QjYYjwW for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 08:58:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1229040148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1229040148
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1229040148
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 08:58:22 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1278275923; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Jan 2026 08:58:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vl1NR-000000045gu-3mV1;
 Wed, 28 Jan 2026 09:58:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Chris Packham <judge.packham@gmail.com>
In-Reply-To: <CAFOYHZD9MLCF=w0H6F39WGwwypfXrD4=zJ75wiVfdAnZ0J-niA@mail.gmail.com>
 (Chris Packham's message of "Wed, 28 Jan 2026 10:11:39 +1300")
References: <CAFOYHZAeKaF89C8hGkiWz_qBT0Kq4n3bM=tmmSThhV2gBs75Qg@mail.gmail.com>
 <aXknYlAq4sBVhAv2@waldemar-brodkorb.de>
 <CAFOYHZD9MLCF=w0H6F39WGwwypfXrD4=zJ75wiVfdAnZ0J-niA@mail.gmail.com>
Date: Wed, 28 Jan 2026 09:58:17 +0100
Message-ID: <871pja15cm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=dQdp42oxJab8GJzGkHDkeapOsLUKE5n0MTmVwYKacmkOpuBWx5I8eB0BwKMkHGk7fCd0r1wKcLn7rGd1TD5uyqOeq6MVZ8bnPNYPQ6UZEjzrpbefcu9AcorNNIhPKMEBdczuDTAnT4zD3d8JR1OZ5Ma9POCSHbpND2PuQZRXaz008pKz7sbHrsEheibOO0s4586PUMggbvtmKmxo/Bv0d+GFZ1Dhrax1de4fPgjRM6bcZhZSQ/OBAOuFK7WaUsJ/Z5Bvf69aduQr1SIkapj7D0JKPuYNcm4OWejiCvTV2jKFxaydJ/rhosr3J5URnyw5vOpGXEJkENjycE/abF+Z0w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=u4/goWIh7Znpc2w5p0bFWbW/3K+KaF0mhV7ENaAZCL8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=dQdp42ox
Subject: Re: [Buildroot] crosstool-ng piggy packing off sources.buildroot.net
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

Hi,

 >> I have installed a robots.txt, but it seems to be ignored.

 > Yeah we have exactly the same problem on crosstool-ng.org. I'm pretty
 > close to turning off our hg/git interface, it's only historic so
 > there's actually nothing new there (that doesn't seem to stop the
 > bots). It's a shame that the side effect of all of this scraping is
 > forcing people to centralise their source code hosting.


 >> Any ideas are welcome!

 > I'm waiting for the AI bubble to burst so we can go back to using our
 > GPUs for bitcoin mining :P.

Heh ;)

We have had some success with putting Anubis in front of the services,
but it is an arms race:

https://anubis.techaro.lol/


 >> I just started the webserver again.

 > Thanks, I still think piggy packing off the buildroot mirror would at
 > least lessen any load our builds are putting on your servers.

Yes, it is fine to use sources.buildroot.net

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
