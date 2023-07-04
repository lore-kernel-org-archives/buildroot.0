Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E85EB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 10:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADAB881F6A;
	Tue,  4 Jul 2023 10:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADAB881F6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYXcrae3YrSh; Tue,  4 Jul 2023 10:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5C1881EAE;
	Tue,  4 Jul 2023 10:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5C1881EAE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67C741BF23C
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 10:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E550402DC
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 10:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E550402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uwDfsnV8uxO for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 10:50:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB8440217
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DB8440217
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 10:50:29 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fb41682472so8232367e87.2
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 03:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688467828; x=1691059828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2473dXsQP5oUF5kauf+3GGstdSogQlJSEgBoiQk5YUM=;
 b=TyioANRVBLDtvA8lYAhq63dH62xspf/x9UqQ3EwIrxzwFc3ssseYfdwMbfV8/jiTcy
 ZCwSKK2cWeUR7XFPSIJ1AAVlRujFbvOLJYU6dYEeN9oZJyClGcSbjZgNZcXC558WfHev
 kNOLxoLCVYY5GmRFdtHZhS1OflJEkvS9ogPBwDqeRFUl2GjkMIpGHvqQhiYZ+YZMNEiz
 Cq0yilJdIR6xInKlX0USWlZaDNIF/4+k0ZPls+KWrY1tA77Ym5C23/RY25tENP758lY/
 R8C3V7R1+2ZPy2lUEDEDZIdEkiTzfOKY1Gx8CHP5ArB8+v2gRSUzvCfytlfddvJdq1NW
 IDPA==
X-Gm-Message-State: ABy/qLZpRP8kMC39hRezTUCcwTm7EIRnksjCzAjB+llEewaUh1k4dSDP
 m4nR7+rhU+aHB9tDqKiGDVtv7zbyVDLM3ca032CqsA==
X-Google-Smtp-Source: APBJJlGkDSGz4XKQVmGHEXRdHAlcTZZGzdyBXboQUc+fD1qePML2xxY/KC0gpBgh9K5Gyd6ljXnq6Bp8P/1BrbDDms0=
X-Received: by 2002:a19:2d05:0:b0:4fb:8e1b:ba05 with SMTP id
 k5-20020a192d05000000b004fb8e1bba05mr9652978lfj.11.1688467827749; Tue, 04 Jul
 2023 03:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230608085015.1075425-1-sebastian.weyer@smile.fr>
 <20230703224149.51f6ac85@windsurf>
In-Reply-To: <20230703224149.51f6ac85@windsurf>
From: Sebastian WEYER <sebastian.weyer@smile.fr>
Date: Tue, 4 Jul 2023 12:50:16 +0200
Message-ID: <CADSVbUsPFy5-CZ22BUU_dYAGc-=ycpJYAKSmdj7nYm96Nn5PBQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1688467828; x=1691059828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2473dXsQP5oUF5kauf+3GGstdSogQlJSEgBoiQk5YUM=;
 b=cOJfSLI6hJoi9/HYB6mAHGwtrAJPOSvRNkS6rOjsjajTaC0jld9x9riKW7/Oj+E/rk
 NHt5pxj/MxAM6REfldNF5hhJgv1uFBNjHYL8IwBK+Hs772vJ7WmPjo98ret7CMQFixp4
 5HcYw8Gt2FwDSakMRxsBpQAG994ffgvFcK5RkM0fPMf+RGVqwP3MHYy0ayshYjia37Wt
 xNUu7dw64i/EjOPi/0xUnrJCVzogvNd0uE/+2I7ywC4hRW23uYhfgwrDyaS+RwKSfmgn
 F0zQJt99T5oPdVOeHjokU4GF1Li//OBolZzcSwZaJ2SvxOoDeTwLHk61kYGd80k9MDyo
 vQWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=cOJfSLI6
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
Content-Type: multipart/mixed; boundary="===============3490743070337992167=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3490743070337992167==
Content-Type: multipart/alternative; boundary="000000000000168f3205ffa70def"

--000000000000168f3205ffa70def
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Thank you for your feedback.
It was an oversight to leave the comment as is, as initially the package
was added with a version <0.63.0.
Do you think a comment explaining the command line options being deprecated
should stay? Also considering that the Kernel still uses these options for
its Rust modules.

Best regards,
Sebastian

On Mon, Jul 3, 2023 at 10:42=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Sebastian, Hello Romain,
>
> On Thu,  8 Jun 2023 10:50:15 +0200
> Sebastian Weyer <sebastian.weyer@smile.fr> wrote:
>
> > +#When updating to a version >0.63.0, pay attention to the command line
> > +#arguments --blacklist* and --whitelist* which are deprecated from
> 0.63.0
> > +#onwards but are still used when compiling the Linux Kernel as of the
> time
> > +#of this comment
> > +RUST_BINDGEN_VERSION =3D 0.65.1
>
> The comment above this version variable is confusing: it says to be
> careful when updating to a version >0.63.0, but the patch already
> includes a version greater than 0.63.0. So?
>
> Also: space after # sign in comments.
>
> Thanks!
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

--000000000000168f3205ffa70def
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Thomas,<div><br></div><div>Thank you for your feedba=
ck.</div><div>It was an oversight to leave the comment as is, as initially =
the package was added with a version &lt;0.63.0.</div><div>Do you think a c=
omment explaining the command line options being deprecated should stay? Al=
so considering that the Kernel still uses these options for its Rust module=
s.</div><div><br></div><div>Best regards,</div><div>Sebastian</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
Jul 3, 2023 at 10:42=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thom=
as.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Sebastian, Hell=
o Romain,<br>
<br>
On Thu,=C2=A0 8 Jun 2023 10:50:15 +0200<br>
Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@smile.fr" target=3D"_=
blank">sebastian.weyer@smile.fr</a>&gt; wrote:<br>
<br>
&gt; +#When updating to a version &gt;0.63.0, pay attention to the command =
line<br>
&gt; +#arguments --blacklist* and --whitelist* which are deprecated from 0.=
63.0<br>
&gt; +#onwards but are still used when compiling the Linux Kernel as of the=
 time<br>
&gt; +#of this comment<br>
&gt; +RUST_BINDGEN_VERSION =3D 0.65.1<br>
<br>
The comment above this version variable is confusing: it says to be<br>
careful when updating to a version &gt;0.63.0, but the patch already<br>
includes a version greater than 0.63.0. So?<br>
<br>
Also: space after # sign in comments.<br>
<br>
Thanks!<br>
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

--000000000000168f3205ffa70def--

--===============3490743070337992167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3490743070337992167==--
