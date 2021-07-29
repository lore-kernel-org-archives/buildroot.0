Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D8FC4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 20:17:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4018B60F46
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 20:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4018B60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paral.in
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED08B83B49;
	Thu, 29 Jul 2021 20:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ajC5Jauh4mjO; Thu, 29 Jul 2021 20:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5786683B47;
	Thu, 29 Jul 2021 20:17:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 018F11BF317
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 20:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4A1760680
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 20:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral-in.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTb8sNKr1rfn for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 20:17:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D83460650
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 20:17:24 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id u10so10025165oiw.4
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 13:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZjSTR1JBOVXposlcBSeCRgnsJ3Kj5iwAWM9bTIu88Hs=;
 b=E4EfAT2hXobnfFDZOf9KvTYmsFX69MIR9X/AbEmWFKtrMOz4/+MVFhFLcCbCgRUtny
 KGf9l9M6el7rj1AZYEf6/hcRE05M9v2+1Xa+EJsIXzKfqORcO0u4rhTHxWewFzoKiGtk
 dM724U7kOdfCg+W8Z02gxhdU/03rWfDYMxVMjz72mNwMWUAHlpnjFAziKpeNaVBd5qlv
 FDmuOpbvZs6ApA2FmIQqaZwSCq1fOGnvjX5RibzY17anrS8wfnnXoKPdnyl9SYS8VMKk
 zXNytYo0MKsoPtV1BeX/K9dG7KEMIKsMjSOi8G/ui/ZNmlN2VmKJgwx+VCseuXo42d75
 4f7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjSTR1JBOVXposlcBSeCRgnsJ3Kj5iwAWM9bTIu88Hs=;
 b=c/g3EqWolYVVzZMP0exsr23WOkZ3+QhLIZM0BI8pWjimQP0bgUw5LB5ZK42iaT9D9N
 FzFK1e0WWry5uV1lNiDGqg+S0waxu7Wupo9qu29gavqhO23utqp+WTeP2Z8keyEXD4pw
 U0kvSgi96+w0jmF/KjR35lQOramw9lC2uz4XDmbCJaAfqBzVs3bm+ylAgXkGDPYoCZTq
 QLnWHkd+gpWYXWfRQv5Sn7BsHmdziPqOuXdxYzAJCdQIDaMqbLjBu9iNr6lFNEu4c0H2
 5Vn35jlEOr7flnDivgf941gxW0kMaVW2/mvuvmxfZeVZTXJVRiTCq7vGmwJ6rK9v9CXC
 W55A==
X-Gm-Message-State: AOAM530z4HqLH/3SwjP+0lnXT/vsXogozeJNKTdpYD4AK3tAZQjq60md
 UmkTGW7iXQTv3HMHSqyCHUBE8RLZhWCJ0w==
X-Google-Smtp-Source: ABdhPJxONYsT5xeVWmpTJFFxVvhefgI59zaDGYRkfSFb8ZO65L3Q8GqhNpzhAINwPE/m/kH06vJUBg==
X-Received: by 2002:a05:6808:28d:: with SMTP id
 z13mr4228292oic.68.1627589843137; 
 Thu, 29 Jul 2021 13:17:23 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com.
 [209.85.167.181])
 by smtp.gmail.com with ESMTPSA id z22sm634879ooz.20.2021.07.29.13.17.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 13:17:22 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id o20so9976788oiw.12
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 13:17:21 -0700 (PDT)
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr10878265oiw.112.1627589841583; 
 Thu, 29 Jul 2021 13:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
 <20201219153525.1361175-6-thomas.petazzoni@bootlin.com>
In-Reply-To: <20201219153525.1361175-6-thomas.petazzoni@bootlin.com>
From: Christian Stewart <christian@paral.in>
Date: Thu, 29 Jul 2021 13:17:09 -0700
X-Gmail-Original-Message-ID: <CA+h8R2r_kBmCAF_ZAvF4EWivhXxaU1OBh6N=eAZSB=ZMqtrdow@mail.gmail.com>
Message-ID: <CA+h8R2r_kBmCAF_ZAvF4EWivhXxaU1OBh6N=eAZSB=ZMqtrdow@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 05/12] support/download/go-post-process:
 implement Go vendoring support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Christian Stewart <christian@paral.in>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Anisse Astier <anisse@astier.eu>,
 Ryan Barnett <ryan.barnett@rockwellcollins.com>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, all,


On Sat, Dec 19, 2020 at 7:35 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> The logic to generate go.mod when not available is moved to the
> download post-process helper, as it must be done before "go mod
> vendor" is executed. Also, "go mod init" is used instead of manually
> crafting go.mod. This was suggested by Christian Stewart
> <christian@paral.in>. The Go module name is passed down to
> go-post-process using the BR_GOMOD environment variable.

> +go mod vendor -v -modcacherw
> +popd > /dev/null
> +
> +repack ${base_name} ${output}

This works fine in most cases, however, this causes inconsistent hashes.

On my system, the hash is correct after re-pack. But on 2 of my users
machines, the hash ends up different.

So something specific to the host machine must be influencing the hash
of the repacked archive.

It's either something in "go mod vendor" that's not deterministic, or
maybe host Go is being used instead of the one compiled by Buildroot,
or perhaps it's not possible to always get deterministic hashes this
way.

Can we possibly switch to hashing the download /before/ re-packing it,
given that Go verifies the hashes in go.sum automatically as part of
the "go mod vendor" step?

Go mod vendor will fail if any of the dependencies are different, the
checksums are included in go.sum

Thanks & best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
