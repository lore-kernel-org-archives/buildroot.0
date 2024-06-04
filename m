Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD893C27C52
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 18:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C7E9417A4;
	Tue,  4 Jun 2024 18:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uxcCec2sa4H; Tue,  4 Jun 2024 18:01:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9503417A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9503417A6;
	Tue,  4 Jun 2024 18:01:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8AB81BF8A8
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 18:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D570B404D1
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6pL6Rgv-qZy for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 18:01:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A33D40342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A33D40342
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A33D40342
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 18:01:17 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a68bf84d747so354129666b.3
 for <buildroot@buildroot.org>; Tue, 04 Jun 2024 11:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717524075; x=1718128875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OU3MtIb30w9Qlfpw8D/ecWcESxO2ChLkslVHXWWusLY=;
 b=Np+/ZYA5r84WCSezz/zinbLliRQDyTxsH9nR1Y3d+tEC+2x3IGzRTnJ3cvpoCMiFQg
 XRnG4syyIXTHgk6WfJ1/+VliukxmL6zPVWVzLr4nFo4NBpli+BFQ7Qs03Ivb08qkt3nr
 nIzqLeJDsvQAQJOvL5lMvQMWtQ2sFTFrQ8Ay+XnnkQ/7bAfuqw+KIBw3StM+ligK0DnB
 j8zVUo1UAaUrfdG8Rq3Li9eeN6wBH9GzFBPisB8UWHrbPj00c7JamrTRygRyjPj63csX
 QsKqjrEPrHILdaO8VCJ+sBsbFelvq017KWfrPDxm7mz+bUjujYHzrhR/+lZLhyNDzTa3
 1/xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoq3EzP79qo3tbYzIXsxiDB0D1jDueCYutnjpoaO+jJZZbjribj/wEEsCX2rhwLdE0hSTzRy60rtjZRTzbr4VqPWriv1xYvw==
X-Gm-Message-State: AOJu0YzEPBNSZemuytqe2sfQtrbp/b2IpTXMc0QaiufLm+mmvuM3yktq
 TL7gb+Ub4QqLIqA/mAlDg5ECJdf8M4T4oAVrJwHo/QMjbsg7ZUYaazgaVR+WNKJwhfpg7sa1C1G
 yghM=
X-Google-Smtp-Source: AGHT+IEZmR97ECUFGrve5mJ64727noVxnoJ03hXZFAkfCfDDRF+B0FUvceuaWFGCWbbyt0soG2EPqQ==
X-Received: by 2002:a17:906:774e:b0:a69:b5:def2 with SMTP id
 a640c23a62f3a-a699faa9004mr17539566b.6.1717524074275; 
 Tue, 04 Jun 2024 11:01:14 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a691364322csm297748866b.109.2024.06.04.11.01.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 11:01:13 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a6341cf2c99so656425866b.0
 for <buildroot@buildroot.org>; Tue, 04 Jun 2024 11:01:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWvslC+w403CoLuDENpmTYksZDfD+iZbo4TMXmkjUdwg6fDN7dVmCjtxAnjfdvYkQjm8qbRok5LkyIlp1uMGTFVMAmee8BsBA==
X-Received: by 2002:a17:906:684a:b0:a68:e0e4:302b with SMTP id
 a640c23a62f3a-a69a023627dmr16943166b.57.1717524072978; Tue, 04 Jun 2024
 11:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240511235609.88305-1-christian@aperture.us>
 <Zlw0x-GMNwen_N31@landeda>
 <87a5k3ljy8.fsf@dell.be.48ers.dk> <874ja8g88f.fsf@dell.be.48ers.dk>
 <CA+h8R2qZ8dVMUH94QN85v5Vms1RtNXM5k4VR+5AqBHEOJzzwDg@mail.gmail.com>
 <Zl8-TDOdLCh5dq42@landeda>
