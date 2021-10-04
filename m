Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CE4C433FE
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:57:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 013386124C
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 013386124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBE260836;
	Mon,  4 Oct 2021 17:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSBUmTUNYe5F; Mon,  4 Oct 2021 17:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC316075D;
	Mon,  4 Oct 2021 17:57:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 425641BF308
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3138D6075D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfx4FhA_IQt5 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 17:57:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3E746074B
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 17:57:27 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v127so14082051wme.5
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 10:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=wLv7SaPTqvNRu4eN46RvGxwzhca4zZK37hjRLyqzBTU=;
 b=DTHlQM0nTa2gtgwtIIZNZ1kxt/R7qisKeTLlGPcBEkHxhrv/AphczuDX0f/KzAWxgF
 3vlvKo2io7u7/oLfRDj77dFCdclAEZkqJTDnNedmy+U0R+3XYpJwN1tSwvUCWH1wov9I
 M+lZUF60dMQN1P+EXYTnS2iry9PQ41lVyeOn8N1P8SH4r/m8VXP86TGl969+Z8N2AnDm
 lwbACckyiyLLQyBEL6s96sLURzyb6MIPcWYSAImmW6bk2dVI4EAikmdEt7YhO5qIgSwg
 aVLZOjgQ4ydM8F+MKN3rTHrdFKFTpVatzg9nep+sz9IQtX0OEvJxXHFbu9FEaxRKpjMM
 lwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=wLv7SaPTqvNRu4eN46RvGxwzhca4zZK37hjRLyqzBTU=;
 b=RLje87bVpr4Kr7vfADedZVwGSqhtG3RPCGll8phgU2H8habhL0N9Ph+vrsG+MNCxMs
 It07sUXCSPJrawhRY0t+1My1xHcEtVRpJrQfA9rouAHWKc8TEMH1AI/oMPp+KEpGYg0W
 HR8yEaRx2px4Xlex/8StbMyoCHkFyQpSzRWd80VtBFEjxYkyhOk9h/FGidPf7fVL33d/
 Fr4bRR4j8hUSE19VjjkqGkJlLEjFaaoEhDkX1dz2Wj69BEdArlRQIGZqUzyfovc1x79K
 2OnOcYzc/5jcC+MSb2emSCtS9kGojat+rOxEGtBaPmL+BU/fxuEzNKUcizAL4zrSW6ZK
 jkOg==
X-Gm-Message-State: AOAM5327ztDHX5q56lVB4SlvubxtFQrLXX7LzKYocKHz2bYCCvrqIVuz
 OGqkZ2ctU2Pk3hzCKbYACc+pxpjiFuk=
X-Google-Smtp-Source: ABdhPJyRzdAhwbmBXJ5s4sylPekESA+jxlsaVgm80ZBeyGrhboBsLS/245n0v1EMIMzBp3cHG7vp7g==
X-Received: by 2002:a05:600c:3217:: with SMTP id
 r23mr8655428wmp.25.1633370246033; 
 Mon, 04 Oct 2021 10:57:26 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id z17sm15008969wml.24.2021.10.04.10.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:57:25 -0700 (PDT)
Date: Mon, 4 Oct 2021 19:57:22 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <YVtAgvElnbAbJyJk@pevik>
References: <20211004174912.4736-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211004174912.4736-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/links: bump version to 2.25
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

tested.

Kind regards,
Petr

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed

                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
             bootlin-microblazeel-uclibc [ 9/45]: OK
                   bootlin-mipsel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                bootlin-m68k-5208-uclibc [12/45]: SKIPPED
               bootlin-m68k-68040-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
        bootlin-powerpc64le-power8-glibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                    bootlin-sparc-uclibc [22/45]: OK
                   bootlin-sparc64-glibc [23/45]: OK
                   bootlin-xtensa-uclibc [24/45]: OK
                    bootlin-x86-64-glibc [25/45]: OK
                     bootlin-x86-64-musl [26/45]: OK
                   bootlin-x86-64-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: OK
                br-i386-pentium-mmx-musl [31/45]: OK
                   br-i386-pentium4-full [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                           sourcery-mips [43/45]: OK
                         sourcery-mips64 [44/45]: OK
                          sourcery-nios2 [45/45]: OK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
