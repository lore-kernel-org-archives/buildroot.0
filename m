Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FB3C636CC
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 20:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EA494186C;
	Tue, 31 Jan 2023 20:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EA494186C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ERONiQiwl_OO; Tue, 31 Jan 2023 20:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 809324186A;
	Tue, 31 Jan 2023 20:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 809324186A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 088991BF34E
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 20:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3CC781E2D
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 20:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3CC781E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xo_-qjvcJa9u for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 20:00:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF6EC81D65
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF6EC81D65
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 20:00:40 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id k4so4808051edo.12
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 12:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z4GpEQU0Ok6BXwZAba44j71kZqbhk/LjpfDEo7kkdpg=;
 b=5N/AdaofCi4vWdVIg7OhzdrrlYXt+HUkwqbGXZrzEkH1hjy5YEBQUfOMVB+8rtuN2f
 2i2J3R8qgo60QFfV2DAZ0T5G0TAzHh1mGo9vfWp2/IBzzKJRkoU5bhoNKW1RrfeaPpe0
 EP0A9/olUFtByvRPI2tSsVxU51IFb6u0ATk8t1veWdxPzjbmvF+eoWvbN3RwJFLhCbve
 b/4BgbstxekLMVQg9rp5zKQpCU8ZzPDSGRTuYLSjA3pLA3WnhKuk5Q+3AL2uX9+J4u8z
 ZrHUnI23TbCWW/WqyNJAW4JQ8vWj4T6BlQz70SfwjU4eO9wtEYXMRDbaY7FCGRrEotwJ
 3a6Q==
X-Gm-Message-State: AFqh2koWIbwgp+/hEI1/fegFgZ33vZMGgpaWF/aq2aiUucbLEU/qa0YR
 eNRCLH/ar/5/ElqvRB3UdDb/VGofbDM=
X-Google-Smtp-Source: AMrXdXu9Q/OXFi1U4HZ+tUEW+T+h0Kkm0Hr5m8x9H/lw12WKW6FEq7HugY4095mKPmQ16X4tkwGXyA==
X-Received: by 2002:aa7:de87:0:b0:49c:d620:4bf8 with SMTP id
 j7-20020aa7de87000000b0049cd6204bf8mr57095391edv.24.1675195238777; 
 Tue, 31 Jan 2023 12:00:38 -0800 (PST)
Received: from devlab.lan (93-43-212-100.ip93.fastwebnet.it. [93.43.212.100])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a056402134800b004610899742asm8760728edw.13.2023.01.31.12.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 12:00:38 -0800 (PST)
From: Alessandro Partesotti <a.partesotti@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 21:00:36 +0100
Message-Id: <20230131200036.4797-1-a.partesotti@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230128094119.10660-1-a.partesotti@gmail.com>
References: <20230128094119.10660-1-a.partesotti@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4GpEQU0Ok6BXwZAba44j71kZqbhk/LjpfDEo7kkdpg=;
 b=Mn5Az3lLi2Xt6u3yPX7aotQSluFbvo1TZsyrCEWhZCr/dWYc5GBgHjUAHHuTja8FBz
 Fl4gxgdI+qxcS7jDA70Q79u2cViTl1KmKV8NhNGQuujNlmNG0qfIE9HlxVs9X9AwFbyA
 imhrUkZDqM2WMEm5mu3F7jZQw6wI0JwGRfAVzsC3DERtSU/7m8zMEjL735PxviDZx1ot
 vYLrH4vIBXXh52diZK2n1cS9+NSqpb9lHwEMvD+qwsz1DWHAEf8HWgVWJaIYjjho1Edd
 ILSZpmYFyUudrnupCeS1+vulgBISL0r6nexPf0yVa8YDtPzu1OSS76VzIZJfmFatuw0w
 i22Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Mn5Az3lL
Subject: [Buildroot] (no subject)
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 "YANN E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Subject: [PATCH 1/1] package/oatpp:: new package
Hi Yann , All
I've resubmitted the patch with the requested changes. Thank you for your time
https://patchwork.ozlabs.org/project/buildroot/patch/20230129225000.336472-1-a.partesotti@gmail.com/

Regards
Alesaadnro Partesotti
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
