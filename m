Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E25C48BC4
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 01:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7EDE4031C;
	Mon, 19 Feb 2024 01:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrIZHqzw6Z52; Mon, 19 Feb 2024 01:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD68240347
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD68240347;
	Mon, 19 Feb 2024 01:20:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0FB51BF37E
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 01:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE637406A2
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 01:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66BoHqz6UA3H for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 01:20:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 448754069C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 448754069C
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 448754069C
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 01:20:52 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5645efb2942so1049256a12.1
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 17:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708305650; x=1708910450;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nlKAvKYqrLwjJjMIBtF0L4k3Ot/vC9oXxECGTe7iKfw=;
 b=QNeZ9pXJVGyR1TqZNhVL/RaqvCY0zACT4Qg6qRFyhDdg44oyhyEPH3Lel7U9ojs9c2
 LfiEMhHgfrNx1urYi0TSl7C0YTceoKBOZtt3LxxkF+ewbMIL4wC2odB7IY9H8vXE3tBS
 nZusLvduBeUgC8aGAc/02uv3w3CIfs72AXlEkuBw8/PtyB0CzUqLWVlv1oXXDpv41YQp
 1TmdR5xnsy4nXkz4nvOfiIff/DmDDyJ8XnOHA4gCVuVpF0qyvsXmpo9gKKKD+t7EvHEv
 5SdG/uMWZioYqvJr+KgL3yI37UZq7+1HrxRAO6XjXYntLAdwaVUAOHplQdmvLrnaghTD
 gLJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkF2j5QojpKkNFpGMh3NqTQ87YOzwkFKuM/QwtqKDVPAAq+LCnVHYQcX/Om5p4TtVGo5Oi5G6bnwtOJhGSUsKRPwRYBPY90w==
X-Gm-Message-State: AOJu0YyYm8Z2BVQlru7/QWbyTRsfcnrMYOvJpW6VwvM5WVrLSDQj4nUl
 L+eKpOUqFf+koQRhvGnKNBNWhoggK16OX+TZ3P30rRsY4cwpyiF15fF9l04Gz2w46VaRUGVfnxJ
 44gvfBlppaz5fsa+SA63sZGJm6pY=
X-Google-Smtp-Source: AGHT+IHNSjsUZzKfe9brNoN1QGFVuDo+L6JoDseglu1XlP1N+W6a2xo2TGJXkZvoGQEM+N/6knru5DA+Pq47kMi/DX0=
X-Received: by 2002:a05:6402:5207:b0:564:4211:faa3 with SMTP id
 s7-20020a056402520700b005644211faa3mr3157237edd.1.1708305649653; Sun, 18 Feb
 2024 17:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20240218230524.639348e6@windsurf>
 <43992C45-375D-4FF4-9EE4-F7FD15BB8DE1@benettiengineering.com>
In-Reply-To: <43992C45-375D-4FF4-9EE4-F7FD15BB8DE1@benettiengineering.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Sun, 18 Feb 2024 19:20:39 -0600
Message-ID: <CAOrEah7v65W-v7y=-N=pz2LDdcXrXtREwdyyFQ2S0_TnEZBQ7g@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708305650; x=1708910450; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nlKAvKYqrLwjJjMIBtF0L4k3Ot/vC9oXxECGTe7iKfw=;
 b=aKr5pNv1FebdcrmCva3dhbPCaBspmvRG2KGZRCFB29/42N//eLRim3doVfsZss0ECJ
 Mh0dp058PzC/466OxQuaHrUJfjA5jQ7IhSLdWoajPFjq63zBX1qcZnexpWQmr4Acr3il
 Mu8B83dYklWsgIM9rGM3QoxOHAi7ixKV3ApeWlpHDV404I1fXoZM1DlflaIcvwjjz+AT
 n0GoQNP7fqb6+lSjgY+MYQj9VQ7GwbTbrFGvR2j/PPduKyGTMtBVm9i0VFWlLDxbwRcD
 6nXZzOQ9ZfqNl7TkNx/uZblDMs0+Nw3WOpWBNt61GXfLchQlSORonVqs0bVSmVT2djR1
 /2mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aKr5pNv1
