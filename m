Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF92C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 12:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FF7E60E36;
	Mon,  8 Aug 2022 12:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FF7E60E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dP_u_VZxzki; Mon,  8 Aug 2022 12:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A5F60E33;
	Mon,  8 Aug 2022 12:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90A5F60E33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F98F1BF34F
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 12:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 226F64173F
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 12:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 226F64173F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjaOMhWA3uDN for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 12:03:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7A9241730
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7A9241730
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 12:03:01 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id o3so8340851ple.5
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 05:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=lQ6TOVi2eJq5fgxRlCyO2OKg+uRsooMz3M37e4ITzJ4=;
 b=UdjzrCSmze8W9SYz4a0loZKMghjgbOkG1HgzNaXvEP3LVRv1WfQmeAGq9Cks6j+jqO
 3aW0KogVbVRq0HxtgQ2lbBVtjXAX/ovrNOOlJ2hwWSJ0MhwgARKWGl0DdpLqqKRFSp4t
 dzHE56jPhXWICHeKwyHVNkb5K99PfmI9HzBdeo3W+ZIV/gMB5+u9gfIcY2rSIyFWcCaU
 unJbb7f1LY4wzNaP6tsNYriGRhv3jAsFDU7fPvky61ok4T/gAnDuAqqw3bvrOegRG10I
 Pp+F2HgWiGFH3AKib1W5QzJfSmrl+7oBh6GGZjDzbvnX/HYCI3dcZiZL6zCFS503giIj
 yrzA==
X-Gm-Message-State: ACgBeo2xV6BXa1bh+46wfewi8jOMZyMtJMvv34IBwfdst+ca4KeIbw+S
 EnSNR60kCi6wCqU9+5j7xy9ampmGQexGgnlwdSxG9kc/QyU=
X-Google-Smtp-Source: AA6agR5Q1YtFsrxg5+3EzcDwomvrOXy7tnv/l6ntgm4FmHl6znH6mEzUvHCGvgs7vRDdG7j78qp1ehabAgnXgfMuBQg=
X-Received: by 2002:a17:90b:4f91:b0:1cd:3a73:3a5d with SMTP id
 qe17-20020a17090b4f9100b001cd3a733a5dmr20225862pjb.98.1659960180850; Mon, 08
 Aug 2022 05:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <CACoTCHeTKbTU4QSBs4qtyUXKDNOH+5u4Y-rGhy4QeuvK=kAENw@mail.gmail.com>
 <20220804125333.11005bc9@windsurf>
In-Reply-To: <20220804125333.11005bc9@windsurf>
From: Jameson Collins <jameson.collins@gmail.com>
Date: Mon, 8 Aug 2022 08:02:54 -0400
Message-ID: <CACoTCHfRtifzeW-W3uJSyFebng13KFaqzOdtitxydh9qKxB=aw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=lQ6TOVi2eJq5fgxRlCyO2OKg+uRsooMz3M37e4ITzJ4=;
 b=cGp8NeY9+WgVBs5N50oGKgr7ASVVVP+hjxWyXjqLpaAvmqvrDerA82o4VBX8C67PmF
 3jr88DhRy6embLZHjsVrUgR/Mdm55PseIbq7HudfptTnVils2Um4hog3yqGM7wr2s6hJ
 KgXOiiNmVaAIsg5lbiNWxjHIRcNHeU+ch4NdfPYRdHYY6meQjqG+rPxE1NTHyR9KnVWB
 NnF2Dyplgv5xXcnvPlHcKaceQjNzfEwksnOSwJtiFA5EyjXC3JqGHptjzLeMjk+1jNCZ
 zub/SipN1jkOTVNymO2zpyIp/qzQmtFPY28eXCdeI+wro8aWoD4qHMjzdIaQN/5gqEyp
 X1yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cGp8NeY9
