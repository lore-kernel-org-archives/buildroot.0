Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06FDC28B28
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 10:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C863406DD;
	Thu, 13 Mar 2025 10:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqGI7xTvASXd; Thu, 13 Mar 2025 10:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3645C40702
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3645C40702;
	Thu, 13 Mar 2025 10:04:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C891FE0
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC2D18118F
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_8rEBuGgmIV for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 10:04:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.44;
 helo=mail-lf1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B9E88118D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B9E88118D
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B9E88118D
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:04:42 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-547bcef2f96so910039e87.1
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 03:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741860280; x=1742465080;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YoNEeOegjetEBxFtZtLIEeW3D4Dvvn18TKY3G2LcuZs=;
 b=jA1fITtVSEDBaIjD2AS5O5FfnxxGovALZrbTN9L5PRldNxFf0Kyq9nPoHyMJwi/q61
 ZGq17bK5gB4ubt8jxdNtRZiwvvNUbxyUOiRtd+7ofpasdEP9KqtV/z/b0wmbrcZeeRly
 mQo4AwgSeAQbcXtkVbk+NpDelRB5Xu7c5LEDfIkwIC0QiIYniY/038l0SEvVU2ChdUP4
 DUQAjcMm//vbvD34kDHgqeNNo1vnYQYXjvsvh5VUPeBZQRlB3E0r0nRpeXiSXnMockli
 Q536fn3z99Fm55FtrQY4a6432izCNwMZsVdTY3lWvkwuxPYKR5QT2KJ/cuu2aV4IRgTI
 eE/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP06Id8hsPxTDuY7dKjVlBncvXqC4BSrWU9kysOyobZQhrDGXiFF91L7Njzj8Xrx9kr4Jc8j0ePyA=@buildroot.org
X-Gm-Message-State: AOJu0YwCTak+f5aCWbqWUhdmh7YI+9ujNWqmrFxTzFxEjqeOVIJ2tAbD
 FdKarp4hlfSUS0lW4x/gEpofw3wL15kPJo7XqfkjndGjgXxbnWumXIzW8PmT
X-Gm-Gg: ASbGncvsABYY/6nADsgJfazpyCWeZc0g4h7Mn1yQ+RjDNfHWAypOM1fF9GdDC3DY3SI
 xY7WnPTHCI2FNrkrNQzcH0Tt9gL6+xuGvtsYvi+pJM/r246dnp6TNXOiZWm6vX8j97U3FcLfQ+B
 IcMDkQnrPwcvsqH0mwPCZJ57TdCPpFosnQjPFIv6nPRj5t8xzZmYXzEg1/naLTynr7ll4RPAUw4
 qn0sBHtgNoL14Valckw+yx0vBn0vgGvYrIoiiJ5vxtzkp2YDRcEPXJbhNhC/Zzaf/yY9Xx3nt6u
 vzEGUodAXOP7+1qcP9vo1WuwmyXDqMBIoxjU6DzMs4MF6VLmC2ukuhbEunlO+/mqDLB1EJAvTfi
 EoKIwDA==
X-Google-Smtp-Source: AGHT+IFeA1KhKzWqXU4KNGEbJusjhMmlhgGUHV7h89jU/5D+WzBhvM83oW2Zh+QZu/5259RvxV0yDA==
X-Received: by 2002:a05:6512:3b24:b0:549:7145:5d2f with SMTP id
 2adb3069b0e04-549abae99camr4486559e87.33.1741860279639; 
 Thu, 13 Mar 2025 03:04:39 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864d7dsm159706e87.130.2025.03.13.03.04.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 03:04:38 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5499659e669so851627e87.3
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 03:04:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUOfR8ayXdL1BfktQywdPnKtjcpTj+cZM0RHpfrJDVOqesr97bJ3x/yoAu8VRR+7rWkHq4MyqjfWvQ=@buildroot.org
X-Received: by 2002:a05:6512:230f:b0:545:2a69:b1f4 with SMTP id
 2adb3069b0e04-549abacc137mr3574663e87.29.1741860278559; Thu, 13 Mar 2025
 03:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250305085617.911367-1-thomas.devoogdt@barco.com>
 <87plil6zer.fsf@dell.be.48ers.dk>
