Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77933D116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 21:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25BDA4088C;
	Fri, 28 Nov 2025 21:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkuRb4sjakku; Fri, 28 Nov 2025 21:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22B34407F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22B34407F8;
	Fri, 28 Nov 2025 21:16:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0342708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C730484836
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eu9-y0TgseM4 for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 21:16:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1161; helo=mail-yw1-x1161.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD34A84833
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD34A84833
Received: from mail-yw1-x1161.google.com (mail-yw1-x1161.google.com
 [IPv6:2607:f8b0:4864:20::1161])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD34A84833
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:16:39 +0000 (UTC)
Received: by mail-yw1-x1161.google.com with SMTP id
 00721157ae682-7815092cd0bso20276947b3.2
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 13:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764364598; x=1764969398;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mr9ZqA3e4gxB6a9+yWzyPdIZ+H1YYt/yMwrICG1e8pM=;
 b=tlrVK33uKexnqyq22j3Hv9iWu2rs3VspGP87MO9CRdCbM6A/59B5xv+Q1lK2gvrZM1
 HPAbUAFUxC5eDrbWYVblxuNrGpuW+DMe1CGRTZpfuR9n2KJfrT2Vqmwd+mCMUT9ZU7fl
 nGw0WPAubSLCerXWMSgXudT8zwUdWKd2TpLQToDMQnfA+YU89hDErkivLhaEkLbM79lb
 qpHsiP34NAGfvt+IRorU8TDfJ6WDK1fUuWfx7eSjarsZ1j9mWsrl4ONKHkXnAUKHbbBl
 kEYmwa2+uN80pUGl7uMBds8ORZfeqptsrWe3WvrXqpLFLqrpiNzMv8JdcRFMcdJZqQzr
 Zytg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUncifH1nZ5WmFNWati7FXCfVk1/FY7e4c2UPEvTpvDp7nVu3ZUKPE/XHpEgew0Y0qcPaSsB+QM/Zc=@buildroot.org
X-Gm-Message-State: AOJu0YwZspex1OMgoQVELuS2UM/ME7h0vLnzhlp9Qg9pXSkVUrr8lFLW
 /GwVTAesOsP1ms8ESeRxSyZr+QUthGKndgknPV+wt7aKOcljMoEOw7+Fit2tHtnnxLoxqjnkMjM
 XCalgJKF+C0pGcHi1WL/OWVnkBEDNsjW2ScXKcQXXENNMSCGOigGVRLbcqJZZ2/BIFlTPLpWjiY
 9EIp4DMp469PA8pCr7l/gTmq7NFmwfrAEn5+XfW4Oab90WgyLyRbycqHy3kg6ta1Abh2vxhAH1P
 xu7wZKbQirjz7s=
X-Gm-Gg: ASbGncsbezePjv8sx8VXwD6Axq9se13wYBWVXte5NfgVo0lpHBSrJ85Og0lQgeSR77q
 GDXJqVxzjuCkHlq0UoTVz/REEjgX1I4Ffp+Ji9529kB+JmbeTyfrJz7fQNvyCUeAe70Dc7twsim
 T29fv496uWzXENE2oo5/vp0Yg58JqW7D4RG/lnv9zxgafC8/AAB3Evohtf5SStGHA+X871gwb5S
 YcMWOpfOvIxCIOdwDf3eVvCVprzWuPCga0lv3PpVuFrLmQRPpzgWnnAOnrHLFDhpdsnJfW0D2bz
 rHnkS1xzimQd+iBAlcJGNfTeQKlnYRar9B3ry0zOyvBXaLJLTRzVEOJgDGyLg+JAI5A/yRH0C0l
 vMllvbBPHvvCqP2St7cD9mB4u0HU6pvTJ8x5yc4zOydtPAQHf4wTR8aVG5iega+5iNRoE1mi3bc
 9Ebg+kpzlQw24voELhL9WlpvK913tfSCwoxkTH5saeE97VXGk=
X-Google-Smtp-Source: AGHT+IFFtpoMu6gFKCqhncWNwOAzs/E5Yj3UfGzwVLoFd1zY84wvwOL/yv1GAxel5T9DuYpOesuK884I+OZ/
X-Received: by 2002:a05:690c:368f:b0:789:2e24:b786 with SMTP id
 00721157ae682-78ab6f4f832mr276906047b3.52.1764364598171; 
 Fri, 28 Nov 2025 13:16:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
 by smtp-relay.gmail.com with ESMTPS id
 00721157ae682-78ad105a177sm4085767b3.26.2025.11.28.13.16.37
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Nov 2025 13:16:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b70b2a89c22so354850066b.0
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 13:16:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU+j081iiK5YfTrK4rEOpMeLvNXPUmhlVogOa0yBmfPZ2ekb9rLdz0rpaxxyrIkzuuoqz2DHMNJ+DA=@buildroot.org
X-Received: by 2002:a17:907:9811:b0:b73:1aba:2ebf with SMTP id
 a640c23a62f3a-b766ed83649mr3670361466b.2.1764364596381; 
 Fri, 28 Nov 2025 13:16:36 -0800 (PST)
