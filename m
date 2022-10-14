Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1BCC4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 21:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 178AA40487;
	Fri, 14 Oct 2022 21:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 178AA40487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnb-BlQurAmf; Fri, 14 Oct 2022 21:17:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 390EC4028D;
	Fri, 14 Oct 2022 21:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 390EC4028D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E8621BF300
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 21:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 376E54028D
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 21:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 376E54028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2OSed2GGvZ5F for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 21:17:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CEB6400AB
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CEB6400AB
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 21:17:35 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 t4-20020a9d7f84000000b00661c3d864f9so2582052otp.10
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 14:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gMoy0tiDgQ9fCTr4Tng0qbyAPr93PKnwGZmOxm8iXEo=;
 b=NsLOFD7udWAc+ClBu0eQRVhiLH3MCpiPA9XAyXod9+t6Mc+y75EJHdwLEEhEwhV0ja
 cAv3LetsRG+ge4XsttT9z1UZTUGT897bQhl4t9dn9XNKR9reFH8HD5kQfP0ZhE1RvCpR
 h2BreCE08o8AcCBaj22SOZJsz/W8Sa84ZRBU2e5mQiKgy0Up0fNhOlVr9ffj8gzo/cGW
 wVaNeCMXp8VQNgjH6lD4Ikhh2BySrIaiXh/+FMrphtMBDxVYM8YZQscV+z+nPub0koSV
 adZiFSiz0n/f+r4RzTVMjMxFKyQ6mJXlBhMBvtdgwH5FNMrmHB6omGQL6vU0pb0oc1q4
 y+QQ==
X-Gm-Message-State: ACrzQf1KEe9fvY6CZ3ZzFjUxvo3j8W2c3+gNPPE5jd8WvzexxI8ds1WM
 q//6EMfSECQqmOPKVxn1Q3XdM4IO5ArFbzhcKYLIBCwWsHE=
X-Google-Smtp-Source: AMsMyM5EIZu/Ii6v9EG+ZHv6BmLxPdOxT+ABkw0NPrO6C6bBuhr6b2LNE6DrHWPwVrVG3KK63XZmVcwZMyn/qu5MUl8=
X-Received: by 2002:a9d:2086:0:b0:661:c74e:6b0b with SMTP id
 x6-20020a9d2086000000b00661c74e6b0bmr3482813ota.316.1665782254476; Fri, 14
 Oct 2022 14:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221002004931.1805825-1-judge.packham@gmail.com>
 <875ygmlckj.fsf@dell.be.48ers.dk>
In-Reply-To: <875ygmlckj.fsf@dell.be.48ers.dk>
From: Chris Packham <judge.packham@gmail.com>
Date: Sat, 15 Oct 2022 10:17:25 +1300
Message-ID: <CAFOYHZBbkLNwzPOcnnM-+2gOosMPRy9pf5oHA_u+nJRAGZD1Pw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gMoy0tiDgQ9fCTr4Tng0qbyAPr93PKnwGZmOxm8iXEo=;
 b=KfEtaWbUIPT0UyiX46ndqwxmcK79t4CPhnUWBNKDAnsUdL/CT2LYFjiolzjYUc24SX
 SjqQ+2z/8l45JyX30Dp//eBVkBQ3RK2hkgBnXEjiE5GVX1tmPiMBFqdKsUYDkS2Ol38i
 G7pZHszSbyVpzlA379BLCKRvHkW3nkSsBJOeIkSdGk/GTctkDiYa4h7ANVGBrTY6RKo/
 Ap6rektq+7uNL8eV3m24YJzxY47uwG2tjeNLtjxTDQ8iR8jKxqjXvbS1Xom3EXAubkgy
 hW2bBp4JLhV1kr6Q3fh/rK9gPc9iPHWDyw7kylhnShNCs8vwzMexibPyphPPtgiTDipm
 qT4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KfEtaWbU
Subject: Re: [Buildroot] [PATCH 1/2] package/micropython: Bug fix release
 1.19.1
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7440144306448536353=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7440144306448536353==
Content-Type: multipart/alternative; boundary="0000000000008d25e705eb052745"

--0000000000008d25e705eb052745
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Oct 2022, 3:11 AM Peter Korsgaard, <peter@korsgaard.com> wrote:

> >>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:
>
>  > This is a bug fix release.  The changes are:
>  > - extmod/machine_i2c: only use WRITE1 option if transfer supports it
>
>  >   This fixes the machine.SoftI2C.readfrom_mem() method on esp32, so it
>  >   writes the address to read from.
>
>  > Signed-off-by: Chris Packham <judge.packham@gmail.com>
>
> Committed, thanks.
>
> Does this mean that it also needs to be backported to 2022.08.x? If this
> is an esp32-only issue then presumably not?
>

No I don't think it needs to be backported.

>
>
> --
> Bye, Peter Korsgaard
>

--0000000000008d25e705eb052745
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, 15 Oct 2022, 3:11 AM Peter Korsgaard, &lt;<a h=
ref=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Chris&quot; =
=3D=3D Chris Packham &lt;<a href=3D"mailto:judge.packham@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">judge.packham@gmail.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; This is a bug fix release.=C2=A0 The changes are:<br>
=C2=A0&gt; - extmod/machine_i2c: only use WRITE1 option if transfer support=
s it<br>
<br>
=C2=A0&gt;=C2=A0 =C2=A0This fixes the machine.SoftI2C.readfrom_mem() method=
 on esp32, so it<br>
=C2=A0&gt;=C2=A0 =C2=A0writes the address to read from.<br>
<br>
=C2=A0&gt; Signed-off-by: Chris Packham &lt;<a href=3D"mailto:judge.packham=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">judge.packham@gmail.com</a=
>&gt;<br>
<br>
Committed, thanks.<br>
<br>
Does this mean that it also needs to be backported to 2022.08.x? If this<br=
>
is an esp32-only issue then presumably not?<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">No I don&#39;t think it needs to=
 be backported.</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><br><br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div></div>

--0000000000008d25e705eb052745--

--===============7440144306448536353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7440144306448536353==--
