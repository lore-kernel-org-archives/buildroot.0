Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F969C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:23:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEAE960E77
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEAE960E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9870083E6B;
	Sat, 28 Aug 2021 12:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UNiUHkxadGL; Sat, 28 Aug 2021 12:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12ECA83E6D;
	Sat, 28 Aug 2021 12:23:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CED81BF319
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28801400CB
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xEa6D5OPjiSN for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 12:23:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8961F4012F
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 12:23:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ce:7c4d:7a73:f3f6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2B57B780306;
 Sat, 28 Aug 2021 14:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630153383;
 bh=0Gq7Tg4reEaz3/12KdDfoh7fwUFEkU5iD9r1ySTbxXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I5mW+OhhlVmK4kSZMyawbmPFmmdPIPJaMuYMyBjUb9+hwD3Qh/hMP9QcwtjQWLJjE
 TTdWCikL42fW2NYqTtK6KNrIWchojnT7RDQ3pDiWBg+fMOwKmF29dpdoUTpdqfL317
 L5nRAhhXL6h3Qb9kKm0sjBfTaRarwH9TMF8zvUGsH3A7UuDpLwjprw3e7Eq+jDej/l
 9g1r6LoVi2E5hRUMfWXEkyP7+ChrCIgtHSXDwCBzr4Ou6tNdjMxr8ssh6YeXts/RE0
 A9h78NuBM/eD3eq8TH69YWVZYP6uGn/T6FWZaJxxburlAJnqV85NRIIFv7KrSl6c4O
 y9p7Z9Q48lw1A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Aug 2021 14:22:56 +0200
Date: Sat, 28 Aug 2021 14:22:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210828122256.GI2661@scaer>
References: <20210827211426.77376-1-conrad.ratschan@collins.com>
 <af866dec-70f5-fea2-3f59-01908afe35a6@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af866dec-70f5-fea2-3f59-01908afe35a6@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: Prevent overwriting
 of fakedate
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
Cc: Conrad Ratschan <conrad.ratschan@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout, All,

On 2021-08-28 13:47 +0200, Arnout Vandecappelle spake thusly:
> On 27/08/2021 23:14, Conrad Ratschan via buildroot wrote:
> > When BR2_REPRODUCIBLE is set and host-coreutils needs to be built, the
> > fakedate script installed to `host/bin/date` will be overwritten by
> > host-coreutils. Disable installing the `date` binary in host-coreutils
> > when BR2_REPRODUCIBLE is set.
> > 
> > Signed-off-by: Conrad Ratschan <conrad.ratschan@collins.com>
> > ---
> >  package/coreutils/coreutils.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> > index 65234a113e..1bdfe2f9cf 100644
> > --- a/package/coreutils/coreutils.mk
> > +++ b/package/coreutils/coreutils.mk
> > @@ -164,5 +164,10 @@ HOST_COREUTILS_CONF_OPTS = \
> >  	--without-gmp \
> >  	--enable-install-program=ln,realpath
>  We were supposed already to only install ln and realpath, so this issue
> shouldn't have happened to begin with. Could you investigate in a bit more
> detail why this --enable-install-program doesn't seem to do the trick?

See the comment just above the HOST_COREUTILS_CONF_OPTS:

    # A lot of other programs still get installed, however, but disabling
    # them does not gain much at build time, and is a loooong list that is
    # difficult to maintain...

> > +# Avoid overwriting fakedate when creating a reproducible build
> > +ifeq ($(BR2_REPRODUCIBLE),y)
>  If there really is no way to get enable-install-program to work correctly, then
> we should probably not make this conditional on BR2_REPRODUCIBLE anyway.

Yes, we should really just disable it unconditionally...

So, I extended the commit log, the comment to explain all that, and
uncoditionally disabled installing date.

Applied to master, thanks.

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
