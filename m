Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E536C7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 10:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2D9260BBF;
	Sat, 25 Feb 2023 10:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2D9260BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3JvuawU4y1N; Sat, 25 Feb 2023 10:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCC5660B3F;
	Sat, 25 Feb 2023 10:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCC5660B3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EB141BF82C
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 10:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC90881B48
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 10:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC90881B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbUdBX0cFyfY for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 10:39:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB58981B36
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB58981B36
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 10:39:34 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id cp12so153420pfb.5
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 02:39:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o8KXDRclxRfypY8zjLx+q2YbGO1Y1ZcRXhqshEKxvVw=;
 b=jdT4f8cDbNpmhcMzqQ3+usmkxFW8IQcpTCjp37NQKr/ZZUHLxLoEIp/BLia2a/bwvW
 7+vYyTu39omTv21XmTfNO2X9JVoR8xla7w08Joc5QvrNTY7jOuG+IxpBVWRwZe62NB4Q
 crKvUblJ7F/7WtlrqISUxZRrTi3nJb2p+HW2wy5+1DCHGpNvbdWmyDjmKUNAP01vvgpD
 58T7gBNjK8ja+8PXmPO+8AZBDTv86pd3XA3dyLNnO8cVAeMT6YPt9Fg4SnmgZYF30KAR
 G590BBF04FK95M7PzKuJRoMUZH9R+uhlGh7VrDnemIf63bduNMh8+elnm9MnqAc12xNs
 OpPg==
X-Gm-Message-State: AO0yUKXyM5VD9xNqMlI5wRWxebphQNCyuvLr4jXR+lJnO55ZMAb+CY/t
 9mACmCHhuFzNkC+84aSdvCetnqVAEcaz5K/7rzAiQ8JB
X-Google-Smtp-Source: AK7set93SjKHl8pYHD91QHgPN6Veb/KdHGdlyoiZyv5X4R5h4xC26tC13eTTaaY8Px0Un+LjFISJzF5h1mZlk5ptd0M=
X-Received: by 2002:a62:52c2:0:b0:5a8:e197:736f with SMTP id
 g185-20020a6252c2000000b005a8e197736fmr4087325pfb.0.1677321574219; Sat, 25
 Feb 2023 02:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20230224101720.1458102-1-fontaine.fabrice@gmail.com>
 <20230225104423.3a9cc6ab@windsurf>
In-Reply-To: <20230225104423.3a9cc6ab@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Feb 2023 11:39:23 +0100
Message-ID: <CAPi7W82W86VqG-d+Xe7GSmx67R3R3-PhRhCwHo_vmAgGSEraDQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o8KXDRclxRfypY8zjLx+q2YbGO1Y1ZcRXhqshEKxvVw=;
 b=VxkQ1SubUDvhguYUu3KU5YxnEkSHOHPl6zAaZUyT2aom9lCnDEnjaxTIuAGZMUCwzi
 HLFSh0tKpMIG7XCfjBB6z+D2HyDTAvtY5cJllV32nfZ6Mq+sQKus5cuWqEQHYpppZ98u
 jEGzjYuKmJS1wAvPtsFg2xBj1G3zljvHEdchKaXOBHl3FkUnEOAhU6PoEI7WmkykYNVd
 2VUWRM3l46eRXO/5TuXTl+dSMQN4xTSgv2dUeWuv4EQq9AKXLOxi35AFTG17yYYkyOrk
 njdIa/F4iVK/PHVUqMV0ZrpEOYswYP9uBx1qdAV4W+XWn8qceW3G4YfliwGA6mFKNWB0
 j1Uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VxkQ1Sub
Subject: Re: [Buildroot] [PATCH 1/1] package/xscreensaver: add linux-pam
 optional dependency
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0027114698819963761=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0027114698819963761==
Content-Type: multipart/alternative; boundary="0000000000009b043205f583dc84"

--0000000000009b043205f583dc84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 25 f=C3=A9vr. 2023 =C3=A0 10:44, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> On Fri, 24 Feb 2023 11:17:20 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> > +XSCREENSAVER_CONF_OPTS +=3D --with-pam=3Dyes
> > +XSCREENSAVER_DEPENDENCIES +=3D linux-pam
> > +else
> > +XSCREENSAVER_CONF_OPTS +=3D --with-pam=3Dno
> > +endif
>
> Any reason not to use --with-pam/--without-pam like we do in Buildroot,
> rather than --with-pam=3Dyes/--with-pam=3Dno?
>

The only reason is for consistency with the other options in xscreensaver.m=
k
.


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

Best Regards,

Fabrice

--0000000000009b043205f583dc84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 25 f=C3=A9vr. 2023 =C3=
=A0=C2=A010:44, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boo=
tlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 24 Feb 2023 11:1=
7:20 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)<br>
&gt; +XSCREENSAVER_CONF_OPTS +=3D --with-pam=3Dyes<br>
&gt; +XSCREENSAVER_DEPENDENCIES +=3D linux-pam<br>
&gt; +else<br>
&gt; +XSCREENSAVER_CONF_OPTS +=3D --with-pam=3Dno<br>
&gt; +endif<br>
<br>
Any reason not to use --with-pam/--without-pam like we do in Buildroot,<br>
rather than --with-pam=3Dyes/--with-pam=3Dno?<br></blockquote><div><br></di=
v><div>The only reason is for consistency with the other options in <a href=
=3D"http://xscreensaver.mk">xscreensaver.mk</a>.<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice <br></div></div></div>

--0000000000009b043205f583dc84--

--===============0027114698819963761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0027114698819963761==--