In-Reply-To: <Zl8-TDOdLCh5dq42@landeda>
Date: Tue, 4 Jun 2024 11:01:01 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qWatxGjtUnkNpETBBn6OUASgNXrK=vkOBWDbSzFCXPDw@mail.gmail.com>
Message-ID: <CA+h8R2qWatxGjtUnkNpETBBn6OUASgNXrK=vkOBWDbSzFCXPDw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1717524075; x=1718128875; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OU3MtIb30w9Qlfpw8D/ecWcESxO2ChLkslVHXWWusLY=;
 b=GP48vg5mCgTHwHmkLmz5YfFgCZxdX+JcYy1kNYIBNZjBnT/bcYy+RDrtol94OPd6Xp
 ca328ehymhiQeJAmQWrDDiU+r4v6dJpjAg91yMhldzSt6WHrficYYVhEni/fSIMskU3S
 23Pe1lqjuhx/XHyM40xnirrfEl+4K6jQNJ2k/lT7K3rRspQPMW9N6heZ+9uqtX7YmORC
 27z6hPf+r04uMFRZ+FHk1sRQIfkMXX2TD6uoEdj0Zy5v82brasYK/eWcHpL37zfhZNQt
 kpfjpYW0vtuK0R6DzdguwBsL76coVJDDNvx5vJJFWhScdB1GVbJ5qTVl4GVVhe1KFYBF
 zLVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=GP48vg5m
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to v2.27.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8317096430726284891=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8317096430726284891==
Content-Type: multipart/alternative; boundary="00000000000043666c061a143cfd"

--00000000000043666c061a143cfd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yann,

On Tue, Jun 4, 2024, 9:18=E2=80=AFAM Yann E. MORIN <yann.morin.1998@free.fr=
> wrote:

> Christian, All,
>
> On 2024-06-04 08:47 -0700, Christian Stewart spake thusly:
> > Is this the correct version? (I'm on my phone and don't have a chance t=
o
> check
> > right now).
> > [15]
> https://mirror.skiffos.com/docker-compose/docker-compose-2.27.0-go2.tar.g=
z
> > It seems to me that there is a difference between either Go versions
> vendor/
> > format OR there is a difference between architectures (amd64 or arm).
> > Hopefully we can tell the difference from the tarball above
>
> The deltas are all of the form of that one:
>
> --- docker-compose-2.27.0-go2.tar.42e9d2.hex    2024-06-04
> 18:07:33.538588495 +0200
> +++ docker-compose-2.27.0-go2.tar.448eaf.hex    2024-06-04
> 18:07:39.737437043 +0200
> @@ -7,7 +7,7 @@
>  00000060  00 00 00 00 30 30 30 30  36 34 34 00 30 30 30 30
> |....0000644.0000|
>  00000070  30 30 30 00 30 30 30 30  30 30 30 00 30 30 30 30
> |000.0000000.0000|
>  00000080  30 30 30 30 30 30 35 00  31 34 36 31 32 32 35 33
> |0000005.14612253|
> -00000090  32 33 36 00 30 31 34 31  31 35 00 20 30 00 00 00 |236.014115.
> 0...|
> +00000090  32 33 36 00 30 31 35 33  35 35 00 20 30 00 00 00 |236.015355.
> 0...|
>  000000a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
>  000000b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
>  000000c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> @@ -18,8 +18,8 @@
>  00000110  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
>  00000120  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
>  00000130  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> -00000140  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> -00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> +00000140  00 00 00 00 00 00 00 00  00 30 30 30 30 30 30 30
> |.........0000000|
> +00000150  00 30 30 30 30 30 30 30  00 00 00 00 00 00 00 00
> |.0000000........|
>  00000160  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
>  00000170  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
>  00000180  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
>
> The --- is the archive Peter and I generated, the +++ is yours.
>
> What this shows, is that the dev major/minor fields are NULs for us,
> while they are 0 (zero), ASCII 0x30) in your case.
>
> This is exactly the change that went in in tar 1.35: our archives were
> generated with tar 1.35, yours with an older tar (presumably, 1.34).
>
> Peter had a similar issue, as he used to set the TAR environment
> variable to point to a pre-built tar 1.35, like so:
>
>     $ TAR=3Dtar-1.35 make source
>
> Are you doing something similar by chance?
>

I'm using "make foo-extract" and then hashing the file in dl/

