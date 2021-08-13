Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E44C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 14:02:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86926023D
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 14:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E86926023D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B6844048C;
	Fri, 13 Aug 2021 14:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pObiHLJL4dT9; Fri, 13 Aug 2021 14:02:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8380404A7;
	Fri, 13 Aug 2021 14:02:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0187B1BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 14:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1022404A7
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 14:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pss5N5esLsxY for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 14:02:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A5294048C
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 14:02:42 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id d22so13392583ioy.11
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 07:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OG+bXE+V3Ct5Ts+LWYNBdv53gHc/dJsyDIikK35f9/0=;
 b=TVj0uQlmv65ivG36h8zUZj9CoF1WmO5YfTiZ378w1MpPNlGnIwJoksnmYNTjRIVNnn
 HAEHdsk6NJGyLLGk6n+EgVCAG1v6kSRzUZOXl3q6XNkzU6yGj+3y2YS9Nzc8DgxBtgV1
 FDe69Wcts8qgoMHX+2pRYDrouoXrqEbEJNqIDJ//+gyVEDC/I970kClXAEPp0KH1hLL1
 kwPXxndYnotg69eM1MUkTefHbD5UDMZhgb3+OTDOUq+K46RqxZe239ax1+e0SBPuClGJ
 5yH4bcl6qHN95ydW5FcrZwz1DiVmJ+HurPronR4AtbcpSkrL6BfxIhTZc41iXbpBvY0b
 ZUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OG+bXE+V3Ct5Ts+LWYNBdv53gHc/dJsyDIikK35f9/0=;
 b=KMe+u1f0+Gt9yCq310RoyWT/67urw/zYhg1/Xs19wJ4AZhbB5GxvckGj4+4oae+8au
 mwkbcLk1dxl+vi/4Zmt8TT8G3tXYPD0QaFEv7tG/dCLTXJ8f+mQhNdkwfXerD71JvnGa
 5UevMgn9YMz3MAh9BBYdyCZdojfqZSB+unOg5FuztdIeZSAL6GslkJMr8ISkri71jJsR
 QyUW3AwyhOU0U2eXgTkTsV11bBdW7VEgu/CEaEuN/ajLE55EG8jPPB5mIqOnLmfqXsV2
 82z2G/TrL1smtluCQ1PouHkvEDoIc6e39w+9KtosW7iRb23iP4OHX1ay9sRE7NJQUFc+
 aMmw==
X-Gm-Message-State: AOAM532yFscNmJLGG8TDyrBUZqZ2J645AOKTYRUTBWNrYrrrArd93gLd
 qJBeOBzjGDCKmaFtlXsEbfhO9s7NvWw6ZPXGTyyLeg==
X-Google-Smtp-Source: ABdhPJxfzCi656omc0dK6ncVbXfRiCoatc11j7yO3IYnOL8EQ3DyC8Al37LXa7rB+59TbtI5V1wP/QYx2+TJ582LGBw=
X-Received: by 2002:a5d:8b17:: with SMTP id k23mr2134960ion.17.1628863361252; 
 Fri, 13 Aug 2021 07:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210811160055.1156551-1-illia.bitkov@mind.be>
 <20210813151131.679e2422@windsurf>
In-Reply-To: <20210813151131.679e2422@windsurf>
From: Illia Bitkov <illia.bitkov@mind.be>
Date: Fri, 13 Aug 2021 16:02:30 +0200
Message-ID: <CA+vtFZPKOpoHQqYc6Vk6f3FZzTdwS-siijWAKLx9VeWVnKGh1Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus-python: drop python2
 dependency
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
Content-Type: multipart/mixed; boundary="===============0566379346649241546=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============0566379346649241546==
Content-Type: multipart/alternative; boundary="00000000000009137b05c9714e57"

--00000000000009137b05c9714e57
Content-Type: text/plain; charset="UTF-8"

Hello Thomas, All

Seems that I've put  this patch here by error.
Yes, the idea to get rid of python2.x.

But anyway I think this patch shouldn't be merged


On Fri, Aug 13, 2021 at 3:11 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Wed, 11 Aug 2021 18:00:55 +0200
> Illia Bitkov <illia.bitkov@mind.be> wrote:
>
> > Changes due to plans to depricate python2
> >
> > Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
>
> Could you explain a bit more why you are doing this? Is it because
> dbus-python is no longer compatible with Python 2.x ? Or you're doing
> this as part of the process of getting rid of Python 2.x support in
> Buildroot entirely ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000009137b05c9714e57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Thomas, All</div><div><br></div><div>Seems that=
 I&#39;ve put=C2=A0 this patch here by error. <br></div><div>Yes, the idea =
to get rid of python2.x.</div><div><br></div><div>But anyway I think this p=
atch shouldn&#39;t be merged<br></div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 13, 2021=
 at 3:11 PM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin=
.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Wed, 11 Aug 2021 18:00:55 +0200<br>
Illia Bitkov &lt;<a href=3D"mailto:illia.bitkov@mind.be" target=3D"_blank">=
illia.bitkov@mind.be</a>&gt; wrote:<br>
<br>
&gt; Changes due to plans to depricate python2<br>
&gt; <br>
&gt; Signed-off-by: Illia Bitkov &lt;<a href=3D"mailto:illia.bitkov@mind.be=
" target=3D"_blank">illia.bitkov@mind.be</a>&gt;<br>
<br>
Could you explain a bit more why you are doing this? Is it because<br>
dbus-python is no longer compatible with Python 2.x ? Or you&#39;re doing<b=
r>
this as part of the process of getting rid of Python 2.x support in<br>
Buildroot entirely ?<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000009137b05c9714e57--

--===============0566379346649241546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0566379346649241546==--
