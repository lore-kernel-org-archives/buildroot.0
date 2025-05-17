Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEB0C3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 16:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 659AA40BE9;
	Sat, 17 May 2025 16:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TSj6tc9dzzR; Sat, 17 May 2025 16:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87E1C40BED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87E1C40BED;
	Sat, 17 May 2025 16:48:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3908E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D543583B37
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9HXrU4vJ9WQ for <buildroot@buildroot.org>;
 Sat, 17 May 2025 16:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1D2183B1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D2183B1D
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1D2183B1D
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:48:15 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e7b943bcf0cso157263276.3
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747500494; x=1748105294;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xlt5WiuYLsuJjIOnrMQ2xudetsDFTLjw9pEX4TJ2/2E=;
 b=Pqkv2WQ8QnIBf2cif58D5Zq+uqRKuSk7s6sZW0lJ2kkAThfwkPR9Lr4LcVSPS3MONk
 eij8pVs9if5QLuHCPyZqCTzgMwiVtJ1vwteDw244uJH7SN7VlwqKv5NmSQcfeUtI8xh/
 5x39go7Kee+NpmsH2NqYbYDo9c8Y7WeFnlAfZ1ABzy6EcofZxmCkaaUshgQSBA/rT/Qc
 gw0hb7PZ/AJgEa0i4/lwOM/R3j0Eqwywch7H8pSuOfLvY7TSORxynioatL5DNYkpyNKR
 F2JmMih823D9wXU6sAFutzYDNVKYVoM6kjhhMidK7IJYkchYvR35+mfu+7fF6KsYoIRn
 /C0A==
X-Gm-Message-State: AOJu0YwABg11xXeiNa4PMdM3KaGbrnZzEpa2qBXZXx+axD5020yGaezO
 E/MHIFIXPDzzT13iZFcWPfzDZwuuO5UFFp9TgGBbTQQ8od61HJX+GU8QcDnZPOVRhPgUAZPr4YM
 im+f4Oaz6jYdM0kCm6rCmRxvBT0Adddo=
X-Gm-Gg: ASbGncvv6wfJULQVz/y+ZxHwT/RrLh+zyyGjE/dqf8/g40LXssXT/YGbZk2a9li/Uhm
 a/PNFBgz6qWlFSPfdAoVFwCli7wlYh7jDmQHF0Ywzu0SHFepA+2yOhcd3zyxo23YZv69h26LYrC
 voilAeKyKVjeEPUjGEknNeLVxwibVzrc74ag==
X-Google-Smtp-Source: AGHT+IGXyaRuxioIpK6dV6rQZU3OD++rNmaxRCRYDs91iLb3h8DWgBA+NHsbHZOeJ2LhNPIFEkXcmT8p8Yw1B3yLtKs=
X-Received: by 2002:a05:6902:2b86:b0:e79:67c9:b665 with SMTP id
 3f1490d57ef6-e7b6d3f8637mr8756799276.12.1747500494498; Sat, 17 May 2025
 09:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
 <20250515103632.2631227-9-roykollensvendsen@gmail.com>
 <20250516225158.706cccf5@windsurf>
 <CA+R_deo8cJVqYuPNiQdnXXbGuaY9o11rMYp1CsaRqVdfRSM_AQ@mail.gmail.com>
 <20250517084222.7b3a32f3@windsurf>
In-Reply-To: <20250517084222.7b3a32f3@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sat, 17 May 2025 18:48:02 +0200
X-Gm-Features: AX0GCFtIoJDz5U8eGhf7Qqcp6Zua8FTevs-yG_yae9CWIDjS-U6wboVI5Umf9U8
Message-ID: <CA+R_dep37eGdjt8hazQhFOD5N_inCb8uKQthg3RDvTGOJcHNdg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>, 
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747500494; x=1748105294; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xlt5WiuYLsuJjIOnrMQ2xudetsDFTLjw9pEX4TJ2/2E=;
 b=RiqIjlXjGIWAyv/yFQ4Q/93iWYs/o+/v+aJDS0Tm+CPsvJLmkfiFfCJDMzqMzO4Z8e
 vXEoKcuV9QnwM6OXHO8u01VogmZNCPEwq0iZuBH4Lnxghwu3ifg0wQlYalPZZ/I0fTAn
 rBWXfZJW0oC+bUMwCMLxEhNyicRsyOH7qIfHOspJ+FWlosTvTpr4+8YJWNlPTaXJRcjh
 j2ztN9EwEpyOIJBFoIBi1fJAyt0pt5NZfe6GL3eORTSXxcBhf6luIAqnTHo144JmCSSI
 wJ6ZURLAG2rA8xzIrJeqpxbjT+TFCGuhCOg/6k2y5Bvx18DsJz86T8VJS6UP+G9uOdlu
 zRBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RiqIjlXj
Subject: Re: [Buildroot] [PATCH 09/10] package/qt6/qt6tools: build only host
 linguist tools
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
Content-Type: multipart/mixed; boundary="===============3254076683996432673=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3254076683996432673==
Content-Type: multipart/alternative; boundary="000000000000383603063557aa56"

--000000000000383603063557aa56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

l=C3=B8r. 17. mai 2025 kl. 08:42 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roy,
>
> On Sat, 17 May 2025 07:18:19 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > fre. 16.
> > > What does this mean?
> > >
> > The last sentence ended up there unintentionally during a rebase.
>
> OK, that's what I thought :-)
>
> > I think it is best to drop patch 10/10 for now. I can reintroduce that
> > change when I need it.
> >
> > By the way, is 9/10 too large? Should we split the commit? Maybe it is
> > better to gradually fix the concrete build failures than "starting
> > from scratch?"
>
> What are the concrete build failures being fixed? What are the
> "on-going" issues that you are referring to. Keep in mind that we are
> maintaining a LTS branch, to which we backport fixes so we really want
> to understand when things broke, and therefore whether the fixes should
> be backported.
>

I'll try to recreate the build errors and read through my e-mail again.


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000383603063557aa56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">l=C3=B8r. 17. m=
ai 2025 kl. 08:42 skrev Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petaz=
zoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hello Roy,<br>
<br>
On Sat, 17 May 2025 07:18:19 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; fre. 16.<br>
&gt; &gt; What does this mean?<br>
&gt; &gt;=C2=A0 <br>
&gt; The last sentence ended up there unintentionally during a rebase.<br>
<br>
OK, that&#39;s what I thought :-)<br>
<br>
&gt; I think it is best to drop patch 10/10 for now. I can reintroduce that=
<br>
&gt; change when I need it.<br>
&gt; <br>
&gt; By the way, is 9/10 too large? Should we split the commit? Maybe it is=
<br>
&gt; better to gradually fix the concrete build failures than &quot;startin=
g<br>
&gt; from scratch?&quot;<br>
<br>
What are the concrete build failures being fixed? What are the<br>
&quot;on-going&quot; issues that you are referring to. Keep in mind that we=
 are<br>
maintaining a LTS branch, to which we backport fixes so we really want<br>
to understand when things broke, and therefore whether the fixes should<br>
be backported.<br></blockquote><div><br></div><div>I&#39;ll try to recreate=
 the build errors and read through my e-mail again.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000383603063557aa56--

--===============3254076683996432673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3254076683996432673==--
