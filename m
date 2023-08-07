Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BFAC001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 09:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C22B4031E;
	Mon,  7 Aug 2023 09:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C22B4031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5urV7vQRrq7d; Mon,  7 Aug 2023 09:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED166404B9;
	Mon,  7 Aug 2023 09:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED166404B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A84A1BF329
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 09:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B12E4148B
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 09:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B12E4148B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9xQ2STs3eZ5 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 09:19:34 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC6DC410BE
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 09:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC6DC410BE
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31792ac0fefso3177853f8f.2
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 02:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691399972; x=1692004772;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xpOyLiXPBZaps9vGsn35gPVi5DaslKORL6FsbpOMhy4=;
 b=AfLrau+jguVkDnBlKokIc7riyLzJq80WJTwkJCoUPAzHf1OYbHQl696zjMRKIZcw05
 jwvpNRBGVUWHxPKIRdNbEPnzCjxa3aEu0OpkB67Z4CxS9AkHeFVdrT+j0Ejepi77U/fD
 DKikb7pfnVrKlSvZuMs45HEiuw7TgHBar6oqLslO2orYvAB+POBPQCAGShiof1SfUOsG
 ObY8+iNIIj+DqqHtKXgh41g3IAfnkPoKPk8S3K3PxZqieelIr5eAWcXpqyMqF9SiMZeK
 jpEEN2110N3eRXnfd2TyuzYHg4jw7vsuOUz4N9Pfih6t2MpT653nMwlTXcM9XndX4vjQ
 D+CA==
X-Gm-Message-State: AOJu0YySfN16cSc7YGVSEsasOy0wCT8Vjk4roFd7VRyKlfVQ607ZMeA1
 d5PX7vr+TR/DlzEtMWUZPNeuEm/MI9Q=
X-Google-Smtp-Source: AGHT+IEBGnIZwH3z+euIzzsSHTLVIrZFJ9cwWm0gSaYRQVA9Vm2VxLQVBTJT9XU6v530+1sko+Zzsw==
X-Received: by 2002:a5d:4044:0:b0:314:a3f:9c17 with SMTP id
 w4-20020a5d4044000000b003140a3f9c17mr5698973wrp.42.1691399971970; 
 Mon, 07 Aug 2023 02:19:31 -0700 (PDT)
Received: from [10.0.0.120] (static-90-255-244-241.vodafonexdsl.co.uk.
 [90.255.244.241]) by smtp.gmail.com with ESMTPSA id
 k2-20020adfe8c2000000b00317ddccb0d1sm5944406wrn.24.2023.08.07.02.19.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 02:19:31 -0700 (PDT)
Message-ID: <7a065654-a4bb-5ce7-dc9c-801037f0f4bd@gmail.com>
Date: Mon, 7 Aug 2023 10:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
From: Nick Betteridge <lists.nick.betteridge@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691399972; x=1692004772;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpOyLiXPBZaps9vGsn35gPVi5DaslKORL6FsbpOMhy4=;
 b=KgJ3GRvi6qoqeQ4DR8S4kC4bldqPa5L/X+ZsEqIduNpZ0BCK0v0Epw4rq2/EBVCCoc
 1jLHcISAXdWCuaOaXE1sLncALRiMW5QPiRgdcnRueA8bosLghxL/X3pvb4rXX5saEfPH
 RwjRgLLiZ9JOwbTgraPupo2rcYF1jGLYPlH4sjGaAJrFWf+OyOY/rxWtW/k3h9BPab4d
 Di+9NND/3AFgOMh4tMh9l6uBO0oapvizWfMxlatb/QqBJqijc3JuIGakEfW0wCD+Q580
 dJ6C+4HgNQY3EFIb/hr6IvNcQTGCF71OpGm0A76ORxSmdaqQXeL1FqN0CqY3VdT2KiKK
 nARA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KgJ3GRvi
Subject: [Buildroot] rock5b & 2023.08-rc1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I just tried to build the rock5b, with a 'make rock5b_defconfig' and 
'make', and the build failed during the kernel compilation 
(page_alloc.c) - there were many 'error, forbidden warning', many 
referencing 'in expansion of macro 'adj_init_size''.

I tried out the rock5b last month using the patches posted to the list 
and the build completed - is there something I can modify in the 
defconfig to make this work?

Thanks

Nick

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
