Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CAEC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 09:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 795D0606EC;
	Fri,  1 Mar 2024 09:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cce-Nq9Lia9h; Fri,  1 Mar 2024 09:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D81560708
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D81560708;
	Fri,  1 Mar 2024 09:16:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B46CC1BF83E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 09:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EF51405E3
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 09:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHZHSH08IlEP for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 09:16:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3831400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3831400A4
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3831400A4
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 09:16:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-566df43a1f8so260145a12.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 01:16:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709284566; x=1709889366;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7AU2lvjGgvpt9KAspc6xiNowbfKEjI6Dhe3xg1bhDoo=;
 b=vnwC7So0vTnrcLzBTxTqiUtNLbUCyCyFGQdjDFcgkbVhnYyuwlMSe93PSRBvew0tDA
 TaFAsXYntu2wQRApTy/Njkg/p2n2XbUxzRz6nqIc4yGgbCQ6AC4gCMR0MoXCvhdmmP9p
 wRCENmfhfLdrtqHS1mtfsd4CzXB3RHOB+5XnZj2mMKSMI+fZMwnl/q7ecTGMP7083vsG
 Ivp2Kd5+/7Ucl+jVc5O82h7a9tVhxP+8DiOwXP3mPYOrwTAkVaU9ril/c3vcXhdKfkLL
 9wLT9qf2c5S0V8S8oracyS+g6XhTOEINzG0M24eH6bw6go5q8l/UUrfDuLtX8+3Dc2mF
 QNnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTc9qgdgJthgEn7soQrPMzoBPMqQiM6vpG+Z3fTTO/PNj6OA6LFfemYeN657vQKK+xL2jdllnTZPMnWU+HGOPhlzYxlCpHbw==
X-Gm-Message-State: AOJu0Ywo6+m8rpoeMUIc2lgTxTcBhfMeWgnCsKboMWzFHY9IKE4c4OWa
 FEGiPewb4cdK8d0nCU3CvW90/qDLvgaXl8YsYaFy/ITa17jZJ7zGG1qys1Z+33E=
X-Google-Smtp-Source: AGHT+IHy0qDp7i3PATIv6swyqaVQV1BW6s7zuAkTBWDXvt55jmrAhbvoajN4FdzSDx0IITbeeMOdOA==
X-Received: by 2002:a05:6402:1d21:b0:566:981d:aef5 with SMTP id
 dh1-20020a0564021d2100b00566981daef5mr694406edb.24.1709284566475; 
 Fri, 01 Mar 2024 01:16:06 -0800 (PST)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz.
 [89.103.66.201]) by smtp.gmail.com with ESMTPSA id
 m18-20020aa7c492000000b005662d3418dfsm1370221edq.74.2024.03.01.01.16.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 01:16:06 -0800 (PST)
Message-ID: <333db2e4-b6ce-4288-bbd1-97a681e74ea3@sairon.cz>
Date: Fri, 1 Mar 2024 10:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240228181409.3756293-1-sairon@sairon.cz>
 <5d375ded-707c-4d56-a5af-f7f769083014@benettiengineering.com>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <5d375ded-707c-4d56-a5af-f7f769083014@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1709284566; x=1709889366; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7AU2lvjGgvpt9KAspc6xiNowbfKEjI6Dhe3xg1bhDoo=;
 b=ZgOQJsnOuzUS2Euv51JA9pcBHJZOpSYjOareMhPrIW17DfaGqzQa5zyeEIGNW713UF
 Q3QWTdxZqnsQvGnLj3p8gHLcaIhiNQmzhlRvAovBpmDBquNnTpKdQkTa4Qr6B+KbE1JX
 hOLRTq/KeijZNpxfq4VBh3zLRLoQTRwg33+x/4hSIk9YRL6EEQrpwmGA3NLqrwq1/SfY
 k55hGzRvNSsUbCrIyzBgvq5nSSQl32qnW+a8W7Y39RYB6ifzGbSWejkBJ5cqEXgQB/p8
 EdsLKu2LyNtLeP8q5A/XG/BxnX/bxLxJgZ35U6b6E/sHs/IxM/S865R60JWOVj6eeUhW
 vonw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=ZgOQJsnO
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: only install fsidd
 binary and unit file with enabled nfsd
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
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 29. 02. 24 22:31, Giulio Benetti wrote:
> For the rest it looks good to me, I've build tested it and it works
> as expected so:
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Can you please send a V2 with improved commit log?

thanks for the review! I'll send the updated patch right away.

Cheers,
Jan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