In-Reply-To: <87plil6zer.fsf@dell.be.48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 13 Mar 2025 11:01:26 +0100
X-Gmail-Original-Message-ID: <CACXRmJjQ51F_pvrJXii6AyN4N4sMp6+=DwxYJN4Nr9OYgxXi_A@mail.gmail.com>
X-Gm-Features: AQ5f1JojqN6xPwJaAB2Ey4nMfyPrpTn6x4Vf5odXdCJHDsT5fGagXksEUah8z6s
Message-ID: <CACXRmJjQ51F_pvrJXii6AyN4N4sMp6+=DwxYJN4Nr9OYgxXi_A@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org, 
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: add support for
 certifi ssl context
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5536951731835064860=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5536951731835064860==
Content-Type: multipart/alternative; boundary="00000000000026f2930630367353"

--00000000000026f2930630367353
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

This was tested on an old build server, but by using host-python3.

Kr,

Thomas Devoogdt

Op do 13 mrt 2025, 10:41 schreef Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED]
>  > certificate verify failed: unable to get local issuer certificate
>  > (_ssl.c:1000)>
>
>  > Allow to fix this by e.g. using `make host-python-certifi`.
>
>  > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
>
> Is this on a very old machine / python setup? Are you using your host
> machine's python or building host-python3?
>
> It is not like we are doing anything special here, perhaps your ssl
> configuration is outdated? Can you access the URL with curl / wget?
>
> curl -v https://raw.githubusercontent.com/CycloneDX/specification/
> ..
> * Server certificate:
> *  subject: CN=*.github.io
> *  start date: Mar  7 00:00:00 2025 GMT
> *  expire date: Mar  7 23:59:59 2026 GMT
> *  subjectAltName: host "raw.githubusercontent.com" matched cert's "*.
> githubusercontent.com"
> *  issuer: C=GB; ST=Greater Manchester; L=Salford; O=Sectigo Limited;
> CN=Sectigo RSA Domain Validation Secure Server CA
> *  SSL certificate verify ok.
>
> --
> Bye, Peter Korsgaard
>
>

--00000000000026f2930630367353
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Peter,</p>
<p dir=3D"ltr">This was tested on an old build server, but by using host-py=
thon3.</p>
<p dir=3D"ltr">Kr,</p>
<p dir=3D"ltr">Thomas Devoogdt </p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">Op do 13 mrt 2025, 10:41 schreef Peter Korsgaard &lt;<a hre=
f=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt;:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Thomas&quot; =3D=3D T=
homas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.com" target=3D"_blank"=
 rel=3D"noreferrer">thomas@devoogdt.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; urllib.error.URLError: &lt;urlopen error [SSL: CERTIFICATE_VERIF=
Y_FAILED]<br>
=C2=A0&gt; certificate verify failed: unable to get local issuer certificat=
e<br>
=C2=A0&gt; (_ssl.c:1000)&gt;<br>
<br>
=C2=A0&gt; Allow to fix this by e.g. using `make host-python-certifi`.<br>
<br>
=C2=A0&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devo=
ogdt@barco.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.=
com</a>&gt;<br>
<br>
Is this on a very old machine / python setup? Are you using your host<br>
machine&#39;s python or building host-python3?<br>
<br>
It is not like we are doing anything special here, perhaps your ssl<br>
configuration is outdated? Can you access the URL with curl / wget?<br>
<br>
curl -v <a href=3D"https://raw.githubusercontent.com/CycloneDX/specificatio=
n/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://raw.githubuserc=
ontent.com/CycloneDX/specification/</a><br>
..<br>
* Server certificate:<br>
*=C2=A0 subject: CN=3D*.<a href=3D"http://github.io" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">github.io</a><br>
*=C2=A0 start date: Mar=C2=A0 7 00:00:00 2025 GMT<br>
*=C2=A0 expire date: Mar=C2=A0 7 23:59:59 2026 GMT<br>
*=C2=A0 subjectAltName: host &quot;<a href=3D"http://raw.githubusercontent.=
com" rel=3D"noreferrer noreferrer" target=3D"_blank">raw.githubusercontent.=
com</a>&quot; matched cert&#39;s &quot;*.<a href=3D"http://githubuserconten=
t.com" rel=3D"noreferrer noreferrer" target=3D"_blank">githubusercontent.co=
m</a>&quot;<br>
*=C2=A0 issuer: C=3DGB; ST=3DGreater Manchester; L=3DSalford; O=3DSectigo L=
imited; CN=3DSectigo RSA Domain Validation Secure Server CA<br>
*=C2=A0 SSL certificate verify ok.<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
<br>
</blockquote></div>

--00000000000026f2930630367353--

--===============5536951731835064860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5536951731835064860==--
