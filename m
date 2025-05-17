Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174CDC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 05:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A28A940DC9;
	Sat, 17 May 2025 05:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3l6UszyH6xlL; Sat, 17 May 2025 05:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA92640DA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA92640DA2;
	Sat, 17 May 2025 05:44:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D65871137
 for <buildroot@buildroot.org>; Sat, 17 May 2025 05:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFAEF40D89
 for <buildroot@buildroot.org>; Sat, 17 May 2025 05:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8YiGK3aASEju for <buildroot@buildroot.org>;
 Sat, 17 May 2025 05:44:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CEBA840D3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEBA840D3F
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEBA840D3F
 for <buildroot@buildroot.org>; Sat, 17 May 2025 05:44:41 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-70c7c4cb929so26726577b3.1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 22:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747460680; x=1748065480;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Ksh5TOeJuJakmQki7DiFsz0np4tub3+KMfyFlIgvPg=;
 b=EDBckPeP2n3whZzq1DTSU7OgqU5jL6k33cntNSRH1CGqEwd7KW9zJOMin9XOIO9lIl
 ZvT9Dpdb+uVsHlni3Bwrz80bDYZI47n3rprIKnOxBZgNmOD+9WCkNI6pTNzuQa1ZiMfj
 PzWU6HjIaMJJkHcAzBwZdYO5Oevxjmv+SV+TKiuS1iVejQM35rLCfGmLRcXu9ZajXX8r
 KurnsWEYLjuM1g+2mW0LNWNsXqqEPq2O4x1NMDoktAlgCDhVd2MZ0/KrOrALGIVDKF7j
 1XaxwwuCnskauTI2NWCwV0jbypAz/sds4+OkFvEWOEyd53cyHB1PN08fQ3DLiNlWwNDp
 4snQ==
X-Gm-Message-State: AOJu0YxfvXkzazowwdxF3j+UQxYwn21RTNsmz8b//fdjCuscwnb5ubah
 GKZgD9k0SIXz2iGASrHrH7a+k1FWgShWDAmTaDbG6mW+TVI1SWRSv0/UDPX+CcGhEg2AhYQCh60
 /c6BsCOQtFEt2kBxDHPaHPaiQ6NLcyyQ=
X-Gm-Gg: ASbGncufKhPt5vQdZ/FH34Zf86IK0Opz7WROrwm/S/rUeu1kUFX6pUiCLHT3Tj+CQWG
 AfrNapxL2ay63XPSUpxM5i/cQgazcR2QYlTDuKBFEGsN8ewnw6yt6cR8Ug0FE/6xcS2A4mbvTro
 wEyQ56jbH64HTDMqHSwAiX9wjmg9hOW5xDYWPUnhIeZ2Yu
X-Google-Smtp-Source: AGHT+IFZp2cD2CqhqSV6b+WzqyX2yscYm9Zku2lp3u8Cm/glTfmrrP3TejpU1/fqcW9XbyD6B19KPayNFCI4Y5nEAms=
X-Received: by 2002:a05:690c:f82:b0:6fd:a1dc:b409 with SMTP id
 00721157ae682-70ca8902198mr84887347b3.5.1747460680591; Fri, 16 May 2025
 22:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
 <20250515103632.2631227-9-roykollensvendsen@gmail.com>
 <20250516225158.706cccf5@windsurf>
 <CA+R_deo8cJVqYuPNiQdnXXbGuaY9o11rMYp1CsaRqVdfRSM_AQ@mail.gmail.com>
In-Reply-To: <CA+R_deo8cJVqYuPNiQdnXXbGuaY9o11rMYp1CsaRqVdfRSM_AQ@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sat, 17 May 2025 07:44:28 +0200
X-Gm-Features: AX0GCFsuEGlJydoGtdeM8-SmU8p8rxCxA2eEhDL0DZ6LNqSvbq5bQxZQ-H63I1U
Message-ID: <CA+R_deoydzaR-Zmc=jziK8+a+QY1=VAU8Z3bgUckn3e-dTFbGw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>, 
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747460680; x=1748065480; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6Ksh5TOeJuJakmQki7DiFsz0np4tub3+KMfyFlIgvPg=;
 b=OWDgEwVqcuHhplgP+FanQ19e3E5f8DYGP9hkqOKjUcBZ54R2pJSU75fGc4fD0Y4XTF
 igTTiu722kvWYN8JhQi/6BY5pPOZdcDqLRPUR/7TKa/ljJB8cLGuwoiUtfQuh9643MpR
 ZPmv1pL8d1JZPlRKp5W70OCSWzNbldOir/rCKb+45H8wszdDqO3VunWH5DJZxxLFTmSJ
 19qVYWH82otvX/fyIMXGtv7LfIMpf7NpKf8hf7b++q3MdN0NuHZTyOoaiSVT+lv3Sknz
 qOLI+v0bclO0QacKSxuxJqxrLBGfd9sQjYYUewRH1diqGaOsyV/jyzvS1dagmMFOaOCD
 esrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OWDgEwVq
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
Content-Type: multipart/mixed; boundary="===============1314002425826915694=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1314002425826915694==
Content-Type: multipart/alternative; boundary="0000000000002038c606354e65c9"