Subject: Re: [Buildroot] [PATCH 0/8] Patch and remove Nios2 binutils bug
 27597
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Yann MORIN <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: multipart/mixed; boundary="===============2495603784615966306=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2495603784615966306==
Content-Type: multipart/alternative; boundary="0000000000006a5c2d0611b1e7ed"

--0000000000006a5c2d0611b1e7ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All,

On Sun, Feb 18, 2024 at 4:28=E2=80=AFPM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> Hi Thomas, Yann, Vincent, All,
>
> > Il giorno 18 feb 2024, alle ore 23:05, Thomas Petazzoni <
> thomas.petazzoni@bootlin.com> ha scritto:
> >
> > =EF=BB=BFHello,
> >
> >> On Sun, 18 Feb 2024 19:45:28 +0100
> >> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> >>
> >> This patchset add backported patches for Buildroot Nios2 binutils bug
> 27597 and
> >> drop packages dependency on it. Doing this the external toolchain will
> fail
> >> building those packages, so I'm not that sure how to deal with this
> situation.
> >> The same happened for OpenRisc and as far as I remember the first patc=
h
> of the
> >> series has been applied, then Bootlin toolchains have been patched and
> rebuilt/
> >> redeployed, in the end the remaining patches have been applied. But
> here we also
> >> have Sourcery CodeBench Nios-II 2018.05 toolchain that contain the bug=
,
> so I
> >> don't know how to deal with this situation to avoid build failures.
> >
> > First of all, thanks for following up on this, I'm really happy to see
> > that we are not always *adding* more GCC/binutils bug options, but
> > sometimes *removing* some of them.
>
> It would be great if some Microblaze or Sh4 bug could be patched too.
> There=E2=80=99s a patch proposed by Vincent for a Microblaze gcc ICE.
> Vincent, it would be great if you provide a patchset similar to this for
> gcc, or I can deal with it.
>
>
I can certainly post the patch for BR. I've been a bit busy recently so
haven't done so and I'm a bit concerned with push back when trying to
upstream it, so don't know if it's worth submitting it without an upstream
submission.


> >
> > Regarding the CodeBench NIOSII toolchain from 2018.05, I think we could
> > simply delete it. It makes sense to support old toolchains to some
> > extent, but NIOSII is a very confidential architecture, and almost 6
> > years old toolchain is really ancient. So I would be entirely fine with
> > dropping this toolchain.
>
> It sounds good to me and it=E2=80=99s similat suggestion of Yann.
>
>
Any patch for the MicroBlaze stuff (and other fixes) will have to slowly
bleed into BR. As may have already been brought up, there are external
toolchains that we do _not_ control which make it difficult to drop these
types of flags.

I don't want to get too far off topic, but some of the things I brought up
in https://bugs.buildroot.org/show_bug.cgi?id=3D15943 seem at least
quasi-related.

Basically, it may behoove us to be very specific about what toolchains
_must_ have in order to be supported by a specific version of BR, such as:

* Minimum version of kernel headers
* Minimum libc + other tool versions
* Prequisite patches

This would largely push consumers to vetted external toolchains such as the
pre-created Bootlin toolchains that meet these requirements or to use BR
generated toolchains. Otherwise, we'll be "supporting" a hodge-podge of
toolchains with various mixtures of software indefinitely.

One thing is left out to deal with, Bootlin toolchains that need to be
> patched/rebuilt/redeployed.
>
> So I can give a respin to this series adding another patch dropping
> Sourcery external toolchain and you can apply it only after updating
> Bootlin Nios2 toolchain(this should be sufficient since the bug shows up
> only on Nios2).
> That way Buildroot will be bug 27597 free.
>
> Thanks for commenting!
>
> Best regards
> Giulio
>
> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering and training
> > https://bootlin.com
>
>
-Vincent

--0000000000006a5c2d0611b1e7ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>All,<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Feb 18, 2024 at 4:28=E2=80=AFPM Giuli=
o Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com">giul=
io.benetti@benettiengineering.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Thomas, Yann, Vincent, All,<br>
<br>
&gt; Il giorno 18 feb 2024, alle ore 23:05, Thomas Petazzoni &lt;<a href=3D=
"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bo=
otlin.com</a>&gt; ha scritto:<br>
&gt; <br>
&gt; =EF=BB=BFHello,<br>
&gt; <br>
&gt;&gt; On Sun, 18 Feb 2024 19:45:28 +0100<br>
&gt;&gt; Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettienginee=
ring.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt; w=
rote:<br>
&gt;&gt; <br>
&gt;&gt; This patchset add backported patches for Buildroot Nios2 binutils =
bug 27597 and<br>
&gt;&gt; drop packages dependency on it. Doing this the external toolchain =
will fail<br>
&gt;&gt; building those packages, so I&#39;m not that sure how to deal with=
 this situation.<br>
