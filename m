Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2288CC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 17:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C568D605B3;
	Sun, 28 Apr 2024 17:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOjwr2CVG0WP; Sun, 28 Apr 2024 17:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE66F605ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE66F605ED;
	Sun, 28 Apr 2024 17:45:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 009B21BF852
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 17:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA15A605ED
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 17:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBlMzcQFiJ08 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 17:45:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C488B605B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C488B605B3
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C488B605B3
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 17:45:51 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e01d666c88so4894981fa.2
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 10:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714326349; x=1714931149;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z7wrmbI/yJnasq/J47lKz7pTSqFr3K6eWuW3/nftX+Y=;
 b=PDMd8O+SeGH+a9E511AcYPy8u0exAosA+gfc73MpzfrK1YHp/SkI5McvYW9KkVkgjJ
 iByCsNlzsnbN+xPnkiO5Wu91B8nUcF3mK73icZCJYhMgeBzeQrCA7tmODr/9B+QfZNQ9
 uLLWk4aRsFEix3yDzQ3esN5C/ICIgTQPUwjIHWTTnMVIyQdKfVHAZqGh6wexmen0v9Jd
 9nYjMuzkEYAskukTVPSoq6ul1Kc9tDszsFo/i/HHjIUuFe41pwnp4CHUq7v/9Ohpkdkr
 YZtrRj3aMHWJNdE32Wc/rtHJjFeAnmh5MFmUxqFl40Kl4zd5vqhd7xrkVonlzQqmgOij
 ZiFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbI/fzjBxdDrDSB07PeIxgl7aNku8SQTuDHLZMOAQZmo9sASprtTUSiG1A10snKVCz8BmApk2mUA9PgKdv6BmVMTCYNRwhAA==
X-Gm-Message-State: AOJu0YyADScYPZfc5aKv7osvXpBMRYe+bPEZ1UW3TWS15qo3G03tjy7b
 K5HVVBN2YI2meGOacLq8Zo8iLWsx+naqRsD3vB9ODmnBUX/VYaPSM5vxd1GnXmS0S8fYZRKLH3d
 H
X-Google-Smtp-Source: AGHT+IFZfljY0zPQtjcQw1rIhAZnl3VzNMONIkwq72OA1SP8o53gPyGGPHlOYYSTNl+P60CZNRktFQ==
X-Received: by 2002:a05:651c:14f:b0:2da:38e:f809 with SMTP id
 c15-20020a05651c014f00b002da038ef809mr4859747ljd.52.1714326349149; 
 Sun, 28 Apr 2024 10:45:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b0041b434e5869sm13511038wmq.43.2024.04.28.10.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 10:45:48 -0700 (PDT)
Message-ID: <b66a89f1-0cca-4b79-90e5-bc8f8181814e@mind.be>
Date: Sun, 28 Apr 2024 19:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrey Nechypurenko <andreynech@gmail.com>,
 buildroot <buildroot@buildroot.org>
References: <CAOiXNkDTjbvmeyAAqtc+Bj=QKxdHLxXS8EtR1rFi_vs9A6Dn=A@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAOiXNkDTjbvmeyAAqtc+Bj=QKxdHLxXS8EtR1rFi_vs9A6Dn=A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714326349; x=1714931149; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z7wrmbI/yJnasq/J47lKz7pTSqFr3K6eWuW3/nftX+Y=;
 b=IQSyJIJFIX8i1ZZSVcGBSARXZRcuxFM5rAzPTU7X564XGeRF0LozMoxSmrWGhoITiL
 4WcurWPsqlE073M2jyJTA1CT0dML0IF167II4jch98BRKknIHxVIeyOd9wakBcaDzR1o
 m7V85ski3OUs3fma21PoxfQTmruOf6BTebS4Q6ND2za8yS3iAFCxmIc7ziRZzdeJUsqZ
 S4K0eZK86M9uJAl4A5y6ArJMxUulW8I+VvK57buT/dIXOY+jRaLDhoDofGh6iJSZXAen
 6Na6U0t2xD689M0+RO0MSAP4XoXUpCytAU7xYUOqbvhgeTNvqp51CtGgutTHo8nGHuJN
 Ybyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IQSyJIJF
Subject: Re: [Buildroot] Growing rootfs.cpio after each make
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



On 19/04/2024 13:34, Andrey Nechypurenko wrote:
> Hi Buildrooters,
> 
> I have BR2_TARGET_ROOTFS_CPIO enabled and just realized that every
> time I run make in the build directory, the images/rootfs.cpio file is
> growing. Even deleting the file before make still results in an ever
> growing file.
> 
> So I am wondering why it is happening and if there is any way to

  It's not the cpio by itself that is growing, it's the contents (i.e. 
output/target) that is growing. The cpio is simply a packing up output/target 
with a bit of additional processing (e.g. setting permissions).

  Now, why your output/target is growing, I can't really give you an answer. If 
you really want to know, you could make a copy of it, then rebuild, then take 
the difference between the copy and the rebuilt output/target. You can also take 
a look at output/build/packages-file-list.txt to see which package created the 
files that are growing.

  I suspect a post-build script, but that's just because I can then put the 
blame on you :-)

  Regards,
  Arnout


> prevent this without running make clean all or similar? Maybe some
> kind of pre- or post-build scripts?
> 
> Thank you,
> Andrey.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