--0000000000002038c606354e65c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

l=C3=B8r. 17. mai 2025 kl. 07:18 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

>
>
> fre. 16. mai 2025 kl. 22:52 skrev Thomas Petazzoni <
> thomas.petazzoni@bootlin.com>:
>
>> Hello Roy,
>>
>> Thanks for the great patch series! I'm going through it, and I'm hoping
>> to merge it progressively in the next days. I have one question on this
>> patch though.
>>
>> On Thu, 15 May 2025 12:36:25 +0200
>> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>>
>> > Strip down qt6tools to the bare minimum by:
>> > - Removing the target package
>> > - Disabling all features except for the linguist tools
>> >
>>
>
------

> > This change addresses ongoing issues with qt6tools and focuses on its
>>
> > primary intended use: providing linguist tools for translating Qt6
>> > applications during the build process.
>>
> >
>> > The linguist tools are essential for internationalization (i18n) of Qt=
6
>> > applications and are now available as a host package for
>> cross-compilation
>> > purposes.
>> >
>>
> > This modification should resolve stability issues while still maintaini=
ng
>>
> > the core functionality required for Qt6 application translation.
>>
> ------

Should probably remove the lines above from the commit message. And replace
it by something like:

Reboot the package to avoid solving build problems that should not exist in
the first place.



> >
>> > update host package
>>
>> What does this mean?
>>
>>
> The last sentence ended up there unintentionally during a rebase.
>
>
>> > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
>>
>> Could you clarify why PATCH 09/10 and 10/10 are separate? It feels odd
>> to drop the target package, only to re-introduce it one commit after. I
>> was thinking of squashing both commits together. What do you think?
>>
>
> I think it is best to drop patch 10/10 for now. I can reintroduce that
> change when I need it.
>
> By the way, is 9/10 too large? Should we split the commit? Maybe it is
> better to gradually
> fix the concrete build failures than "starting from scratch?"
>
> Thanks for your feedback!
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
>>
>

--0000000000002038c606354e65c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">l=C3=B8r. 17. m=
ai 2025 kl. 07:18 skrev Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollen=
svendsen@gmail.com">roykollensvendsen@gmail.com</a>&gt;:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">=
<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">fre. 16. mai 2025 kl. 22:52 skrev Thomas Petazzoni &lt;<a href=3D"mailt=
o:thomas.petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.=
com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hel=
lo Roy,<br>
<br>
Thanks for the great patch series! I&#39;m going through it, and I&#39;m ho=
ping<br>
to merge it progressively in the next days. I have one question on this<br>
patch though.<br>
<br>
On Thu, 15 May 2025 12:36:25 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Strip down qt6tools to the bare minimum by:<br>
&gt; - Removing the target package<br>
&gt; - Disabling all features except for the linguist tools<br>
&gt; <br></blockquote></div></div></blockquote><div><br></div><div>------ <=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; This change addresses ongoing issues with qt6tools and focuses on its<=
br></blockquote></div></div></blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt; primary intended use: providing linguist tools for translating Qt6<br>
&gt; applications during the build process. <br></blockquote></div></div></=
blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt; <br>
&gt; The linguist tools are essential for internationalization (i18n) of Qt=
6<br>
&gt; applications and are now available as a host package for cross-compila=
tion<br>
&gt; purposes.<br>
&gt; <br></blockquote></div></div></blockquote><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt; This modification should resolve stability issues while still maintain=
ing<br></blockquote></div></div></blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt; the core functionality required for Qt6 application translation.<br></=
blockquote></div></div></blockquote><div>------</div><div><br></div><div>Sh=
ould probably remove the lines above from the commit message. And replace i=
t by something like:</div><div><br></div>Reboot the package to avoid solvin=
g build problems that should not exist in the first place.<br><br><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; <br>
&gt; update host package<br>
<br>
What does this mean?<br>
<br></blockquote><div><br></div><div>The last sentence ended up there unint=
entionally during a rebase.<div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensven=
dsen@gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<br>
<br>
Could you clarify why PATCH 09/10 and 10/10 are separate? It feels odd<br>
to drop the target package, only to re-introduce it one commit after. I<br>
was thinking of squashing both commits together. What do you think?<br></bl=
ockquote><div><br></div><div>I think it is best to drop patch 10/10 for now=
. I can reintroduce that change when I need it. <br></div><div><br></div><d=
iv>By the way, is 9/10 too large? Should we split the commit? Maybe it is b=
etter to gradually</div><div>fix the concrete build failures than &quot;sta=
rting from scratch?&quot;</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
Thanks for your feedback!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div></div>
</blockquote></div></div>

--0000000000002038c606354e65c9--

--===============1314002425826915694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1314002425826915694==--