X-Received: by 2002:a17:907:9811:b0:b73:1aba:2ebf with SMTP id
 a640c23a62f3a-b766ed83649mr3670358266b.2.1764364595990; Fri, 28 Nov 2025
 13:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20251123133431.1499202-1-thomas.petazzoni@bootlin.com>
 <fe64d9aca519af339d5d30054c162d0e@free.fr>
 <CAGt4E5vMkqsHt2sUUqLWERZyRvQXyp1Z90E4wx8yPRP6CEiWgg@mail.gmail.com>
 <20251128102146.2afd777b@windsurf>
In-Reply-To: <20251128102146.2afd777b@windsurf>
Date: Fri, 28 Nov 2025 13:16:24 -0800
X-Gm-Features: AWmQ_bk42HfhCIP9jd3qrAUedu7Zoyajf0Puq8Mm6yzGJWmsTL__XctpsHgS4Bg
Message-ID: <CAGt4E5tGGkOAtDYysD2DcusQZNhfb6CV5mtJPPNn_oWwr+M04g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain <ju.o@free.fr>, Buildroot List <buildroot@buildroot.org>,
 Bernd Kuhls <bernd@kuhls.net>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1764364596; x=1764969396; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mr9ZqA3e4gxB6a9+yWzyPdIZ+H1YYt/yMwrICG1e8pM=;
 b=fcKnaLQQjjY1ElZ8NwJZGIBai3MT9OqzZCWVcDsnSc4U1UjqwfTu9J11THsODfHg3Q
 DrjryI9YCNI7hP6/rPVTXzV3mJ8Aovtjf0HhGNAhKPcS3zuSC1PI+j/joPnJgBhtTNmW
 C7Ak4EuUfBbknEVyfYzPd6qSP/2C3p5mwRfOo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=fcKnaLQQ
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: fix build with headers
 >= 5.10 and < 5.12
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thanks for checking out this patch series.

On Fri, 28 Nov 2025 at 01:21, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Markus,
>
> On Thu, 27 Nov 2025 11:53:36 -0800
> Markus Mayer <mmayer@broadcom.com> wrote:
>
> > I submitted a different patch for this to Ted T'so a week ago, on
> > November 21, to be exact. Unfortunately, there doesn't seem to be a
> > mailing list for e2fsprogs, so there is no way of quoting said email.
> > Unfortunately, I haven't heard back from Ted as of yet.
> >
> > I think the easiest way of showing my patch set here at this point in
> > time is by providing a Github link.
> >
> > https://github.com/tytso/e2fsprogs/compare/master...mmayer:e2fsprogs:kern-compat-master
> >
> > This page should show the entirety of the diff, combining the two
> > commits in that tree (manual changes and derived autoconf changes).
> > The important changes are in the first commit (configure.ac and
> > kern_compat.h)[1].
> >
> > The big difference between your patch and my patch is that my patch
> > doesn't disable functionality when the build environment is too old.
> > Instead, it provides the missing definitions of the data structures,
> > so the binaries can still be built with full functionality compiled
> > in. So, while your patch strips functionality out of e2fsprogs based
> > on the build environment, mine does not.
>
> I don't really have a strong preference between the two solutions.
>
> In your solution, what happens if the kernel is actually too old to
> support the fsverity ioctl() ? Does e2fsprogs gracefully handles the
> situation? That's a bit the problem with building code with "newer"
> kernel headers than the running kernel: how is user-space going to be
> have when the kernel features exposed in the kernel headers are
> actually not implemented by the kernel.

According to [1] and [2], e2fsprogs does the right thing and will
propagate the "not supported" error. I'll see if I can set up a test
case that will trigger this function call, so I can verify the actual
behaviour.

Regards,
-Markus

[1] https://github.com/tytso/e2fsprogs/blob/master/misc/create_inode.c#L599https://github.com/tytso/e2fsprogs/blob/master/misc/create_inode.c#L599
[2] https://github.com/tytso/e2fsprogs/blob/master/misc/create_inode.c#L599https://github.com/tytso/e2fsprogs/blob/master/misc/create_inode.c#L669

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
