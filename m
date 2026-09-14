Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674B9C88E6A
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 09:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3122C405C9;
	Mon, 14 Sep 2026 09:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uo4sxfsvky4L; Mon, 14 Sep 2026 09:27:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2FD3A40587
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789378063;
	b=aDXcnXpPDh4/uUOcLM2GnjFsmUb9gi4vbhadPWPMOh8Nn4Ay9Q1iu/XLDQyx6/i9Vrpb
	 gEJUSpnRbrO9fNjORzR0u32nBzN6iKJbOzMIQhP+asLcSNpSuVzVZ3IDfz1dpu9gH7A2F
	 auUKQiwIe8zke0GGBLAd+bsUCbwUpsIRgzR3fjkafvKwLa+aJK44Tywr81nbY63xO0Qq8
	 vCvu5WEfq54oinYHWIpigCNDoeCf3MHucm40T0zlW8HKj1abT0S6o7sdBUK7+0gI8X7xB
	 a8lPPzar9ZrGbam6yoAOja118/LGQuDpQ3UOlfEhWEIq+rPrm1oSycd8M2RNP6plqOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789378063;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:From:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Date:To:CC:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Originating-IP:
	 X-ClientProxiedBy:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=KVl/supN4qpmqSDohggeAC5tXEXQb4MbKWjmam7O+Bo=;
	b=kgSLRO4zZbNtJbt4Uux5rLEeQ40yK+WeGAMBrrJdYTqg+YCJCMVmhjmJ7NcVncYB54Gy
	 hAAd4AjvOuV3CsoTHSYRyZA71xI6+0odlY4816pAASvXukemclUxMuLru/HuDO9ay9BhY
	 VGmR7xr8ve+Qoy0/ER+hYodAUk/gjfVdkAKyFkc5CYQrDGnzr+cgNhFTeYCEc4Kr2WGbC
	 46EIQ3d6RbPT9b3257gkq8UFvFsA4T6QdUl94MJsEAghLrkcvnWq6Fd2Dj3kl5vpk2h4T
	 ZlhZ3utYoPe3iA20MgLH5/WZcASKbg+dLrDmK3WQYR7CVBWA/O+MuwTzgj8Y9x+R0Xg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789378063;
	bh=KVl/supN4qpmqSDohggeAC5tXEXQb4MbKWjmam7O+Bo=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jcrVWT0lP5uYU6a4OwgWiA4SON/eWxzF1HbW0U+5SY4oAQaHalfuZoJehOXiGJNyA
	 8sAORAgtnSOAVjg48EHQyQ4/W/0hETUBzdWtUjubihBG928KVGjXgU+9IG1cKTbJyd
	 AlLnV1CBM5VDBsA799a1kGb/8DW3gK+ohqxDmHGuC2I/UC2fE6VnxuYwqcFvd4qs3i
	 9BUHfoTnSRozIUljC6e0PwMzab9LVgL9uXE6hBoKCH/oLNnW3M6Wef9L+G57hkogzf
	 R5jjqg/OMfVRph8Z7/Hs/2ytpeIOY/B40j+aXXfAr7JST2aMzKqVoaGrh7kODYC3q6
	 gNldaS9kwhXOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD3A40587;
	Mon, 14 Sep 2026 09:27:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 207F7493
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 09:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05CCD80D52
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 09:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17OhuNlwdm-M for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 09:27:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C5E9580D32
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=80.12.126.237
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789378060;
 b=bD6NcS3SgFSBnOtz0QbsCqh2QgTm4uKLs7UPtOiZO5KuPsoXA3YcnBhQ/imK638Z8N/z
 wXxiUVc8Tc275GlJO2R7DtXqFjhpA47ZwigmhBjBysElNJ7fp7dQVkzjb/MjpFb1JAoy3
 sHmHvQ135BcQWhvDDW1WAELI/4pvDfEu1mOlSWK4M/NHh5hcgpFZUA7f/dZr0/F+84vuU
 aZO3nV3s2rN2zuMUfHe1im0so6uxb2u4XzLJJAFQDwWHPhPB+TCzp9ZdOMirufhWaAWJE
 x5j+VVOV3mmZ5f6XzT/W6EDEiV580q7VGDUnN498VGNbJmMC64puKW77aExjyIayS5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789378060;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:From:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:Date:To:CC:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Originating-IP:X-ClientProxiedBy:
 Content-Transfer-Encoding;
 bh=UVH7o/OQzowjyM4ikuZ656NjxtyFr+0RnAKBwuiNXUE=;
 b=qmIDPEq1j8AW89tgT+T6pDK780xv5lFUIDNlAKr+SGcBc4ZrVDV3wdk4w+Izuba8vzo0
 34c04pYp8YubcgeQNMZMt6TKTNT6KreND87FJHesPX+7U2dBaxaKUPoFO9ADeJMLqh47l
 FZiB+U+hlLNKso6a/6x4wzH8zoi9DjXBrhD6UbBBCjkUJzshN1Q6XOobED/QONKRwBaMM
 EFxLEoZOltL6OhJQcZ11z6mtX/5aOnH4CLMd3a1AfJLNng7NrBJxDjN+n+3ZGiJgn+YQ/
 hN5NsOfjvfGqBaX+JOnfquLyqnJVZ/Ia3K4lskVmgtyluOOfZnaqAwX79qLivPY0Pxw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=WX6G23Ei; 
 arc=none smtp.remote-ip=80.12.126.237
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=WX6G23Ei
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5E9580D32
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789378060; x=1820914060;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=UVH7o/OQzowjyM4ikuZ656NjxtyFr+0RnAKBwuiNXUE=;
 b=WX6G23EiOf6vPYW4HfcWyK8pwkGWBiKQBy0HypH/UMMuDmQjp+YuyNND
 QsaPWmAZFf+3A+m1XZWUn1NcTrBG70gbZxnpdIxqSZtWrjYggnTvM/wWE
 z+5J5YSEkJf5USTs36HKbCJ6taPTS92H6qZTuier+262I4Wwy4sLXKyai
 s8l/wMLWFLvvfjqZ3lMRihDdWa7zSbl9Vp2a+vd7Qua5WYMS4oyseH6PE
 5Aw++CenNDF3hgSOFS+XFjUndBfcW6llEGhGTsGZXt6tj7UriS9TBBEFG
 OXx+0g6Se5Hb5G7avbctv/PRLVHb+lj6dOulmAe7UtCC4AmykhFmXs3i4 g==;
