Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE0DC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:06:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD181608FE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD181608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7157840104;
	Sun, 29 Aug 2021 17:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iljPGWRhHCTl; Sun, 29 Aug 2021 17:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4199F4020D;
	Sun, 29 Aug 2021 17:06:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8318C1BF599
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E2794020D
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffL2GFzzHI6N for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 17:06:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7353F40104
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 17:06:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87f:483a:a09f:382b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6F2255FF93;
 Sun, 29 Aug 2021 19:06:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630256804;
 bh=jjf1/qq6nBgls86DCb6yMRRuIAEGB9HA4nib+f27MXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FS3ZOqYAwLEvRM+MbOOI3wArVrXFyt2X2KcgP0fHc8coQR6lgZ+j7Wb9Fs5DfspqJ
 58c6yR62rDgRy6bh5uluZdFG+wzbAI/yG/VFVi/CDSezi/FRLLPy6GV9r3O0LQ1FS/
 eHV2ov/mbNk5g6snN9UuHa/+Ec6aGB53h4M8BxTEB7IokNSCq+O+AY1+y/hWPQDzDw
 2OmafDBwXqh5TVgw2+PEoJIDOm1PQ8AqscXhJTINmAwONZZJ/zqgj/hpQZjrQgaayW
 aJPptTOMbNcQ5bjsZSbq5ELEGgn8GGAXxkKWm2Ul63uwAAnf4hfqWUFNkedH7dnRhq
 cmh5jL0xsv+tA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Aug 2021 19:06:38 +0200
Date: Sun, 29 Aug 2021 19:06:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210829170638.GC1053080@scaer>
References: <20210804140211.12849-1-anaumann@ultratronik.de>
 <461d6e65-dbea-d448-524d-1fbe9142fa99@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <461d6e65-dbea-d448-524d-1fbe9142fa99@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5opcua: new package
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
Cc: Andreas Naumann <anaumann@ultratronik.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout, All,

On 2021-08-29 18:52 +0200, Arnout Vandecappelle spake thusly:
> On 04/08/2021 16:02, Andreas Naumann wrote:
> > The Qt OPC UA module implements a Qt API to interact with OPC UA on
> > top of a 3rd party OPC UA stack.
> > The default is open62541, which is bundled by qt5opcua in version 1.0,
> > so we dont need to provide/depend on br's own open62541 package.
> > 
> > Another dependency is mbedtls, but it's optional.
> > 
> > Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>  Applied to master, thanks.

s/master/next/ ;-)

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
