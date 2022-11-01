Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85422FA3741
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 00:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8E8640204;
	Tue,  1 Nov 2022 00:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E8640204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xQmbHiZKveO; Tue,  1 Nov 2022 00:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11016400CC;
	Tue,  1 Nov 2022 00:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11016400CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E70B61BF957
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 00:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDA9C400CC
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 00:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDA9C400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3lvuUWBpNHxT for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 00:32:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B5EA400BB
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B5EA400BB
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 00:32:14 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id f7so14061127edc.6
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 17:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t20mOGt/JwCLMxjGrRmX0nup+xN8r0WUYtcy98V0oqQ=;
 b=xD340Klh2MInblYKpq3Vg+v8d693gwi4KnG4UiAsjVtFxfZp0LcHJGdNunTXbUNocQ
 BOCOZYnAZg27xcStANhkBprLOrxUHFTj9UMoU5WV/mb3dvm4GQ4zwQIBrdyrUas/b0P0
 pOLbywP7BP2B2dErEp2idZ7nFNnKp916SZySv+1eNgMbRzsk4c4hcX/wt0QwOOCsbU36
 56+Ia7AmxqtclPB0n8oyoSuenLNA4FaRE+gVEEPxdLhdkhUQV1pvANg2zPyjz5U7ltdD
 6JIpYCQ2o/7TFxpmOI6e9DUNaMLDZ6pZUVwAwotHHIRCUoOcIcxHI6SNWw4qyBKvNAa4
 X44w==
X-Gm-Message-State: ACrzQf3CvVT8B4yziWHgvVzkSeu7UGduOxnUeMMr2nNT2VvqjREukZkm
 r6FfbuOIaUVNAWw+V0P/4ARqEiWxw097OvxC
X-Google-Smtp-Source: AMsMyM5NJHqwpsG6EEns29Qavtf2UGpIsXFwrR5RByHxRQkGDhHEaikhz3eG9L2a2WRfp1vHwKFkxw==
X-Received: by 2002:aa7:ccd7:0:b0:461:c6e9:8b0 with SMTP id
 y23-20020aa7ccd7000000b00461c6e908b0mr16297352edt.287.1667262732817; 
 Mon, 31 Oct 2022 17:32:12 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 cx26-20020a05640222ba00b004611f5efea8sm3829568edb.17.2022.10.31.17.32.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 17:32:12 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id f5so11953592ejc.5
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 17:32:12 -0700 (PDT)
X-Received: by 2002:a17:907:5ce:b0:730:bae0:deb with SMTP id
 wg14-20020a17090705ce00b00730bae00debmr15975111ejb.181.1667262731867; Mon, 31
 Oct 2022 17:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220904191010.200822-1-christian@paral.in>
 <20221031230227.222d7ad1@windsurf>
 <CA+h8R2obmhk2WH2O5oxELnYX3k+ab1pP-zS-AJfpRmQcx_SxiQ@mail.gmail.com>
 <20221031233134.6d432abd@windsurf>
In-Reply-To: <20221031233134.6d432abd@windsurf>
Date: Mon, 31 Oct 2022 17:32:00 -0700
X-Gmail-Original-Message-ID: <CA+h8R2p4CY2wKyzCoqRW4ApteOHci0HJg2TCrYU7sFdmURwp9Q@mail.gmail.com>
Message-ID: <CA+h8R2p4CY2wKyzCoqRW4ApteOHci0HJg2TCrYU7sFdmURwp9Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t20mOGt/JwCLMxjGrRmX0nup+xN8r0WUYtcy98V0oqQ=;
 b=Rxl41iLPRCI4nMIlfj8qwjTfpCXQH02arA1HCJqroOPnboR39l13O8Mw2ctIh66LWo
 73RTludsSvLqqjijAiI216n3pSboZ+Xwq5eCD1+BgFNMnB9WqUqltKdWJWBunKKKKCXn
 iIaJZgVZFNQx6GODTYIdgZi+wPMhniQqNwzWtQjjLUWnnnum5UjBcef4WUf5v45q4oNG
 nXWPOu3wiXK5djmCShk73660O/X186uEdjQFOkz/7JzFU8f1XxY/POolyCKlsIbNwoLj
 //N97FN4LEs30/maGffOCLkxDzmJm7Wd6Hs/RhBv+pKEyYlCzDaOPFXNJPmxEA10hHia
 mIsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=Rxl41iLP
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump to
 version 2.10.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,


On Mon, Oct 31, 2022 at 3:31 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> It does fix the docker compose issue, but then the loop of docker
> inspect that waits for the container to be ready never completes:
>
> # while ! docker inspect root_busybox_1 2>&1 >/dev/null; do sleep 1; done
> Error: No such object: root_busybox_1

I've submitted the patch series(s) to fix this, however, for the record:

This was because docker compose v2 uses root-busybox-1 as the
container name (no underscores).

Best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
