Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAB1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 20:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 133EB60F0E;
	Mon, 31 Jan 2022 20:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVxE5ciOFsnY; Mon, 31 Jan 2022 20:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DE6760B50;
	Mon, 31 Jan 2022 20:38:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD3B21BF36A
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB586813BB
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fb3VhZs_1DLj for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 20:38:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8577A8139D
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 20:38:39 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id z20so21101880ljo.6
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 12:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5NudbMurzfYzXfqYC75HsOUWwHJs5U2kmLyXXzbUdTE=;
 b=q7SFOB5XIBi/jpiLyFqhbmsd4XXkLOfJzkpe4J9xs3HjOcC+x19M9PgoGHN+x8CEBY
 /+05BHghWyOAIHLpyZRJKvYYiR7jtT2fyr+KuXFFcKIr+uoUa/NT0AahrBVGh5ojkbVX
 VcK+CHyxCx54fJ1qWBo0+nSP4m5gy4pEX5WrMJUb0Godtlcx/UA1i51qBrOnq+nVl13s
 ZPOJyahoGLVRHUZIRH6qQ5b7omVi7W2YINSJ1Bn5vX74VIidry0JUtNUSwSgpqPaqdSH
 zNHwmYonhfynXDNAo6qS9NQl9G5Ay90CV/LxlsMfoRrTLa1qJm6srKcnGawH3AJsBGId
 8Tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5NudbMurzfYzXfqYC75HsOUWwHJs5U2kmLyXXzbUdTE=;
 b=41MobZRWWIWggK9oiaUy4JQuFtse/FUrKqNM99sUu0C02LcMyAu0CTaU6nPCCZWo1h
 rkvp9w1U9VToQrQSJfQuE3iD3T3JhZdQvF4IYApsS9tZwOekhmI4xfIMdx69zVwxY34K
 mSVzzzoAIB5OQbMcvxkX0pNd/PZ7eTwoojHRlwRhAsxVpdVGlxKsbKHXj02TtWhU9OOM
 JxcMON0yPLZ6c9v0yG5jfXL0Kx12ho6SLmtwCR64NgiDMb6IDKvP6hktlz6hWTVICcdF
 2jtF+Sxr3yS/nZ7luKtt/LtaS6GbFq9jXV+4IrWZi9k8/dtbfDZ/wf+j72ejgLjcBF8U
 6P9w==
X-Gm-Message-State: AOAM530W3n3EO2gLb27kEHC6Rg3vfEWdyV5NvWYGLQVsF3q3xUHbD7O6
 28eilXF3JaDqxBDbUmx6SMQUSwfKxeY=
X-Google-Smtp-Source: ABdhPJyuA1dksJBWwW4AvOGS2dOareNXfWrGDZr3e4LtLjbXlG97i/mDBxcfMfrXBEJNFoU017XS1w==
X-Received: by 2002:a05:651c:214:: with SMTP id
 y20mr13921472ljn.223.1643661517441; 
 Mon, 31 Jan 2022 12:38:37 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id bq7sm3767328lfb.210.2022.01.31.12.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 12:38:37 -0800 (PST)
Date: Mon, 31 Jan 2022 23:38:36 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <YfhIzDNP6sIsaG7J@curiosity>
References: <20220131194818.2084092-1-geomatsi@gmail.com>
 <CAGm1_ktBCO3mnWL2LBF-zEqG0pf4wBr7KKF_Gsjs5HPg+kx3tA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_ktBCO3mnWL2LBF-zEqG0pf4wBr7KKF_Gsjs5HPg+kx3tA@mail.gmail.com>
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yegor,

> Hi Sergey,
> 
> On Mon, Jan 31, 2022 at 8:48 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> >
> > Update wpa_supplicant to the latest release v2.10. Drop all the patches
> > as they have already been upstreamed. Remove from .mk file all the
> > WPA_SUPPLICANT_IGNORE_CVES records since those CVEs will not be
> > reported against the new version.
> >
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

...

> Have you tried to build wpa_supplicant without
> BR2_PACKAGE_WPA_SUPPLICANT_WPA3 and enabled
> BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING? I've got a linking error.
> I have also sent a quick and dirty patch to the hostap mailing list
> [1] but still got no answer.
> 
> [1] http://lists.infradead.org/pipermail/hostap/2022-January/040181.html

So far I have not observed that problem. I think we can handle it
independently from the revision update, adding fixup patches if needed.

I tried to reproduce it using the following wpa_supplicant configuration:

BR2_PACKAGE_WPA_SUPPLICANT=y
BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y

However build succeeded. Could you please post your wpa_supplicant
configuration snippet ? Probably the root cause is in openssl and some
of its features need to be enabled in package/wpa_supplicant/Config.in.

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
