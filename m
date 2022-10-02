Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58873C433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 15:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3FE540414;
	Sun,  2 Oct 2022 15:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3FE540414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_ETR74vlxOj; Sun,  2 Oct 2022 15:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D493840184;
	Sun,  2 Oct 2022 15:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D493840184
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6571BF3C3
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 15:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 681CF40184
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 15:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 681CF40184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhMQipZdo9xO for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 15:33:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91ABE40121
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91ABE40121
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 15:33:13 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id d3so2225279uav.7
 for <buildroot@buildroot.org>; Sun, 02 Oct 2022 08:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=lYq9BDGW0PKxKWLyXqHdE2Qq53L1BUAtkIbwatp7prE=;
 b=YYjG7AE1Ol03rXD84Q3/5YYnK7/AwuJXfzTarMUg7tcEHNi/ir5ul3Yaj2v1g3LyBI
 nUji2r69rvsfF6/AxCgFlE141ZKh0UFc3ehjhA2X+M8ooJmbqo/d6V38A1Jf+BDW0jyz
 cud5taG+BAVizCYwF8l7NUNq9PHDW2SrBWqYgvP3PNPm5kQaz9lXlAfIu5QfrRk8yGWz
 4UcdnZRwRX1aL38YAXjvUMRLG6/iBKc0Dg7oa7FWscYoCrkRDlXGSSORZim5/zunvkey
 71iHff1N/tnUEl+8s2421jmQj+1x+SMhzL1s4WqA7i8pREskyEjh0AIx4odbsyjl3sPa
 3K2w==
X-Gm-Message-State: ACrzQf2nDxztoB7yX9yhAW/Gpz7JjRf6l3MUOSOB2A+dA1+e9mbW67Ln
 qxjt3559YrA+nrVcsyHz5alB2LwbX6VPssJKPb9sbQvQor0=
X-Google-Smtp-Source: AMsMyM5KSIF6i3JryKiyQaFBE3v/H+tU8HBQAlsHVuTRQv9dpebgmKwSJ5c4p8BqOJ9w5CW9//aW2fuTzxrgAFRiFEM=
X-Received: by 2002:ab0:136d:0:b0:3b3:da15:c7de with SMTP id
 h42-20020ab0136d000000b003b3da15c7demr8305675uae.25.1664724792095; Sun, 02
 Oct 2022 08:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <CABRndgxwuvAGu0ydgfuShTvQjjppoUNiBSnP6xgqSKsHjifXTw@mail.gmail.com>
 <87v8pebk2s.fsf@dell.be.48ers.dk>
 <CABRndgxFQLVvusnFHXyMuByfXhg+rR0Q2-X+osOz+V+MJaqXtQ@mail.gmail.com>
 <87r101as98.fsf@dell.be.48ers.dk>
 <CABRndgw8bBeQBkyhUJonHkr-QFkENmRU7BS2jQxRg+v_Nqaeyg@mail.gmail.com>
 <87mtaobvm1.fsf@dell.be.48ers.dk>
In-Reply-To: <87mtaobvm1.fsf@dell.be.48ers.dk>
From: Zvi Vered <veredz72@gmail.com>
Date: Sun, 2 Oct 2022 18:33:02 +0300
Message-ID: <CABRndgwJx6mJsmXS+=DX9dbhg12rjwCe3qXcDeW4hYX3ksSckw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=lYq9BDGW0PKxKWLyXqHdE2Qq53L1BUAtkIbwatp7prE=;
 b=aVhKBQYzB5lbGCSFU9KagHHZhSiWAcu4eXbAL2ya7N3Ragd59nPbTipjIHZn/2Xl6k
 1KFCExii0+pLUNnKO3+cHs56y39hJYktt8ZYjm3sNJPZBUeoevT1351pMLJJAix9N0Of
 vv+HNa+0qmgLtlXw9QP86+AGkJbl1ZD5OAQzdwrAdtv7pfbLjgSC+Gf1T7V4rUb/osVe
 TaBKlsEgB6LNAqCLrQd1uRuLO6T7DjXOjY91MOUNM6uX4AJX1pJwqklSrGluNdJb6nZy
 rGTgnGbN34AFHOpPW8w1ak0q0N95zp8ZPO9QFE8a7Dhv66FiHUC+2Ee1CG8BQoyx7kK5
 8Vdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aVhKBQYz
