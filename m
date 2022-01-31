Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4609C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 23:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89CC340165;
	Mon, 31 Jan 2022 23:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIVuljvCBvJ2; Mon, 31 Jan 2022 23:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A18F4015F;
	Mon, 31 Jan 2022 23:05:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F6581BF363
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D72A60F30
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uOj8m170eZXG for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 23:05:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47281600D1
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 23:05:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l129-20020a1c2587000000b0035394fedf14so397696wml.5
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 15:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=7lbLmpmfmJ271QPc6LOJ/WVmmqa8PNt0afuiJtzXEO8=;
 b=WHejzp3BvB39fH2QuarskwzO2XUsJKXTdYTGTErm9yAtPvV1hBrZQ+ISeVLqhqPB9Z
 DTJEFWfkKj4uL1g+gfnyWTi9WyDpTLEla+VoOTdlCimLNv/PSLA/ILPGajJu60J2cigA
 u+9qg0MJrjh0p7xj223epZUg6ryFZjxi6mRdqJFbxDm3Hr6IMjDLNKtrAecD1swjXMK0
 0ob8yIca4EjSID/5W9ZAk8Xi5Tx9Gt5+Ly0b/T0ziHgUrfEbmArKLkhTTv01X51O+ng3
 EPN/qbHem1fmHuXcBbCgLGxA8BxfBqvdUWCpYZ24UF0F56BiV5y5sR9SoUQM7FfSES31
 g81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=7lbLmpmfmJ271QPc6LOJ/WVmmqa8PNt0afuiJtzXEO8=;
 b=CqWMDlzmCQewLF2FXJETtXKCy8wbxytRhfT/VzAkLpSKkoEmJ25udAQl7lVAJR4N86
 JRlWwfVQm5GhTnyLviXo+F9N9pFdlHrBYDyHpJrwmCqfpezY0SIFYm3tDOcqLVi9xfPJ
 7pd4EPAFrHds/qruk3WQQ5E8UIHNSYv426ldbDvPHxsw4bHl68/MRAPzDdydwmVHLGGD
 RSVva8+Cswl/dZX9QIgoOc7JGH0wpYV84ffTdn2z4OT9VdqnlQi1vxn10jjVhUoFhRt0
 H7BLiLPt86BnEPfg+/In+dxc86RyKYf8KkltZwB0rgKmkzDOTfWo+s91UDOyFpJeUEdr
 KIqA==
X-Gm-Message-State: AOAM530uvCWpvLZ4nIFGwkpNHTtGzFn4efaLaT66CzWcfWvn+VtGyGsZ
 hQaJltIhtuwQBoP/wC1mHW0=
X-Google-Smtp-Source: ABdhPJyuZDAdt7cc4XgUx4utBAPOd/YCCsb4EHJ3ai6r4dxS5BnU/102hGsOf6W6OSWH0i6Bngu1Ig==
X-Received: by 2002:a05:600c:4308:: with SMTP id
 p8mr20208418wme.72.1643670321496; 
 Mon, 31 Jan 2022 15:05:21 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id w22sm13201263wra.59.2022.01.31.15.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 15:05:21 -0800 (PST)
Date: Tue, 1 Feb 2022 00:05:19 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <YfhrL9CyQI2LDmKs@pevik>
References: <20220131230015.181368-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131230015.181368-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: fix musl build
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

good catch!

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

...
> diff --git a/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch b/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
...
> +[Retrieved from:
> +https://github.com/shemminger/iproute2/commit/8bced38a941a181f1468fa39541e872e51b6022f]
I'd use URL from primary git:
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=8bced38a941a181f1468fa39541e872e51b6022f


Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
