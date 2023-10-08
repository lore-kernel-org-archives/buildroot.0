Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A93E95A67
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 19:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1592C60B68;
	Sun,  8 Oct 2023 19:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1592C60B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kthuYRnM6gU2; Sun,  8 Oct 2023 19:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0579760B6E;
	Sun,  8 Oct 2023 19:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0579760B6E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 894ED1BF42C
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 19:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BB2C60B6E
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 19:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BB2C60B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d2QwYe0JJiGz for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 19:23:51 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4A1D60B68
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 19:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4A1D60B68
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-538575a38ffso6268009a12.1
 for <buildroot@buildroot.org>; Sun, 08 Oct 2023 12:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696793028; x=1697397828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bsQD9yOIuE5ub3eGwN3JbkzDcJfCBMFnsZUuhhM+o7E=;
 b=Jxm/gyccZkWZVqnrWjY+HUvyNtcbsul6JFP2uFU62G0H5JtvaiI7kJ0WD5mKNAUe6+
 8RKZiQC6cF5MsyWTPjcpI07xARnOc8tO0duYVoFLaEUK0+H0rSntD8v2YhDU+NLykqZk
 F1pahPrbGRXs/klIHs2pQUETFcJ24BtQwW4ypCn8mvR+O3OE0V4QoiiuwOuoR4th2I72
 JM/buEtrxfFQ4iAaudgX/JK0/khs452QYBfksCtUiXmA/du7y2mMtleWITNgF5ZIX55w
 1MfyIUmBYmJ5UPKxrBkao8eIMCQs9rbGkZmoZh7MNtqZaHB3y8svCXtaYjpD/IVzCOOx
 +xiQ==
X-Gm-Message-State: AOJu0Ywt/VY6kukkn0Q58S+Oj9Vl1C0nI+/KzQA3SH+y5hfoxhBhIKKT
 oi1Ha0w7XjnN9MjYBuRsJJ3GwFyLSvhLuECxD2cFWw==
X-Google-Smtp-Source: AGHT+IFvBEgSmL1r4VCjscbD75b7LHbvO4J0Fs/z0+cMy0SIrXqCnj83MCcoD4rDKRkvz+2UVbPfRw==
X-Received: by 2002:aa7:c0d2:0:b0:530:7ceb:33c with SMTP id
 j18-20020aa7c0d2000000b005307ceb033cmr12093847edp.4.1696793027692; 
 Sun, 08 Oct 2023 12:23:47 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 f26-20020a056402005a00b00530bc7cf377sm5283784edu.12.2023.10.08.12.23.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Oct 2023 12:23:46 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso702025866b.2
 for <buildroot@buildroot.org>; Sun, 08 Oct 2023 12:23:46 -0700 (PDT)
X-Received: by 2002:a17:907:78d7:b0:9ae:3a68:93e8 with SMTP id
 kv23-20020a17090778d700b009ae3a6893e8mr12442916ejc.14.1696793026015; Sun, 08
 Oct 2023 12:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231006095142.2051641-1-peter@korsgaard.com>
 <87cyxpdrg8.fsf@48ers.dk>
In-Reply-To: <87cyxpdrg8.fsf@48ers.dk>
Date: Sun, 8 Oct 2023 12:23:36 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oqA6TCVbVbJZoCDiJ_hHA2iKbcsw8HKEBp6xmbsABJ9Q@mail.gmail.com>
Message-ID: <CA+h8R2oqA6TCVbVbJZoCDiJ_hHA2iKbcsw8HKEBp6xmbsABJ9Q@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1696793028; x=1697397828; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bsQD9yOIuE5ub3eGwN3JbkzDcJfCBMFnsZUuhhM+o7E=;
 b=OH3yIxipvSZ66W2tD0+2s5dT3wAAvUyZ1DNwlvaYbYn6SjXR1KlHw2tls8Ru/MWnup
 h6ewdWm9Yt0TGNs9Z9Z6PtQDumTyJljdke0CJabjOYqKkRh+j+uySXuz7ZlQ1YZBBJvZ
 Y8/fc1MTaOBOrsgORNWyIukShMoyowAGYHdAGy2/FIKg2JAupQDoR6YnscrjmgalU0FR
 kffTf6UTRWeie95WfJzBvPfrHZu+QDuRatcuCvH5yQrIhv5rK/YY8Apm6QOcp5sVSMqX
 g9fxVhVQ9sUrQ3pHLnST1KeE70XRaoclWi8KZSZ8JU7ftL8dYluODHpE1csfbwoTKLRN
 dipQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=OH3yIxip
Subject: Re: [Buildroot] [PATCH-2023.08.x] package/go: security bump to
 version 1.20.9
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2922259712525402086=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2922259712525402086==
Content-Type: multipart/alternative; boundary="00000000000092d8c806073969f7"

--00000000000092d8c806073969f7
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Sun, Oct 8, 2023, 9:12 AM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>
>  > Fixes CVE-2023-39323: Line directives ("//line") can be used to bypass
> the
>  > restrictions on "//go:cgo_" directives, allowing blocked linker and
> compiler
>  > flags to be passed during compilation.  This can result in unexpected
>  > execution of arbitrary code when running "go build".
>
>  > go1.20.9 (released 2023-10-05) includes one security fixes to the cmd/go
>  > package, as well as bug fixes to the go command and the linker.
>
>  > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>
> Committed to 2023.08.x, thanks.
>
> I'll also bump 2023.02.x to this as 1.19.x no longer is getting updates.
>

Please also note that the bump from 1.19 to 1.20 requires the additional
bootstrap packages.

Best,
Christian Stewart

>

--00000000000092d8c806073969f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Peter,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Oct 8, 2023, 9:12 AM Peter Korsgaard =
&lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Peter=
&quot; =3D=3D Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" ta=
rget=3D"_blank" rel=3D"noreferrer">peter@korsgaard.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Fixes CVE-2023-39323: Line directives (&quot;//line&quot;) can b=
e used to bypass the<br>
=C2=A0&gt; restrictions on &quot;//go:cgo_&quot; directives, allowing block=
ed linker and compiler<br>
=C2=A0&gt; flags to be passed during compilation.=C2=A0 This can result in =
unexpected<br>
=C2=A0&gt; execution of arbitrary code when running &quot;go build&quot;.<b=
r>
<br>
=C2=A0&gt; go1.20.9 (released 2023-10-05) includes one security fixes to th=
e cmd/go<br>
=C2=A0&gt; package, as well as bug fixes to the go command and the linker.<=
br>
<br>
=C2=A0&gt; Signed-off-by: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsg=
aard.com" target=3D"_blank" rel=3D"noreferrer">peter@korsgaard.com</a>&gt;<=
br>
<br>
Committed to 2023.08.x, thanks.<br>
<br>
I&#39;ll also bump 2023.02.x to this as 1.19.x no longer is getting updates=
.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Please also note that the bump from 1.19 to 1.20 requires the additional b=
ootstrap packages.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best,=
</div><div dir=3D"auto">Christian Stewart=C2=A0</div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000092d8c806073969f7--

--===============2922259712525402086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2922259712525402086==--
