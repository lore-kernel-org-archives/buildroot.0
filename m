Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2E8EB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 14:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA36C417A9;
	Tue,  4 Jul 2023 14:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA36C417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIkojncxQL27; Tue,  4 Jul 2023 14:25:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06170417A7;
	Tue,  4 Jul 2023 14:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06170417A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D7441BF83E
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 14:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 814B681CBA
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 14:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 814B681CBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJfG5s5mjnMp for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 14:24:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A98A8142C
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A98A8142C
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 14:24:58 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so9144987e87.0
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 07:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688480697; x=1691072697;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RcWag/T3LmEyfWjaHLLpXe/wvbJ9NARLcxQpppRPCJg=;
 b=dEZzsTwnjoTukxdG/j3527B6RyMLe8vT4scUiQvJIsKR0AtLYd1DMp0Tj22NCpEFxZ
 MHjg6jzyDbaVC0+/Do1FQ/aR7b8CluAoRjRH2JPaj7Vre6Hopc6Ij9aa7VfpmoB4OX5Z
 th34DwZV/ydC2HjolVcc5Y0aDUQG4HOLqNcq7dcktt2Q1bYZJOSvCFm6pswANExWXuH6
 DjFIvS9HcDl+NNlvBxiOgo05x1r4kF8cFMCBXpUCTCWZ25XCfbyUmieGkk+ZCgs8I+Hb
 7LYKhmLkoXasGv6yIb2aQK4VQJrXmxQMaQMmGhf5+DgPJLv94TFBFI02W+VDrxD8wdH5
 hTwg==
X-Gm-Message-State: ABy/qLYxgo8rQ904tsg0Mjgj4algFrSOh7V6ZJaBIJS0en8D/88B5n92
 yQt3xo/vnhh8kbb1WQKMKQbLv7kDN5d6pqow4FO28w==
X-Google-Smtp-Source: APBJJlH0PWjeQnPkaFjmu3DFdsZLvoxURlsSh+e5uzATyM4rf3vwNhXxGrFvJpEu/EsFFB86+HyuB5VQH766tXDwpYw=
X-Received: by 2002:ac2:4da6:0:b0:4fb:8df5:8919 with SMTP id
 h6-20020ac24da6000000b004fb8df58919mr8207951lfe.23.1688480696954; Tue, 04 Jul
 2023 07:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230608085015.1075425-1-sebastian.weyer@smile.fr>
 <20230703224149.51f6ac85@windsurf>
 <CADSVbUsPFy5-CZ22BUU_dYAGc-=ycpJYAKSmdj7nYm96Nn5PBQ@mail.gmail.com>
 <20230704153345.153f73ac@windsurf>
In-Reply-To: <20230704153345.153f73ac@windsurf>
From: Sebastian WEYER <sebastian.weyer@smile.fr>
Date: Tue, 4 Jul 2023 16:24:45 +0200
Message-ID: <CADSVbUvonajc2AXV8pZq9_8zxADf0zcW95p-ygSvwqMJSWu-yA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1688480697; x=1691072697;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RcWag/T3LmEyfWjaHLLpXe/wvbJ9NARLcxQpppRPCJg=;
 b=X3Y1dciQYYJtrtF/Ar58T/6rwqi4skbOWZVyCsx0ik5FGbI/5IzJkMnRv5vC4C+g5C
 cm3yX9AD3ixZHdA51vPbjFZ1bYzu0E8aM/EQi6bhZJpAj/inHeARj8Upgfc/9x/sffNr
 XY8cZUK7piaVoKzGLuNjuELgGXTJv7ZQ+E+Kc5PML7JLSkMqQ0mcg8xA9nCpRyzxr7EG
 M3gAbWWI5Lk7vHCb+q1bWjh5e3zyRMyNmLOLFWs3LEN7uhItJtmcwZifcsISt8yPYUTt
 XulIGc+mBdbY0MtwKJex/loAjFjsQDzjOQYfoiVD6f4t7vxnoY+f/RD7kWDeHumR2a1N
 4aQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=X3Y1dciQ
Subject: Re: [Buildroot] [PATCH 1/1] package/rust-bindgen: new host package
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2952446644027086252=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2952446644027086252==
Content-Type: multipart/alternative; boundary="00000000000027044605ffaa0c1e"

--00000000000027044605ffaa0c1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Yes, the kernel only supports bindgen in version 0.56.0 (released in
November 2020!).
Since the support for Rust in the kernel for now is only very rudimentary
and this is not the only difficulty (lack of minimum version of rustc for
example and lack of architecture support) I think for now it is not that
big of a deal.

Best regards,
Sebastian


On Tue, Jul 4, 2023 at 3:33=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Sebastian,
>
> On Tue, 4 Jul 2023 12:50:16 +0200
> Sebastian WEYER <sebastian.weyer@smile.fr> wrote:
>
> > Thank you for your feedback.
> > It was an oversight to leave the comment as is, as initially the packag=
e
> > was added with a version <0.63.0.
> > Do you think a comment explaining the command line options being
> deprecated
> > should stay? Also considering that the Kernel still uses these options
> for
> > its Rust modules.
>
> Ah, so the proposed version of rust-bindgen would not work to support
> the in-kernel Rust support? This is a bit unfortunate.
>
> Regarding the comment, I'm not sure they make sense. If we start
> documenting all what's no longer supported by a given package,
> Buildroot would be full of comments related to obsolete features :-)
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>


