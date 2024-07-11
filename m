Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C34C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 18:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEF5F410FB;
	Thu, 11 Jul 2024 18:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fC_wiFzNqakY; Thu, 11 Jul 2024 18:08:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AE4E405FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AE4E405FA;
	Thu, 11 Jul 2024 18:08:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AEB11BF5A2
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 846FF405FA
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-NtsoBoNHw8 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 18:08:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8CFF40462
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8CFF40462
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8CFF40462
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 18:08:24 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42565670e20so13851345e9.0
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 11:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720721303; x=1721326103;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m1BXLNv+oRyDGGp+Q1BJuGZAorz+lmEDOgZ1CDri1cw=;
 b=nMeOsYJsh3vuZvlEYQ6Bp+p4mwJvraDB3uxnuGp47cPw8zT3cmsT1Aq7kt9OthIzox
 79uhdq414Brj7c5x37vsAiCfSsnK0uhAFcK/tFLQx7TPcNEc9UaAntQQWM07amX3YgPZ
 xSCOM9Tz6KRnt6ppuZo2Hdy0jpEWM//7C0wcTAy6o+wiAKiHG8+D5YiI6mAm6YzBzudF
 l7vDC0Kqd26c/1+ToWowMlhgUI1rHIqzIsp+Yc/3g6SfDZ9bRLrAsLqn4Gmr+GEL/h72
 yRPjVHdOCn8m4ADhUJxdBCfVDpl4AOnrKkxXxLalEsB5DSIo07eBbsSTWxqLLe8pTf/m
 je4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAQt+uecUlGwlxT3znzG+2UdU/rbv9JGU+HvV1AgZm4KtfVBMv2zR+ufncdm3HrApjN7+ku1VzIfdy5ucRSiCt1mbNuD9eyg==
X-Gm-Message-State: AOJu0YwZu+MxVXPLOIqvjsI4QTbzFHRpOd4WhqeR1XwqHKaXyIcVO/+b
 fu1lBS0irQ3v90BFLnSH+t2WaitgykIdZ1wMrzSk42U6WSdyOcq2fVWKa13opPjDKGLbxgdbOdR
 98T6V7iOm8QI2omZqh4nFjaXdAshgX2Lj
X-Google-Smtp-Source: AGHT+IF3EzPRNhdvVv+oBH5Tkv+tVwyJQ4vTfp0x/lhwp/nbHxOsqpr8n3KI9pcVwVxEYdhwus8GBwNkrk72MBNLt6g=
X-Received: by 2002:a5d:47c4:0:b0:366:e9f7:4e73 with SMTP id
 ffacd0b85a97d-367ff6e758emr344507f8f.5.1720721302315; Thu, 11 Jul 2024
 11:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240617151020.31120-1-flaniel@linux.microsoft.com>
 <20240617151020.31120-4-flaniel@linux.microsoft.com>
 <20240711200029.0763fc1d@windsurf>
In-Reply-To: <20240711200029.0763fc1d@windsurf>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 11 Jul 2024 20:08:08 +0200
Message-ID: <CA+TH9VkQ_mMTyGmjM0T0HeMz0+BvWp6bBjthP4GXbY5VNKdVzw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720721303; x=1721326103; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m1BXLNv+oRyDGGp+Q1BJuGZAorz+lmEDOgZ1CDri1cw=;
 b=h2SXPz7/o70xUJbwIfeQqpb6RbNiqWO9TJixcyx2xyHx3PotBvlNXi8UfzOInRFl2P
 R5E7oaWtmk2IuwQHMycHD9lLufBXRIlDSN1yqRKdedrWxITvQ1/vQQt82GZIjnU4d4JX
 hluLNcknlUjYa2Td6Qt7y1vsS5rwg8/VaeWL47QI+9IiWeE/8bbhYulUajwlnGpkMlyK
 R7WoCfXEE1si4IDgshCI2lBdUe3DX4FwlFY0fLAZK8aD0nCOnv7hYzPjNGwq4TpbejUc
 4Wu5ZGhrtoYL9mZ9HJMg6SZZXnzZZO22/By0UyyZcxTOHulrvFvUu+RHX6aryR8XWYoS
 LYZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=h2SXPz7/
