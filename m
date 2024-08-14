Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A43C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 04:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 299BF605DD;
	Wed, 14 Aug 2024 04:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IYGW4v3XHmy; Wed, 14 Aug 2024 04:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20A9E6070A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20A9E6070A;
	Wed, 14 Aug 2024 04:11:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14BDF1BF2FF
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 04:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01DDF6070A
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 04:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYhIspkNOze4 for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 04:11:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02D65605DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02D65605DD
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02D65605DD
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 04:11:35 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2cb80633dcfso1147082a91.0
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 21:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723608695; x=1724213495;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xIlh5caflxuYugApsabk6M5DWHUWUipEMbq0mk0ZPMc=;
 b=Ee7qysTM+CGGS9grajAT2uLs9UA4NKBqgvF4lCdK3W4uM04A02qZ8ILoZpCo/OUck3
 3sLN48cBKTk7qN8k9Ij3/Abine4LOjxsdOQg5T/WH+s6Ke8CCWQs0TLtN/1b4gBJjuao
 G6ygFyajgNeJgfpQ9ygENVauHu19snqf7g6/VKpm4o0D9t4YCOibtgqP6WkRVXHwyL32
 7ZZhHq5gSeu15pNIhvTA455KIF7cqvHgcuh24TiJ/fJCqlYPXwj1iDE93pmpCWgIswMK
 YBPqGla2EbTQUA63GRNIRiJt5RaW6Y4dkCXPd7p3fvPPFCQewNC5n2rYMliiHCN9P8ro
 3OAQ==
X-Gm-Message-State: AOJu0Yyjskq7Ip4eqDH5rAfO8uLyclAkzN6ZkxQFBy5Kx1xKQXDrIUaV
 Ig7ADtf/cryhIBtqYgVmpAD+8zIngLSknp/Iic3xkNf1AXkMuHKakoIaWt/PhhFOffb/Su8ypTt
 4LXcWocRfggP1/60J19O88Ep81+xxjNvEVT8Hsir92dAtCk21wVek
X-Google-Smtp-Source: AGHT+IHa2IBQ/OkO/3uTtzbc94G0RyIx/63pr1TGG12Xxv3yaalNmUDS3UIUTB0vkbVLW+qrmiOLwJXAi6Epnk9h3vU=
X-Received: by 2002:a05:6a20:728b:b0:1c3:c1d0:227 with SMTP id
 adf61e73a8af0-1c8eb00a502mr1197368637.8.1723608694958; Tue, 13 Aug 2024
 21:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAGt4E5tNuugDABr-goDwU2csVNOAaKp=GqS9B-3KZcMjmaxKYA@mail.gmail.com>
 <Zru-cKO4R3cz1NRF@landeda>
 <CAGt4E5uHdqDHnNHrvuwe18tozRq8B3M5TTaShqRaWqfAOpn_eg@mail.gmail.com>
In-Reply-To: <CAGt4E5uHdqDHnNHrvuwe18tozRq8B3M5TTaShqRaWqfAOpn_eg@mail.gmail.com>
Date: Tue, 13 Aug 2024 21:11:23 -0700
Message-ID: <CAGt4E5u3UeGDLp_D1SgedQgXvcN2mGxSF3ExX+e0KKqDMMTVzw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723608695; x=1724213495; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xIlh5caflxuYugApsabk6M5DWHUWUipEMbq0mk0ZPMc=;
 b=JKo/F0BRzHTayEKBoFbD51Mjw+pO1M3JQG7UdEGP/E7U/bP0JKepNYbt1V4Li3uUq9
 w+ZsAnXSpqaB0ZvbdGqW5cpbHKqcu6282Acl3uC5aGYIG+mblmikF4FlPYJyenoAXBTJ
 OKJtlB6+rsvhihqUWzuraIniL8A0JEJKNw+HM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=JKo/F0BR
Subject: Re: [Buildroot] LLVM builds broken by "-z text" (3a39e706a91a)
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Aug 2024 at 13:41, Markus Mayer <mmayer@broadcom.com> wrote:
>
> On Tue, 13 Aug 2024 at 13:13, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > My @work alter-ego just sent a series that would hopefully help in this
> > case:
> >
> >     https://patchwork.ozlabs.org/project/buildroot/list/?series=419144
> >
> > It would be nice if you could have a look and test it, if possible.
> > Otherwise, please send him a defconfig, he might be able to spin a build
> > tomorrow...
>
> Tell your alter ego I'll be taking a look. My work day is far from
> over, so I should have something for him when he gets to work
> tomorrow. ;-) I'll fetch that series into my tree and see what
> happens.

I am happy to report that your patch series performed flawlessly in my
tests. There were no further build issues caused by "-z text".

If you so desire, you can add

Tested-by: Markus Mayer <mmayer@broadcom.com>

to the series.

Thanks,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
