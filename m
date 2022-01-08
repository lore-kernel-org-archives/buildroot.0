Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382BBC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 21:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A660F400C1;
	Sat,  8 Jan 2022 21:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8x1R30w-7h_I; Sat,  8 Jan 2022 21:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 662C840122;
	Sat,  8 Jan 2022 21:15:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47ED41BF283
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 353F7813C0
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l9SFnAVtym1n for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 21:15:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F3E1813BF
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 21:15:16 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id h7so29326235lfu.4
 for <buildroot@busybox.net>; Sat, 08 Jan 2022 13:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kj6vY2ukrFz8SuAytE9tA2Ihab6hP42rX9Q31MWWT1w=;
 b=aVnB/UHx1uBC5D1Z0AvWEg8aITmxiLcIwU6xeA31Eoqo+CzX4Xlh0XF9wtU9WPF+Vy
 emk1sPEsAz1eJeOe7PFxKjAlB5VD8Xo9qDGp2MobjwAcOwfXbJt1n+zEDZlP8Q9DkKzW
 4HeRYvtVMm4iONKEXz5G2ihw3TlS+SqfBQDqiUbExDN2KbmX1rN8AaF1DO289HA525xC
 kd2ssJCIDaUiUTtmrECgrgCAlkD/oE2Dr8udh2+Zt3yUk3KE+OV4YIQpczqgNqvGJoSp
 +4kSxM3BKY5KEcTi7L9CRkUT7A8tlXeetNAr7fuaGU96pleSUeqkyZY8r1ykgD7UAHIE
 yCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kj6vY2ukrFz8SuAytE9tA2Ihab6hP42rX9Q31MWWT1w=;
 b=YBsb9pCKhYspMIEdUKZrz97z/MvyNGOF4I1tmJhp5sap5d1rwq70GmiwdiBighHS98
 kkg2XjZj0+syFsWnwbULVu+ccVI5OsKbEPwBT1Vf0SfhaJk2DlA5wFaXj/UpZQJPBcWy
 bl0YO75iq8jYHmeewWiln494qWO9ZpQM5R2AJxlOAmRjkNbgHrl0scGZP+7W55qEbPrE
 WbFX/mEYF+nuCcO4FI00NdHQF+C4lURRfiwYgfYt8/O5aRz0pz2LgNKeXlfZl4XXSCvv
 8z2ykbBSjM1DUVPwKTqPx+mZLHkEqAJGB1YTtOr182oDMkDjDqY6oMQ70n4Vlh2OhazH
 RYig==
X-Gm-Message-State: AOAM531UrMGCyWSuhuWgUWt5gOLTYOoB7CpKaja389b5VZ52v4SXk7ot
 pzp/KUUf+M53flBiP8FvDPdnxBFQuK4t7ZmsLy0=
X-Google-Smtp-Source: ABdhPJyHhaBskVmx/W9Vru8GXuY6OjJFTLM0OsQmPZHWouhvV26v+AOJxmvgZGL2ajXZVP4yOIGMSgksRO3OCQZ5pOY=
X-Received: by 2002:ac2:48ad:: with SMTP id u13mr2462165lfg.562.1641676513941; 
 Sat, 08 Jan 2022 13:15:13 -0800 (PST)
MIME-Version: 1.0
References: <20210213102055.24378-1-guillaume.bresaix@gmail.com>
 <20220108204223.2e904905@windsurf>
In-Reply-To: <20220108204223.2e904905@windsurf>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Sat, 8 Jan 2022 22:14:47 +0100
Message-ID: <CAJe0E3cJ4ANZ6g8XkoXZ0RJ45x5yAhuHg6bEq3_Qzau_iHZjew@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyext: new package
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>
Content-Type: multipart/mixed; boundary="===============0101356898764316376=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0101356898764316376==
Content-Type: multipart/alternative; boundary="000000000000731dca05d51899e9"

--000000000000731dca05d51899e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> If you have a reason to think this  is still maintained, could you
provide some more details?
Hello Thomas,
Please discard this package.
I thought it was a requirement for ntpsec that i was about to submit at the
time.
But it turns out ntpsec does not require it, or at least, not in modern
versions

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le sam. 8 janv. 2022 =C3=A0 20:42, Thomas Petazzoni <thomas.petazzoni@bootl=
in.com>
a =C3=A9crit :

> Hello Guillaume,
>
> On Sat, 13 Feb 2021 11:20:55 +0100
> guillaume.bressaix@gmail.com wrote:
>
> > From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> >
> > Python-pyext is a set of scripts to enhance python.
> > This includes features such as function overloading,
> > the "switch" statement..
> >
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> > ---
>
> We looked at this package, and upstream has not made any release since
> 2014, and there is apparently no publicly available version control
> system. With python moving so fast, a package that hasn't been touched
> since 2014 doesn't seem like a good idea.
>
> So I'll mark this patch as Rejected. If you have a reason to think this
> is still maintained, could you provide some more details?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000731dca05d51899e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0If you have a reason to think this=C2=A0 is stil=
l maintained, could you provide some more details?<br>Hello Thomas,<br>Plea=
se discard this package. <br>I thought it was a requirement for ntpsec that=
=C2=A0i was=C2=A0about to submit at the time.<br>But it turns out ntpsec do=
es not require it, or at least, not in modern versions<br><br clear=3D"all"=
><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div><div><div><font face=3D"arial,helvetica,sans-serif">Guillaume W. Bre=
s<br></font></div><font face=3D"arial,helvetica,sans-serif">Software engine=
er</font><br></div><font face=3D"arial,helvetica,sans-serif"></font></div><=
font face=3D"arial,helvetica,sans-serif">&lt;<a href=3D"mailto:guillaume.br=
essaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br=
></font></div></div></div></div></div></div><br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 8 janv. 2022 =
=C3=A0=C2=A020:42, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@=
bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Guillaume,<br>
<br>
On Sat, 13 Feb 2021 11:20:55 +0100<br>
<a href=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_blank">guillaume=
.bressaix@gmail.com</a> wrote:<br>
<br>
&gt; From: &quot;Guillaume W. Bres&quot; &lt;<a href=3D"mailto:guillaume.br=
essaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br=
>
&gt; <br>
&gt; Python-pyext is a set of scripts to enhance python.<br>
&gt; This includes features such as function overloading,<br>
&gt; the &quot;switch&quot; statement..<br>
&gt; <br>
&gt; Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillaume.bress=
aix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
We looked at this package, and upstream has not made any release since<br>
2014, and there is apparently no publicly available version control<br>
system. With python moving so fast, a package that hasn&#39;t been touched<=
br>
since 2014 doesn&#39;t seem like a good idea.<br>
<br>
So I&#39;ll mark this patch as Rejected. If you have a reason to think this=
<br>
is still maintained, could you provide some more details?<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000731dca05d51899e9--

--===============0101356898764316376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0101356898764316376==--