&gt;&gt; The same happened for OpenRisc and as far as I remember the first =
patch of the<br>
&gt;&gt; series has been applied, then Bootlin toolchains have been patched=
 and rebuilt/<br>
&gt;&gt; redeployed, in the end the remaining patches have been applied. Bu=
t here we also<br>
&gt;&gt; have Sourcery CodeBench Nios-II 2018.05 toolchain that contain the=
 bug, so I<br>
&gt;&gt; don&#39;t know how to deal with this situation to avoid build fail=
ures.<br>
&gt; <br>
&gt; First of all, thanks for following up on this, I&#39;m really happy to=
 see<br>
&gt; that we are not always *adding* more GCC/binutils bug options, but<br>
&gt; sometimes *removing* some of them.<br>
<br>
It would be great if some Microblaze or Sh4 bug could be patched too.<br>
There=E2=80=99s a patch proposed by Vincent for a Microblaze gcc ICE.<br>
Vincent, it would be great if you provide a patchset similar to this for gc=
c, or I can deal with it.<br>
<br></blockquote><div><br></div><div>I can certainly post the patch for BR.=
 I&#39;ve been a bit busy recently so haven&#39;t done so and I&#39;m a bit=
 concerned with push back when trying to upstream it, so don&#39;t know if =
it&#39;s worth submitting it without an upstream submission.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Regarding the CodeBench NIOSII toolchain from 2018.05, I think we coul=
d<br>
&gt; simply delete it. It makes sense to support old toolchains to some<br>
&gt; extent, but NIOSII is a very confidential architecture, and almost 6<b=
r>
&gt; years old toolchain is really ancient. So I would be entirely fine wit=
h<br>
&gt; dropping this toolchain.<br>
<br>
It sounds good to me and it=E2=80=99s similat suggestion of Yann.<br>
<br></blockquote><div><br></div><div>Any patch for the MicroBlaze stuff (an=
d other fixes) will have to slowly bleed into BR. As may have already been =
brought up, there are external toolchains that we do _not_ control which ma=
ke it difficult to drop these types of flags.</div><div><br></div><div>I do=
n&#39;t want to get too far off topic, but some of the things I brought up =
in <a href=3D"https://bugs.buildroot.org/show_bug.cgi?id=3D15943">https://b=
ugs.buildroot.org/show_bug.cgi?id=3D15943</a> seem at least quasi-related.<=
br><br></div><div>Basically, it may behoove us to be very specific about wh=
at toolchains _must_ have in order to be supported by a specific version of=
 BR, such as:</div><div><br></div><div>* Minimum version of kernel headers<=
/div><div>* Minimum libc + other tool versions</div><div>* Prequisite patch=
es<br></div><div><br></div><div>This would largely push consumers to=20
vetted external toolchains such as the pre-created Bootlin toolchains that =
meet these requirements or to use BR generated toolchains. Otherwise, we&#3=
9;ll be &quot;supporting&quot; a hodge-podge of toolchains with various mix=
tures of software indefinitely.<br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
One thing is left out to deal with, Bootlin toolchains that need to be patc=
hed/rebuilt/redeployed.<br>
<br>
So I can give a respin to this series adding another patch dropping Sourcer=
y external toolchain and you can apply it only after updating Bootlin Nios2=
 toolchain(this should be sufficient since the bug shows up only on Nios2).=
<br>
That way Buildroot will be bug 27597 free.<br>
<br>
Thanks for commenting!<br>
<br>
Best regards<br>
Giulio<br>
<br>
&gt; <br>
&gt; Best regards,<br>
&gt; <br>
&gt; Thomas<br>
&gt; --<br>
&gt; Thomas Petazzoni, co-owner and CEO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering and training<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
<br></blockquote><div><br></div><div>-Vincent <br></div></div></div>

--0000000000006a5c2d0611b1e7ed--

--===============2495603784615966306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2495603784615966306==--