Subject: Re: [Buildroot] [RFC PATCH v1 3/4] package/sysdig: remove package.
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 buildroot <buildroot@buildroot.org>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: multipart/mixed; boundary="===============5789373905079352412=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5789373905079352412==
Content-Type: multipart/alternative; boundary="000000000000fb6db1061cfca508"

--000000000000fb6db1061cfca508
Content-Type: text/plain; charset="UTF-8"

Il gio 11 lug 2024, 20:00 Thomas Petazzoni via buildroot <
buildroot@buildroot.org> ha scritto:

> Hello Francis,
>
> I'm adding in Cc: Angelo who is also listed as a maintainer for this
> package in our DEVELOPERS file. Angelo, any feedback?
>
> See below.
>
> On Mon, 17 Jun 2024 16:10:19 +0100
> Francis Laniel <flaniel@linux.microsoft.com> wrote:
>
> > Building sysdig within buildroot is a complicated task which
> > has changed at each of their release.
>
> But the package is working right now, isn't it?


To my knowledge it is, I have used it in the past, even if it's not updated.

Did you try to update
> it to a newer version and encountered some specific issues? If so,
> which issues?
>

Francis sent several iteration of the bumping patches but from my
knowledge, they were never good enough to be included.

I promised myself to look again at it, but really never found the time.


> Maybe those issues should be communicated back to upstream, so that
> they can improve how sysdig is provided/delivered? If something like
> Buildroot can't package sysdig, maybe they will be interested in
> hearing why?
>

I fixed several things in the past in the build system, I think they are
still open to proper fixes.


> > As the package seems to not be really used in buildroot, it
> > seems wise to remove it.
>
> How can you say it is "not really used"? We have no usage metrics for
> packages, so really we have no idea of who uses sysdig.
>

Indeed. It is a wonderful tool in my opinion to not to have in buildroot.


> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000fb6db1061cfca508
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 11 lug 2024, 20:00 Thomas Petazzoni via buildro=
ot &lt;<a href=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org</=
a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Francis,<b=
r>
<br>
I&#39;m adding in Cc: Angelo who is also listed as a maintainer for this<br=
>
package in our DEVELOPERS file. Angelo, any feedback?<br>
<br>
See below.<br>
<br>
On Mon, 17 Jun 2024 16:10:19 +0100<br>
Francis Laniel &lt;<a href=3D"mailto:flaniel@linux.microsoft.com" target=3D=
"_blank" rel=3D"noreferrer">flaniel@linux.microsoft.com</a>&gt; wrote:<br>
<br>
&gt; Building sysdig within buildroot is a complicated task which<br>
&gt; has changed at each of their release.<br>
<br>
But the package is working right now, isn&#39;t it? </blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">To my knowledge it is, I ha=
ve used it in the past, even if it&#39;s not updated.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Did you try to update<br>
it to a newer version and encountered some specific issues? If so,<br>
which issues?<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Francis sent several iteration of the bumping patches but from=
 my knowledge, they were never good enough to be included.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I promised myself to look again at it, b=
ut really never found the time.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Maybe those issues should be communicated back to upstream, so that<br>
they can improve how sysdig is provided/delivered? If something like<br>
Buildroot can&#39;t package sysdig, maybe they will be interested in<br>
hearing why?<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I fixed several things in the past in the build system, I think=
 they are still open to proper fixes.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; As the package seems to not be really used in buildroot, it<br>
&gt; seems wise to remove it.<br>
<br>
How can you say it is &quot;not really used&quot;? We have no usage metrics=
 for<br>
packages, so really we have no idea of who uses sysdig.<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">Indeed. It is a wond=
erful tool in my opinion to not to have in buildroot.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"norefer=
rer">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman=
/listinfo/buildroot</a><br>
</blockquote></div></div></div>

--000000000000fb6db1061cfca508--

--===============5789373905079352412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5789373905079352412==--
