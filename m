Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F73C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 01:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D311B417D2;
	Fri, 28 Jan 2022 01:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gzgXDiooYdNB; Fri, 28 Jan 2022 01:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35A3A41781;
	Fri, 28 Jan 2022 01:46:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89E371C1148
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 01:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7870784DB1
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 01:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pmwaeNhgej9j for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 01:46:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 575F684D65
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 01:46:06 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id d10so10641688eje.10
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 17:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=SGp1FH/+5SOIXbZdFu6A9ywkD9xu/vqRNTDZtyYQ+SM=;
 b=S3Bx8H/BPvqSZCsCiVly/tIogGbFXONXm1yuTxks7Kgdq2V+ZACpTlFfHwxu5ne92y
 UdwF4bPtdslqW1z5o85rXGJuUxOVxV9+rKTGeZrMHrLRB2M1d5x+Tl10TMDnwLgQXjRE
 K1sh+dywPVdVIthLHVSQBWIcTuGm21rluXuwO+tJIybBQc19GAlF1JbkxgV3UzBrmeoq
 Rq4L7RinmBiQalUeJjac8NnPGkAjV31FJszaB+CQz3MIcayMI5OGFRBISeqIMCddTb5/
 AlYuCfvb1u2ngqOZr4A5+fPe/rZeOUJO3IYxQ301ZMIB69HMOhA/e1eRmZ8Z1AnP7lUs
 RtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=SGp1FH/+5SOIXbZdFu6A9ywkD9xu/vqRNTDZtyYQ+SM=;
 b=AYsAEYAIBM6GuexvBcb9LykFfP3srEj+rGGni4CFPohfhcfIk3HEKjQX/ARyHqanW4
 FHZvNTeIi/i//NN6T0N5F3PWjdMkRgmpd7KQUZq2I5CqylDt5rO+7XoHEmVdRs9xc4NO
 TLLPR6nHN8bthILE588jW+papUPl0cieJHvZSm8e7yCpu7JOHRxONMpJ59XtDyvGB/lD
 cZKBmtQgPDElJdykwk9cs7Q4BqaZkRmqd8hzMbg/EWwEAWo7W5BXWv7Xk4M2h2gHfR+F
 p2VH5j/oUsmo6ZSqMvgy/dDp6Q0KGtdGStUVw97T487S/ZkTGnYEC/476jNbXE5pBNj3
 nNZg==
X-Gm-Message-State: AOAM532Zp5Q3gAVY+AeRsi+AHuCq27JP3ygW849nznCwmYUlQKO0sP4Z
 O+mYB7BeDMUtlQN8Qi5GNyItrZTJpq8KrdIP
X-Google-Smtp-Source: ABdhPJzxo+84FXYSt5YScF8ksjs6wULSZ2+JB4Z+Lgy9YLswwTeU4rVmHvFtB15bNnaBlcq35KuCzQ==
X-Received: by 2002:a17:907:7f8f:: with SMTP id
 qk15mr176345ejc.287.1643334364532; 
 Thu, 27 Jan 2022 17:46:04 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id o11sm12049687edq.5.2022.01.27.17.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 17:46:03 -0800 (PST)
Date: Fri, 28 Jan 2022 02:46:02 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <YfNK2vDk+noFqzO3@pevik>
References: <20220126235652.25712-1-petr.vorel@gmail.com>
 <87lez191e6.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lez191e6.fsf@tarshish>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: bump version
 to 20220121
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

FYI tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

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
                     bootlin-nios2-glibc [14/45]: SKIPPED
                 bootlin-openrisc-uclibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
        bootlin-powerpc64le-power8-glibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                    bootlin-sparc-uclibc [22/45]: SKIPPED
                   bootlin-sparc64-glibc [23/45]: OK
                   bootlin-xtensa-uclibc [24/45]: OK
                    bootlin-x86-64-glibc [25/45]: OK
                     bootlin-x86-64-musl [26/45]: OK
                   bootlin-x86-64-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: SKIPPED
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
                          sourcery-nios2 [45/45]: SKIPPED
45 builds, 6 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
