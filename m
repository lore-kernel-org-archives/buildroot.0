Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBA5D1BDF3
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FC6B80E1C;
	Mon,  4 Nov 2024 21:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqDAraVLkEWU; Mon,  4 Nov 2024 21:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C5FB80E28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C5FB80E28;
	Mon,  4 Nov 2024 21:17:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8E0B3B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C809C404A3
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13i8QZ8m2SVD for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:17:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F7524042F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F7524042F
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F7524042F
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:17:02 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so778284866b.0
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 13:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730755020; x=1731359820;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KxJyoCgNWXI/Lo14N+RQAT2RZdP2TJLSndJWVKEozck=;
 b=B1Jvh2EZCufDowTVA20T981jCnZjmUzlDrfqCBfBG5fiXS57lvJ4QDZRByHdWbfMhM
 QS4L8i9osCD0nLgPvV+8AF4ahCvs+7QRDY9xUYVsxInEtLhytrdM4wegSwnqfkzvPdxx
 mjQvUZfui87h4c68fZeKP31wgpbr9CnWzTyzFucsa56MF7esONp1FnHOoEUiPo0KH6Mt
 0bAmSHkZQXAmh4XVLeiVeC9xbBxU+8dCgfuEJ9QrCcnoqUAt3NR4kiG/HQV2Xqr0x8HL
 MWtgREeKx5axg5OT7viSjTy4y46o9hPLI+pUnWJIExc9m7yyDIJQ7liApj5RIKC28Xxn
 Cd2g==
X-Gm-Message-State: AOJu0YzV7LxB404a/IdPif3KTqxnESc4P9k/nxGEG+Rn0hSzOmxxphWn
 5EcbI7KGeWr3bNHlqYNTPjmraNFX4q4PhjK37pwjIHgPZClOBTU6
X-Google-Smtp-Source: AGHT+IGNfW9J0OsSAWqkz6uojPMzmVLmYZEMQ0wfO+E6gN7wNztXIgD79cE8iIZ1YpZnUepFBiRDJg==
X-Received: by 2002:a17:906:c145:b0:a80:f840:9004 with SMTP id
 a640c23a62f3a-a9e6553bf86mr1437640866b.12.1730755019908; 
 Mon, 04 Nov 2024 13:16:59 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6afe45csm304807a12.63.2024.11.04.13.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 13:16:59 -0800 (PST)
Date: Mon, 4 Nov 2024 22:16:55 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20241104211655.GA1423113@pevik>
References: <20241026221347.22f27cad@windsurf>
 <20241104202319.2193487-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241104202319.2193487-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730755020; x=1731359820; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KxJyoCgNWXI/Lo14N+RQAT2RZdP2TJLSndJWVKEozck=;
 b=ZsnKc7XaTbEq7Q5OWFg2psUc/Q/jpBFAOrkWx94ttPd3kTfRFgUWlaQD2aEvRXU9rP
 EvARW7WocLK89i9Jsci/bUX3qiAsYFf/pwJap1HivacJfy6hOqSqhHmnB7W3ct0cop8H
 SZLpY54QklpD4ONH0KhnDG76xFamX5df1WyvjoQ70GuZ89qBes9BIfJu5UuT4wnjv92r
 ZFemQTKni2i56H0tzhNieDgIvUx38sryNAEFywUZRq5qi9TDuEzC+KDHngW6GbZ/5ziJ
 j+CrmGSxHf7h54NiGctLNCMaEiZa9KDKuaKQKx6JT1TJFGcwkIAqbbQgUJyJ41qZALrT
 ELjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZsnKc7Xa
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.1
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

Thanks for the update!

> * disable junction and nfsdctl by default
...
>  NFS_UTILS_CONF_OPTS = \
>  	--enable-tirpc \
>  	--enable-ipv6 \
> +	--disable-junction \
> +	--disable-nfsdctl \
>  	--without-tcp-wrappers \
>  	--with-statedir=/run/nfs \
>  	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
> @@ -30,6 +32,8 @@ HOST_NFS_UTILS_CONF_OPTS = \
>  	--disable-gss \
>  	--disable-uuid \
>  	--disable-ipv6 \
> +	--disable-junction \
> +	--disable-nfsdctl \
>  	--without-tcp-wrappers \
>  	--with-statedir=/run/nfs \
>  	--disable-caps \

What was the reason to disable them? Shouldn't be at least nfsdctl enabled?

man nfsdctl(8) "control program for the Linux kernel NFS server" [1]
That sounds useful.

man nfsref(8) "manage NFS referrals"
       ...
       A junction is a file system object on an NFS server that, when an
       NFS client encounters it, triggers a referral.  Similar to a
       symlink, a junction contains one or more target locations that
       the server sends to clients in the form of an NFSv4 referral.

I'm not sure how much useful this is, but it's enabled by default. Also Debian
explicitly enables it. Do we have a good reason to disable it?

> * drop 2 local patches that have been committed.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

[1] https://manpages.debian.org/testing/nfs-kernel-server/nfsdctl.8.en.html
[2] https://man7.org/linux/man-pages/man8/nfsref.8.html
[3] https://salsa.debian.org/kernel-team/nfs-utils/-/blob/master/debian/rules?ref_type=heads
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
