Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA33DC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CA26409D0;
	Mon, 15 Aug 2022 12:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CA26409D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jc-zzpuo4S-s; Mon, 15 Aug 2022 12:18:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 131F0409FD;
	Mon, 15 Aug 2022 12:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 131F0409FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 015C71BF3B9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD70E60F45
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD70E60F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uguAqAs58gfj for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:18:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2681860F76
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2681860F76
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:18:53 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u3so10378925lfk.8
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 05:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc;
 bh=IYCepEnVBd2jwOQiPTiX6O6Db0ecEFUF2Oppv23MviM=;
 b=1P3OmuRFcZlWra3+5KkI7EdmANJYimoZ6DWLQ4hY8zxLlIJP+peKISuJYipXtWFehw
 VuL4YUjfF6haiDOLX+FAiBPYpCJPOfoHve8pyHU/29mXSPp+SO8UYE+14wf89sK8B6PD
 PW7z0MOtdC815HqHsgfAtiPVvG9E2gGjallyIKviic5rpuLBl1vaqOWLV3qBWOIJLjpE
 EZDqr1jRCDgdCyipB4K2IQ13hmAFr7aq+TjBhMT95ZzM55w8Ap79rwtCGZbTSLJyNvHv
 P1WEEFTtiQjQjN97+LV06rVi/tMLoKsLTUYlOZ1MZiDda2qydw6Vv25x+j0ddVszUQjO
 2t0Q==
X-Gm-Message-State: ACgBeo33lVULZ0mNE8NXv1zynYRWr6nMnjZfk0YrtLJW6jmyYUfubOE2
 Hf10Ulcku5TjLZn4eDyi9LBzInqePeY=
X-Google-Smtp-Source: AA6agR4whIxmRNIXxCHrPptLAsiW8xttnTZDJzxCfHb3juLxOOjCQmZii4cRGQk3wi/mckFogPVp6A==
X-Received: by 2002:a05:6512:c06:b0:48d:1d99:2a1a with SMTP id
 z6-20020a0565120c0600b0048d1d992a1amr6054153lfu.396.1660565929225; 
 Mon, 15 Aug 2022 05:18:49 -0700 (PDT)
Received: from gimli (a124.broadband3.quicknet.se. [46.17.184.124])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a2eb5d2000000b0025d9552fcafsm1391341ljn.97.2022.08.15.05.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 05:18:48 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220815114945.2c32654b@windsurf>
References: <20220815090736.79798-1-troglobit@gmail.com>
 <20220815114945.2c32654b@windsurf>
Date: Mon, 15 Aug 2022 14:18:47 +0200
Message-ID: <86fshxn1i0.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc;
 bh=IYCepEnVBd2jwOQiPTiX6O6Db0ecEFUF2Oppv23MviM=;
 b=ifGSXfjBfawfX1KBijNbXafYNyLwlIz1sHuzdgKYRDtd4CHFf6cftyYgEcKQuuRhEu
 C83VFU6bMJco2jtaS4H5DU8nTrIAvpnq9syrjrpnT0SY0JJkoc/kux4pNVoU7/tQSimN
 DN9e4C6E6X7FU7aDAIhq3thvT1oURdXo4Dy0G0njlTWBb0ojN5Adgua7lXvrShHfmOCq
 7ZLd4kTZXoyzyJoAdlFx5zFgQs35u/KW22RWq7ptzcTLTUqRfExvcq+ALI0/iQIhFlZ7
 qyoivvps40n2yRndl4rWH6C+wzTjImdiPe5oWRZ9o6TUTqz8zl1lGjcYgdnayWuz1QFP
 FAow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ifGSXfjB
Subject: Re: [Buildroot] [PATCH next] package/sysklogd: bump to version 2.4.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Aug 15, 2022 at 11:49, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> On Mon, 15 Aug 2022 11:07:36 +0200 Joachim Wiberg wrote:
>> Only one change compared to v2.4.3, fix for running `syslogd -T`, which
>> should use local time for all remote messages, but time is always logged
>> with "Jan 0 00:00:00".
> Since this is a pure bugfix release, I've applied the version bump to
> master. Thanks!

Wow, thank you Thomas! <3

BR
 /Joachim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
