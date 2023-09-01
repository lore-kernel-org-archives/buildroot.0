Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E7ECA0FE6
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 07:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5520160AEF;
	Fri,  1 Sep 2023 07:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5520160AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRUeBQry60Ny; Fri,  1 Sep 2023 07:19:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8475A60D78;
	Fri,  1 Sep 2023 07:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8475A60D78
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0401BF312
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 07:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1154840412
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 07:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1154840412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ejUJ_IHxLTKk for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 07:19:08 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E06484038B
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 07:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06484038B
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99c1f6f3884so194438066b.0
 for <buildroot@buildroot.org>; Fri, 01 Sep 2023 00:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693552746; x=1694157546;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6LCoZhp7Wdo4WwgJMqr1pgfpA8jp3+v2S+lFhzrxyt4=;
 b=ZnS6QOdL3QM6B/dv7Y1aaFQSpU3UqDR34mACg/DX6Jxmbk4N1uxzbbgwiazP99Vhfl
 Hk1i9H9QJYw9cKZf3kOz9GNr6sP/bFMver+DewZmzT/Mdgz8Wz1We2BYeQmfvqe09/Al
 dgPJQITtUTGK5Io1dP1bDgXZPsQYARj48uPVol8gCHCl0An3vxGn/2J1ly2CrVdYwMtC
 vebc+Q/VCbkZ4Z5oSip8xHyZgPjMRvOJwGlBCpepCZ99Y8UqRB7F/g87PaAIaK/5f9+U
 D9wDKhVib4OBQm62wFm8N7zzCVe1HuEYiqWs9WiyIQFHtYXTsbUXTFi2fQSQ3FypYblk
 fLgg==
X-Gm-Message-State: AOJu0YzI1wSUdC9TfNf5blLOde+1dpR7oXY2yuX1TIPLCxsV8iBcuoXo
 rVPcQ4JQousriloFRyNseBPGRw==
X-Google-Smtp-Source: AGHT+IEQAALwLP/w/8GQtBpz1xOMHzrZnakQR+ghws49pUXz4/YOSgtPWdiYLqW6aNPQPHlXLo8thA==
X-Received: by 2002:a17:906:7398:b0:9a2:c5a:6c9a with SMTP id
 f24-20020a170906739800b009a20c5a6c9amr1115920ejl.45.1693552745868; 
 Fri, 01 Sep 2023 00:19:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a1709064dc200b0099c53c4407dsm1633074ejw.78.2023.09.01.00.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 00:19:05 -0700 (PDT)
Message-ID: <7af21f66-d3c5-e42f-03e5-8a1f6b370520@mind.be>
Date: Fri, 1 Sep 2023 09:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org,
 yann.morin.1998@free.fr
References: <5969347.lOV4Wx5bFT@kilian-aisec>
In-Reply-To: <5969347.lOV4Wx5bFT@kilian-aisec>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693552746; x=1694157546; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6LCoZhp7Wdo4WwgJMqr1pgfpA8jp3+v2S+lFhzrxyt4=;
 b=awikScuIxOIC/7gHufgkWzkQb0I/nv3MKkafrMcqKMUXVuS8/c8rhj5tXo52H4Bspj
 u0j0KuG4HFp0Gpt3fnbwX8vKz+OY6VF3BBnJpUZAKv8ECkQb7sFJCdhYsXdlYyFbXegS
 eMJMVrsSt8b7HyvDpuw/yDFB902sChnlK/MdLHbWaplvivlCkYX1wMAGjAQo/A4/qdXh
 1BBr0FvN5tosxVLWZX6kOlWTlRCjKRlEToDIti8xzyG18EGiTfCybcp3LPZWa7gb0PVM
 ElciU2PwnPZ6RmcpTHrUKLKh4ajMMYx5heR0HMULjKT5wt1OskW6X186fZoz2QcfhsgO
 1y9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=awikScuI
Subject: Re: [Buildroot] Buildroot docker image
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



On 01/09/2023 08:51, Kilian Zinnecker wrote:
> Hello Yann, Arnout, all,
> 
> I am looking for a docker image for buildroot to setup a CI. (I am actually
> not very familiar with docker to this day.) I found one on dockerhub, which
> looks like it was created by you: https://hub.docker.com/r/buildroot/base Is
> this some kind of "official" buildroot docker image?

  Not really, no.

  First of all, the one on dockerhub is no longer updated. The images we 
actually use are on registry.gitlab.com/buildroot.org/buildroot/base

  But even those images are not really "for user consumption". They are the 
images we use for CI, and they therefore have a bit more stuff in them than 
really needed, e.g. qemu. They are also not updated (on the OS level) - no 
security updates or anything are applied on it.

  It would probably be better if we would also create a small image that people 
can use for just building in their CI. A small image based on e.g. Alpine or 
Arch, and that is updated e.g. daily on dockerhub. However, nobody ever 
contributed such an image so we don't have it.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
