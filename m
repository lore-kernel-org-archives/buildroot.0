Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805EEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 16:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFAD7613A3
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 16:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFAD7613A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD5E240789;
	Thu, 21 Oct 2021 16:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GPuoLaT0TG6G; Thu, 21 Oct 2021 16:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 413B04064D;
	Thu, 21 Oct 2021 16:29:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA0DD1BF20B
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 16:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93C1583C75
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 16:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UCuoCXLQ2RVU for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 16:29:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB63883C69
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 16:29:46 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w19so1628158edd.2
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 09:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=LGdnAJ88JKNX8R1HDtvA3zelb4NVBlUnsbqrMAf/YTc=;
 b=E16Ygu6LFFYMFe/v2Ewbvy51IeOKdvfRY8Sbsb/odekl8C9EB0pYYjcAoztA68yxOj
 k6BTCPHOxPegzne08AhyThND/bgy+Jb+UF5Y4JeEy6kodODtqfki7nM/sOXWhxcPvNnT
 tciFy1ZDEeaH5yGugH9hMT5Ag9AodRj+7Q6nstJxW/8vKozj6KIKzQbeoAv/YlOseXUq
 FaIjbLp1pog0KaVUnFnnAxEX9D3+pDKkV/esV3kap2Ee4LOoGW2fpKRIXlE5l/AOMHdH
 6+YV34zfpG+vVFw+Vf+XcCDEcM64d6CAx/rRrEvxJC8VJe8+90nL1u/ECmHlo7OR0RYE
 sEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=LGdnAJ88JKNX8R1HDtvA3zelb4NVBlUnsbqrMAf/YTc=;
 b=GkxRcovlbA3Essxff/LPVW9wgbH7zuYV3Ua4cBzSFIsevDhR2yMgr+ZtLjUapIKEuy
 eeU9P/20CrV63EOIQh151pO74XLaKftLkl1uIkmk1EWDboX/y67J4WFMBQQoj5piMINY
 T885NkriJBwjFU9+GgS3AzwpcTiR12o1mHxBw6NP0IbMIrQtDvmWjLU/JL4t5CrbGabk
 OJvym9FN9DYwc3Gk6ENlSX4Idxf3DBqOi+ANZJVdyk+eeq4gbNS7RGTar0hNB8rhNOgv
 vVc+1G7goApqEyhxSmZoKh4octr0h/hgHnxqjp+4tnnA0KC6oqIH1iESzaQKexXX+20p
 9yLA==
X-Gm-Message-State: AOAM530zMAP86oFlx9ff6saXOk5YYbQMg3v7ti3KvPlm8yMdqLuar9c2
 Z6b3sM7w48P6CNZNfvQHMjcWwkiL2K8=
X-Google-Smtp-Source: ABdhPJxuZkec/mSXe11e8IsfYvLrkIdA54rd3yFc8j9aHNN0jwtyZJS/XmFKTsMw7ovJP5+pJjdzLg==
X-Received: by 2002:a50:da06:: with SMTP id z6mr9077756edj.355.1634833785215; 
 Thu, 21 Oct 2021 09:29:45 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id he37sm1370072ejc.113.2021.10.21.09.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:29:44 -0700 (PDT)
Date: Thu, 21 Oct 2021 18:29:33 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YXGVbUWKSxVtUz4+@pevik>
References: <20211021112358.8769-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021112358.8769-1-rpalethorpe@suse.com>
Subject: Re: [Buildroot] [PATCH] package/ltp-testsuite: Add Open POSIX and
 realtime test suite opts
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
Cc: io@richiejp.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Richie, all,

as I wrote to the first post (which didn't landed to ML):
Thanks a lot, I always wanted to do this.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