--=20
[image: eco] Pour la plan=C3=A8te, n'imprimez ce mail que si c'est n=C3=A9c=
essaire
[image: SMILE] <http://www.smile.eu/>

10-12 Rue Nicolas Appert
44100 NANTES
*Sebastian WEYER*
Stagiaire production

[image: email] sebastian.weyer@smile.fr
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

--00000000000027044605ffaa0c1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Thomas,<div><br></div><div>Yes, the kernel only supp=
orts bindgen in version 0.56.0 (released in November 2020!).=C2=A0</div><di=
v>Since the support for Rust in the kernel for now is only very rudimentary=
 and this is not the only difficulty (lack of minimum version of rustc for =
example and lack of architecture support) I think for now it is not that bi=
g of a deal.</div><div><br></div><div>Best regards,</div><div>Sebastian</di=
v><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Jul 4, 2023 at 3:33=E2=80=AFPM Thomas Petazzoni &l=
t;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hello Sebastian,<br>
<br>
On Tue, 4 Jul 2023 12:50:16 +0200<br>
Sebastian WEYER &lt;<a href=3D"mailto:sebastian.weyer@smile.fr" target=3D"_=
blank">sebastian.weyer@smile.fr</a>&gt; wrote:<br>
<br>
&gt; Thank you for your feedback.<br>
&gt; It was an oversight to leave the comment as is, as initially the packa=
ge<br>
&gt; was added with a version &lt;0.63.0.<br>
&gt; Do you think a comment explaining the command line options being depre=
cated<br>
&gt; should stay? Also considering that the Kernel still uses these options=
 for<br>
&gt; its Rust modules.<br>
<br>
Ah, so the proposed version of rust-bindgen would not work to support<br>
the in-kernel Rust support? This is a bit unfortunate.<br>
<br>
Regarding the comment, I&#39;m not sure they make sense. If we start<br>
documenting all what&#39;s no longer supported by a given package,<br>
Buildroot would be full of comments related to obsolete features :-)<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">
    <img src=3D"http://ftp.smile.fr/client/Communication/signature/img/eco.=
png" alt=3D"eco" width=3D"13" height=3D"11">
            Pour la plan=C3=A8te, n&#39;imprimez ce mail que si c&#39;est n=
=C3=A9cessaire
    <table style=3D"padding:20px" border=3D"0"><tbody><tr><td style=3D"font=
-size:13px;color:rgb(255,128,84);text-align:center;padding-right:30px"><a h=
ref=3D"http://www.smile.eu/" target=3D"_blank">
                    <img style=3D"max-width: 100%; height: auto;" src=3D"ht=
tp://ftp.smile.fr/client/Communication/signature/img/Logo-new.png" alt=3D"S=
MILE">
                </a><br><br>
                    <p style=3D"line-height:15px">10-12 Rue Nicolas Appert<=
br>
44100 NANTES</p>
            </td>
            <td style=3D"border-left:1px solid rgb(59,127,254);padding-left=
:20px;font-size:13px;color:rgb(255,128,84)">
                <div style=3D"color:rgb(255,128,84);font-size:14px">
                    <b>Sebastian WEYER</b>
                </div>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    Stagiaire production<br>
                   =20
                </div><br>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    <span style=3D"white-space:nowrap"><img style=3D"margin=
-right: 5px;" src=3D"http://ftp.smile.fr/client/Communication/signature/img=
/mail.png" alt=3D"email" width=3D"12" height=3D"10">
                        <a href=3D"mailto:sebastian.weyer@smile.fr" style=
=3D"color:rgb(59,127,254);font-size:13px;text-decoration:none" target=3D"_b=
lank">sebastian.weyer@smile.fr</a>
                    </span>
                     <br>
                                                    <span style=3D"white-sp=
ace:nowrap"><img style=3D"margin-right: 5px;" src=3D"http://ftp.smile.fr/cl=
ient/Communication/signature/img/web.png" alt=3D"url" width=3D"12" height=
=3D"12">
<a href=3D"http://www.smile.eu" style=3D"color:rgb(59,127,254);font-size:13=
px;text-decoration:none" target=3D"_blank">http://www.smile.eu</a> =20
                  </span>
                                </div>

                <br>
                <div>
                    <span><a style=3D"margin-right:5px" href=3D"https://twi=
tter.com/GroupeSmile" target=3D"_blank"><img src=3D"http://ftp.smile.fr/cli=
ent/Communication/signature/img/rs-twitter.png" alt=3D"Twitter" style=3D"ma=
x-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.linkedin.com/company/smile" target=3D"_blank"><img src=3D"http://ftp.smile=
.fr/client/Communication/signature/img/rs-linkedin.png" alt=3D"LinkedIn" st=
yle=3D"max-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://git=
hub.com/Smile-SA" target=3D"_blank"><img src=3D"http://ftp.smile.fr/client/=
Communication/signature/img/rs-github.png" alt=3D"Github" style=3D"max-widt=
h: 100%; height: auto;"></a></span>
                </div>
            </td>
        </tr>
        </tbody>
    </table></div></div>

--00000000000027044605ffaa0c1e--

--===============2952446644027086252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2952446644027086252==--
