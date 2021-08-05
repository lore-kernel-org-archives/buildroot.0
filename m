Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4130AC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 14:44:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A669D61154
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 14:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A669D61154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68209400F7;
	Thu,  5 Aug 2021 14:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eh_44_Dxp0AY; Thu,  5 Aug 2021 14:43:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 134E3402F0;
	Thu,  5 Aug 2021 14:43:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2A281BF44C
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 14:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A85F183A43
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 14:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_GBGVAhmIq5 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 14:43:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64B3383A40
 for <buildroot@busybox.net>; Thu,  5 Aug 2021 14:43:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id x14so8711474edr.12
 for <buildroot@busybox.net>; Thu, 05 Aug 2021 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VS8kFiJxMuzGjyb3q7suoILv8QFtdZJ9uE0jrUzg4Us=;
 b=bXdXNaLFGntpTaNiA1YthOjMCC1QKsSg8i8iNB/h/UR/gsE6zItfBpR5IY6GeY8kYU
 4N+a4Bt+gedsO2I+YOWFIoLqamuq2uSIcQJ8Hz94HVEDyPZ5ShttP+r4y30EkeFKiQkQ
 Z6h5KiRZ4IAMRyOKNarKMf/5vkYp5qR/2wwx/o556cyK1s/eMZe81qFCy3SrVSDRFzx7
 P7K4/3LbgBCaLqHnYEbaN6tH1+VlEpnA50QFRWM2gNMk6hXJQIckOE03REUld2L0c6jc
 RJUtiodIc+6EkHqyvFDRXOX6Wqvtj+6RXfB/+MmOEpgKEAwLGJQPO5P89dNtW+GZvADS
 ajpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VS8kFiJxMuzGjyb3q7suoILv8QFtdZJ9uE0jrUzg4Us=;
 b=ZZFtheGWGVLvRHwFQkRMDmL8YyOEYOOjz6/OhKrteCxpeOQeQ7wiOsX4BXJUTx8paQ
 M0t+VdcaX+Bal9szLk0EeoRyoRBow7yPqTvMgkaIdxW2fMKeC/YNr0lddE7YUrK36N6i
 4AzfCEv+q2IlKBcumziTyQHWgn6pIRO7cfAL4U9V9KbIilSotI5q62Cx1GcT15WXF7je
 Ii0+mkd5H4p1ovhMz59+j7nGDjc6fIxKGPFz6Lo+Xyf+H5KNkHp+x/ympaB0Djam+S9O
 V5sMH+MS2lbL9aHGzUcePzO2INlasw7XcHQjO7RtPak9kkteVZkLqJDvvevYUDhmSBaC
 PkKA==
X-Gm-Message-State: AOAM531ZAoNpoEk/E3kth00txsnTU0e2EEs1Vscs89hSNCIoNiqNKXuS
 cqr45wDeRz0DsCP6e3SfvFNVLA==
X-Google-Smtp-Source: ABdhPJxOv9pStH9nGEbDK30gzlfh1GiiDy0cy9mxmYBoG6AN8ka9/Ovd0Kz1cDWEkibxzBG7j+qoRA==
X-Received: by 2002:a50:9b16:: with SMTP id o22mr7167395edi.342.1628174632198; 
 Thu, 05 Aug 2021 07:43:52 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id x42sm2412010edy.86.2021.08.05.07.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 07:43:51 -0700 (PDT)
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 buildroot@busybox.net
References: <20210805103124.tnyy4uqurvngvq5g@fedora>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <0875c705-8f2e-ca10-cb41-bb83d9ab85df@mind.be>
Date: Thu, 5 Aug 2021 16:43:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805103124.tnyy4uqurvngvq5g@fedora>
Content-Language: en-GB
Subject: Re: [Buildroot] [BUG] qt5declarative not building on host distro
 without libatomic.so
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: ps.report@gmx.net, yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

 Hi Quentin,

On 05/08/2021 12:31, Quentin Schulz wrote:

[snip]> From the logs and also the Makefile, it seems that qmltyperegistrar is
> built with the wrong -spec passed to qmake. It should be
> common/g++-base.conf (or something similar) and not
> devices/linux-buildroot-g++ as currently.

 After a lot of analysis I come to the same conclusion.

> This is confirmed a bit later in the Makefile with `-latomic` making it to LIBS
> which might not be what's wanted?
> 
> This `-latomic` was added in
> 7d286be4f96cfb731e184c3e8cfea27a031bde3c "package/qt5base: link with -latomic when needed".

 We end up with $(HOST_DIR)/mkspecs/devices/linux-buildroot-g++/arch.conf that
looks like this:

-----8<-----8<-----
LIBS += -latomic
-----8<-----8<-----

 Perhaps that should be changed into:

-----8<-----8<-----
!host_build {
    LIBS += -latomic
}
-----8<-----8<-----


 Can you give that a go, and if it works, create a patch?


 Regards,
 Arnout



> 
> Here's the minimal defconfig I used to reproduce the issue:
> ```
> BR2_aarch64=y
> BR2_cortex_a35=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_QT5DECLARATIVE=y
> ```
> 
> Let me know if there's anything I can do to help,
> Thanks,
> Quentin
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
