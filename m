Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97168C77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 14:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F3E6415F4;
	Mon,  8 May 2023 14:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F3E6415F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4QpXiMi0OocX; Mon,  8 May 2023 14:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E36FE415AE;
	Mon,  8 May 2023 14:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E36FE415AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0353C1BF279
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 14:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF17940984
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 14:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF17940984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gmevrFcjlqF4 for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 14:38:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F133408DE
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F133408DE
 for <buildroot@buildroot.org>; Mon,  8 May 2023 14:38:27 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3908c252609so2513869b6e.1
 for <buildroot@buildroot.org>; Mon, 08 May 2023 07:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683556706; x=1686148706;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tyQRY9eY9d+dvSUjl0uMuBrWCiSCD2g19CoRj86mrNg=;
 b=D8TxAxM8pjxPA60ZlmcMVVKuVDo2IQ3aOAlA2WMyceP3fOWvy2v7BOUo98S9X8xJEj
 vA27Q5CteK7zQ+wpypwRrHkTKkVxSjxpnmDFueW77NrR+qI6yocWs51Z5/QQuDsg+d5v
 7c5ncc4rKeSy9UHcHGm/kOsIu/dsPEkElAjaVXKPLQOOWP/AyGfmMpg5Z8H7vm9qED/Z
 ohSjaQfq9wLT4sQv0thXZ+/CpphZ/J8XDE80OCeVmI/NSq7Gct4Fh3DO/UQBKUWNnDbY
 pSark4NYysRu6yBn7kL++UwqLKUxnSSKv0PY4I23c/xw+oKYvSVmk70Yo4KDLgVf7w4+
 i2bg==
X-Gm-Message-State: AC+VfDwBWumOq4AJQDmIjGeEwnAFvwfJWhrd6WYCUfmIB1SrkEeWCgh0
 mQL63hafIyPajNqmfGpX0st50EJvtMLG8L1oI4rM0TZm
X-Google-Smtp-Source: ACHHUZ576qIywVaoEE2eGUGjZAI/kJXY5NTqCoZScCj+t9rQUG2q+JnetT0W1upcwuzvTOYuH/rR5ZYFRKlpW0q5sVY=
X-Received: by 2002:a05:6808:a0a:b0:392:500:3f02 with SMTP id
 n10-20020a0568080a0a00b0039205003f02mr4804797oij.5.1683556706492; Mon, 08 May
 2023 07:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSv5qORodur3uKXp3zm_DRtVEeX=jTR_oBcTYMKks3k+iQ@mail.gmail.com>
 <f04ebbbb-b8a1-2a44-9ad8-d20fffdbae94@grenoble.cnrs.fr>
In-Reply-To: <f04ebbbb-b8a1-2a44-9ad8-d20fffdbae94@grenoble.cnrs.fr>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Mon, 8 May 2023 16:38:11 +0200
Message-ID: <CADYjeSsNfUSd-RSmMZU9AiUGSt1C5tCQBEE9NcWA3jgY=Dv2pg@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683556706; x=1686148706;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tyQRY9eY9d+dvSUjl0uMuBrWCiSCD2g19CoRj86mrNg=;
 b=PRovPh6V4EhO2fjdBkFRfr7UrK8R/lG/lDTDuri91Ig0GdHpIs0UfZtC7GVrvUhoJN
 IPNETHlbbAAPd9lMXQgchI71GuQLzcmcYRgHkEn9nDkod0ineE/DhajNRpHaQq+3JsZL
 fxMQnpdJ9y4bZRvy/TXEnKOlC6r3B51kK2oI9udg6qiU98tiZgZd31yeK6QFSt7MAmjy
 oz02N7S9XPEQAGa1NpAc3Rq+ZBhKeCFSUK2Uh/pGG+EZRhRJpFt8sIX3hspDBb1o1V5z
 zwTgZ7PnnfpZKbCdSBE6hHxg5XVYU8AVBres4etkILTlj5OVy4Kfk/B/EiVHiciJErV/
 /bOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PRovPh6V
Subject: Re: [Buildroot] Adding custom package to buildroot | tar.gz: not in
 gzip format
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
Content-Type: multipart/mixed; boundary="===============3985169487974520159=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3985169487974520159==
Content-Type: multipart/alternative; boundary="00000000000073244f05fb2f979e"

--00000000000073244f05fb2f979e
Content-Type: text/plain; charset="UTF-8"

Hello Edgar,

Thanks for the update.

Yes, it worked.

Regards,
Sourabh

