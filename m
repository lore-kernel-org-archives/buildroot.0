Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32499CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 22:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AA0040732;
	Mon,  1 Apr 2024 22:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbgd0GBwDmk4; Mon,  1 Apr 2024 22:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 701B140734
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 701B140734;
	Mon,  1 Apr 2024 22:27:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0CB01BF345
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 22:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9F3A4010C
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 22:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5RGjRuekfPT5 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 22:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AC7D400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AC7D400D6
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AC7D400D6
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 22:27:26 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6e6f69e850bso5037052b3a.0
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 15:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712010446; x=1712615246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bhg7UaHcutdX44ZWOfnFaFoAPv2TYf4O2zqFaHjcBcg=;
 b=pffraV3jTbh0mHfaUqBdou+yEa4IUeqkYMnU1PeRJLmU7E+dSEUUNKRSXI5ZTaUnIx
 EAIXcYka4Wx0aF90+mTPHQJd4k5yoaaGT3CfGOq/utobughx2pS0aWHJYwnna2egGqD+
 DuTi6ZVqEYYdn33kRIuy6R9xwJMDM+ifIy90hJ6BLOOVvJYaYSNPTkeWUTVrwc2jXQvV
 8U4U4AgcUdU8SpoxD5VKRiG+gppQ8TSYzic/CqVaqAVKmki6Wej6eSNfcsk2XedWipeh
 y0cqfbkEEYqgOf1/nP0nmmQBHyYL3RmTqj8IchoX8wfhTeTn3QLKzVFIM/eev2O93Roo
 fkZw==
X-Gm-Message-State: AOJu0YzfxAJCJ1qSM3nFUdjBmKspyVBAkp/lr7uZ0LH0L1iFYBdjn4px
 WSFZi4fqPjfiYlPExK8PILTDSuvBk7q+uK9eri3+T11PhezeZSJTAy3+RUbbEuv8C9HPM1d+nRK
 8K8RoY5ELxZuLbtHOe+qeFFS6npRuw/xiJ9jTJ33U4iDd1PpX9eg=
X-Google-Smtp-Source: AGHT+IGpkaLtb1PAUXbPz0uCrPzH5UPIO1h/JjgjU/yazs3gedJQ4X109eQsTR2LgCK5IX4/SwMde0fJbi8TpRXAr74=
X-Received: by 2002:a05:6a21:193:b0:1a3:ae75:d6f5 with SMTP id
 le19-20020a056a21019300b001a3ae75d6f5mr13465415pzb.20.1712010446367; Mon, 01
 Apr 2024 15:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ6EmCfd_TZwz3=RKequ=1t1-2Q5FbHENkcrPTu0ebwMEWq_HA@mail.gmail.com>
 <03d6dfc8-3a39-45eb-bdca-7f1654fab9a3@mind.be>
 <CAJ6EmCcEAuv8i_RC5FbVLueXaCLYm1T-GsuEtmo1wNCPOsRmCw@mail.gmail.com>
 <b5434307-aaf8-4ee1-a41a-00d9730f332c@mind.be>
 <CAJ6EmCdiSJk0Mora4P401KPv3vhXOpSGEthujBh37Lg_kAc52w@mail.gmail.com>
In-Reply-To: <CAJ6EmCdiSJk0Mora4P401KPv3vhXOpSGEthujBh37Lg_kAc52w@mail.gmail.com>
From: Patricia Holden <pholden@nklabs.com>
Date: Mon, 1 Apr 2024 18:27:15 -0400
Message-ID: <CAJ6EmCesk+mnBYocn4N0Hz+rU3udi+4U_9ZR7yQ9zyhrNvoFoA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1712010446; x=1712615246; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bhg7UaHcutdX44ZWOfnFaFoAPv2TYf4O2zqFaHjcBcg=;
 b=FtntenxnEOgiH9qOfi1ihL3AiRgd0p8yi0tXFNnKSZReRHK2ffRlviRHqulrwcIX9s
 9t79/tfVILoE96suNIYR7JPrVwCVCH0FeyP0VKnzxbacqOCCfymrkovk987qmSDmK1oT
 eQ6K3FtiaYXupHwpbv2JCxo81tmSUIipndMDcY4tF0ISCh+KPlu+CQTsuDhuuUyt2acO
 EW05pom7+g/yoACU4uES+6ugcCl+D/4wo/6JyX6EMPrkhD39og70wWknREVTuewrOYKE
 +zc+zWo3HUPbYAL84z/rr28j7QeyBwW9eP20uY3hgC1pleG6iTFPzJWxhVP25u1lZvHf
 21Bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=Ftntenxn
