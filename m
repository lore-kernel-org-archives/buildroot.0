Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306E7E7717F
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 10:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E340D811ED;
	Sun, 15 Dec 2024 10:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcdjmLD7OG3e; Sun, 15 Dec 2024 10:12:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1287E81223
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1287E81223;
	Sun, 15 Dec 2024 10:12:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FC9CCE
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38DE88121A
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veAfeWltswHX for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 10:12:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE6ED811F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE6ED811F7
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE6ED811F7
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:12:41 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ffd6af012eso36405281fa.2
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 02:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734257559; x=1734862359;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RWM2wWSO+r32WK7JGqwD3l7Py2tzTHfvSa63Eg3e9dE=;
 b=Hr1/eXFTVSlvj/SHGRCw9hD+cbVFLxdMxgpc7IBNXS0zJO+Wk3t9TMACzuVmGYj4f0
 w1dmJjYVp2DGgsCBXPEcnb9NR4oKnT08KKaWNBCgr+Bi5eB7XIa2NfWOImJN+NmQgNk4
 Q51rUcTo8RE/ebbiKm2T4KZS0noeBr2kniCJwHS7hAo4kADRvzWuWlRJ7x+rlYaN+Jpu
 t3NRcXnvLJFqRqjioBCpYIq0Kp87FKfIy+gtu1oLOJTpwW3xdgVxznj0ubuSvSqrjE1S
 OoqMs7PwcbG2VBkLulncm8F5LYHrWKA53Kq3MQ4AMEjsvQFLTV6tPMIHoxC0TZm2N3jB
 xAGw==
X-Gm-Message-State: AOJu0Yx2IzP/m4XemvGnZKpU1ffj9Q5jFKHXBuNdibaaeG+ta6SaLcSM
 HM7G7XLEUxefjj3n8tHrfD6K60v7597qao7m0uc04Q2O8U+fIIAr
X-Gm-Gg: ASbGncs6qy65jvBMZxU79Q535bG7Zo5Z9cbc+FbFAu0TQ2eXv071mgKoa5VA32xrVsf
 sqHsR/aTO1ck5s4yYouTArKD8DrZgKI2qh1ji1RR14RQebasBTXJ/arkAlkEEcCal6/BxwpB4dP
 Uxyk3qVJ6nhqMCcFl7f6PJR9uQLa1eo7mw0cGweeVa5K5t7PE3z2bM0gccCzzkdFdy8eQOEgMIJ
 rL3Q0FJF+v3GuF0TQw/rY3jYgZQ0siU4Lhi/Q5CyW5zX3G5
X-Google-Smtp-Source: AGHT+IH3FJdkzyscUXfGnWhxMcKbaPnTX68Fsc+DvU3r3LLccwDlMbK9kOTrWiomYvdShfLVjnpRDw==
X-Received: by 2002:a05:6512:3b98:b0:53e:395c:6888 with SMTP id
 2adb3069b0e04-540905a7b96mr2782641e87.36.1734257558894; 
 Sun, 15 Dec 2024 02:12:38 -0800 (PST)
Received: from curiosity ([5.188.167.4]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c1faeesm467882e87.232.2024.12.15.02.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 02:12:36 -0800 (PST)
Date: Sun, 15 Dec 2024 13:12:33 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <Z16rkQ49QaWAW-ud@curiosity>
References: <20241211201146.4057892-1-geomatsi@gmail.com>
 <d2f330edc5dd1b36a2b4cb793444720f@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2f330edc5dd1b36a2b4cb793444720f@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734257559; x=1734862359; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RWM2wWSO+r32WK7JGqwD3l7Py2tzTHfvSa63Eg3e9dE=;
 b=CJhsa3ZNKZkma7sq5c+mD2xSC9slc/ObSdTckxtwAu/lkSIH2kahgVyzcIc9lnasP2
 KfX3d9fwvIQZwI8OnpG6IgNSkPcQwweEfwKEr2yQY9b9pNHevB9DEPqT8K5CHKHJueoB
 OUsF1xpfArZ2eoMUQVM4Pn96rwdS0FfJ8MX/AwMa1VZDE/F2aouw3tTrBtHRkHnQ3l+0
 /Fgikp/geZ0L9VXSSsH1tc1TzpD4oJIOotQ03t857OpF/arwyx5QQ2KOwaFLlK/gZjZs
 PmmEN457NE5UoVoZG5/JAj17fqXh6Xm+Gd1QxDSb64Fr9eTwHf5rgT3n8v2o9zKDwSrJ
 OEEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CJhsa3ZN
Subject: Re: [Buildroot] [PATCH 0/3] orangepi: BSP updates, part I
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Sat, Dec 14, 2024 at 10:47:55PM +0100, Julien Olivain wrote:
> Hi Sergey,
> 
> On 11/12/2024 21:09, Sergey Matyukevich wrote:
> > Hi Peter and All,
> > 
> > These patches update BSP components for OrangePi Zero and One boards:
> > - Linux kernel updated to the latest LTS v6.12.3
> > - U-Boot  updated to 2024.10
> 
> Thank you for the patches. I applied the series to master.
> 
> I have made few fixes and improvements. See the commit logs:
> https://gitlab.com/buildroot.org/buildroot/-/commit/3ef5975b795271a723b694160c8d50c62d518e8e
> https://gitlab.com/buildroot.org/buildroot/-/commit/6ee9c706179076ec1d7772debb6390631da184ce

Thanks ! Next time do not hesitate to request v(N+1) from me. I am sure
maintainer's time deservers better use rather than cleaning my mess.

Best regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
