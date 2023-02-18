Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84FDC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 13:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 553E3820DA;
	Sat, 18 Feb 2023 13:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 553E3820DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GobWOsVsF5Bm; Sat, 18 Feb 2023 13:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D208F820C6;
	Sat, 18 Feb 2023 13:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D208F820C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8D381BF59F
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 13:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B211F60E74
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 13:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B211F60E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4565Cw2eKc8r for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 13:39:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B165A605EE
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B165A605EE
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:39:50 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id 16so862015oiy.0
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 05:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Q5LhXBQhEQhbmoq+U9sCvviIbkCLXHBETB6ZZQo/TU=;
 b=xgvaGftScGCrSVrKsiRMSqw5aoL/YG9dapxKNTxwtLyV91CbDvR0+BAEHijPPwIMeu
 uEuSsVGZ1CRFNMfAddI4cf3AD1EbMOB8jbjilN70NTL6URCORm6b6y+rrVhi5oZG7ZzP
 cJUnRJUk+mMALJSGFjg/JXh5mF+9ZJvwzvgEWwAexIUtBQMMyISGh55idcELDgvxtoA1
 3q0nFMVlyz7ZWrVXpeMqURt9kzIlAkP9/4DEHxsmEHVZVl6CnLFHZLQJXkTUXqMJ4mT9
 ucIwfbyGSj/aKdnLS5ckqLfPPbJ5ZVOU+8NEnbhsjzWFGix4Oq8v739aaIQs9v56s2Au
 lN9Q==
X-Gm-Message-State: AO0yUKW439vrLvmX8CrNX2OReN992E+QrvvanLxmgjt+aCz8nrX+pGcH
 kKiE2rQ2IaufHdhTxjw6UgyVmB0dkcfJKC6muxitbJI6
X-Google-Smtp-Source: AK7set996TOqrES6auEJMD/4CQPP+kKtrpMMdgAiOIiiFiSR8SSLBe+2xJEIVrxpYnUFBLglwmTWv5Dvq7+7ERpNYWw=
X-Received: by 2002:a05:6808:2385:b0:367:18a6:eb14 with SMTP id
 bp5-20020a056808238500b0036718a6eb14mr844988oib.208.1676727589690; Sat, 18
 Feb 2023 05:39:49 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
 <20230218121940.7442410e@windsurf>
 <CADYjeSuzT5ueq5F5SQvib87d1HCKXLj565mW-Rm91N7Na1KrDQ@mail.gmail.com>
 <20230218141937.60c307f7@windsurf>
In-Reply-To: <20230218141937.60c307f7@windsurf>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Sat, 18 Feb 2023 14:39:39 +0100
Message-ID: <CADYjeStz_KmmROtsqrVfJh8D7gAnRz-bYAoFe9eFjBc1_Efycw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9Q5LhXBQhEQhbmoq+U9sCvviIbkCLXHBETB6ZZQo/TU=;
 b=M7I65i2msS62QpIaE6dwC4KKzD8uoQOXdDWTudyMt1HYhKK5fRB6F783UDnysm/zUA
 ZTWbjoT6kYnHf7LmwQ+jlVQFuCcLa9TrHB8nyEOcKcxJiu5C4MZVpe6YbI7pItI7hSjr
 wcs9dB8yTwnw/oNDa2CKn0Nmryc8aLLRpv0GvGY91UJscyNAIIWQSyxDd865BqoASw8r
 BY6l2mf87H/IQHRlrds8k3o5+h7dns4NhclxLburakmBrU5HGeiPSa9Dp4DBLBmy3LLy
 2STprTWv7orXuYKWL/b/56QWbKazpxzVelKWsPKEJjyinRGFYePyExvk/QhaLaGFFtY8
 55VQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M7I65i2m
Subject: Re: [Buildroot] Updating trust store using update-ca-certificates
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
Content-Type: multipart/mixed; boundary="===============4299071913337248410=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4299071913337248410==
Content-Type: multipart/alternative; boundary="0000000000005e669605f4f99051"

--0000000000005e669605f4f99051
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

I want to add a local CA to the openssl trust-store in my image. This CA
will be used by other applications in the target. As I read in other  blogs
the local CA needs to be in /usr/local/share/ca-certificates with .crt
extension and executing update-ca-certificates will add it to
/etc/ssl/certs/. But, what I have noticed is this is always done with
"sudo".
So, do you think post-build script can handle this?
How about post-image script?

On Sat, Feb 18, 2023, 14:19 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Sat, 18 Feb 2023 13:54:15 +0100
> Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>
> > Thanks for the update.
> >
> > I was thinking the ca-certificates package will take care of this. Maybe
> I
> > was wrong.
> >
> > So, how should we add local CA to the trust store in the target?
>
> I am not sure as I'm not super familiar with that aspect. If what you
> need to do is to call update-ca-certificates during the build, then we
> could potentially build it for the host, and run it as a post-build
> script. Of course, this assumes update-ca-certificates is capable of
> doing its work on a root filesystem that isn't at the root.
>
> Do you have more details about what needs to be done? With more
> details, we could probably give some more useful hints.
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000005e669605f4f99051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas,<div dir=3D"auto"><br></div><div dir=3D"au=
to">I want to add a local CA to the openssl trust-store in my image. This C=
A will be used by other applications in the target. As I read in other=C2=
=A0 blogs the local CA needs to be in=C2=A0/usr/local/share/ca-certificates=
 with .crt extension and executing update-ca-certificates will add it to /e=
tc/ssl/certs/. But, what I have noticed is this is always done with &quot;s=
udo&quot;.=C2=A0</div><div dir=3D"auto">So, do you think post-build script =
can handle this?</div>How about post-image script?<br><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 18, 2023, 14:19=
 Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thoma=
s.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hello,<br>
<br>
On Sat, 18 Feb 2023 13:54:15 +0100<br>
Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">hrsourabh011@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Thanks for the update.<br>
&gt; <br>
&gt; I was thinking the ca-certificates package will take care of this. May=
be I<br>
&gt; was wrong.<br>
&gt; <br>
&gt; So, how should we add local CA to the trust store in the target?<br>
<br>
I am not sure as I&#39;m not super familiar with that aspect. If what you<b=
r>
need to do is to call update-ca-certificates during the build, then we<br>
could potentially build it for the host, and run it as a post-build<br>
script. Of course, this assumes update-ca-certificates is capable of<br>
doing its work on a root filesystem that isn&#39;t at the root.<br>
<br>
Do you have more details about what needs to be done? With more<br>
details, we could probably give some more useful hints.<br>
<br>
Best regards,<br>
<br>
Thomas Petazzoni<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--0000000000005e669605f4f99051--

--===============4299071913337248410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4299071913337248410==--
