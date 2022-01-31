Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C637C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 21:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3037F60F16;
	Mon, 31 Jan 2022 21:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOR81RKa9927; Mon, 31 Jan 2022 21:35:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78D5E60F0E;
	Mon, 31 Jan 2022 21:35:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7F31BF362
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 475DD401C9
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1My-1Vqpru9 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 21:35:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C480400E3
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 21:35:38 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id m11so29609519edi.13
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 13:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g3/0Ifan9Or3JAfdAcWpwH+HzoTyGb2XtUaHL/o5y6Q=;
 b=ZudYXEw5Ud7/ToyZfP+IhIDvvKE0KZTb6MXbSl/JvYflWk5msvyZXO7iy3rne5+m9Z
 y3sv15jx9Zm0HFlFOQdCE1h8aEm6rjkHvFiyYV3KeIPqcE2uJ55HynSG4hIL90/CPeYQ
 W4yaa7vg6Y0CTI8/CD/MV8x/ws22x5iA5DxmKGmm4Q6o4uP2CbeiZY9kXg2EGyHzQvtH
 3BeY80u+QGxS2/6vmqwsHSc6KT4cRk6VNubWw/esqHVAn3+t2Cm7kaP4rGKdpFLVQCxD
 TPUAh49m8056gXR4fs530dlOMdAMpURsoBPxQ4nrq5kekTiVEinRhMP2IQPv62p/XAIQ
 jNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g3/0Ifan9Or3JAfdAcWpwH+HzoTyGb2XtUaHL/o5y6Q=;
 b=LKeKRtzBZeRPZKWcluRWd9sYOokTcKAE9NkCAr+NZi4pKRyzwmRh639yvGmEprIq17
 UQxNvApMe22HvflRofsZ0py5K8Cu7SS1gQI2sfBFRcsgf8rgmfp+c/yFxhVYFcRmnSWr
 I7Ni/3gVMlSz1Sz1WDmfavU02TB5Ihi00lKSGocS+8i/Iqd0pJRI7GQE8QVnTwsbK6Md
 Buc4LgGhNDbf6xA2qm3nTtU5QlXyXMShppfLoaVg75Yo7nGstK+tKvaxdYz/Zdp8VFLA
 2zsJL43kqg6AaY96Nipg+3yWeKtHhzSaR6GmcmHbPxiZ1oUZ0FeQGHp/VcKbUPk8d2X+
 qFrQ==
X-Gm-Message-State: AOAM5336eQMn/0budQ9sJGvye8+0wsImut6ZYn3/GmkvTALHiNHm0WqF
 NdWhub04ZafyUYrg5O1RrCILSzjDhzckkdrQgG8=
X-Google-Smtp-Source: ABdhPJytAPTetYo0GUx+u7ZbsxE5+v6Knqau6M892smq8567Y5Om0wg7O5FZzn8XjFsBIDJbRnQ8xw1AKawYrPd6dHo=
X-Received: by 2002:a05:6402:358e:: with SMTP id
 y14mr22473238edc.136.1643664936632; 
 Mon, 31 Jan 2022 13:35:36 -0800 (PST)
MIME-Version: 1.0
References: <20220131194818.2084092-1-geomatsi@gmail.com>
 <CAGm1_ktBCO3mnWL2LBF-zEqG0pf4wBr7KKF_Gsjs5HPg+kx3tA@mail.gmail.com>
 <YfhIzDNP6sIsaG7J@curiosity>
In-Reply-To: <YfhIzDNP6sIsaG7J@curiosity>
Date: Mon, 31 Jan 2022 22:32:45 +0100
Message-ID: <CAGm1_ku=iCDJZqDpDPoQAnF7YwtCtKdo3OZbdyb8yJ6Wv5wRXA@mail.gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/wpa_supplicant: bump version to
 2.10
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jan 31, 2022 at 9:38 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hello Yegor,
>
> > Hi Sergey,
> >
> > On Mon, Jan 31, 2022 at 8:48 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > >
> > > Update wpa_supplicant to the latest release v2.10. Drop all the patches
> > > as they have already been upstreamed. Remove from .mk file all the
> > > WPA_SUPPLICANT_IGNORE_CVES records since those CVEs will not be
> > > reported against the new version.
> > >
> > > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
>
> ...
>
> > Have you tried to build wpa_supplicant without
> > BR2_PACKAGE_WPA_SUPPLICANT_WPA3 and enabled
> > BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING? I've got a linking error.
> > I have also sent a quick and dirty patch to the hostap mailing list
> > [1] but still got no answer.
> >
> > [1] http://lists.infradead.org/pipermail/hostap/2022-January/040181.html
>
> So far I have not observed that problem. I think we can handle it
> independently from the revision update, adding fixup patches if needed.
>
> I tried to reproduce it using the following wpa_supplicant configuration:
>
> BR2_PACKAGE_WPA_SUPPLICANT=y
> BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
> BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
>
> However build succeeded. Could you please post your wpa_supplicant
> configuration snippet ? Probably the root cause is in openssl and some
> of its features need to be enabled in package/wpa_supplicant/Config.in.

I have pinned it down:

BR2_PACKAGE_WPA_SUPPLICANT=y
BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
BR2_PACKAGE_WPA_SUPPLICANT_EAP=y

It is BR2_PACKAGE_WPA_SUPPLICANT_EAP option the selects NEED_SHA384.

Regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
