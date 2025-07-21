Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D3CC83F1A
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 03:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B916B61366;
	Mon, 21 Jul 2025 03:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYWqnR3ABh9o; Mon, 21 Jul 2025 03:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C70CE61367
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C70CE61367;
	Mon, 21 Jul 2025 03:24:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B97F01F7
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 03:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AABAD8441A
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 03:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_OYn11lig1A for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 03:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.50;
 helo=mail-ed1-f50.google.com; envelope-from=fede.evol@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B22C84411
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B22C84411
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B22C84411
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 03:24:09 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-612a338aed8so5795281a12.1
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 20:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753068248; x=1753673048;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AjjEJPd4DTwkJoOWMoCCANmDu/GnX7QUi4lCLtNM0hM=;
 b=WDrt7XPCeCVriAy65yX88y4Y1k7uBONH9gniabRbuTD25SN9xbw7xPo+dzXhZgjH0K
 psceQozg/XPxSVdY57eubMBdmz0LlUVkE4mHDC/U+jdbp94orJFq+53eryafNsG5rQiT
 LUaw3+snr13QYKDYc2/6diA1b7dptepfQ2vBY5dPaVVWl0hmo9xGDCVU3eEt3dISHJQG
 Y/0d2SUFlwGwQOT8bsMUG4y/dBkaQfSQpYcOJ+m/+bL50eoY0OWpZkbjVzgEXxyHWZ5C
 5FHO+NpS8HyLWVkP6lLrrZ1mT2M0uGcbsXxcN6H+n5+P8XRi/MM/ShYzb9FdXg2/ZMyz
 95fg==
X-Gm-Message-State: AOJu0Yzyg37Z1izL2X/Pr+Rlw2y8Tobn4Ha69fVpChW9WSMli1n6k/OL
 idghPTSjpJ7QOTF8fQND8G10YV6fWibZv8FFJDj/KHLPtWO/KouFq8pCbPazJNiUE687koQ9QnJ
 xhFKbST1q4FEXkfo1RoYCTsS71LUV3as=
X-Gm-Gg: ASbGncvJlt1x/CTVbKy8Lb5DHvcWbfUdzdzEB1YPA2L1qhUm0IEOO1ZytV3l+ionr7t
 nfq9Tg8fR9lZfD1BFSDi9ictUJfhC9WqC5HnL6KX/6WMQLZEU91T5Bw+P8OQ1THjqGX5dk2iGez
 K8iaR0SPv7BrQP5TuGnFdDCj7UjTOBOVNmjsnwT8JLtLP9qRWjTPPtkurlsij8BNhFB5vpKvT/m
 6BjXE4xRCbTzUWmKQJUMZ7sXX4CGkLDeSqLe8MAqA==
X-Google-Smtp-Source: AGHT+IHq/a7mSQNHPNB7rpji7hSqDqq6Uv6DuW7lKpXXsAjlWPFA0drsUdalMW9oOrH2Wv+/JiyVr7zTHwuMYYONrl4=
X-Received: by 2002:a05:6402:288e:b0:612:a54d:fff3 with SMTP id
 4fb4d7f45d1cf-612a54e0912mr10749965a12.28.1753068247606; Sun, 20 Jul 2025
 20:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250718045614.17100-1-fede@evolware.org>
 <a6813f8b41e2a50a3622a48f515a14b0@free.fr>
In-Reply-To: <a6813f8b41e2a50a3622a48f515a14b0@free.fr>
From: Federico Pellegrin <fede@evolware.org>
Date: Mon, 21 Jul 2025 05:23:56 +0200
X-Gm-Features: Ac12FXyhIrPboAQCORXQqjBtRVnuD3QrKFSWT8vaaP9MjlZtNZ4vZ3jRNKAdo_c
Message-ID: <CAM6O0Zjvv1nG0n5JR5oa8+r1S65AyZvW8WvJV-ZR6N-tBhh+ow@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, james.hilliard1@gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=evolware.org
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftool: bump to version 7.5.0
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
Content-Type: multipart/mixed; boundary="===============1958314574384988776=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1958314574384988776==
Content-Type: multipart/alternative; boundary="0000000000002a6c02063a6802d3"

--0000000000002a6c02063a6802d3
Content-Type: text/plain; charset="UTF-8"

Julien,
Many thanks for the fast action and merge!

Would it be possible to merge this also to 2025.05.x branch as it is
effectively broken there? Should I submit another patch request maybe?

Many thanks!
Federico



Il giorno sab 19 lug 2025 alle ore 16:40 Julien Olivain <ju.o@free.fr> ha
scritto:

> On 18/07/2025 06:56, Federico Pellegrin wrote:
> > Changes: https://github.com/libbpf/bpftool/releases
> >
> > This upgrade fixes as well linking problems to LLVM libraries in
> > the previous version on Buildroot 2025.05 and master.
> >
> > Signed-off-by: Federico Pellegrin <fede@evolware.org>
>
> Applied to master, thanks.
>

--0000000000002a6c02063a6802d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Julien,</div><div>Many thanks for the =
fast action and merge!</div><div><br></div><div>Would it be possible to mer=
ge this also to 2025.05.x branch as it is effectively broken there? Should =
I submit another patch request maybe?</div><div><br></div><div>Many thanks!=
</div><div>Federico</div><div><br></div><div><br></div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">Il giorno sab 19 lug 2025 alle ore 16:40 Julien Olivain &lt;<a href=3D"ma=
ilto:ju.o@free.fr">ju.o@free.fr</a>&gt; ha scritto:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On 18/07/2025 06:56, Federico Pellegrin=
 wrote:<br>
&gt; Changes: <a href=3D"https://github.com/libbpf/bpftool/releases" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/libbpf/bpftool/releases</=
a><br>
&gt; <br>
&gt; This upgrade fixes as well linking problems to LLVM libraries in<br>
&gt; the previous version on Buildroot 2025.05 and master.<br>
&gt; <br>
&gt; Signed-off-by: Federico Pellegrin &lt;<a href=3D"mailto:fede@evolware.=
org" target=3D"_blank">fede@evolware.org</a>&gt;<br>
<br>
Applied to master, thanks.<br>
</blockquote></div>

--0000000000002a6c02063a6802d3--

--===============1958314574384988776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1958314574384988776==--
