Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D3FC678DC
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 13:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 514EC40382;
	Wed, 11 Jun 2025 13:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6vBwZeeDZc5; Wed, 11 Jun 2025 13:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7E340C2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E7E340C2D;
	Wed, 11 Jun 2025 13:58:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A9BC183
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 13:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 170E2403B8
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 13:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGtMHfuB6e9C for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 13:58:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ACC4F400B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACC4F400B1
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACC4F400B1
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 13:58:10 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-32b019bdeaaso28611551fa.0
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 06:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749650288; x=1750255088;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LFW9dqxUb/rCdEttwFER6fmlhLTXH/l2TjLEKA1VjUk=;
 b=l4fm1TRUMYyh/XqjLamdwY6L5FO2wdF+X+7GyJTxXGR6+wtYhpsamUqysXso9dCpZD
 K6xVFk7Sg91y70VN7jfdF1iIcFgo2bEOofoImhQ9tjGzmJtC52Xzd995qwGkFKwxEblm
 A1ELjgliL8a/IwXov9JG0VEKBLEN4H5eLYcpbfLP3hyDya1iGmVmEj4TCEHg3g1a5RvH
 uqpkQJKH8bSoXjy4FBpWARNYVNPNznKGTAU/CbXBz97ikw1PUSxIqCoz4SOEqVVqSqLu
 y2D9+qZOjLm8mnR8Ig/R679uMMjrjkm8sRS+yThcpwb92pGTGKUVseejI/CJ8zMM4eIV
 if7g==
X-Gm-Message-State: AOJu0YyrEYKaxnMQlEqSlOlemPoNqa6VQ9+JVHHuyQfoFTaymcxb5gkf
 C7pp1mB2MB3TGFfh60fOPKHkAHNNptC9MkhuQu+XTLBm6Bh1KVHrMcW9zLbbMlNw5gBiw+gnk8n
 demztR09Wv2V2TLRfxU/UnKrKQmwu74fUdw==
X-Gm-Gg: ASbGnctUztbLfNIlmEESLtC4yuTQNziD8TRgIJpc5P/GPc23MCMYu8Dzhl91ATjxwjQ
 Gxz5nyVTijGPWcZOrvtvP2xAHGJ+PY+3u9d21sVcN5oT1sySO5F95zud7DpUk5JypvTeHrCz5mK
 zA4DmIaKy11dc7+Ido3PQQqdjYthS0MU9WRkJ6aDacE3eWFRGg13lilAw=
X-Google-Smtp-Source: AGHT+IGT6ZnnbUzGOCQmiLEWf6zj5eK9QKadyvMzw+EB3fX8EJ6ZY9WuIESZy/j81/iZtf8WdI/GtYulKjwuimm44rk=
X-Received: by 2002:a05:651c:1547:b0:32a:866e:2ed8 with SMTP id
 38308e7fff4ca-32b21dc22d3mr10923331fa.28.1749650288042; Wed, 11 Jun 2025
 06:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250611111640.702572-1-alex.bennee@linaro.org>
 <20250611111640.702572-5-alex.bennee@linaro.org>
 <CAEyMn7Yu_ZAPhaAOSHO7K+LbbVAGQqe84_UCe4uKqnJ+4UbDsQ@mail.gmail.com>
 <87jz5ijsbw.fsf@draig.linaro.org>
In-Reply-To: <87jz5ijsbw.fsf@draig.linaro.org>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 11 Jun 2025 15:57:56 +0200
X-Gm-Features: AX0GCFtrvuDZJIcTRESkZ5kl5XWanX5WydaaL41RiWQToeUFC60ghrDgxRgP7D0
Message-ID: <CAEyMn7Y6fJ_=KsUqw8+H0o28LnKDs-cyRjHfs5NkU+=AuruYGQ@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749650288; x=1750255088; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LFW9dqxUb/rCdEttwFER6fmlhLTXH/l2TjLEKA1VjUk=;
 b=KyFZ9x4dJ6Ph4U/oQYVWjo36bcimnrVbsq7A+JnwYFKKCvtMsehyQaD6jetSOm5lG/
 Iz+Q4/rdh8zKxc+l5k4iLvseZvbB2tFrUo/WN6vnb3tnBnOn6zZBGGyC7VauWwpnyRkK
 SFOAsEq5JhipUEIi1W7lBywDq2zDaVURbfx2T+Ettt7x3WOeqGDoGXa06xJJVt40btun
 1NTZXeyG3m3lH+znvUSMG0pL+3n6PB23Wq3x9pURevJ5TLzLlpUAF5U0CruiJ+mxsqhQ
 NL55/4qd2PP+33Jk3x5e0aS4vNpDVhhrzNUw8YzOMmu4zaPntoRDAJPQfemBtshDjt79
 XzUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KyFZ9x4d
