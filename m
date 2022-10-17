Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8951C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 18:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D80B417D9;
	Mon, 17 Oct 2022 18:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D80B417D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86P19Bw5dFmz; Mon, 17 Oct 2022 18:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26794088E;
	Mon, 17 Oct 2022 18:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F26794088E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69E721BF31C
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4580A60AB5
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4580A60AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEI5nC_wCNtD for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 18:10:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35F1B607F1
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35F1B607F1
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 18:10:37 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a13so17289071edj.0
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 11:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3U0w0WiFkTaJZG/SmrByBk/8pPc1ukCY1HxD+AuuFRU=;
 b=EbMA1RqhumD9EsigJQAJeXjjcIXFagxcEByipUvdx/4+n94/I7/GPopB6RqYvpt/UH
 B9GJsDnd7n7wAu5nKti5oIqqXfz2RrTyYvnZPN90PDNEi5urG9t5k4CJKRlyUTO6pUEu
 SEI3jO+mV5YHVJtc+NdYGggy/jmxBaQXV0gyu9eWVT8r5fmBug7yBmOHyAhDmQz/Vsko
 SHk6RFoNwdoUrApHfDEiARnkquKwxd/tdc8Jrq/1l3NwdkWUyOVOd4Tsbt9i1r0eJJxa
 ZnXOuU/F/slpGV67f/lyyaDQafbj68ZwwRpKswnqS10NRK+rRH6k4+TiS6xaSOnpGpi/
 Kb5g==
X-Gm-Message-State: ACrzQf1+N72Xc9FIuDqEqL7inVkeRen32ydOFXKKuyVSjakyZv0iuEN+
 7hZjEX941v9RUelutF3LxXBBwmcQYsOcqs8klMw=
X-Google-Smtp-Source: AMsMyM6YMtsOIsoFHmwXIXkw9bj2jIWJ4lBkTxojX+p8L5bYEYzsqqJdX/rN9IJd2xjHdVyJ11522A==
X-Received: by 2002:aa7:d306:0:b0:459:6e9:6284 with SMTP id
 p6-20020aa7d306000000b0045906e96284mr11231009edq.70.1666030234917; 
 Mon, 17 Oct 2022 11:10:34 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 g6-20020a17090669c600b0072af4af2f46sm6354042ejs.74.2022.10.17.11.10.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 11:10:34 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id b12so17232068edd.6
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 11:10:34 -0700 (PDT)
X-Received: by 2002:aa7:dc10:0:b0:440:b446:c0cc with SMTP id
 b16-20020aa7dc10000000b00440b446c0ccmr11410624edu.34.1666030233851; Mon, 17
 Oct 2022 11:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-2-thomas.perale@mind.be>
 <CA+h8R2qwa-bzHzogQoVRubbapo1EwKmzyPML_hJQww144DWv6g@mail.gmail.com>
 <20221017175500.GB3666@scaer>
In-Reply-To: <20221017175500.GB3666@scaer>
Date: Mon, 17 Oct 2022 11:10:22 -0700
X-Gmail-Original-Message-ID: <CA+h8R2poqGOachEBUhQjiVmXwqMJJXxD3RrzeDKVAe_7PSSZJA@mail.gmail.com>
Message-ID: <CA+h8R2poqGOachEBUhQjiVmXwqMJJXxD3RrzeDKVAe_7PSSZJA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3U0w0WiFkTaJZG/SmrByBk/8pPc1ukCY1HxD+AuuFRU=;
 b=eCi8cZvLlYygbWHlgwj2bYPMrfwTHBZl1byOF9DIpFXRjZ73WMnFIUIhroRjmmgm9R
 E6GtDAA5CrhE3UTjR6UPlAYsp7PlwxSb2FGimusd00ZGjM4j4grK/xag0QiYVFvR/knl
 EuyfXn4nFKCQggItVG2AoucDJQuI7eyookU5KN65+rXMWPyYt0m05rnxAx/7AnvZuo62
 9HncatD6iFyMAKLOtY3wSjLy5mJgMFSh/gBui7xoJyxxhNKlXIMGYza4/0LxauNNdSCU
 s5ESz45UrYy3aBA990CFDB+lsKjOraRcV+Svk2EiQ2IOQIzXDnlQ4/gVz4yScmCD/ioL
 5gwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=eCi8cZvL
Subject: Re: [Buildroot] [PATCH 1/4] package/goc: new virtual package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Geoff Levand <geoff@infradead.org>,
 Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann,

On Mon, Oct 17, 2022 at 10:55 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Christian, All,
>
> On 2022-10-17 09:06 -0700, Christian Stewart spake thusly:
> > On Mon, Oct 17, 2022, 7:29 AM Thomas Perale < [1]thomas.perale@essensium.com> wrote:
> >   This virtual package implement the already existing go compiler compiled
> >   from source and shows it on the host package menu.
> >   The usage of a virtual package on top of the go compiler enable the
> >   supports of for multiple providers for the Go compiler.
> > Is it not possible to continue using the existing host-go target and
> > simply add a parameter which enables downloading the precompiled
> > version instead?
> > Rather than add a new package.
>
> In fact, we want to have a similar implementation for rust, go, nodejs,
> so (without looking at the details of this series), I guess Thomas
> Perale took the same approach as the existing rust situation, like
> Thomas Petazzoni did in the recent host-nodejs series:
>
>     https://patchwork.ozlabs.org/project/buildroot/list/?series=319967

Thomas changed host-nodejs to be a metapackage:

https://patchwork.ozlabs.org/project/buildroot/patch/20220925204030.1661583-3-thomas.petazzoni@bootlin.com/

This is not what this series does, which is to add a new host-goc
package and refactor all Go packages to point to this new one.

Sidenote: having a rust-bin and nodejs-bin makes sense, as those take
a /very long/ time to compile. Having a go-bin on the other hand does
not make as much sense, because compiling the Go compiler is fast
(about 1 minute vs. Rust's 1 hour).

In my opinion:

 - Do not add a new host-goc package.
 - Add parameter to host-go to select which compiler to use:
   - bin
   - src
   - host go compiler (see patch linked below)
 - If src is buildable: default to it
 - If src is not buildable: default to host Go compiler
 - Or if the parameter is set: use bin download

This patch already solves the issue of selecting when to use the host
go compiler or not:

https://patchwork.ozlabs.org/project/buildroot/patch/20220725011322.1301684-1-christian@paral.in/

... it would be straightforward to add the Config parameter + binary
download to host-go after applying that commit.

My reasoning for why:

 - Avoid refactoring all Go packages across the tree.
 - Avoid confusing "goc" name (not used in Go ecosystem)
 - Backwards compatible with existing configs.
 - Fewer packages to maintain, easier to understand structure.

I'll have a look at submitting a RFC series adjusting this one to the
above structure.

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
