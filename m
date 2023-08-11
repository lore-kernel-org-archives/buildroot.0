Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225ADEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 16:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A77644193A;
	Fri, 11 Aug 2023 16:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A77644193A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EYwz8xXC4Oaw; Fri, 11 Aug 2023 16:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA50F418C2;
	Fri, 11 Aug 2023 16:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA50F418C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 481171BF25B
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 16:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2004E418C2
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 16:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2004E418C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nFMUxLcLNNvC for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 16:28:47 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C9BF40260
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 16:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C9BF40260
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb72b9so19160315e9.0
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 09:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691771325; x=1692376125;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbqV7sN3lX0OZl/HUJiKvCqWjvQEuNnqt1rhawOYQyU=;
 b=lV2aXI3hOIZiItx4DJqCdu8DVAMHMa543NBcjo20U1YpwASeaO6e+n16YO7tc6nPfl
 7KkRyzclTiWuqTWrye7AQqUHf5HcvpBQfkERDp85k+0mnAAdnuu/cIIHNsk4yzJJQV/E
 BRPiVXh41BrrNiTkj9b85fke3qjYeUdQqzsDXIOmi+2Yfi3z70tTFvCxXVkGt7wvHLtT
 cDherj5ccjVxUgtHus8LJerbf2WpvRTZ4mvQm8AZHPcO0yySmB1KHUmCEqDMlth4cRcn
 TRk8MIWHprWJT7Dkfnr4r2XwKb3Y7IhvAdw1XYPgfqrL2m3h5NZPD3gktLVUWK4bi5OI
 Jpjg==
X-Gm-Message-State: AOJu0YwP52LXxwz5a1cdu4CxGxnpx8RWurkhm5T5ADb+GbaB1Tkljq6W
 OIJiqyTdj110FxV4/g5H5A0=
X-Google-Smtp-Source: AGHT+IEI+meIMWGsCFDDoesjkDMNXV4Zb1rjuSXPUQaDhueJg2z1f69zK6ELKUFxuiR7+guebS2IfQ==
X-Received: by 2002:a1c:7c10:0:b0:3fe:18d8:a61b with SMTP id
 x16-20020a1c7c10000000b003fe18d8a61bmr2071587wmc.29.1691771324921; 
 Fri, 11 Aug 2023 09:28:44 -0700 (PDT)
Received: from ?IPV6:2a01:e34:eca2:2100:1908:92af:1110:d41c?
 ([2a01:e34:eca2:2100:1908:92af:1110:d41c])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a7bc458000000b003fbb25da65bsm5666231wmi.30.2023.08.11.09.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 09:28:44 -0700 (PDT)
Message-ID: <88906c88-9597-4f1d-a5d2-244337ac0fdf@gmail.com>
Date: Fri, 11 Aug 2023 18:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Roberto Medina <robertoxmed@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230710212151.574040-1-robertoxmed@gmail.com>
 <20230710212151.574040-2-robertoxmed@gmail.com>
 <20230808230609.0eaa80e8@windsurf>
Content-Language: fr
In-Reply-To: <20230808230609.0eaa80e8@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691771325; x=1692376125;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EbqV7sN3lX0OZl/HUJiKvCqWjvQEuNnqt1rhawOYQyU=;
 b=Y+RRYFg9wAwGg8CSsr04nmfWgqDVxCN1Box3ZhB0d9qNIVbnlpBQT7SfL9Jst7zi45
 770gDCfy6nAaqz/bvejVAJ/3oqgrQ3143EQkeU1gmzfNN8foyR9HhTlU6cG5avfcKEPH
 tPgUSacWYmsUd542QNs0JnYVQOS2SKunTvwKdgmpKdc6yhsLQWk+KeIo1mSY83y1f1jV
 qjQ/p3SrfbuxA6C40jDxZ7q+FWAygq1mZ/bvVgCcGp9wspZhAgdF/72aAzLkHx5CCNyk
 HvFU0Y3zTNVP2ZHd0CR7jOyx8JfjcaAA4/XBbetbgq1nRCrp4lUNQP4o/cRdhc1o29Po
 MHbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Y+RRYFg9
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/roc_rk3399_pc: Bring back
 and update the configuration for the rockchip rk3399 built by firefly.
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
Cc: kilian.zinnecker@mail.de, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thank you for your reviews. I submitted a v3 for review but I will 
answer the following here as well.

On 8/8/23 23:06, Thomas Petazzoni wrote:
> Why this custom size rather than leaving the default?

If I leave this value as default I will get the following error:

Copying files into the device: __populate_fs: Could not alocate block in 
ext2 filesystem while writing file "stm_core.ko".

The error message then suggests to increase the filesystem size.

Best,
Roberto

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
