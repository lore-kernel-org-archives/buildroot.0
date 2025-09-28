Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D64CAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 19:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F9D34063A;
	Sun, 28 Sep 2025 19:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwPL7cprFExh; Sun, 28 Sep 2025 19:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8921A4054C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8921A4054C;
	Sun, 28 Sep 2025 19:41:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB111111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 19:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C16FF80D55
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 19:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sa6p2Nim0PmZ for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 19:41:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=74.208.4.196;
 helo=mout.perfora.net; envelope-from=alex@alexmclain.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA9A780D54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA9A780D54
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA9A780D54
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 19:41:27 +0000 (UTC)
Received: from mail-pj1-f45.google.com ([209.85.216.45]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id
 0M2KNW-1uDBZ42GEm-00t33g
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 21:41:26 +0200
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3307de086d8so3359389a91.2
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 12:41:26 -0700 (PDT)
X-Gm-Message-State: AOJu0YxyFBjaknTBpXU5mvIUwHRoZAi9zjj0TTsK0f0C55wujTaLBZ7h
 4s55p3eNsRw/NvE47ysTJpavwUluN/1yPvLqrfGrA5lsjgrIe0wkkFq6+RYOBAZCUgSrEOjvrCd
 /RUjRMn1RoqPIf+ZRHsi9Y7aGo1kuSO8=
X-Google-Smtp-Source: AGHT+IFBWrt8D078XXvS5j7FUB4BUpBXJRf15NYmzns1mt1SfptFR+Dyx6KRhIyUv1ftPTa6dFgvSsVvBxYAeUdrwCI=
X-Received: by 2002:a17:90b:4c04:b0:334:18f9:8008 with SMTP id
 98e67ed59e1d1-3342a2701e7mr16079143a91.8.1759088485573; Sun, 28 Sep 2025
 12:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250915033631.2230670-1-alex@alexmclain.com>
In-Reply-To: <20250915033631.2230670-1-alex@alexmclain.com>
From: Alex McLain <alex@alexmclain.com>
Date: Sun, 28 Sep 2025 12:41:14 -0700
X-Gmail-Original-Message-ID: <CAOLSxMWDhn_75qiznCwSsHwEMDuaiZFzuso8qu8aifhzyh7sAg@mail.gmail.com>
X-Gm-Features: AS18NWDMNoyi7pMdQ1kHhkD5UQBwOYpI1-mJFL6qDervCApEqzLPt12LwEe4GLA
Message-ID: <CAOLSxMWDhn_75qiznCwSsHwEMDuaiZFzuso8qu8aifhzyh7sAg@mail.gmail.com>
To: buildroot@buildroot.org
X-Provags-ID: V03:K1:Kqjz3dxEqhD3m+2NtJyfjk1hPMHc+UxwWWUYCvqM1/VXIXYERL2
 JFL0lajNbktJv8uE+/hiJAg72JYy/qWiVGbjkPQNFUvImmjD9+UQmDSnDFiv0RIH6EO3m5H
 Ax+pfcNe1NqzOfLyOgqoIoIh+Z4MuJtcxNPXCfJH22nPq2a+0arN/YQKGn1QrK2IIbywCnk
 oG3hlmueamyJ/5Yk2A3yg==
UI-OutboundReport: notjunk:1;M01:P0:Zns7pIx3Zzw=;oGfW3NY1UG6w97Y5kw7DsxBtO1M
 u9WN8ThLm8Dlxu5tnDd3MGUNyxo/AROmGedmHGaGyYI1jBeYY20ravYyM/uSsWKbPnSMCQEcG
 uijSQxkVNW2XuWaG+gJRDZhRfGCW4aE/5syekPzVZF118qc66R7dtq6jLSKpiTZhnovQ9xjUM
 7CPmyiNrYtk4WyD/0rQ8ErOjMSS5UTuTXUN9pBxNev0r+kTomp7IYFuhuj629mRr65PNbXvMC
 xZuFk+up/hvKaMMIoHo3SLwl10dD3gaxcvD7WkCCTQx1SY8ASox4SLwswVWqM7DXOZxWPnnLn
 XXoChG/tJj3Cuu90tV2B5OOP5zxRZKBeM42C+4c669e4h62mPx1TOFsC00SBPmxx/I70vHl1t
 B58B+ZHqHxVPyb4dyj+lJ2VRoWmDWaHhgt9o71H8ER9M8EQe1x2k4lOfVmKKTwbH8WrSGaOk1
 bF0y5Uoch/msv+Qp+mTXSUTx6P9b4J7o5amZndky5Jr8YXU+f/dk9H/ovwEqDCCLoYBlOgFqN
 FnwabWqw3Evna4N02D6RD4TFrR3qfp4ymvSCJA8lm2R/0q5KDD5TpD8d+PO4ZOP3Q5+W7pbB+
 pt2yy0u7MpuiKTFbcyUv4al/Ao06tyQJNSgi+c2IZF5UywMKJ/X/dOBcivOB9f3E7C9n5uUie
 Xd2tFHL3BNBy7vEhVLiTWrLNQgCc7rX58AUYROZIKCPgTmtY4orQDwEODxbebY6K32c1mxp+n
 AukFUM6IPMdNCwFfUYVrdr+vL/pZFXCus252JJw0ELNE5FtxtLNc+yVEjs2qKOPsLEf75LAWJ
 1nI2Y7VZR2fG0QCWXE6zlQvQx/V2pnCJ90HqP+aT+6ufWfXXr4Of1ODZ25QpBIpPxFHd3eSPy
 YgB3FIXyFUXjvrAh1y73N/qUhPwVYuFetUhQXjljhpzKBj4YtcSFsr7imo/U90oBfLYl1eECC
 aIEvGK/OARJHyJP1XgpNPrHvyi5GkhrYzZHTI/AxAmM6GP+5Lea40wBuKQn9NRhI9mkR7JBYk
 i6d0DqNcJYSbVJrKhthnFiKRlcNJ7fnzac2bolzqh19hxzy+ER86VcuMG4NIsbGRQb0J1HECR
 mLGpWhTd2lApRpln7yfWb93EKU2w17GVopq6IM3QPj+OdF/kVp3LYpS1lxZirtSc9NkDMd6dA
 vX4FQoBCDMnqbhJ3dGeC/L25zZf06+CJYcYDpNB4mwElcFb/SAXk4SK6+md4E6dWciRCY6Js4
 TCBheovP72RUVldX3JKsmQgODiyH15qw0i86irf3IAkJG9zPoMWd3mwb6H7m9NnVzSoxHREvb
 RBmWFHpp7KhZZVOnGApIWCpUQX5MhivJlxs/RuEsPGJ2ZQ0mUiIQwmLZiP6AjSM6j4OHKTINX
 wDewq/HjjNNoJeqJ3kFIq3Khm/6fwhp3vjCo4EIpWglnCZPfwwp4qGfCnq+C6QJMCbL3UnhWX
 yss0fU6/8XxyUC8tmSQwhVFw/5AVbuQsTkEX3HR2BE7BQ4EIb5/8HJ77UsoQopDsyiawJAqYE
 L/tkK8nzjm/5AAXRJ6RJzjN150x8Tpgv8dtyi+NasIu7P6VqmSWecDYqsCVZsMD72OICSGnRs
 TtF8GnUbpNdv3EnLCJqUyU8jVJhARQiFk6+Cgr5G5OXztcDWXixGzFSvPXttFgx83bCgZvwVS
 E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=alexmclain.com
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add support for
 Intel 6E Ty architecture
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: multipart/mixed; boundary="===============4397438417123922917=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4397438417123922917==
Content-Type: multipart/alternative; boundary="0000000000004faaa5063fe1b496"

--0000000000004faaa5063fe1b496
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, just checking in to see if there are any changes I need to make for
this patch to be merged. Thanks!

On Sun, Sep 14, 2025 at 8:36=E2=80=AFPM Alex McLain <alex@alexmclain.com> w=
rote:

> Signed-off-by: Alex McLain <alex@alexmclain.com>
> ---
>  package/linux-firmware/linux-firmware.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/linux-firmware/linux-firmware.mk
> b/package/linux-firmware/linux-firmware.mk
> index 7f1a789057..21d29fa945 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -642,7 +642,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES +=3D
> LICENCE.iwlwifi_firmware
>  endif
>
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
> -LINUX_FIRMWARE_FILES +=3D iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
> +LINUX_FIRMWARE_FILES +=3D iwlwifi-{so,ty}-a0-gf-a0*.{ucode,pnvm}
>  LINUX_FIRMWARE_ALL_LICENSE_FILES +=3D LICENCE.iwlwifi_firmware
>  endif
>
> --
> 2.25.1
>
>

--0000000000004faaa5063fe1b496
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, just checking in to see if there are any changes I nee=
d to make for this patch to be merged. Thanks!</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun,=
 Sep 14, 2025 at 8:36=E2=80=AFPM Alex McLain &lt;<a href=3D"mailto:alex@ale=
xmclain.com">alex@alexmclain.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Signed-off-by: Alex McLain &lt;<a href=3D"=
mailto:alex@alexmclain.com" target=3D"_blank">alex@alexmclain.com</a>&gt;<b=
r>
---<br>
=C2=A0package/linux-firmware/<a href=3D"http://linux-firmware.mk" rel=3D"no=
referrer" target=3D"_blank">linux-firmware.mk</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/package/linux-firmware/<a href=3D"http://linux-firmware.mk" re=
l=3D"noreferrer" target=3D"_blank">linux-firmware.mk</a> b/package/linux-fi=
rmware/<a href=3D"http://linux-firmware.mk" rel=3D"noreferrer" target=3D"_b=
lank">linux-firmware.mk</a><br>
index 7f1a789057..21d29fa945 100644<br>
--- a/package/linux-firmware/<a href=3D"http://linux-firmware.mk" rel=3D"no=
referrer" target=3D"_blank">linux-firmware.mk</a><br>
+++ b/package/linux-firmware/<a href=3D"http://linux-firmware.mk" rel=3D"no=
referrer" target=3D"_blank">linux-firmware.mk</a><br>
@@ -642,7 +642,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES +=3D LICENCE.iwlwifi_f=
irmware<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)<br>
-LINUX_FIRMWARE_FILES +=3D iwlwifi-so-a0-gf-a0*.{ucode,pnvm}<br>
+LINUX_FIRMWARE_FILES +=3D iwlwifi-{so,ty}-a0-gf-a0*.{ucode,pnvm}<br>
=C2=A0LINUX_FIRMWARE_ALL_LICENSE_FILES +=3D LICENCE.iwlwifi_firmware<br>
=C2=A0endif<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000004faaa5063fe1b496--

--===============4397438417123922917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4397438417123922917==--