Subject: Re: [Buildroot] [PATCH v6 4/5] package/vkmark: add vkmark
 benchmarking tool
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
Content-Type: multipart/mixed; boundary="===============2432911332206311638=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2432911332206311638==
Content-Type: multipart/alternative; boundary="000000000000e6687906374c3342"

--000000000000e6687906374c3342
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Am Mi., 11. Juni 2025 um 15:55 Uhr schrieb Alex Benn=C3=A9e <
alex.bennee@linaro.org>:

> Heiko Thiery <heiko.thiery@gmail.com> writes:
>
> > Hi Alex,
> >
> > Am Mi., 11. Juni 2025 um 13:16 Uhr schrieb Alex Benn=C3=A9e <
> alex.bennee@linaro.org>:
> >
> >  We build from a recent HEAD to ensure we have the fixes to better
> >  handle the missing KHR_display extension.
> >
> >  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >
> > I tried to build vkmark against, now with wayland enabled and I see thi=
s:
> >
> > Program /usr/bin/wayland-scanner found: NO
> >
> >
> ../out-weston/build/vkmark-36e7d9b2ecf723e876add65534e95f55ec1bc79d/src/m=
eson.build:116:22:
> ERROR: Program
> > '/usr/bin/wayland-scanner' not found or not executable
>
> Hmm this seems odd. At least wayland-scanner has a pkgconf variable:
>
>   =F0=9F=95=9914:51:21 alex@draig:buildroot.git/builds/x86_64  on =EE=82=
=A0
> add-virtio-vulkan-vkmark:master [$!?=E2=87=A1]
>   =E2=9E=9C  pkg-config --variable=3Dwayland_scanner  wayland-scanner
>   /usr/bin/wayland-scanner
>   =F0=9F=95=9914:52:16 alex@draig:buildroot.git/builds/x86_64  on =EE=82=
=A0
> add-virtio-vulkan-vkmark:master [$!?=E2=87=A1]
>   =E2=9E=9C  ./host/bin/pkgconf --variable=3Dwayland_scanner  wayland-sca=
nner
>
> /home/alex/lsrc/tests/buildroot.git/builds/x86_64/host/bin/wayland-scanne=
r
>   =F0=9F=95=9914:52:29 alex@draig:buildroot.git/builds/x86_64  on =EE=82=
=A0
> add-virtio-vulkan-vkmark:master [$!?=E2=87=A1]
>   =E2=9E=9C
>
> And the meson should find it with the normal dependency logic:
>
>     wayland_scanner =3D
> find_program(wayland_scanner_dep.get_variable('wayland_scanner'))
>
> >
> > A full log can be found at
> >
> /srv/storage/hthiery/sources/sa67/out-weston/build/vkmark-36e7d9b2ecf723e=
876add65534e95f55ec1bc79d/buildroot-build/meson-logs/meson-log.txt
> >
> > make[1]: *** [package/pkg-generic.mk:263:
> >
> /srv/storage/hthiery/sources/sa67/out-weston/build/vkmark-36e7d9b2ecf723e=
876add65534e95f55ec1bc79d/.stamp_configured]
> > Error 1
> > make: *** [Makefile:23: _all] Error 2
> >
> > It looks like here we have something similar like before. It looks
> under  '/usr/bin/wayland-scanner' but the prefix is missing.
> <snip>
>
> Yeah I see the same:
>
>   Found pkg-config: YES
> (/home/alex/lsrc/tests/buildroot.git/builds/arm64/host/bin/pkgconf) 2.3.0
>
>
>   Run-time dependency vulkan found: YES 1.4.317
>
>
>   Library dl found: YES
>
>
>   Found CMake: /usr/bin/cmake (3.31.6)
>
>
>   Run-time dependency glm found: YES 1.0.0
>
>
>   Run-time dependency assimp found: YES 5.4.3
>
>
>   Run-time dependency xcb found: YES 1.15
>
>
>   Run-time dependency xcb-icccm found: YES 0.4.2
>
>
>   Run-time dependency wayland-client found: YES 1.23.1
>
>
>   Run-time dependency wayland-protocols found: YES 1.42
>
>
>   Run-time dependency wayland-scanner found: YES 1.23.1
>
>
>   Run-time dependency libdrm found: YES 2.4.124
>
>
>   Run-time dependency gbm found: YES 25.1.3
>
>
>   Program python3 found: YES
> (/home/alex/lsrc/tests/buildroot.git/builds/arm64/host/bin/python3)
>
>   Program /usr/bin/wayland-scanner found: YES (/usr/bin/wayland-scanner)
>
>
yes .. the program is installed on your machine under
/usr/bin/wayland-scanner (from your distro) ... but on my build-server it
is not ;-/


> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

--000000000000e6687906374c3342
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGksPC9kaXY+PGJyPjxkaXYgY2xhc3M9Imdt
YWlsX3F1b3RlIGdtYWlsX3F1b3RlX2NvbnRhaW5lciI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9Imdt
YWlsX2F0dHIiPkFtIE1pLiwgMTEuIEp1bmkgMjAyNSB1bSAxNTo1NcKgVWhyIHNjaHJpZWIgQWxl
eCBCZW5uw6llICZsdDs8YSBocmVmPSJtYWlsdG86YWxleC5iZW5uZWVAbGluYXJvLm9yZyI+YWxl
eC5iZW5uZWVAbGluYXJvLm9yZzwvYT4mZ3Q7Ojxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0i
Z21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6
MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+SGVpa28gVGhpZXJ5
ICZsdDs8YSBocmVmPSJtYWlsdG86aGVpa28udGhpZXJ5QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmhlaWtvLnRoaWVyeUBnbWFpbC5jb208L2E+Jmd0OyB3cml0ZXM6PGJyPg0KPGJyPg0KJmd0
OyBIaSBBbGV4LDxicj4NCiZndDs8YnI+DQomZ3Q7IEFtIE1pLiwgMTEuIEp1bmkgMjAyNSB1bSAx
MzoxNiBVaHIgc2NocmllYiBBbGV4IEJlbm7DqWUgJmx0OzxhIGhyZWY9Im1haWx0bzphbGV4LmJl
bm5lZUBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+YWxleC5iZW5uZWVAbGluYXJvLm9yZzwv
YT4mZ3Q7Ojxicj4NCiZndDs8YnI+DQomZ3Q7wqAgV2UgYnVpbGQgZnJvbSBhIHJlY2VudCBIRUFE
IHRvIGVuc3VyZSB3ZSBoYXZlIHRoZSBmaXhlcyB0byBiZXR0ZXI8YnI+DQomZ3Q7wqAgaGFuZGxl
IHRoZSBtaXNzaW5nIEtIUl9kaXNwbGF5IGV4dGVuc2lvbi48YnI+DQomZ3Q7PGJyPg0KJmd0O8Kg
IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFsZXguYmVu
bmVlQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5hbGV4LmJlbm5lZUBsaW5hcm8ub3JnPC9h
PiZndDs8YnI+DQomZ3Q7PGJyPg0KJmd0OyBJIHRyaWVkIHRvIGJ1aWxkIHZrbWFyayBhZ2FpbnN0
LCBub3cgd2l0aCB3YXlsYW5kIGVuYWJsZWQgYW5kIEkgc2VlIHRoaXM6PGJyPg0KJmd0Ozxicj4N
CiZndDsgUHJvZ3JhbSAvdXNyL2Jpbi93YXlsYW5kLXNjYW5uZXIgZm91bmQ6IE5PPGJyPg0KJmd0
Ozxicj4NCiZndDsgLi4vb3V0LXdlc3Rvbi9idWlsZC92a21hcmstMzZlN2Q5YjJlY2Y3MjNlODc2
YWRkNjU1MzRlOTVmNTVlYzFiYzc5ZC9zcmMvbWVzb24uYnVpbGQ6MTE2OjIyOiBFUlJPUjogUHJv
Z3JhbTxicj4NCiZndDsgJiMzOTsvdXNyL2Jpbi93YXlsYW5kLXNjYW5uZXImIzM5OyBub3QgZm91
bmQgb3Igbm90IGV4ZWN1dGFibGU8YnI+DQo8YnI+DQpIbW0gdGhpcyBzZWVtcyBvZGQuIEF0IGxl
YXN0IHdheWxhbmQtc2Nhbm5lciBoYXMgYSBwa2djb25mIHZhcmlhYmxlOjxicj4NCjxicj4NCsKg
IPCflZkxNDo1MToyMSBhbGV4QGRyYWlnOmJ1aWxkcm9vdC5naXQvYnVpbGRzL3g4Nl82NMKgIG9u
IO6CoCBhZGQtdmlydGlvLXZ1bGthbi12a21hcms6bWFzdGVyIFskIT/ih6FdIDxicj4NCsKgIOKe
nMKgIHBrZy1jb25maWcgLS12YXJpYWJsZT13YXlsYW5kX3NjYW5uZXLCoCB3YXlsYW5kLXNjYW5u
ZXI8YnI+DQrCoCAvdXNyL2Jpbi93YXlsYW5kLXNjYW5uZXI8YnI+DQrCoCDwn5WZMTQ6NTI6MTYg
YWxleEBkcmFpZzpidWlsZHJvb3QuZ2l0L2J1aWxkcy94ODZfNjTCoCBvbiDugqAgYWRkLXZpcnRp
by12dWxrYW4tdmttYXJrOm1hc3RlciBbJCE/4oehXSA8YnI+DQrCoCDinpzCoCAuL2hvc3QvYmlu
L3BrZ2NvbmYgLS12YXJpYWJsZT13YXlsYW5kX3NjYW5uZXLCoCB3YXlsYW5kLXNjYW5uZXI8YnI+
DQrCoCAvaG9tZS9hbGV4L2xzcmMvdGVzdHMvYnVpbGRyb290LmdpdC9idWlsZHMveDg2XzY0L2hv
c3QvYmluL3dheWxhbmQtc2Nhbm5lcjxicj4NCsKgIPCflZkxNDo1MjoyOSBhbGV4QGRyYWlnOmJ1
aWxkcm9vdC5naXQvYnVpbGRzL3g4Nl82NMKgIG9uIO6CoCBhZGQtdmlydGlvLXZ1bGthbi12a21h
cms6bWFzdGVyIFskIT/ih6FdIDxicj4NCsKgIOKenDxicj4NCjxicj4NCkFuZCB0aGUgbWVzb24g
c2hvdWxkIGZpbmQgaXQgd2l0aCB0aGUgbm9ybWFsIGRlcGVuZGVuY3kgbG9naWM6PGJyPg0KPGJy
Pg0KwqAgwqAgd2F5bGFuZF9zY2FubmVyID0gZmluZF9wcm9ncmFtKHdheWxhbmRfc2Nhbm5lcl9k
ZXAuZ2V0X3ZhcmlhYmxlKCYjMzk7d2F5bGFuZF9zY2FubmVyJiMzOTspKTxicj4NCjxicj4NCiZn
dDs8YnI+DQomZ3Q7IEEgZnVsbCBsb2cgY2FuIGJlIGZvdW5kIGF0PGJyPg0KJmd0OyAvc3J2L3N0
b3JhZ2UvaHRoaWVyeS9zb3VyY2VzL3NhNjcvb3V0LXdlc3Rvbi9idWlsZC92a21hcmstMzZlN2Q5
YjJlY2Y3MjNlODc2YWRkNjU1MzRlOTVmNTVlYzFiYzc5ZC9idWlsZHJvb3QtYnVpbGQvbWVzb24t
bG9ncy9tZXNvbi1sb2cudHh0PGJyPg0KJmd0Ozxicj4NCiZndDsgbWFrZVsxXTogKioqIFtwYWNr
YWdlLzxhIGhyZWY9Imh0dHA6Ly9wa2ctZ2VuZXJpYy5tazoyNjMiIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPnBrZy1nZW5lcmljLm1rOjI2MzwvYT46PGJyPg0KJmd0OyAvc3J2L3N0
b3JhZ2UvaHRoaWVyeS9zb3VyY2VzL3NhNjcvb3V0LXdlc3Rvbi9idWlsZC92a21hcmstMzZlN2Q5
YjJlY2Y3MjNlODc2YWRkNjU1MzRlOTVmNTVlYzFiYzc5ZC8uc3RhbXBfY29uZmlndXJlZF08YnI+
DQomZ3Q7IEVycm9yIDE8YnI+DQomZ3Q7IG1ha2U6ICoqKiBbTWFrZWZpbGU6MjM6IF9hbGxdIEVy
cm9yIDI8YnI+DQomZ3Q7PGJyPg0KJmd0OyBJdCBsb29rcyBsaWtlIGhlcmUgd2UgaGF2ZSBzb21l
dGhpbmcgc2ltaWxhciBsaWtlIGJlZm9yZS4gSXQgbG9va3MgdW5kZXLCoCAmIzM5Oy91c3IvYmlu
L3dheWxhbmQtc2Nhbm5lciYjMzk7IGJ1dCB0aGUgcHJlZml4IGlzIG1pc3NpbmcuPGJyPg0KJmx0
O3NuaXAmZ3Q7PGJyPg0KPGJyPg0KWWVhaCBJIHNlZSB0aGUgc2FtZTo8YnI+DQo8YnI+DQrCoCBG
b3VuZCBwa2ctY29uZmlnOiBZRVMgKC9ob21lL2FsZXgvbHNyYy90ZXN0cy9idWlsZHJvb3QuZ2l0
L2J1aWxkcy9hcm02NC9ob3N0L2Jpbi9wa2djb25mKSAyLjMuMMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KwqAgUnVuLXRp
bWUgZGVwZW5kZW5jeSB2dWxrYW4gZm91bmQ6IFlFUyAxLjQuMzE3wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqA8YnI+DQrCoCBMaWJyYXJ5IGRsIGZvdW5kOiBZRVPCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCsKgIEZvdW5kIENNYWtl
OiAvdXNyL2Jpbi9jbWFrZSAoMy4zMS42KcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIDxicj4NCsKgIFJ1bi10aW1lIGRlcGVuZGVuY3kgZ2xtIGZvdW5kOiBZRVMgMS4wLjDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+DQrCoCBSdW4tdGltZSBkZXBlbmRlbmN5IGFz
c2ltcCBmb3VuZDogWUVTIDUuNC4zwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQrCoCBS
dW4tdGltZSBkZXBlbmRlbmN5IHhjYiBmb3VuZDogWUVTIDEuMTXCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoDxicj4NCsKgIFJ1bi10aW1lIGRlcGVuZGVuY3kgeGNiLWljY2NtIGZvdW5k
OiBZRVMgMC40LjLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+DQrCoCBSdW4tdGltZSBkZXBlbmRl
bmN5IHdheWxhbmQtY2xpZW50IGZvdW5kOiBZRVMgMS4yMy4xwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPg0KwqAg
UnVuLXRpbWUgZGVwZW5kZW5jeSB3YXlsYW5kLXByb3RvY29scyBmb3VuZDogWUVTIDEuNDLCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoDxicj4NCsKgIFJ1bi10aW1lIGRlcGVuZGVuY3kgd2F5bGFuZC1zY2FubmVyIGZvdW5k
OiBZRVMgMS4yMy4xwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQrCoCBSdW4tdGltZSBkZXBlbmRlbmN5IGxpYmRy
bSBmb3VuZDogWUVTIDIuNC4xMjTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCsKgIFJ1bi10
aW1lIGRlcGVuZGVuY3kgZ2JtIGZvdW5kOiBZRVMgMjUuMS4zwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqA8YnI+DQrCoCBQcm9ncmFtIHB5dGhvbjMgZm91bmQ6IFlFUyAoL2hvbWUvYWxleC9s
c3JjL3Rlc3RzL2J1aWxkcm9vdC5naXQvYnVpbGRzL2FybTY0L2hvc3QvYmluL3B5dGhvbjMpwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgPGJyPg0KwqAgUHJvZ3JhbSAvdXNyL2Jpbi93YXlsYW5kLXNjYW5uZXIgZm91bmQ6IFlFUyAo
L3Vzci9iaW4vd2F5bGFuZC1zY2FubmVyKTxicj4NCjxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+
PC9kaXY+PGRpdj55ZXMgLi4gdGhlIHByb2dyYW0gaXMgaW5zdGFsbGVkIG9uIHlvdXIgbWFjaGlu
ZSB1bmRlciAvdXNyL2Jpbi93YXlsYW5kLXNjYW5uZXIgKGZyb20geW91ciBkaXN0cm8pIC4uLiBi
dXQgb24gbXkgYnVpbGQtc2VydmVyIGl0IGlzIG5vdCA7LS88L2Rpdj48ZGl2PsKgPC9kaXY+PGJs
b2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAu
OGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDox
ZXgiPg0KLS0gPGJyPg0KQWxleCBCZW5uw6llPGJyPg0KVmlydHVhbGlzYXRpb24gVGVjaCBMZWFk
IEAgTGluYXJvPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pg0K
--000000000000e6687906374c3342--

--===============2432911332206311638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2432911332206311638==--
