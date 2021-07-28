Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7B1C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:46:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A4460234
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79A4460234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2623A4059F;
	Wed, 28 Jul 2021 19:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GnfMdG_LD2un; Wed, 28 Jul 2021 19:46:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 653B74054E;
	Wed, 28 Jul 2021 19:46:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 970701BF2BC
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 934D8608AD
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxniZMOOkU9x for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 19:45:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A40AD6088D
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 19:45:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:453b:e753:6c2:161c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 577F720039E;
 Wed, 28 Jul 2021 21:45:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627501556;
 bh=tfoB3UcVWXxonHbtv5vIawdTEi140EiEn/GlteEeans=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j4MwkOtfIjkVxIciPS+9M2BDndXpoqaO1R+fu/leFYpvvS+kBF4Nb59kpzabCohJ1
 OoA0hBHRceqrYT1fclENgyG8RRLrfy47CJqxUEWu1VCNbSAmpMvihuByl2ABeMR8wT
 r5nf0p16p0ULNVENeCEIgHmVof1lulKF4iwYYEL5pCOqruoo2gXEeCsxzsvQwjVh6N
 GfJzGt6ToyxwzA32tJhgNqAQtliyVxhmz++tPk5vfKMXlOvKPKR5aNivr/vBkkIOm8
 TZHfltXFE0htw8yGSmADRNuN7cjg298iZ9uQWAIR/9Txihh9sMp3v10DXch/XBoLme
 E209hvN2aoiVA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 28 Jul 2021 21:45:46 +0200
Date: Wed, 28 Jul 2021 21:45:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210728194546.GF3189549@scaer>
References: <20210726082131.1705945-1-fontaine.fabrice@gmail.com>
 <20210726141522.38012b89@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726141522.38012b89@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/drbd-utils: add SELinux module
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
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, All,

+Matt, our resident SELinux expert ;-]

On 2021-07-26 14:15 +0200, Thomas Petazzoni spake thusly:
> On Mon, 26 Jul 2021 10:21:31 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > Support for drbd-utils is added by the services/drbd module in the
> > SELinux refpolicy.
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/drbd-utils/drbd-utils.mk | 1 +
> >  1 file changed, 1 insertion(+)
> 
> I have a question: are you testing/using all these packages in an
> SELinux context ?

That is eaxctly what I was pointing out with our addition of the
handling of the SELinux refpolicy in our package infrastructure.

On one side, either we consider that the refpolicy is authoritative and
represents the state of the art of the SELinux policy for packages, in
which case we can "blindly" add SELinux metadata to our packages, or...

on the other side, I fail to see how a generic policy can be applied to
a specialised product, where constraints vary wildly from the "server
world" where refpolicy and SELinux originate from, and even vary wildly
between different specialised products, in which case basing out SELinux
handling in our infra on refpolicy does not make much sense.

So, it is my understanding that we decided that the refpolicy was to be
seen as the gold-standard of a policy, from which customised, local
policies would be derived, and as such we could safely use the refpolicy
modules on the assumption that a local policy would also have them...

And as such, we can just batch-apply Fabrice's patches on the topic.

But I am not an expert in SELinux, so... Maybe an SELinux expert (Matt?)
could chime in and explain a bit?  Please? ;-)

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
