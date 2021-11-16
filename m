Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C2CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 19:27:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F896140A
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 19:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03F896140A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF61580CD4;
	Tue, 16 Nov 2021 19:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBPKTpGtL5sJ; Tue, 16 Nov 2021 19:27:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17A5180CDB;
	Tue, 16 Nov 2021 19:27:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EA891BF2C4
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 19:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97F6E607FE
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 19:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IDgSp_vM57z for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 19:27:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D1D3605C3
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 19:27:12 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w1so26572160edc.6
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 11:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AXUhl3Epww3UjFkwKXN7hJSEu6pFe7ha3Lj+6KNnODI=;
 b=doxhTroort4XAdtOuI/t3DKEu8Jey86LUyJLn2zw79L6vv61SRAzyoYE9POOM+X6oD
 0PkqFHX91PfgIKrBdwlQqyD6nKgeUEubXmqDcofjSeWaOeZyOUz5OPxBN0yIAJDN1W4S
 OxwDXLOnE4bSd/pWPegg2wS8bfsL1jS+ODTag4UAU/2O9T4vXeJGeb0cWOgzWtvDacrx
 WuICQPjlTKLpG10YKt0NLFAVvmvTqFgoSZbaJM5guXyaywDuDGZ5PktWEFhv/P3XIEtt
 dFICx9h5lxLG9t9zJpaDBWW9GM0eIajcv0WoPb2fyGF0E/eX4cIOWjZSnvbg+XeGd+Bl
 qx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AXUhl3Epww3UjFkwKXN7hJSEu6pFe7ha3Lj+6KNnODI=;
 b=hH6QLNG764Mj6ag7ZkHb/yOCcISlHHt1pDLdl2xPohIEC554N9M95O1NbA7wtf+Idn
 TkIK9HsiqqZH6p/iStG91aUqq3UvS5bxNOGocpEvoO4kJdN10x8DE2ylHzXCAFSshKHN
 slLq+eTSPIroN6mBLz70teE9koGhnowboLyJE1zH2EEAneMtMFzLze+TZEQ7g+tQtLZ6
 kBrTREfrUcEvr5xnfoij8UoK1i8YuubK4vp31JblY2ekT//IgYarvdp8DfvQMIBTietf
 StIAQYRFPxIojGNC/jDpHXQ1N0UVEg/9IQx2CThGZkZLm9zTFjc+1yAQSbEiB2Tqa66X
 2Ptw==
X-Gm-Message-State: AOAM533Ppao5WML5lPM4HomXGoGW3GBGZ4RBv/kRLHT802OB1zOaHzUN
 V2NnLDPQup2p0oY6k3jlQnGNtw==
X-Google-Smtp-Source: ABdhPJzrQXkDboMzhIftRP7ZPAKBXQXXFqjzp4RHrPqk93FNqjwR+d3iyZ8qoaA3q0RHyltcEBokUA==
X-Received: by 2002:a50:e003:: with SMTP id e3mr13503495edl.374.1637090830481; 
 Tue, 16 Nov 2021 11:27:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f18sm10544072edd.10.2021.11.16.11.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 11:27:09 -0800 (PST)
Message-ID: <67a957e6-5330-2195-0762-128ee8f22bdd@mind.be>
Date: Tue, 16 Nov 2021 20:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20211109220328.388872-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211109220328.388872-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 RFC] support/scripts: don't build board
 defconfigs with Gitlab's pipelines trigged on tag
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/11/2021 23:03, Romain Naour wrote:
> |Currently when a tag is added to the Buildroot git tree, the gitlab-ci create a 
> pipeline with several hundred of jobs (~750) to build all defconfigs and execute 
> the Buildroot testsuite.|

  Note that gitlab also has a *hard* limit of 1000 jobs per pipeline. Since we 
continuously add runtime tests and defconfigs, we're going to hit that limit at 
some point.

  So it's not simply an infrastructure issue, I'd say.

  That said: a hack to bypass that limit is to trigger several sub-pipelines 
instead of just a single one, e.g. one for defconfigs and one for runtime tests.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
