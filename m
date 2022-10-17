Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A33C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 16:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B299881589;
	Mon, 17 Oct 2022 16:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B299881589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bshzv7FFtkUY; Mon, 17 Oct 2022 16:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA039813AB;
	Mon, 17 Oct 2022 16:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA039813AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79D211BF331
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54E914053C
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54E914053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rImAqkKMWC_Y for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 16:05:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01522404E5
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01522404E5
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 16:05:14 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r14so16744992edc.7
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+uNo/ujycIzp/4rH/5P4JKA2LwqCj5o8IJAe2nznvLI=;
 b=KHnLETsiRg7Ik/lPtmIUTJ6ybLtYSwwc3XGq/2ZcBiq3O+SFUGR1FUU+TLROsWI5qL
 waUL18OJHcuK8wC8dTReLT+pl2jWsv8b0BqO1ReEyiYtF4vgjSEQhglJlqGSlXTpJR3z
 fNcbIyrO54KhNk697YZbfj5+461dpv6TTPaMi1IRcqfqgZXIa3CllEXqu5AbvjHduX+C
 5WdDWmWn42tKSlSTU2gZ/Pqtyd/rTFl5fow6xGdQB37ZE0vgzOVkSNobur0rDS2HVyGD
 +Psc1A2iZ79+OW6drFxvFMA0eGFbPDnukqARXmyJ5ZUcJE4ZwB3bL1+mGAyyw6VtjECC
 sIGg==
X-Gm-Message-State: ACrzQf0SIoUvabklODjzKKhmSJrNXPHeqih5bsjbV6ySh5rbym+BMzwp
 93uPo3/a7UeA8l0bj+NFikMM09XcraJv2vJ0
X-Google-Smtp-Source: AMsMyM4GDppBfgOd90BQYDwW/OJlOko3M4NuYdEygc3gZabTiD5BlgY4p/0VMWbfTxZuOZA6stJoxg==
X-Received: by 2002:a05:6402:557:b0:458:7488:8958 with SMTP id
 i23-20020a056402055700b0045874888958mr10779034edx.242.1666022712657; 
 Mon, 17 Oct 2022 09:05:12 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 j16-20020aa7c410000000b0045769dee1fdsm7576366edq.29.2022.10.17.09.05.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 09:05:11 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id a67so16689322edf.12
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:05:11 -0700 (PDT)
X-Received: by 2002:a05:6402:40d6:b0:45d:636c:a12f with SMTP id
 z22-20020a05640240d600b0045d636ca12fmr9490304edb.233.1666022711385; Mon, 17
 Oct 2022 09:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-4-thomas.perale@mind.be>
In-Reply-To: <20221017142849.41399-4-thomas.perale@mind.be>
Date: Mon, 17 Oct 2022 09:05:00 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pNRrBsChKS3PHQtT0_rsVF3Wi3LwMTD9jKFoKf1ot2-A@mail.gmail.com>
Message-ID: <CA+h8R2pNRrBsChKS3PHQtT0_rsVF3Wi3LwMTD9jKFoKf1ot2-A@mail.gmail.com>
To: Thomas Perale <thomas.perale@essensium.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+uNo/ujycIzp/4rH/5P4JKA2LwqCj5o8IJAe2nznvLI=;
 b=PWix/XRRTIgRwnfozfxIevy2ULNzuz9iIg4nmC2QPYh6tZ1wpydz7nuB2CVPVK70g+
 s3aI6h+EJrEl5xfovIxmDG9boooiB6nSpwgz+Wf6UOUoVIBYDa0ISw3eGiyJU5dDSVzt
 7tWQ+QgTrwn5zoA4/chCXEZ7j37E6dCn6gk7ZhjZ8IgbUc4FqsjNF0tY6ht3IQIrs1tL
 OBYxVVLrpvUKVAyYRzzUGvTJtrqreJrgYHybIYjfwg5utEXlbvzq3zQADlxq+wxNWc1w
 EJfBIcYo8AiTUHS8oRTV9458NYXGGCuDLHv2qAWKQZPrvwlEE0bXnBkkwxFdL1fWPqtu
 ZS/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=PWix/XRR
Subject: Re: [Buildroot] [PATCH 3/4] package/go-bin: new package
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Geoff Levand <geoff@infradead.org>,
 Anisse Astier <anisse@astier.eu>, Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============3739708435106287436=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3739708435106287436==
Content-Type: multipart/alternative; boundary="000000000000e6674b05eb3d2363"

--000000000000e6674b05eb3d2363
Content-Type: text/plain; charset="UTF-8"

Hi all,

This looks interesting, one request though...

On Mon, Oct 17, 2022, 7:29 AM Thomas Perale <thomas.perale@essensium.com>
wrote:
> +       # Default to host-go-bin

> +       default "host-go-bin" if BR2_PACKAGE_HOST_GO_BIN
> +       default "host-go" if BR2_PACKAGE_HOST_GO


Please don't default to downloading something predompiled. Especially when
the behavior currently defaults to compiling everything from source.

Thanks,
Christian Stewart

--000000000000e6674b05eb3d2363
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi all,<div dir=3D"auto"><br></div>This looks intere=
sting, one request though...<br><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Oct 17, 2022, 7:29 AM Thomas Perale &lt;<=
a href=3D"mailto:thomas.perale@essensium.com">thomas.perale@essensium.com</=
a>&gt; wrote:</div><div dir=3D"ltr" class=3D"gmail_attr">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0# Default to host-go-bin</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;host-go-bin&quot; if BR2_PACKAGE_=
HOST_GO_BIN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;host-go&quot; if BR2_PACKAGE_HOST=
_GO</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">P=
lease don&#39;t default to downloading something predompiled. Especially wh=
en the behavior currently defaults to compiling everything from source.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"au=
to">Christian Stewart</div><div dir=3D"auto"><br></div></div>

--000000000000e6674b05eb3d2363--

--===============3739708435106287436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3739708435106287436==--