Subject: Re: [Buildroot] Is there an official browser patch for Buildroot?
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5680775098734778472=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5680775098734778472==
Content-Type: multipart/alternative; boundary="0000000000008209190615107e8f"

--0000000000008209190615107e8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I do have a TI SK-AM62 dev board to use too.  If someone could help me out
with setting up Buildroot to just bring up a single page web browser so I
can start my react-app frontend UI, that would be awesome!

On Mon, Apr 1, 2024 at 5:09=E2=80=AFPM Patricia Holden <pholden@nklabs.com>=
 wrote:

> Unfortunately I cannot use WPEWebKit with Beagleplay dev board I'm using.
> It requires OpenGL which has no Beagleplay support at the moment.  What
> about matchbox-window-manager?
>
> On Mon, Apr 1, 2024 at 3:53=E2=80=AFPM Arnout Vandecappelle <arnout@mind.=
be>
> wrote:
>
>>
>>
>> On 01/04/2024 20:56, Patricia Holden wrote:
>> > I just need a simple web page I can run a react app on.  If you know o=
f
>> any
>> > examples of this, please share!  I have tried using matchbox, but not
>> sure I'm
>> > configuring it correctly.
>>
>>   That's exactly what qt-webkit-kiosk is meant for. Oh, and I forgot cog
>> earlier: that's the same kind of tool but without pulling in Qt. Note:
>> you need
>> to enable WPEWebKit to be able to enable cog in Buildroot.
>>
>>   cog is much better maintained - I added Adrian in Cc who works on
>> WPEWebKit
>> and cog in Buildroot.
>>
>>   Regards,
>>   Arnout
>>
>> >
>> > On Mon, Apr 1, 2024 at 2:38=E2=80=AFPM Arnout Vandecappelle <arnout@mi=
nd.be
>> > <mailto:arnout@mind.be>> wrote:
>> >
>> >
>> >
>> >     On 01/04/2024 20:00, Patricia Holden wrote:
>> >      > I found a few topics online about a patch for chromium, but the=
y
>> are
>> >     dated 2018
>> >      > or older.  Is there an official patch to add the
>> chromium-browser as a
>> >     package
>> >      > for Buildroot?  Or how about "minibrowser", which I have also
>> seen topics
>> >     in an
>> >      > online search?
>> >
>> >        I don't think there has ever been an attempt to attempt chromiu=
m
>> itself, but
>> >     there was an attempt at patches for Chromium Embedded Framework
>> (CEF). That's
>> >     not a browser, however, just a browser engine. And anyway it turne=
d
>> out that
>> >     Chromium (and firefox) are way too complicated with too many
>> vendored
>> >     dependencies and crazy buildsystems.
>> >
>> >        There are a bunch of alternative browser engines: qt5webengine,
>> qt5webkit,
>> >     webkitgtk, wpewebkit.
>> >
>> >        There are also a few simple "frontends" for these, that
>> basically render a
>> >     single webpage and then allow you to browse (so no things like
>> history,
>> >     bookmarks, plugins, etc.): qt-webkit-kiosk, qt5webview; and a more
>> complete
>> >     browser: midori.
>> >
>> >        Finally, there's also the text-mode browser links, but I don't
>> suppose that
>> >     that is what you're looking for.
>> >
>> >
>> >        Regards,
>> >        Arnout
>> >
>> >      >
>> >      > Thanks!
>> >      > Pat Holden, NK Labs
>> >      >
>> >      > _______________________________________________
>> >      > buildroot mailing list
>> >      > buildroot@buildroot.org <mailto:buildroot@buildroot.org>
>> >      > https://lists.buildroot.org/mailman/listinfo/buildroot
>> >     <https://lists.buildroot.org/mailman/listinfo/buildroot>
>> >
>>
>

--0000000000008209190615107e8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I do have a TI SK-AM62=C2=A0dev board to use too.=C2=A0 If=
 someone could help me out with setting up Buildroot to just bring up a sin=
