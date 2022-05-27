Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE80C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 11:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ADD6414A4;
	Fri, 27 May 2022 11:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBVXok_MLgIv; Fri, 27 May 2022 11:30:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 764954149A;
	Fri, 27 May 2022 11:30:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF4BB1BF40B
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 11:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE83A8433E
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 11:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_RDeysS4XZ6 for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 11:30:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27AC1842EE
 for <buildroot@buildroot.org>; Fri, 27 May 2022 11:30:41 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id A58D0440F3C;
 Fri, 27 May 2022 14:30:35 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1653651035;
 bh=63J1j7Z3AeO0gIMPHYRysrKfipWhFedCVl4UaXWtTp8=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=AOqvzn2wfMMT+Ou5JqmDaiZmtGBbxYcF43rvTALMOO3iLket6e0xprcaQw4aLZXX4
 KgONScuEIvk69Qq5WUKaBjJwH5mKeKbSVCz0C59Von3oGF+XjEwWW/NmoKZcE5/yzi
 01K/ejIDCTri1SoddAXBRmzYwxpDjhdBBpie7tzoElIyOZfNVhV5d7yyPzqU6IlnuO
 VxSWwSYu/aFu/ieIgLTZ1QUNZt52yyitA7YsoAvDqvx+d0DivpsD249r18EaoskTNx
 wDaLvdK83dJi2WyRtZyj1XCkTv6zSG6kCFMz70vebuTf6ZCZetU00X6fV8Nnr17MK8
 fEC4hbNpXhhpQ==
References: <20220427035556.1814178-1-james.hilliard1@gmail.com>
 <87zgj3jp4g.fsf@dell.be.48ers.dk>
User-agent: mu4e 1.6.10; emacs 27.1
To: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 May 2022 14:29:29 +0300
In-reply-to: <87zgj3jp4g.fsf@dell.be.48ers.dk>
Message-ID: <87h75brz4z.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix unsafe openssl
 header path
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Fri, May 27 2022, Peter Korsgaard wrote:
>>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
>  > Explicitely set the openssl path so that python3 doesn't search host
>  > header paths for target openssl headers.
>
>  > Fixes:
>  >  - http://autobuild.buildroot.net/results/c27/c27fe795e079350dd1c9af45be417d41b55e57c3
>
>  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Committed to 2022.02.x, thanks.

Not in 2022.02.x as of commit 15e59056c47 ("package/vim: security bump
to version 8.2.4843").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
