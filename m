Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30042E784BF
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 15:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C96DC822D1;
	Mon,  2 Oct 2023 15:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C96DC822D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ASSm9w7si0kT; Mon,  2 Oct 2023 15:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A6A822D2;
	Mon,  2 Oct 2023 15:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1A6A822D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB7401BF5F8
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 15:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0580822DD
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 15:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0580822DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEqy1daJLAfF for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 15:43:02 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49746822CF
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 15:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49746822CF
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-991c786369cso2238092066b.1
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 08:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696261380; x=1696866180;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ltxDSHXutTykaK5Ebzlwpw/jLUrr4LRWG55V+SUEAqM=;
 b=j8a3ZcBe5P/3eY9ddBb87rkWneMXuhtJTLAPig6+epqeJ41vOyKECsWfTPVQ8TE6XW
 YVbez0flluLK7BMjq6XgJkIUJiK75w35CB/oRehqnGHu9phG+pvHFKUex3hx9LO6OFIP
 mPN7eg/5V7dVd8AMtX1EHHKOJK8di9NoNDxYLzC7tdf+eV27t3Z+DifqrG90YxPpymEr
 VEWvmI1lQinrRCIpNK0QVgHNiBISDCmJxg3/vt51w5SwD1nrjxrDZqZj4/xA6g++DilQ
 jj94O171abAyoCFVjCroBowQg4n7DE8V0XzgVP8o+lckDVIAWJFAinGEuSfG03GGIlPl
 BGsA==
X-Gm-Message-State: AOJu0Yy2w8B5Cfg6DpfVQnKVwHbbolhrySQGNWv1FG5Ddc2GiQmZPLzM
 Tfy0aIBiT2xsj2c3iyHDqBbhYA==
X-Google-Smtp-Source: AGHT+IGQnYcIw8yjM9UZJsQg2iz7OanQenndt9OzPVXLsYAlR9ehJIC87//5PbJ69nxTfdeUU0a3tA==
X-Received: by 2002:a17:906:5daa:b0:9ae:5aa4:9f7 with SMTP id
 n10-20020a1709065daa00b009ae5aa409f7mr9139193ejv.14.1696261380296; 
 Mon, 02 Oct 2023 08:43:00 -0700 (PDT)
Received: from [10.1.0.174] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 o26-20020a1709062e9a00b009ad88839665sm17174079eji.70.2023.10.02.08.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 08:42:59 -0700 (PDT)
Message-ID: <422a9653-0f29-e6ed-103d-d8126561b477@mind.be>
Date: Mon, 2 Oct 2023 17:42:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>
References: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696261380; x=1696866180; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ltxDSHXutTykaK5Ebzlwpw/jLUrr4LRWG55V+SUEAqM=;
 b=cXjVjW2L4peJMoGDJbmhSG9EplreT5TgQ7x4umHDYayYieIgo+oIZlNqYfBu3JYp4x
 QutuE8MJAVUDvT3Ubh1prCL7sEs8sL4D4gMTweo38X/kqh+1DpwwIPCwQjLfmk0LaabB
 rIQt8kqMPmKoHto6c1VJgIpL9s3ZQC+zQlXNEf7XnpHfjuVSag7uFxXcr2QIvUkucJBM
 8+XqbxyAcNDAJji7ErzGLUydtCLZm4LUdF7nG1KUz3qONvd2DWomnWqplPmG2Aq9t20T
 n1fLuXwBNo2GVxY5k5JTavAvEzgDWfO3a2Ta0TL1RFSYpA4hLnxDPnX9pNDCpl2xBkek
 FE4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cXjVjW2L
Subject: Re: [Buildroot] [PATCH RFC 1/4] DEVELOPERS: add Thomas Petazzoni
 for nodejs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/09/2022 22:40, Thomas Petazzoni via buildroot wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Series applied to master, after reworking similar to the just-posted go-bin 
series [1].

  Regards,
  Arnout

[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=375729


> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 564149de0f..f82472bbb5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2902,6 +2902,7 @@ F:	package/msmtp/
>   F:	package/musl/
>   F:	package/musl-fts/
>   F:	package/ne10/
> +F:	package/nodejs/
>   F:	package/pkg-python.mk
>   F:	package/pkg-autotools.mk
>   F:	package/pkg-generic.mk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
