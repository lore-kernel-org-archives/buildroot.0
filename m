Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08126CF3185
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 20:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F22560618;
	Tue,  1 Oct 2024 20:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nhpn_8HM4yeJ; Tue,  1 Oct 2024 20:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADAB360671
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADAB360671;
	Tue,  1 Oct 2024 20:50:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FB2D1BF844
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 20:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BD6480F40
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 20:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7-9tYFDUKxb for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 20:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::932; helo=mail-ua1-x932.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DD1D80F27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DD1D80F27
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DD1D80F27
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 20:50:08 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-84f1c36c31cso109021241.1
 for <buildroot@buildroot.org>; Tue, 01 Oct 2024 13:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727815808; x=1728420608;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0oCJIUGjOrvbnM+1pY/Kla5r7uat0EsL6QHvDUw0NC0=;
 b=G2p3kzbrqjslq+7vcrYutcWJTYC0g78rWQznpJnATeYr+yotc2vVhSXmWq+3zrOwMG
 WpzjdrejhMef1P7/LzrnXrU1JCb6DuK0cgKAv9oLSkVNxDuWx4QI1hPOu3NgkBQzfYyT
 OHqDwh9iS1izj+citbtmtdx/qAhOD0/Kn21Kpu3uyuzY8FJZxINDopNvLpTttS7D6DNB
 ikpGFxtBYpjVO7hJmlO2CEMpw8sfULAV/6ZioGvHznhqLL/gsGEsavKFJQDTvjfug/CD
 7ZhmdOwUyBa6BZ6rpjjEUH76CRGtuCv0TF3Yy9R7XBJ6tFGpb/dcubmm2ME7ux3HOe8g
 PI+g==
X-Gm-Message-State: AOJu0YyMTH26CIll7tEnmFlYqT1F5+f7NhquGwjTsuzR0DWM38AV1wuW
 O2ADczELG915dUW+4XMl6eSSohBn+fRq2rvFcoAtR3QUZ9rmlVuJYR3eCyj0IeaEbgFSYEaWOcD
 WaRQhZEI40LlyPw8KUk/wSvYLex1+hQ==
X-Google-Smtp-Source: AGHT+IHXq7biU0aa/JI4QTUSh1AOuainwV5LfYyb22hOFHsca1wcRbWEPtrqLjySS3nZY8HhMUX2XMCRhjvNKG0wi9I=
X-Received: by 2002:a05:6102:510f:b0:4a3:d7ef:40c8 with SMTP id
 ada2fe7eead31-4a3e68074c0mr1202408137.1.1727815807757; Tue, 01 Oct 2024
 13:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240930223133.1202389-1-james.hilliard1@gmail.com>
 <20240930223133.1202389-2-james.hilliard1@gmail.com>
 <87plojfujn.fsf@dell.be.48ers.dk>
In-Reply-To: <87plojfujn.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 1 Oct 2024 14:49:58 -0600
Message-ID: <CADvTj4rw8hWgkVtz_QafMWcLGrxYi=Mitjm606L57AtXBoAXfA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727815808; x=1728420608; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0oCJIUGjOrvbnM+1pY/Kla5r7uat0EsL6QHvDUw0NC0=;
 b=MefnNlQ5nGLBghXNqvPQ8A3Aj2d9PthDfBiKoBqA73dHYJogchagKlZgegnT9hVCRN
 jz71vRrHcSsnGTV9oiuZDSYruC/6no/9zn6+yMkWXlDFhOQPqlMGTnx+dv8j4KXKoZ0K
 p7z9j4Chuh2PjnKHRmIJo/M+JC+B277dln8Qaz2C8Qv2I2PSF0BXsAI3LIWzSjDvddPh
 6NXiR0wnpf5Nm2wgvy+04h4nH5lFm42HTB3SqRGvT3mIcL0b0+XbJjFMF4SFZuMBgzBV
 dy4Dl9mMuualNVmah+2FSZj6MFMHZ5zOkEQxObSeclwrHinIky6pfr48rskOgS0SG907
 5oGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MefnNlQ5
Subject: Re: [Buildroot] [PATCH 2/4] package/libcupsfilters: new package
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1849476520426816096=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1849476520426816096==
Content-Type: multipart/alternative; boundary="0000000000007576ff0623707795"

--0000000000007576ff0623707795
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 1, 2024, 2:16 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
>  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> We should probably use version 2.1b1 instead (or backport the fix) given
> the vulnerability:
>
>
> https://github.com/OpenPrinting/libcupsfilters/security/advisories/GHSA-w63j-6g73-wmg5


Maybe best to merge for now and backport if a final release doesn't show up
soon?


>
> --
> Bye, Peter Korsgaard
>

--0000000000007576ff0623707795
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Oct 1, 2024, 2:16 PM Peter Korsgaard &lt;<a hr=
ef=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;James&quot; =
=3D=3D James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">james.hilliard1@gmail.com</a>&gt; writes:<=
br>
<br>
=C2=A0&gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hillia=
rd1@gmail.com" target=3D"_blank" rel=3D"noreferrer">james.hilliard1@gmail.c=
om</a>&gt;<br>
<br>
We should probably use version 2.1b1 instead (or backport the fix) given<br=
>
the vulnerability:<br>
<br>
<a href=3D"https://github.com/OpenPrinting/libcupsfilters/security/advisori=
es/GHSA-w63j-6g73-wmg5" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://github.com/OpenPrinting/libcupsfilters/security/advisories/GHSA-w63j-6=
g73-wmg5</a></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Maybe best to merge for now and backport if a final release doesn=
&#39;t show up soon?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div></div>

--0000000000007576ff0623707795--

--===============1849476520426816096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1849476520426816096==--
