Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A86C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 15:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 326EE83C06;
	Sat,  8 Feb 2025 15:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxA_7E9kXSpT; Sat,  8 Feb 2025 15:39:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D60983C77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D60983C77;
	Sat,  8 Feb 2025 15:39:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A24DCF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D13D6068B
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7hBDzlUWly0 for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 15:39:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=tashernadav@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E15E60627
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E15E60627
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E15E60627
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:39:22 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso4433855e9.3
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 07:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739029160; x=1739633960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MYDdoBAboWlKKZH5gYIjLhhymFbn43ET+738QC8vzm0=;
 b=lg9rLSDYg0wc6MQEv6TNOULuJxLGbxynRVCAkUjG3yA+WbvwznV5DzZAh9ZGqKHdVL
 mtQWxB8GckqvjOwH+Cex/gzHNTTukaCnfCkElh+nY8ZpNLLtwYpNvXFrfXvBYkLbWAXo
 HvjXQumoQ4I97zO9AFZnkEGPqTIFMgLCyRETcXzPHjx++H+h6kYHJHeMh1zKEDwkmmca
 jUgRECcOM6U+qFVpxJmWXHx//+x9wNE32WEufFKW1GEOSZWiVA0n4OmUXBOeXj5CUe7K
 bQ+iqbE2Q4fH05QGs7UYLte/NQpOAx+/ZTZimSemov4FkOuixJ4vWPtYjKNP8zb1aDev
 YQIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOIB6vBHQlNP7ct3NTWp2QcBAJWWsfVkpXDO/o+s8dchHzzbnZbff5J6JDtjFOZzE15SSydd/2HLA=@buildroot.org
X-Gm-Message-State: AOJu0YzQtFDJfF28uvjRcQ2jSxGo2yDyH7j9mEvdm4Fpn9k83y76Q9rT
 mS5LIVGUz0YeNd3fS8eqRnKPZLeNVuB4tRJlpVFK93OabaQSYSAD6LoJ3g==
X-Gm-Gg: ASbGncvA3HNdLkSw1IVYjdFys62TKDnjn1lyuURHcBAWAevDPzlwjgcUhJUGYJeTDXL
 9xtitHnCyrIKrPJfYsdnl/gD37DEVyLatyEpRodovO6wLYe6BFUYi/ijIMNMgtAIruDYLuENGan
 Ojm/O9AMNa29brDtf2O2pxCIgdM9i6wdTV1UjvyYvKAAS59wb1WGyNqqLrKAFyl8NWbkYqeF0R0
 geZDgKhThNi4ddaTx5NgvzcWROMqfBATJXt4IRVRu/hHgoxpmMlhtYg3l/66TAZC6Ffg4BebZ2z
 GInwpv8SPukXfoTz
X-Google-Smtp-Source: AGHT+IExHgN8kdsqum77clmKxwjS+X8gl2wtEffLd9jZ3wRiCw1GU1sev3beqckqmsMZa5qvQy0gJQ==
X-Received: by 2002:a05:600c:384c:b0:434:fddf:5c0c with SMTP id
 5b1f17b1804b1-4392497d1d9mr66512805e9.4.1739029159981; 
 Sat, 08 Feb 2025 07:39:19 -0800 (PST)
Received: from nadav-dell ([2a0d:6fc7:25d:66e4:a0fd:7146:a0:aca8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcc9bd251sm4213782f8f.9.2025.02.08.07.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 07:39:19 -0800 (PST)
Date: Sat, 8 Feb 2025 17:39:15 +0200
From: Nadav Tasher <tashernadav@gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Buildroot Notifications <buildroot.notifications@gmail.com>,
 buildroot@buildroot.org
Message-ID: <Z6d6o47Usm-OR_lw@nadav-dell>
References: <67a6da1d.170a0220.15dee9.b177@mx.google.com>
 <20250208044634.GA1770044@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250208044634.GA1770044@pevik>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739029160; x=1739633960; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MYDdoBAboWlKKZH5gYIjLhhymFbn43ET+738QC8vzm0=;
 b=DjUORlmF1E4C0eeaCNgM0Z6IA5CeZWQtG8K/mJvuS/FF70Q0l2phmpF9JZDeJ99NG7
 mFPXUkfOo5aqmzApLX5sAVWO/nUdPozqQ3kHKMIEphRwv9RGFrkuBvvare6mGSaOC/TM
 aSDqc2XAWXJrYFtMM9o//E0pYswkRiM6drWeVpQbjXYmaXorfSHWnvj04ye2m5RXWT3p
 UTk45Uvfg4wvrN8NfZeocCEJ+6kZ2j0XyuQX3mrgpv5LwwOzc4vsxE4f8O2Ar2MZomPl
 xgo36Qb2BcAfYAFbYLjMYGnz3T4A/j6wxHpxhMKjiuhIl4Ma+5b4CJJCuQKFluR1qQ4F
 8m1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DjUORlmF
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2025-02-07
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

On Sat, Feb 08, 2025 at 05:46:34AM +0100, Petr Vorel wrote:
> Hi all,
> 
> > Hello,
> 
> > Autobuilder failures
> > ====================
> 
> > Below is a list of build failures reported by the Buildroot autobuilders
> > in relation to packages or CPU architectures you are in charge of.
> > Please help us improving the quality of Buildroot by investigating those
> > build failures and sending patches to fix them.
> 
> > Results for the 'master' branch
> > -------------------------------
> 
> > Build failures related to your packages:
> 
> >     arch     |             reason             |                                       url                                      
> > -------------+--------------------------------+---------------------------------------------------------------------------------
> >     arc      |     ltp-testsuite-20250130     | https://autobuild.buildroot.org/results/609697d89e0c5948842c7c0e5dcec4d93be3258e
> >    arceb     |     ltp-testsuite-20250130     | https://autobuild.buildroot.org/results/8814f6f166ad6ddd58e8627964d147ecfff4d76f
> >    xtensa    |     ltp-testsuite-20250130     | https://autobuild.buildroot.org/results/05728d3609553a0b78875d62adb88cccb43e00ed
> 
> All are uclibc-ng, problem. Nadav suggests [1] it's caused by the fact that time64
> on 32-bit targets is not supported on Linux < 5.1.0. I'm not sure why this is
> just on uclibc-ng. Should I bump min kernel headers for uclibc-ng >= 5.1.0?
> 
> Kind regards,
> Petr
> 
> [1] https://lore.kernel.org/ltp/Z5q7NwweeZ0iNlzc@nadav-dell/
> 
> > Thanks for your contribution to Buildroot!
Hi Petr,
Linux 5.1.0 is only the minimal headers version when TIME64 is enabled for
uclibc-ng.
Is there a way to make it so that it is only affected when TIME64 is enabled?
I think this would be a little complicated since TIME64 is enabled by default.

I guess making 5.1.0 the minimal for uclibc-ng would solve the issue, but it
might impose some limitations for people trying to compile newer versions
of Buildroot with older versions of Linux.

Nadav
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
