Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACE4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 20:30:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6F66619EC
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 20:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6F66619EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5829340117;
	Mon,  8 Nov 2021 20:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nHh147he8APF; Mon,  8 Nov 2021 20:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91BFA400C4;
	Mon,  8 Nov 2021 20:30:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C2AE1BF3EF
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 20:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AB71402F8
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 20:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4P2lbKwSO83k for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 20:30:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 742EB401DE
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 20:30:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so684506wmb.5
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 12:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=AXXbUCq8NS5TvmDpjEEq+vY+4Qcx/7n/+NRE4m8U6gc=;
 b=CmpxeHsyMsZgz/BH0cZKlb2gu4JJxXxE0cIs71J05hJskieGphTfOf+REuMtRQuYOO
 teIihOv3B54KdCPLpCZgNW5SVgIRgKDL3M8YbiHJJs9KiigeHiTxdQ4V39knsCcI66Ql
 bxCpJWQN6kJ3ASqjba98A6yJCYg2R6u6i3Ejdw9pz+TRH7VXstu81enLPnbxNTsn4OsZ
 AEn2BjlOKbHLSEk+qIYGe9ol4DOkdru1MLPol/gdl3GfRgw33e/DslKnsH+cGl1HzOuP
 J1Gw4lJVk8H9EThhkUgQxZnSUwcH7mTYQAKvdmpzESYBlIXMqinLiGpHsIRV0gvowXz9
 eqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=AXXbUCq8NS5TvmDpjEEq+vY+4Qcx/7n/+NRE4m8U6gc=;
 b=JXwQvu9wHSn5nnO2QWVHadRojL68ZN2rdyoAM5Psfq9roFGCJH0cdqsD8Q7vz0mSkw
 ahW86gnfCfCJ39u/LGRF+REmJMwEMGe5OyV8P4KehOZXW9K/eR0NC9WFW3b39tNGvpWl
 qjKyisTMmhFjqiQ8ckKYjR5Zo6BjralPToGTwAwtZ20kRs25QT9PDA+LXkgpG3Fs/lfU
 /9+bSLzID8HPlSmEsTA7RJpgbW6hoHnqcON9svgMyIT0RNSxhgjCGUJRtjXcpH66dQEW
 MH0gBtuGditM+Y+7s2QAHzQCf2onHgJY+d+wulfy+SlurIdt34bZa3fmM/+Kvz8CTlVk
 Bc6w==
X-Gm-Message-State: AOAM531YkUxk+R8seLj79JYc4H7Xh/L4WaeXEz9gMWGqHTH7vmIUUfRQ
 w+KT0+zrsDKqBvdpaHXjObQ=
X-Google-Smtp-Source: ABdhPJyePpkisFeKipEW4ESQgnxrCLTZtfT+sLX61MBbriEq7AQEqFxhd5jUA8sPjBxKpeYMmRomEA==
X-Received: by 2002:a1c:1fcf:: with SMTP id f198mr1152510wmf.66.1636403419654; 
 Mon, 08 Nov 2021 12:30:19 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id w15sm17983457wrk.77.2021.11.08.12.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 12:30:19 -0800 (PST)
Date: Mon, 8 Nov 2021 21:30:16 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <YYmI2G+VQs4XdqYE@pevik>
References: <20211108201940.17754-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211108201940.17754-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/iproute2: bump version to 5.15.0
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

Hi Peter,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Thanks!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
