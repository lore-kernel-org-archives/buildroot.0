Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8471CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 15:27:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 058CA6115A
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 15:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 058CA6115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD18C83CB8;
	Tue,  5 Oct 2021 15:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfFMqWt9-Tl3; Tue,  5 Oct 2021 15:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C3083B9C;
	Tue,  5 Oct 2021 15:27:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75E091BF315
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 15:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 656D060B2A
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 15:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lmk81VgNvREr for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 15:27:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 349CE607A1
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 15:27:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:19f9:cbe2:8053:b89b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8185F19F58A;
 Tue,  5 Oct 2021 17:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633447661;
 bh=gOj4lNABjel0Ubt23/7huGp5BMalmLotwLPG8SYPyrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pontELVL9vKMZE93WHzfNVQA1y3yFYmmxnRKsaveotl2/nmlaE5ofSfuRoE/6caQ+
 aY7SjAyLC6K8onp+2JhMVZofkPjxQgh8wQnUYbokitDQmrrIRXXzsnP5ChU1ODYjvP
 d6ELIzjWE0kf/IJR6Ecxzui7pbD6oGieo0Dqx5wn9GsM9po6JSplc6shdqfRm1MMfI
 pNY16SPQ/D/BWSC6tlhsjaklxeF1OA5HVBfNNPS8cK+15iJbdQoCFOlt6mQQtG6zTY
 dJbq79qYS11y59UA4IJ+IJOJEyq3uAydzzlOm0Ep+S6WUpPhiYtTdZD7FTBx+M1nF3
 SMmie7bPumXcA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 05 Oct 2021 17:27:34 +0200
Date: Tue, 5 Oct 2021 17:27:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211005152734.GA2081069@scaer>
References: <20210917201944.3760710-1-yann.morin.1998@free.fr>
 <87v92bd1u7.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v92bd1u7.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] fs/ext2: fix namespace for variables
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter

On 2021-10-05 15:43 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > In filesystems, variables must be prefixed with ROOTFS_, to avoid
>  > ckashing with packages of the same name.
     ^^^^^^^^
>  > We do not have a package named 'ext2', so we currently have no clash,
>  > but it is still ebtter that the variables be properly namespaced.
> s/ebtter/better/ ;)

Lol. But you missed s/ckashing/clashing/ above. ;-)

>  > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>  > Cc: Kory Maincent <kory.maincent@bootlin.com>
> Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

Thanks for the backports! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
