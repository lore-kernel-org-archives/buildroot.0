Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CDFD0D78F
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 13:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 408BD6068A;
	Fri, 11 Oct 2024 13:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjC4xsiDfIFN; Fri, 11 Oct 2024 13:13:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA4A606C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA4A606C0;
	Fri, 11 Oct 2024 13:13:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A8171BF859
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A119840ED
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kz1BvACDQwJC for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 13:13:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com;
 envelope-from=dtraft@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 579C5840E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 579C5840E8
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 579C5840E8
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 13:13:08 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6e2e4237da4so18850577b3.1
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 06:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728652388; x=1729257188;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iBO+AM1vthuekIHIQCJBMj63AzS2ayfOua3c1IFDxAY=;
 b=UaODzTwBF+nCZ6SGD47UlJVubUohNQein6BpUjCdBXC698aLzPGb2NG+QxKhdGMxTN
 UUYdPgixuE06SBmryPHtK7EHTpLUzC1vkkp95h3HoW5LVCFJhMOXIW6yasGOQ3r3slnu
 vQeiy6UO5hM1EWkbjxinzRAGnt8jPGmDv5zWJYg9c+pG7EkTwYyD8vZEjPpQMtkDdsE3
 5eKP6qR1kvfW5UByhX3VQBIlLmRDhCXD09dlmkWvF4e+tRav88lPW7QYauSX/07woqxM
 JRh85HYAFYng5ITDecHaTnB04JZqOIckHLiQSMX4AZyX0hRvfjSOU3YkBTPqff6R6hMb
 c9TA==
X-Gm-Message-State: AOJu0YyAopqHHVsTIADobZkGPHGK6DGn3c0VDUsB7znWv1qygh2C1tT0
 udw7N93x/GZ77VRVpApQzL3QsGCCqlS+Gp+S1x/OcCopFreP75gwUNy+4YhBEOr6+Wro0/v/Dad
 OAcgLeti0QEzOlBKsDOVUtcUa45U=
X-Google-Smtp-Source: AGHT+IExjij11rymfeP+IV9HyDLSXfVHT3Cldv0TXtXQWU+f1xay8RUDfCs/z/3RcDXIPfHKWPSrFjPf5tphj33YKZk=
X-Received: by 2002:a05:690c:4489:b0:6af:6762:eba1 with SMTP id
 00721157ae682-6e3479c1971mr22090557b3.20.1728652387776; Fri, 11 Oct 2024
 06:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADdAThchVWBsrNOa08HS6DR3oAUQO_KprRCkVxttrg0rSSCnbA@mail.gmail.com>
 <20241011083033.43de7ed8@windsurf>
In-Reply-To: <20241011083033.43de7ed8@windsurf>
From: Drew Traft <dtraft@gmail.com>
Date: Fri, 11 Oct 2024 09:12:57 -0400
Message-ID: <CADdAThdJRHStRfrQ=e+vvhH6SBPmDokCi2mZdbvoJ77miSn1pA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728652388; x=1729257188; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iBO+AM1vthuekIHIQCJBMj63AzS2ayfOua3c1IFDxAY=;
 b=BriAVvftxiURg006r4IHG5g8iVwuUn8zNtF06ayzEyd73Gp0bzFmUdEu4Dz05Dtn3J
 LQ6dwKsa0nsgX1wz37gSUBrdCNNqE4psbPAfEyUPDN1T3w/rJYKPqtkf/W5qrtECnSFd
 69yYJvrtE/b54C9PNH5NMtUqXoqZJAFwhpIaYMG1WjqkI3DoccpuFQrhEolGnTIJO9ug
 IgvyaZGrWvYdhXOOEuOVU+X6tTYikUuNk0jXxPSZZNE+2a0+lqaJyWP8znMRg3FRiY4A
 prZboM24292qhHjMNfdXFfJ3+I8UxQPFiqtgfrJrhB1IY7vuPVeYQUS+FHfqpUmZ92Ry
 AKXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BriAVvft
Subject: Re: [Buildroot] [PATCH 1/1] package/fbv: update site to
 sources.buildroot.net
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
Content-Type: multipart/mixed; boundary="===============4211593209498790789=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4211593209498790789==
Content-Type: multipart/alternative; boundary="0000000000008381a40624333f15"

--0000000000008381a40624333f15
Content-Type: text/plain; charset="UTF-8"

Ah - apologies, missed that!

Thanks for the heads up, sorry to clutter your inbox!

Best,
Drew

On Fri, Oct 11, 2024 at 02:30 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Thu, 10 Oct 2024 22:17:51 -0400
> Drew Traft <dtraft@gmail.com> wrote:
>
> > This change was necessary as the previous url is no longer active.
> >
> > Signed-off-by: Drew Trafton <dtraft@gmail.com>
> > ---
> >  package/fbv/fbv.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Thanks a lot for your patch! However, this issue has already been
> solved in a different way, in commit:
>
>
> https://gitlab.com/buildroot.org/buildroot/-/commit/c7109e265cb6c179dd51a02637bb5f97f4767d21
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000008381a40624333f15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ah - apologies, missed that!</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Thanks for the heads up, sorry to clutter=C2=A0your =
inbox!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best,</div><div d=
ir=3D"auto">Drew</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Oct 11, 2024 at 02:30 Thomas Petazzoni &lt;<a =
href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 10 Oct 2024 2=
2:17:51 -0400<br>
Drew Traft &lt;<a href=3D"mailto:dtraft@gmail.com" target=3D"_blank">dtraft=
@gmail.com</a>&gt; wrote:<br>
<br>
&gt; This change was necessary as the previous url is no longer active.<br>
&gt; <br>
&gt; Signed-off-by: Drew Trafton &lt;<a href=3D"mailto:dtraft@gmail.com" ta=
rget=3D"_blank">dtraft@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/fbv/<a href=3D"http://fbv.mk" rel=3D"noreferrer" target=
=3D"_blank">fbv.mk</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
Thanks a lot for your patch! However, this issue has already been<br>
solved in a different way, in commit:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/c7109=
e265cb6c179dd51a02637bb5f97f4767d21" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.com/buildroot.org/buildroot/-/commit/c7109e265cb6c179dd51a026=
37bb5f97f4767d21</a><br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000008381a40624333f15--

--===============4211593209498790789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4211593209498790789==--