gle page web browser so I can start my react-app frontend UI, that would be=
 awesome!</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Apr 1, 2024 at 5:09=E2=80=AFPM Patricia Holden &lt;<a href=
=3D"mailto:pholden@nklabs.com">pholden@nklabs.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Unfortuna=
tely I cannot use WPEWebKit with Beagleplay=C2=A0dev board I&#39;m using.=
=C2=A0 It requires OpenGL which has no Beagleplay support at the moment.=C2=
=A0 What about matchbox-window-manager?</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 1, 2024 at 3:53=E2=80=AF=
PM Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_bl=
ank">arnout@mind.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><br>
<br>
On 01/04/2024 20:56, Patricia Holden wrote:<br>
&gt; I just need a simple web page I can run a react app on.=C2=A0 If you k=
now of any <br>
&gt; examples of this, please share!=C2=A0 I have tried using matchbox, but=
 not sure I&#39;m <br>
&gt; configuring it correctly.<br>
<br>
=C2=A0 That&#39;s exactly what qt-webkit-kiosk is meant for. Oh, and I forg=
ot cog <br>
earlier: that&#39;s the same kind of tool but without pulling in Qt. Note: =
you need <br>
to enable WPEWebKit to be able to enable cog in Buildroot.<br>
<br>
=C2=A0 cog is much better maintained - I added Adrian in Cc who works on WP=
EWebKit <br>
and cog in Buildroot.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; On Mon, Apr 1, 2024 at 2:38=E2=80=AFPM Arnout Vandecappelle &lt;<a hre=
f=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@=
mind.be</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 01/04/2024 20:00, Patricia Holden wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I found a few topics online about a patch for=
 chromium, but they are<br>
&gt;=C2=A0 =C2=A0 =C2=A0dated 2018<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; or older.=C2=A0 Is there an official patch to=
 add the chromium-browser as a<br>
&gt;=C2=A0 =C2=A0 =C2=A0package<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; for Buildroot?=C2=A0 Or how about &quot;minib=
rowser&quot;, which I have also seen topics<br>
&gt;=C2=A0 =C2=A0 =C2=A0in an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; online search?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 I don&#39;t think there has ever been an at=
tempt to attempt chromium itself, but<br>
&gt;=C2=A0 =C2=A0 =C2=A0there was an attempt at patches for Chromium Embedd=
ed Framework (CEF). That&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0not a browser, however, just a browser engine. And =
anyway it turned out that<br>
&gt;=C2=A0 =C2=A0 =C2=A0Chromium (and firefox) are way too complicated with=
 too many vendored<br>
&gt;=C2=A0 =C2=A0 =C2=A0dependencies and crazy buildsystems.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 There are a bunch of alternative browser en=
gines: qt5webengine, qt5webkit,<br>
&gt;=C2=A0 =C2=A0 =C2=A0webkitgtk, wpewebkit.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 There are also a few simple &quot;frontends=
&quot; for these, that basically render a<br>
&gt;=C2=A0 =C2=A0 =C2=A0single webpage and then allow you to browse (so no =
things like history,<br>
&gt;=C2=A0 =C2=A0 =C2=A0bookmarks, plugins, etc.): qt-webkit-kiosk, qt5webv=
iew; and a more complete<br>
&gt;=C2=A0 =C2=A0 =C2=A0browser: midori.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Finally, there&#39;s also the text-mode bro=
wser links, but I don&#39;t suppose that<br>
&gt;=C2=A0 =C2=A0 =C2=A0that is what you&#39;re looking for.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnout<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Pat Holden, NK Labs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; _____________________________________________=
__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; buildroot mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"mailto:buildroot@buildroot.org" ta=
rget=3D"_blank">buildroot@buildroot.org</a> &lt;mailto:<a href=3D"mailto:bu=
ildroot@buildroot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"https://lists.buildroot.org/mailma=
n/listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.bu=
ildroot.org/mailman/listinfo/buildroot</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.buildroot.org/mailman/=
listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buil=
droot.org/mailman/listinfo/buildroot</a>&gt;<br>
&gt; <br>
</blockquote></div>
</blockquote></div>

--0000000000008209190615107e8f--

--===============5680775098734778472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5680775098734778472==--