Subject: Re: [Buildroot] buildroot 2022.02.1: apache (httpd) - libgcc_s.so.1
 must be installed for pthread_cancel to work
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4181947704130740870=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4181947704130740870==
Content-Type: multipart/alternative; boundary="000000000000e1b8e305ea0ef103"

--000000000000e1b8e305ea0ef103
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Today I managed to build rootfs + kernel with a gcc created by buildroot.
This time I used: i686 (x32)
httpd worked fine.

In /lib I noticed there are 2 libgcc files:
libgcc_s.so.1 (95962 bytes)
libgcc_s.so (132 bytes)
Both files are real (not static link)

In the external gcc I used before (created with crosstool-ng few years ago)
there was only one libgcc_s file.
The other one was a static link.

Do you think this difference is the cause to the problem I had ?

Thank you,
Zvika

On Sat, Sep 24, 2022 at 7:11 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Zvi" == Zvi Vered <veredz72@gmail.com> writes:
>
>  > Hi Peter,
>  > There is no real technical reason.
>  > I thought it would be right to use gcc I got from the vendor (Xilinx)
>  > Also, buildroot supports using external toolchain.
>  > All gcc libs are copied (by buildroot) to /lib64.
>  > Should I try using gcc built by buildroot ?
>
> Yes please, if nothing else then to verify that the issue is specific to
> your toolchain. We do not have access to that petalinux toolchain, so it is
> hard to help debugging.
>
> --
> Bye, Peter Korsgaard
>

--000000000000e1b8e305ea0ef103
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div><br></div><div>Today I managed to build root=
fs=C2=A0+ kernel with a gcc created by buildroot.=C2=A0=C2=A0</div><div>Thi=
s time I used: i686 (x32)=C2=A0</div><div>httpd worked fine.=C2=A0</div><di=
v><br></div><div>In /lib I noticed there are 2 libgcc files:</div><div>libg=
cc_s.so.1 (95962 bytes)<br></div><div>libgcc_s.so (132 bytes)=C2=A0<br></di=
v><div>Both files are real (not static link)=C2=A0</div><div><br></div><div=
>In the external gcc I used before (created with crosstool-ng few years ago=
) there was only one libgcc_s file.</div><div>The other one was a static li=
nk.</div><div><br></div><div>Do you think this difference is the cause to t=
he problem I had ?</div><div><br></div><div>Thank you,</div><div>Zvika=C2=
=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sat, Sep 24, 2022 at 7:11 PM Peter Korsgaard &lt;<a href=3D"mai=
lto:peter@korsgaard.com">peter@korsgaard.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Zvi&=
quot; =3D=3D Zvi Vered &lt;<a href=3D"mailto:veredz72@gmail.com" target=3D"=
_blank">veredz72@gmail.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Hi Peter,<br>
=C2=A0&gt; There is no real technical reason.<br>
=C2=A0&gt; I thought it would be right to use gcc I got from the vendor (Xi=
linx)<br>
=C2=A0&gt; Also, buildroot supports using external toolchain.<br>
=C2=A0&gt; All gcc libs are copied (by buildroot) to /lib64.<br>
=C2=A0&gt; Should I try using gcc built by buildroot ?<br>
<br>
Yes please, if nothing else then to verify that the issue is specific to<br=
>
your toolchain. We do not have access to that petalinux toolchain, so it is=
<br>
hard to help debugging.<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div>

--000000000000e1b8e305ea0ef103--

--===============4181947704130740870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4181947704130740870==--
