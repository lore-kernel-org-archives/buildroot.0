Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C1EC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 17:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ECFD41932;
	Fri, 10 Nov 2023 17:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ECFD41932
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QO5xRPXWQQ5o; Fri, 10 Nov 2023 17:15:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF0474189F;
	Fri, 10 Nov 2023 17:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF0474189F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 665C71BF311
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 17:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F55C60FA5
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 17:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F55C60FA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpA_oWkheFQL for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 17:15:03 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10C436101C
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 17:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10C436101C
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507adc3381cso2924898e87.3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 09:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699636500; x=1700241300;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=92Hbjk6ABKsn96A8mCFI07pLaO3dMVpvPMqJwdjUrW8=;
 b=VxI+W8+y5WUu18p23o8Ea0CS8ED1+QR+d4nQx/Bo/QcZpkVWOTo8f5+1g3iFgJjzIy
 2oqMsv0R7Krg2GhbkxL+PkL0DSARl6SqHbLjlTPq8PqHPAnb6Y0P9NWoU0mStRzQJ4uz
 x5At+zyargtt2yChokx6OIBw7fA19loMyJYX/LP2yI7O9i3F5ncTJeqXvY7z+0BnvR7P
 sPny16IWP1eKyIQCm1ofQNoXJLGw8HZv3sJ5VlPUbuWpASrZmi18TaMXQv6Kn3gD7CG5
 7O3WuOuHXdb+JhW99kVRTsd7jczHAxYmM1aBwXazSNaj6tGEc1ZtDNAyscIczUOMa0WP
 kdog==
X-Gm-Message-State: AOJu0YxF0wNbbaAu/4nnliAFVFpsEYZyHwW3lcpDiA1sf8LSw+D79ZkB
 rWi5sUPgxIjYEGDWcfDWLs/PmsL5IBuzf0F0OsE=
X-Google-Smtp-Source: AGHT+IF76SVW3exEZz0UUqBnKEplP1rsAlACsttp5nnIxsmfZYF1kaiXyaNp+vr9slbmM5CwUjBwgA==
X-Received: by 2002:a05:6512:374c:b0:507:ad92:18d1 with SMTP id
 a12-20020a056512374c00b00507ad9218d1mr3900646lfs.68.1699636500182; 
 Fri, 10 Nov 2023 09:15:00 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 x9-20020aa7cd89000000b005435faef9cfsm1359329edv.52.2023.11.10.09.14.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 09:14:59 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-9de7a43bd1aso353816066b.3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 09:14:59 -0800 (PST)
X-Received: by 2002:a17:907:a44:b0:9dd:65d7:e91e with SMTP id
 be4-20020a1709070a4400b009dd65d7e91emr7287829ejc.44.1699636499202; Fri, 10
 Nov 2023 09:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20231110104504.2340403-1-jonhenrik@qbee.io>
In-Reply-To: <20231110104504.2340403-1-jonhenrik@qbee.io>
Date: Fri, 10 Nov 2023 09:14:46 -0800
X-Gmail-Original-Message-ID: <CA+h8R2q=+SNv+2bu2+WR1NbfZ20hD09+eCntZoETnWiDgk-xgg@mail.gmail.com>
Message-ID: <CA+h8R2q=+SNv+2bu2+WR1NbfZ20hD09+eCntZoETnWiDgk-xgg@mail.gmail.com>
To: =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1699636500; x=1700241300; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=92Hbjk6ABKsn96A8mCFI07pLaO3dMVpvPMqJwdjUrW8=;
 b=MTT6gyff0P5RoQNIvfBa5PIsLhg4yku1qqzKWDVIibObG2HNlJ94bqbx4JlUKA8uA3
 EwhnnofF9KqFZOmTX7rsASJgU9J93QzAbgyFcd1Wo2f7aDJDu7E9z0B8Qo4NWgBZ8Jvl
 izVxbmqiO5zGRzAkbj3gM/8WI+UZd0bkf+RMUQqyRmwRwLDBDSvvM/gdspgwLO/HR1rn
 MbhN6pLmDttrb9R+6WRoJaAvHn60qZujH/eDnJhiD8ilrtCnDB6Mv6MIf9bsjir+cn6O
 U4tpaX5+XRFwQMOZZosp+ck+jPiZESd3qegR4PTWe8mfHP/GQwJrGeFqLwyai/nJAUYr
 5+Iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=MTT6gyff
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: new package
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
Content-Type: multipart/mixed; boundary="===============0851517428166263524=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0851517428166263524==
Content-Type: multipart/alternative; boundary="000000000000c8473d0609cf75de"

--000000000000c8473d0609cf75de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,


On Fri, Nov 10, 2023, 2:45=E2=80=AFAM Jon Henrik Bj=C3=B8rnstad <jonhenrik@=
qbee.io>
wrote:

> This patch add qbee-agent, an open source device management software
> for Linux devices.
>

Are there any buildroot users today who would want to install this package
with it's proprietary backend independently of using the proprietary
backend?

Who holds the private key for that public key and what can they then do
with my device if I chose to install this package?

This seems like a case where, if I was adding this package for a
proprietary service, I would instead opt to use a Buildroot External
Package for the reasons stated above:

https://buildroot.org/downloads/manual/customize-outside-br.txt

Indeed: there are many cases like this one where I'll maintain an external
buildroot extensions tree because the packages are not fully open source
(backend and frontend) and therefore probably not of interest to the main
buildroot user base.

For a counter example to this see Mender and Balena Engine.

Thanks,
Christian Stewart

--000000000000c8473d0609cf75de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi all,<div dir=3D"auto"><br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 10, 2023, 2=
:45=E2=80=AFAM Jon Henrik Bj=C3=B8rnstad &lt;<a href=3D"mailto:jonhenrik@qb=
ee.io">jonhenrik@qbee.io</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">This patch add qbee-agent, an open source device management software<b=
r>
for Linux devices.<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Are there any buildroot users today who would want to ins=
tall this package with it&#39;s proprietary backend independently of using =
the proprietary backend?</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Who holds the private key for that public key and what can they then do wi=
th my device if I chose to install this package?</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">This seems like a case where, if I was adding this=
 package for a proprietary service, I would instead opt to use a Buildroot =
External Package for the reasons stated above:</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><a href=3D"https://buildroot.org/downloads/manual/cu=
stomize-outside-br.txt">https://buildroot.org/downloads/manual/customize-ou=
tside-br.txt</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">Indeed:=
 there are many cases like this one where I&#39;ll maintain an external bui=
ldroot extensions tree because the packages are not fully open source (back=
end and frontend) and therefore probably not of interest to the main buildr=
oot user base.</div><div dir=3D"auto"><br></div><div dir=3D"auto">For a cou=
nter example to this see Mender and Balena Engine.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Christian Stewart=
</div></div>

--000000000000c8473d0609cf75de--

--===============0851517428166263524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0851517428166263524==--