Subject: Re: [Buildroot] Defining a package with no dependencies
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
Content-Type: multipart/mixed; boundary="===============2205141828725981614=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2205141828725981614==
Content-Type: multipart/alternative; boundary="000000000000ebc5ce05e5b998f6"

--000000000000ebc5ce05e5b998f6
Content-Type: text/plain; charset="UTF-8"

Thanks Thomas and Arnout,

Both of these solutions worked perfectly (switching to a
host-generic-package, and <pkg>_ADD_TOOLCHAIN_DEPENDENCY = NO).

I had forgotten that I switched from a regular make target to a
generic-package because I wanted buildroot to manage build stamps.





On Thu, Aug 4, 2022 at 6:53 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Wed, 3 Aug 2022 19:30:07 -0400
> Jameson Collins <jameson.collins@gmail.com> wrote:
>
> > If I have a package that doesn't build anything, doesn't depend on
> > anything, and doesn't have anything depending on it, is it possible to
> tell
> > buildroot to build this package without first building the toolchain?
>
> You could do:
>
> <pkg>_ADD_TOOLCHAIN_DEPENDENCY = NO
>
> but that's normally reserved for packages that are part of the
> toolchain build.
>
> > An example of a package like this might be the `flash-my-board` recipe
> that
> > is shown in the manual.  Yes, in this case the package doesn't make any
> > sense unless boot.bin existed, but you can see how it might be useful to
> > have a package that performs a task and not necessarily generate a build
> > product.
>
> flash-my-board inside the manual is *not* a package. It's just an
> example in the external.mk, to show that external.mk can be used to
> provide additional custom make targets. It has nothing to do with a
> package.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000ebc5ce05e5b998f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Thomas and Arnout,<div><br></div><div>Both of these=
 solutions worked perfectly (switching to a host-generic-package, and &lt;p=
kg&gt;_ADD_TOOLCHAIN_DEPENDENCY =3D=C2=A0<span class=3D"gmail-il">NO)</span=
>.=C2=A0=C2=A0</div><div><br></div><div>I had forgotten that I switched fro=
m a regular make target to a generic-package because=C2=A0I wanted buildroo=
t to manage build stamps.</div><div><br></div><div><br></div><div><br></div=
><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 4, 2022 at 6:53 AM Thomas Petazzoni &lt;<a href=
=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,=
<br>
<br>
On Wed, 3 Aug 2022 19:30:07 -0400<br>
Jameson Collins &lt;<a href=3D"mailto:jameson.collins@gmail.com" target=3D"=
_blank">jameson.collins@gmail.com</a>&gt; wrote:<br>
<br>
&gt; If I have a package that doesn&#39;t build anything, doesn&#39;t depen=
d on<br>
&gt; anything, and doesn&#39;t have anything depending on it, is it possibl=
e to tell<br>
&gt; buildroot to build this package without first building the toolchain?<=
br>
<br>
You could do:<br>
<br>
&lt;pkg&gt;_ADD_TOOLCHAIN_DEPENDENCY =3D NO<br>
<br>
but that&#39;s normally reserved for packages that are part of the<br>
toolchain build.<br>
<br>
&gt; An example of a package like this might be the `flash-my-board` recipe=
 that<br>
&gt; is shown in the manual.=C2=A0 Yes, in this case the package doesn&#39;=
t make any<br>
&gt; sense unless boot.bin existed, but you can see how it might be useful =
to<br>
&gt; have a package that performs a task and not necessarily generate a bui=
ld<br>
&gt; product.<br>
<br>
flash-my-board inside the manual is *not* a package. It&#39;s just an<br>
example in the <a href=3D"http://external.mk" rel=3D"noreferrer" target=3D"=
_blank">external.mk</a>, to show that <a href=3D"http://external.mk" rel=3D=
"noreferrer" target=3D"_blank">external.mk</a> can be used to<br>
provide additional custom make targets. It has nothing to do with a<br>
package.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000ebc5ce05e5b998f6--

--===============2205141828725981614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2205141828725981614==--
