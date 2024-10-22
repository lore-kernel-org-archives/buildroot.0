Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDCACDD0FF
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 23:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECD3540308;
	Tue, 22 Oct 2024 23:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lY_m0Q25R_4B; Tue, 22 Oct 2024 23:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8EA24034D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8EA24034D;
	Tue, 22 Oct 2024 23:00:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA9F44C2A
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 23:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7EEA404E2
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 23:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMtP1zhfBRJZ for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 23:00:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.174;
 helo=mail-yw1-f174.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4DFF403D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4DFF403D2
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4DFF403D2
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 23:00:11 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6e314136467so3453177b3.0
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 16:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729638010; x=1730242810;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XHdZ6DToKykqXbbKm4h7c2PHcnAkHcj3hqhCJnCdgAA=;
 b=oIITRi6UP86JsQ3ylhwBpUNYq6SHqki7IB6NVyYhHH6fan/ZLd7BRoK70bfZcy5w6B
 y+tkbOIWLKM7tiGS+I3J/xzvzmVWAfo/KeXvJCu8NiN7jz90F6Zpjx6Vyk/xq+2EGSUh
 phd1utQrWzlWjMuwN4E2jOw4LRMU+7UeoNPZtXpW5qugSfvixcdtJVTmz6RmRepCPQRA
 r2RLA/+lx3MKTz6ujtsDmWaLrN+TDHZvHDD8wyRAEwSu3tFMglXBE6s4+o3zhO1VqSO5
 h811yncCJO0Vpept1tPf4Y2kmCb96ST0Qt2oo0n9a5cMXdapuM0ecwftJNSJP8egyq8T
 MFhA==
X-Gm-Message-State: AOJu0YxHuUTkJjyjv0qqvbSss7yQTh9i7tIjLM8j7iJXYc5/WoQjGXfQ
 LR5bal7JRu8F1KMkSI31St8TPev4NpHR1BlZSEbgTkw7gIoaw+lHMaqG3A==
X-Google-Smtp-Source: AGHT+IHkgnAg90ZqSiNDVBcaslRfQawtvEeCzzmpcpCw/xPkd9kChfnzZ8NRLK4dSQPxBorir74ngw==
X-Received: by 2002:a05:690c:6488:b0:6d4:72b7:177e with SMTP id
 00721157ae682-6e7d4518669mr44504467b3.5.1729638010417; 
 Tue, 22 Oct 2024 16:00:10 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6e5f5cefb3esm12651167b3.104.2024.10.22.16.00.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 16:00:10 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6e314136467so3453107b3.0
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 16:00:09 -0700 (PDT)
X-Received: by 2002:a05:690c:3006:b0:6e5:2adf:d584 with SMTP id
 00721157ae682-6e7f08e7962mr5673477b3.14.1729638009742; Tue, 22 Oct 2024
 16:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241022180542.224972-1-bryce@redpinelabs.com>
 <20241022212800.570cbcfc@windsurf>
 <CADXxVS+0bHz+Hqe4437vb5K3=Qmt3DLfNSFMEmsWJTFXGkiFTg@mail.gmail.com>
 <20241022231243.7ab36afc@windsurf>
In-Reply-To: <20241022231243.7ab36afc@windsurf>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Tue, 22 Oct 2024 16:59:58 -0600
X-Gmail-Original-Message-ID: <CADXxVSJ6M3BeH3SsKF6XEO7yHDSd1oL7yjAFhY7c9a-A+fpYjg@mail.gmail.com>
Message-ID: <CADXxVSJ6M3BeH3SsKF6XEO7yHDSd1oL7yjAFhY7c9a-A+fpYjg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Suniel Mahesh <sunil@amarulasolutions.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-toolchain: Add $(HOSTARCH)
 so it can be built with aarch64
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

Hi Thomas,

> > > The change looks correct as-is of course, as it doesn't make anything
> > > worse. However, I believe to make things cleaner, we should perhaps
> > > introduce a package/arm-gnu-toolchain/Config.in.host file, with a blind
> > > option BR2_HOST_PACKAGE_ARM_GNU_TOOLCHAIN, that has a "depends on" the
> > > host architectures that are supported. And the packages that use
> > > host-arm-gnu-toolchain would have to be careful to propagate those
> > > depends on, so that we do not allow using host-arm-gnu-toolchain on
> > > configurations that do not allow using the host-arm-gnu-toolchain
> > > package. However this can be done as a separate patch, as again your
> > > change is not making things any worse than they already are :)
> > >
> > > Could you send a v2 of your patch with the proposed changes?

I followed up with a patchset with taking a crack at the changes.  Let
me know how they look or if there is a better way then what I did.

Bryce
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
