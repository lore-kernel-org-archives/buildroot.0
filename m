Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A306CCF34C1
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 20:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C116607E1;
	Thu,  3 Oct 2024 20:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFEXArkWTlS9; Thu,  3 Oct 2024 20:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EEA9607E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EEA9607E2;
	Thu,  3 Oct 2024 20:31:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFA091BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC741815AD
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dkqK5f0aGmZ for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 20:31:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3B4881252
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B4881252
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3B4881252
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 20:31:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37ccfada422so895511f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Oct 2024 13:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727987474; x=1728592274;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=53zVGaRH62u8vNU8O5d0bpybPM0hU/pUcDxWWJZirJQ=;
 b=dxzWzkYbKE6ZAyLNjPnewRvQAbqKqIutRw2UHcj7yv2izQlHjZ995n0egjqLDbsXqp
 d4oeQ8r4eLeAS19irSKB3a5RpPBvGfxXMgV8ZY75+3mB7L2N50Iuajaqhz56V3+VZ8PD
 /1iFAJV4TKzcC17uNzhRugKcnrjdm4BHoPVy1aj/GZaq1HvZk2jsIuGBgPz9+dFL9wxV
 JWWFBT4WRR9TgoHwO0uYYyT78/NbKlj8CH02raTWKtnEZQI4b17BlG8XYFL1WJk+2GTj
 QPtjSjP6rgucC/WJOgKyStRf3v9+4mP/if3+DY3Utlep+5oDDucb/a8RH/GcJxUQwyyj
 jj+A==
X-Gm-Message-State: AOJu0Yyp8vpQsZ8+PEWm5QjmVJJVSjiMn9r65sUB5npg8wJkJx8IMsvP
 8lmnAyyrLWrj4hU2A5+DvY2cF8Yr52BS8LGzieK+KUbzEZ5aLOyaLxGtH3Z3GKQGrZRU9inXFi4
 40ueURrGdO4S3YIosWl3mmRMifVN7hCovJkI=
X-Google-Smtp-Source: AGHT+IH6ULveuM+EBWBmeloljSlvibvFcNTe34OHbh3gHLR+ST7qAvI/sfAkTcU5GT7j2JRpVQ9ahaI9rBZiItZ9yZw=
X-Received: by 2002:a5d:44ce:0:b0:37c:ce58:5a1b with SMTP id
 ffacd0b85a97d-37d0e8f6719mr354063f8f.51.1727987474177; Thu, 03 Oct 2024
 13:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241003165926.849456-1-james.hilliard1@gmail.com>
 <20241003220608.4d106029@windsurf>
In-Reply-To: <20241003220608.4d106029@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 3 Oct 2024 14:31:01 -0600
Message-ID: <CADvTj4pK9EMpvmK8nmgw8U1S22h9y2TKc=Ta=XK4+uCKCzzSqA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727987474; x=1728592274; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=53zVGaRH62u8vNU8O5d0bpybPM0hU/pUcDxWWJZirJQ=;
 b=aDRr/Lj9HhXxtGZx2KTXVOq0uhm+uwHcDX71AvCLk4giAZyesvHdjO+gRQ+8ZuY8lB
 Q9TY37/jy/gvq/EpbZH0SsVi/Xd2Z1hzLXlAV+d/wzmH8KTjhN4HgOH8hs34l7bGEeC2
 S9I0TQNYFWn0cqxB5URDOQErL/JDITbfnbhTUO+u+ZlmX5aMTuLhCvhGTvbnOlYc57wn
 VDirgJF+haKz8Dng9PtC8sfQsRG6k3/YWuer/35SdVocu3Tfw665czoNvYEhQa/WazQs
 salj92IiLwWaQBtJMpX+9fxL1cokly8KExUQGzJRrQeUVx2HbUiOF8KQXY8L93oWtW+L
 l1tA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aDRr/Lj9
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: enable asha when
 building audio plugins
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
Cc: Marcin Bis <marcin@bis.org.pl>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3064415478276824881=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3064415478276824881==
Content-Type: multipart/alternative; boundary="000000000000932b220623986f81"

--000000000000932b220623986f81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 2:06=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello James,
>
> On Thu,  3 Oct 2024 10:59:26 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Symbols from the asha plugin are required when building a2dp
> > support as part of the audio plugins, so always enable asha
> > when audio plugins are selected.
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.net/results/5a3/5a306356f5f190a14a0a2294a44285=
44b1a018bb
> >  -
> http://autobuild.buildroot.net/results/353/3539c83deaa45a3548bcd488659148=
c62af3fc73
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Could you please indicate since when this problem is occurring. It
> seems to be appearing since the recent bump, but is it really the case?
>

Looks like it was introduced in ce4e5fd129b557ac0411d0a0704be43717310d6d


>
> A bug fix submitted to Buildroot should *always* carry an explanation
> of since when the problem started occurring.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000932b220623986f81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Oct 3, 2024 at 2:06=E2=80=AFPM Th=
omas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.p=
etazzoni@bootlin.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hello James,<br>
<br>
On Thu,=C2=A0 3 Oct 2024 10:59:26 -0600<br>
James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_=
blank">james.hilliard1@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Symbols from the asha plugin are required when building a2dp<br>
&gt; support as part of the audio plugins, so always enable asha<br>
&gt; when audio plugins are selected.<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.net/results/5a3/5a306356=
f5f190a14a0a2294a4428544b1a018bb" rel=3D"noreferrer" target=3D"_blank">http=
://autobuild.buildroot.net/results/5a3/5a306356f5f190a14a0a2294a4428544b1a0=
18bb</a><br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.net/results/353/3539c83d=
eaa45a3548bcd488659148c62af3fc73" rel=3D"noreferrer" target=3D"_blank">http=
://autobuild.buildroot.net/results/353/3539c83deaa45a3548bcd488659148c62af3=
fc73</a><br>
&gt; <br>
&gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gm=
ail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
<br>
Could you please indicate since when this problem is occurring. It<br>
seems to be appearing since the recent bump, but is it really the case?<br>=
</blockquote><div><br></div><div>Looks like it was introduced in ce4e5fd129=
b557ac0411d0a0704be43717310d6d</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
A bug fix submitted to Buildroot should *always* carry an explanation<br>
of since when the problem started occurring.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000932b220623986f81--

--===============3064415478276824881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3064415478276824881==--
