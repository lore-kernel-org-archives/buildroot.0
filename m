Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3124BCCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 22:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED18140AA4;
	Fri, 16 Oct 2026 22:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tf3CT3J6za8X; Fri, 16 Oct 2026 22:53:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 05BBC40A5B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792191209;
	b=jd7bA/b+03OPuANEoA28PhmMGVYIYkQgklUR8nSVg1DrrNSH1uiBAfN7F8VEYjsQnx3S
	 +5quUrHII59kgWCo0RmulfPdzH6l4yrLq7NZX0k7J3wpMj8bIVuHEcYGsaRF2p9lGZRjC
	 hYfmUAKyjkZdwVGzDd7dcXPFhH7fV25kQ4eLFp2j91tazl2Wv5fxBcGh2J4v3XSj68020
	 kK9+yB8XQn7t2dkG8MDHQGZcqIJn7oSMdj2d9SA9EDq5WBe5XqJnGTSYMB9q/6bcLxW/f
	 cIz0SDHPyZgjqNhMjThGgfc7e/d3BWGRlY7QX3t9rzRVnoezQ9IpY/kErdKUif7h2yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792191209;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=IUXoWoOa8w604j7b9v5cbrVgDyM5pZXx/xkwpvR89nk=;
	b=fa9b+icz26w3niWu3b+aw/UWqXpgEGbHn+Fg02lRKKek4V8jctEzIOqmgS3DLW4DFxGw
	 kAx+2S46qhyq00ddS3KVOGRU54OMdSysatAO0JoV6DME72ODKl0UeG+04tWF0kkk/5Xca
	 zSyoPgL8UHyyclTB3CsuTNyr8yL3HfwuJfadH19P6qZpQ9xeuQeMfDNjCu8RpOjrT84Bn
	 ZpnL4P2Ht7ptGOn2JvOeoqsZ64SAZjO9NZ+kGX6BUzIAt6v9NY6818e61B9Jd6WtCtFMI
	 /xqCfo/r7eZ6Ku+3tzs6zGIn5L+YQistppklRnNQuy0ULucE3txnLKTHQK9eMvvvt1w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792191209;
	bh=IUXoWoOa8w604j7b9v5cbrVgDyM5pZXx/xkwpvR89nk=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=E8mt3eK+2mcdZr4cPHHgFHVrlK+rQfDeUqE6p0dkvFzjs5FrVtVvgqQ8WyHPyYm9O
	 dg7HhmLLOWoThV7NFV65IVZyP7FPdy5ORM2SxLPCJnQByQp5twh27y176YlO/F038t
	 SlxWILg2qm/Vg5U05vX5rJSYKcBUH667QX/mZQo+vw7fvmwZchiddcyk1NJgtAQrqB
	 DdSZ8p0GtH52PCU0W6auGP3U36aDj/spwBQQbArMCxtB84BHJiljcQ5sJAM/ECT/jo
	 ohDzzqUpn+GPt2T7BhYgt6qYqZ2aQ7kLUuvbpr8glEJxl8KdltK5TcHYxDaUXpjAVo
	 q3pqaZGrpFdBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05BBC40A5B;
	Fri, 16 Oct 2026 22:53:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B0E07AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58B1E816F7
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpFqguuIKwmF for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 22:53:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5CF0E8153E
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792191206;
 b=agtfF6dHAF3zsjr3aIumC5ZAAoVELJC7vWgYoUYeE0yJXbDQ7fVlhHQ78FLTpUq8KTvk
 oGiyAmGagmpT5r5Zvbh66jSSRnMVz1trSQeT1eMGxEWrd8IYVBxR2q12wM1QrJKw1wJ7N
 sMdIBe+eMXTr2g1R+fW+NmsBNqSi/9GNcXiSARyuS6v3c0oK0HCqFQjlKu/hhSTak8EsV
 x2WTbiLyantdHhJ5HShRLce3Gq/BzD2umbSXRRqLIyLLwDXJ7wjTh70hvITMhZUjtXnQW
 SM9PQn6QSzKE9yNaHqUxllZgh5f2wyxQo+GXHOM4vEqKSMAnOlAwd2oq6g3PO3BB2zA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792191206;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=Ra3YIDUxd41lRC7mIUuv/TT1XhlyY1eA40cuVtXzZXM=;
 b=NurcGY9X4NHTdW1bHfPuP9bN6QlXS1P+9FS8zJaIedcnZH98la1TSDwVwbHH/Lksp7uw
 FintLf4Le0268+hf5Y4PlOV472f6yz3e39hNrAzFikyBjbTJFNb+M8AA/rcN8IoCtPXI6
 a6oqKPWs4E0uMkpRraZxcuMnDMUgKR2I4aZXePpc4P7syXRDX+BX78ab6+eRA68Qe1t3U
 kYVFe0atFvtbAQ/8EUByy5TVjDUdJ9AniTJb/E6KiPsTAhF8gkT4Sdw6iLNN8Gv7NxaEu
 yilWuQaPAmLKy8hYp6jS8NyEhD1CV53s/+4F0iMRKvOqxvVTvn2kgyrg7Txo2qS2Kvg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FjCIVGZM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FjCIVGZM
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CF0E8153E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:53:25 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a1cef0439aso4438915e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792191203; x=1792796003; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ra3YIDUxd41lRC7mIUuv/TT1XhlyY1eA40cuVtXzZXM=;
 b=FjCIVGZMn0NJtJ1bHkpx3ssPDjwXCrMXchiV4s/rnmhaPjy3KGl34JKIRIFDSRCKm/
 MP7nrNA7AW8WB0WdGJkUGWdGLE9l7HECI5YgEzNsdJmjw8FDbkVTFdknuOkwAona8Ffg
 HwFav2kKYOgVgc5IYrlJ1XWXyy+wr671goSbOSLhuEVB8L8xjNfN7v63uUApl3GljlAg
 x6CZBxOKRjwrP0Mp5eIu2Elr0B4G8CjTlvMOZjHENHURNGLSpUACRj1oxxHWWeJl2jkG
 KQgPw/E8l/dqgMlrgJdDqjsQDy4EwdRUaAwxA737QuAi1SCzsfjttZUQnKiwUvsbD/Y9
 5wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792191203; x=1792796003;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ra3YIDUxd41lRC7mIUuv/TT1XhlyY1eA40cuVtXzZXM=;
 b=l6qKRKZ0DZQ+8NzMlWCWtwB1qapIJEiRDbn2bQb14EgeGPLL4bYdghK/GZQHXaGOif
 JhOTq+ZCJBm8lImLJXT0kXS1y8DG4/+EN33Gfd0Te6tgKdh5DSIQj1w44oAlp80PKTrJ
 LU35+hlU220wF1VqN6eMVgY/KORFU5BSnVxgUdDASZsLbNR1VgeRKBaO27900lKbxGaC
 0ogj09FHc4is7/MphqRDKkAGYOAyGjg1kihrSakwp6MD21ZvlSw3D4CcWAlh3YBCeVje
 GxhXeQSMFTsPn4NWsq4Caqy+SCvsbo9M3JOlZL/s8jEaa4QuU38BwzW4G2cLfwYcFs9T
 E3Vw==