Why is the buildroot host tar not used for this?

Thanks!
Christian

--00000000000043666c061a143cfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Yann,<br><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Jun 4, 2024, 9:18=E2=80=AFAM Yann E. MORI=
N &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Christian, All,<br>
<br>
On 2024-06-04 08:47 -0700, Christian Stewart spake thusly:<br>
&gt; Is this the correct version? (I&#39;m on my phone and don&#39;t have a=
 chance to check<br>
&gt; right now).<br>
&gt; [15]<a href=3D"https://mirror.skiffos.com/docker-compose/docker-compos=
e-2.27.0-go2.tar.gz" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//mirror.skiffos.com/docker-compose/docker-compose-2.27.0-go2.tar.gz</a><br=
>
&gt; It seems to me that there is a difference between either Go versions v=
endor/<br>
&gt; format OR there is a difference between architectures (amd64 or arm).=
=C2=A0<br>
&gt; Hopefully we can tell the difference from the tarball above<br>
<br>
The deltas are all of the form of that one:<br>
<br>
--- docker-compose-2.27.0-go2.tar.42e9d2.hex=C2=A0 =C2=A0 2024-06-04 18:07:=
33.538588495 +0200<br>
+++ docker-compose-2.27.0-go2.tar.448eaf.hex=C2=A0 =C2=A0 2024-06-04 18:07:=
39.737437043 +0200<br>
@@ -7,7 +7,7 @@<br>
=C2=A000000060=C2=A0 00 00 00 00 30 30 30 30=C2=A0 36 34 34 00 30 30 30 30 =
|....0000644.0000|<br>
=C2=A000000070=C2=A0 30 30 30 00 30 30 30 30=C2=A0 30 30 30 00 30 30 30 30 =
|000.0000000.0000|<br>
=C2=A000000080=C2=A0 30 30 30 30 30 30 35 00=C2=A0 31 34 36 31 32 32 35 33 =
|0000005.14612253|<br>
-00000090=C2=A0 32 33 36 00 30 31 34 31=C2=A0 31 35 00 20 30 00 00 00 |236.=
014115. 0...|<br>
+00000090=C2=A0 32 33 36 00 30 31 35 33=C2=A0 35 35 00 20 30 00 00 00 |236.=
015355. 0...|<br>
=C2=A0000000a0=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00 =
|................|<br>
=C2=A0000000b0=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00 =
|................|<br>
=C2=A0000000c0=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00 =
|................|<br>
@@ -18,8 +18,8 @@<br>
=C2=A000000110=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00 =
|................|<br>
=C2=A000000120=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00 =
|................|<br>
=C2=A000000130=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00 =
|................|<br>
-00000140=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00 |....=
............|<br>
-00000150=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00 |....=
............|<br>
+00000140=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 30 30 30 30 30 30 30 |....=
.....0000000|<br>
+00000150=C2=A0 00 30 30 30 30 30 30 30=C2=A0 00 00 00 00 00 00 00 00 |.000=
0000........|<br>
=C2=A000000160=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00 =
|................|<br>
=C2=A000000170=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00 =
|................|<br>
=C2=A000000180=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00 =
|................|<br>
<br>
The --- is the archive Peter and I generated, the +++ is yours.<br>
<br>
What this shows, is that the dev major/minor fields are NULs for us,<br>
while they are 0 (zero), ASCII 0x30) in your case.<br>
<br>
This is exactly the change that went in in tar 1.35: our archives were<br>
generated with tar 1.35, yours with an older tar (presumably, 1.34).<br>
<br>
Peter had a similar issue, as he used to set the TAR environment<br>
variable to point to a pre-built tar 1.35, like so:<br>
<br>
=C2=A0 =C2=A0 $ TAR=3Dtar-1.35 make source<br>
<br>
Are you doing something similar by chance?<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m using &quot;make foo-extr=
act&quot; and then hashing the file in dl/</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Why is the buildroot host tar not used for this?</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Thanks!</div><div dir=3D"auto">=
Christian</div></div>

--00000000000043666c061a143cfd--

--===============8317096430726284891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8317096430726284891==--
