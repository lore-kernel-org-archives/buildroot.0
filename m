Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD245C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 12:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26FB04019D;
	Sat,  1 Jan 2022 12:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w3sX82ccNqsX; Sat,  1 Jan 2022 12:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AB1A40133;
	Sat,  1 Jan 2022 12:19:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F58B1BF39A
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 12:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D76F82881
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 12:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b72l2XJDi1_H for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 12:19:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98B5A827C5
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 12:19:57 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id x6so12095826lfa.5
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 04:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=alm7PPrVc5PoXo+3xCq2KwRBb6Q/2xA6XSD3iCzrNlg=;
 b=UKiIJVSKGBjoHWTkTwjfOvrt8N6nEiUva6LVLwse4UvdNY6aP3PGe6MHNYIAXd11cr
 1y+0LUyAfe2fwxzxpQQV9HMMmQTqdW6+0gUKBqZbwtB86Tmvg9Mkb4AaFtsM+KXHsY1/
 r36iZ+6RvM2QwSHcv8cixYxv3/X/01TvGAJWcJLQ1OPQz++ELEfnbdKLqhpb0FujiJvr
 chmI7aNhygiAP3ErsPU1oC10NpZLBzAdMGwnL2HznfMCo7Sre3rxxW94a9tC0mgb+XVz
 3LEFEqnNMSYzwFKbrOAPrRQ5OAPr/3288aqjugJ5gGt+uEFMj5IIcz80UTH+aMbJmf59
 o8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=alm7PPrVc5PoXo+3xCq2KwRBb6Q/2xA6XSD3iCzrNlg=;
 b=h1j7K8WD/Wev8IXZxwS/cyBELfd2j/qpAFZyjnE68KJwm0qIlTWBz48RtmyuXa5R41
 gIBGYtZDbHMcmB/9WgmCJWL5doHLyr1Zg+iVeiqrZH8yu44TZMOMnrbkiXCEoojjpB6u
 yTpLnEDzcmZU9sMjIVpShaAqVXYfavKvwziXWw5pzSsIK1Bz1eDftmQhmQpQEkBVkQzW
 6XQqwKiuLXgp8/u4I/zcGPFS0CZhA4PkJmRkGK4ARA4Ltg8ibPK3yhC0EnIktdI4z8TO
 3GE1HjSRSRSoD+VdspNCeIVZLoRVVIr5k6I3BrOgwkk0WoKlqJEV3/dQNMuxF7DVGaIy
 vg3A==
X-Gm-Message-State: AOAM532u5hD2hwVuEYf8xm+ta/D1gjwgsMhDs0kJZhBTj18THZqDoiL2
 JYn4sl6T9DkIyExbyAf//yK5AO22c/k=
X-Google-Smtp-Source: ABdhPJxL8ld+wc/YWL/zzhi2Mg7R7EGm2/KKUiBuuCRfjBUyX2b+EJQsOj4HS623GIh1K3w6zhJKBw==
X-Received: by 2002:a05:6512:12d5:: with SMTP id
 p21mr27057959lfg.569.1641039595487; 
 Sat, 01 Jan 2022 04:19:55 -0800 (PST)
Received: from luthien ([176.10.248.201])
 by smtp.gmail.com with ESMTPSA id d5sm3057726lfv.83.2022.01.01.04.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 04:19:55 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
In-Reply-To: <20210305111048.1902558-1-fontaine.fabrice@gmail.com>
References: <20210305111048.1902558-1-fontaine.fabrice@gmail.com>
Date: Sat, 01 Jan 2022 13:19:54 +0100
Message-ID: <87mtkf1wd1.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpcd: add
 BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
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
Cc: John Stile <johns@msli.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Mar 05, 2021 at 12:10, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> Add BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP following Arnout feedback:
> https://patchwork.ozlabs.org/project/buildroot/patch/20210303091904.467706-1-fontaine.fabrice@gmail.com
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Looks good to me, much cleaner than what we have now.

Reviewed-by: Joachim Wiberg <troglobit@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