X-Gm-Message-State: AFq9FYKLrhvLN5m1CcrsTGVRKwpJn+Md7WASv+3QQ4lsNpxmCfOQGp1m
 ovmml457NxaZUmqQqznbNe5L5b4sAX91VULrBnB/OMzCqMz4rIIldAMd
X-Gm-Gg: AYBFou35DeXKY8OtLF2LhSlN5raVC2621XvCY9FuMHnu1K4JZm4eSajOaUojoyxa+Hl
 KBz9Zo29LtmO+La17dCTIwopuiy4l1QvZ8Gg8vKC0IcXOwDEtgL5PnAwWXerhOQy0NqWsQJeV+o
 fddl6h/GlPkx27xzuct/p2Cwbc8md94dEVSCAxUe/FogfPjhrzfjeP/rRTmcemf5jA9SbAapjNV
 QOnahp8wnvsjG8nk7ttKn8iVNj57R7MwOGVzux6LCzs3D0B1+q4EWxtmF92g8KpI420VK9LO546
 7X/gq8FwLYb8+OeDufHTkXVoGpaF+Rn1ioTXkeoUi/HyIPXgGYhYVPpjBwuKiaEPr3nwGN6CbQY
 trjM2QvxvmUacNQqw2hX3oAAaq9F/HnBchJl3qjSldYmfe3Ugz2EjpVArTlTMjAk1FNJMRAIyhC
 VS/z4lv5Ugc8IVUVTxjsaqgJBWdd/bRHRBZ9Z6cycAx9DAhwaRoBwYlNfudqlidxIV6znuLEFRr
 Dtf5um2SAB8L8kWQCAdpsCK4qjqa+EOYfo=
X-Received: by 2002:a05:600c:3e8d:b0:4a1:6916:798 with SMTP id
 5b1f17b1804b1-4a1d75fa219mr23101875e9.14.1792191203078; 
 Fri, 16 Oct 2026 15:53:23 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd50aafbsm7858753f8f.52.2026.10.16.15.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 15:53:21 -0700 (PDT)
Date: Sat, 17 Oct 2026 00:53:19 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20261016225319.GH331129@pevik>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261010151121.876133-7-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261010151121.876133-7-titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH 6/7] docs/manual: add migration notes for
 changes in the kconfig syntax
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

> Previous patches introduced some changes in the KConfig syntax,
> namely on variable expansion and choice entries. Reflect that in
> the migration guide.

> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  docs/manual/migrating.adoc | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

> diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
> index 86b040a19c..b2e0cb24b4 100644
> --- a/docs/manual/migrating.adoc
> +++ b/docs/manual/migrating.adoc
> @@ -270,3 +270,16 @@ changed, therefore the suffix of such tarballs has been changed from

>  Due to the update of Dovecot to version 2.4.x the runtime configuration
>  files need to be updated.
> +
> +Following the update of the bundled kconfig infrastructure, the syntax
> +of +Config.in+ files changed in a few ways, which affects **all
> +br2-external trees**:
> +
> +- variable names in +source+ statements and prompts must now be
> +  enclosed in parentheses. For example,
> +  +source "$BR2_EXTERNAL_FOO_PATH/bar"+ must now be rewritten as
> +  +source "$(BR2_EXTERNAL_FOO_PATH)/bar"+;
> +- +option env="VAR"+ is no longer supported. Environment variables
> +  are referenced directly as +$(VAR)+ instead;
> +- the prompt of a +choice+ must now be given with +prompt "..."+
> +  instead of +bool "..."+.

I wonder if \$(ARCH) should be here also mentioned.

Otherwise LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