On Mon, 8 May 2023 at 14:33, Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> Hello all!
>
> Sourabh wrote:
> > I am trying to add a custom package to buildroot packages. The package
> > is a simple compiled binary file that will be downloaded from Git. I
> > am not doing any build in the buildroot. Only installing the binary to
> > target.
> >
> > But, during package extracting process, I am getting below error:
> >
> > gzip -d -c /dl/awsclient/awsclient-1.5.0.tar.gz | tar
> --strip-components=1 -C
> /home/ultratronik/tmp/br.mmia53.standard/build/awsclient-1.5.0   -xf -
> >
> > gzip: /dl/awsclient/awsclient-1.5.0.tar.gz: not in gzip format
> > tar: This does not look like a tar archive
> > tar: Exiting with failure status due to previous errors
> >
> > The tar.gz file is downloaded in the buildroot download directory but
> > it is not in gzip format.
> > Inspecting file with "file" showed:awsclient-1.5.0.tar.gz: HTML
> > document, UTF-8 Unicode text, with very long lines
> >
> > The package Makefile:
> >
> > AWSCLIENT_SOURCE=awsclient-$(AWSCLIENT_VERSION).tar.gz
> > AWSCLIENT_SITE=
> https://git.osb-connagtive.com/iot/public/awsclient-releases/uploads/a0e69fa56d7772454b2587df2a800feb/awsclient-1.5.0.tar.gz
> > AWSCLIENT_SITE_METHOD=git
>
> The URL in AWSCLIENT_SITE does not appear to point to a git repository.
> It is just a tarball that can be downloaded directly. In this case, the
> download method should be "wget", but you can omit it, as it is the
> default for HTTP and HTTPS URLs.
>
> Besides that, two other changes are needed:
>
>  - do not include the trailing file name ($AWSCLIENT_SOURCE) in
>    AWSCLIENT_SITE: it will be added automatically, do not include a
>    trailing slash either
>
>  - add AWSCLIENT_STRIP_COMPONENTS=0, as this tarball is unusual in that
>    it doesn't include a leading directory in the stored path.
>
> Regards,
>
> Edgar.
>

--00000000000073244f05fb2f979e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Edgar,<div><br></div><div>Thanks for the update=
.</div><div><br></div><div>Yes, it worked.</div><div><br></div><div>Regards=
,</div><div>Sourabh</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, 8 May 2023 at 14:33, Edgar Bonet &lt;<a hr=
ef=3D"mailto:bonet@grenoble.cnrs.fr">bonet@grenoble.cnrs.fr</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello all!<br>
<br>
Sourabh wrote:<br>
&gt; I am trying to add a custom package to buildroot packages. The package=
<br>
&gt; is a simple compiled binary file that will be downloaded from Git. I<b=
r>
&gt; am not doing any build in the buildroot. Only installing the binary to=
<br>
&gt; target.<br>
&gt;<br>
&gt; But, during package extracting process, I am getting below error:<br>
&gt;<br>
&gt; gzip -d -c /dl/awsclient/awsclient-1.5.0.tar.gz | tar --strip-componen=
ts=3D1 -C /home/ultratronik/tmp/br.mmia53.standard/build/awsclient-1.5.0=C2=
=A0 =C2=A0-xf -<br>
&gt;<br>
&gt; gzip: /dl/awsclient/awsclient-1.5.0.tar.gz: not in gzip format<br>
&gt; tar: This does not look like a tar archive<br>
&gt; tar: Exiting with failure status due to previous errors<br>
&gt;<br>
&gt; The tar.gz file is downloaded in the buildroot download directory but<=
br>
&gt; it is not in gzip format.<br>
&gt; Inspecting file with &quot;file&quot; showed:awsclient-1.5.0.tar.gz: H=
TML<br>
&gt; document, UTF-8 Unicode text, with very long lines<br>
&gt;<br>
&gt; The package Makefile:<br>
&gt;<br>
&gt; AWSCLIENT_SOURCE=3Dawsclient-$(AWSCLIENT_VERSION).tar.gz<br>
&gt; AWSCLIENT_SITE=3D<a href=3D"https://git.osb-connagtive.com/iot/public/=
awsclient-releases/uploads/a0e69fa56d7772454b2587df2a800feb/awsclient-1.5.0=
.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://git.osb-connagtive.co=
m/iot/public/awsclient-releases/uploads/a0e69fa56d7772454b2587df2a800feb/aw=
sclient-1.5.0.tar.gz</a><br>
&gt; AWSCLIENT_SITE_METHOD=3Dgit<br>
<br>
The URL in AWSCLIENT_SITE does not appear to point to a git repository.<br>
It is just a tarball that can be downloaded directly. In this case, the<br>
download method should be &quot;wget&quot;, but you can omit it, as it is t=
he<br>
default for HTTP and HTTPS URLs.<br>
<br>
Besides that, two other changes are needed:<br>
<br>
=C2=A0- do not include the trailing file name ($AWSCLIENT_SOURCE) in<br>
=C2=A0 =C2=A0AWSCLIENT_SITE: it will be added automatically, do not include=
 a<br>
=C2=A0 =C2=A0trailing slash either<br>
<br>
=C2=A0- add AWSCLIENT_STRIP_COMPONENTS=3D0, as this tarball is unusual in t=
hat<br>
=C2=A0 =C2=A0it doesn&#39;t include a leading directory in the stored path.=
<br>
<br>
Regards,<br>
<br>
Edgar.<br>
</blockquote></div>

--00000000000073244f05fb2f979e--

--===============3985169487974520159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3985169487974520159==--
