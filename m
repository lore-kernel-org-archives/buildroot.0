Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35679C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:04:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF67560ED3
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF67560ED3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B17AB4256F;
	Sat, 28 Aug 2021 14:04:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVFxTm5hgtyR; Sat, 28 Aug 2021 14:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16C8842583;
	Sat, 28 Aug 2021 14:04:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1818A1BF2E5
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14FC460673
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJmG8VkvZ8Ls for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 14:04:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1401D60681
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 14:04:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ce:7c4d:7a73:f3f6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 88EEE78034E;
 Sat, 28 Aug 2021 16:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630159465;
 bh=vzh38eCMT/z3bPxjZo+DnH0AcahhDBiAsOjDZ8J2RrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OOXr7LtvJtsqJcWjrW/7axwnBJjIirTOVdiGr7QfEaBDq9TzEdI5Jb2VclkcjJtK9
 kmjgMOK0z7GVadYQO5DlkuqxjgZoBESADf45NOjQ+s4ZH3gsulSiLr39u4SLzfON46
 Ko7d6WKkLLTzkYKQKb01Ksqzza0PHwImHEDox9wo5b8a5kUtkFqKH6F/572WYh2gVJ
 VgVOzVTzRUjq7vM7iQWm60L17nIzDdsOFY5XC7q61cARUXIQMkUPdIBksOlI5qcIAR
 P5t+fni0adUQdAfI7uOtT9a56hAzMUgd48SyGN64RIZeByh71bc1iNwNB0xLSDUabk
 szu1i5a1r3C+w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Aug 2021 16:04:18 +0200
Date: Sat, 28 Aug 2021 16:04:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210828140418.GM2661@scaer>
References: <20210828130847.461996-1-yann.morin.1998@free.fr>
 <fc83d0b8-928f-6cab-de86-7a58a4114445@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc83d0b8-928f-6cab-de86-7a58a4114445@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/fakedate: avoid recursion if not
 first in the PATH
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout, All,

On 2021-08-28 15:57 +0200, Arnout Vandecappelle spake thusly:
> On 28/08/2021 15:08, Yann E. MORIN wrote:
[--SNIP--]
> > We fix that by iterating, in reverse order, over all the 'date' we can
> > find in PATH, and when we find ourselves, then we know the one we found
> > in the iteration just before is the one that we should call.
[--SNIP--]
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>  Applied to master, thanks.

As discussed on IRC: s/master/next/

(Baruch will not have to worry we again messed up when pushing! ;-) )

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