X-CSE-ConnectionGUID: sOoVr/YQQSCfJO4GIIzhOg==
X-CSE-MsgGUID: KfZ6En71QJ+6JMKg0s/K8Q==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 14 Sep 2026 11:27:36 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 11:27:36 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46;
 Mon, 14 Sep 2026 11:27:35 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 14 Sep 2026 11:27:34 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: IaJYQhToR7eQk0RhbIHqkA==
X-CSE-MsgGUID: p6BMv3BrTJm1nZMcu89/4Q==
X-IronPort-AV: E=Sophos;i="6.27,102,1787004000"; d="scan'208";a="475537006"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Mon, 14 Sep 2026 11:27:34 +0200
To: Vincent Fazio <vfazio@xes-inc.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Michael Klein
 <m.klein@mvz-labor-lb.de>
Message-ID: <aqe-BvOFrZnDF1YR@yd-6wlzhs3>
References: <cover.1786368449.git.yann.morin@orange.com>
 <c45315df9f1084fe0f6f932e1523cfa9c4e6d992.1786368449.git.yann.morin@orange.com>
 <PH1P110MB16031631D241E9E2C84C0CF49FA5A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH1P110MB16031631D241E9E2C84C0CF49FA5A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX602.corporate.adroot.infra.ftgroup
 (10.115.26.30) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/size-stats: properly
 assign pre-compiled .pyc files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

Thanks for the review! :-)

On 2026-08-19 13:44 +0000, Vincent Fazio spake thusly:
> > Since commit 3fed42456693 (package/python3: use the provided pyc
> > compiler), we abide by the PEP 3147 guidelines on where the pyc files
> > are located. In practice, this means that, for a .py file /foo/bar.py,
> > the corresponding .pyc file will be /foo/__pycache__/bar.pythonX.Y.pyc
> > (where X.Y is the current major.minor python version, e.g. 3.14).
> > 
> > Add support for this layout in the size-stats scrip, which so far only
> > supported the legacy, pre-PEP 3147 layout of having the .pyc next to the
> > .py.
[--SNIP--]
> > +        # Legacy .pyc next to .py
> >          yield (relpath + "c", abspath + "c")
> > +        # PEP 3147 layout
> > +        basename = os.path.basename(abspath).rsplit(".", 1)[0]
> > +        reldir = os.path.join(os.path.dirname(relpath), "__pycache__")
> > +        absdir = os.path.join(os.path.dirname(abspath), "__pycache__")
> > +        try:
> > +            for fname in (
> > +                fn
> > +                for fn in os.listdir(absdir)
> > +                if fn.endswith(".pyc")
> > +                and fn.rsplit(".", 2)[0] == basename
> 
> It's not an immediate concern because we don't have support for it
> (yet), but there are multiple optimization levels which pyc can be
> compiled for (1-3) [0][1].
> I think (untested) the current rsplit will fail on an optimized file
> pattern and we can be a bit more future-proof so we don't accidentally
> run into this same problem again?

The thing is, we currently do not generate "optimised" bytecode, so I
have no way of:
1. knowing how the files are named
2. test any change.

> Maybe we can leverage `source_from_cache` [2] and compare the file names?

Ah, good idea if it can work out-of-tree as we install for the target.
I'll look into that.

> It's probably overkill, but I think this is one of those easily
> overlooked things where if we did add support for optimization levels
> that we'd miss fixing the code here to account for it.

Assuming this function handles all the magic, it is better than
open-coding the path resolution...

Regards,
Yann E. MORIN.

PS. Sorry for the delay in my reply, I'm just back from my holiday break.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
