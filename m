Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F78C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 11:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C44094256A;
	Fri,  1 Apr 2022 11:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OW8k4bnJQ_cu; Fri,  1 Apr 2022 11:04:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEB0142565;
	Fri,  1 Apr 2022 11:04:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5591BF30A
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 11:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6269F834AE
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 11:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwexilUVsS_W for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 11:04:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E30483419
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 11:04:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 360F661857
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 11:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD5BC2BBE4
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 11:04:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="iGpJbPj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648811086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HB3yzIGZe3Xg+W8kzC0hQ3oSZWawolNFn2OvvFYA3TA=;
 b=iGpJbPj2hPTxcicpiliO3FepY2RG15F55f3td+87DL68ObSTGtYv850qr+TwFzBAkkPwE4
 Jx82areV0P+f1978SrYRo9Ks7vEVc/NfohP3WxuhZRHYfPxr6Ec0abgwhBaHLKhASYjDHQ
 0Dpk8VqwLNhHgE1ajnDumsg00244xKQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9081c634
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Fri, 1 Apr 2022 11:04:46 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2e5827a76f4so28470717b3.6
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 04:04:45 -0700 (PDT)
X-Gm-Message-State: AOAM532THlHNYY0KHVe63A4juN6r/em3zZ1xFUNVIxFAzntmkGR+UIww
 3KX1/neJbeQLtnENN99YF+OnYLNwdz9iJKZYf9k=
X-Google-Smtp-Source: ABdhPJwZ+Ov3E9fZQSQMXuxQEYHTsGGIoxRsUOlcjrUx3CF06SEW7PN3+VQsz8nB8VAnufsi7Cci6pmc3NAwLGjZFCo=
X-Received: by 2002:a0d:eb02:0:b0:2e5:9d37:58ba with SMTP id
 u2-20020a0deb02000000b002e59d3758bamr9585488ywe.231.1648811085322; Fri, 01
 Apr 2022 04:04:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:4707:b0:171:cd8f:b3d2 with HTTP; Fri, 1 Apr 2022
 04:04:44 -0700 (PDT)
In-Reply-To: <CADvTj4obQf+p-bES_5NLK85D=TbjqFhVyxNgNTmWtHzY+nAkcQ@mail.gmail.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <CADvTj4obQf+p-bES_5NLK85D=TbjqFhVyxNgNTmWtHzY+nAkcQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 Apr 2022 13:04:44 +0200
X-Gmail-Original-Message-ID: <CAHmME9rNbxonoOXNV5FQh+AsUbYA4psgZYLUFJm4aZh1ERe9hQ@mail.gmail.com>
Message-ID: <CAHmME9rNbxonoOXNV5FQh+AsUbYA4psgZYLUFJm4aZh1ERe9hQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 4/1/22, James Hilliard <james.hilliard1@gmail.com> wrote:
> I should add that I do also think this should be upstreamed to busybox,
> which
> will also reduce the amount of duplicate work as busybox is commonly used
> across many distros.

I'll work on that. And hopefully David won't sabotage it with his
"it's only 10 lines!" stuff.

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
