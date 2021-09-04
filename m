Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C78C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:10:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDDFD60F55
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDDFD60F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DEA340702;
	Sat,  4 Sep 2021 20:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CcekVn0y5tX9; Sat,  4 Sep 2021 20:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD18040631;
	Sat,  4 Sep 2021 20:10:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AEB11BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A1DD6064F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v5uFj8_nXL9R for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:10:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D448F605C9
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:10:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id jg16so5070345ejc.1
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=+IMn73S6AVTxaL6+7E3qbB7qnRfV1zjIrStzs57cT2w=;
 b=UlNGAAj1BtWDtrQTyNFKTGRC+1yBjgxz95RYMtlQP2dNfPsM6znLpNYGW0Tt16oXCR
 /ubWIRENDPgoJZf6E/bxw1Y4z2RJQENkJ2+qYZMNARgqa1LEJssPdFlfxqiKiMDlSUNz
 Q6t+mDwcqBUZmmko/7TpjJDm49NzmQw5BLQ7Uykmgw7Nrj3uC1NAFYju7r3Fv1UCFq/Z
 TuzijAuKfuJHtjNvGBvW1kZO4/pD1Z0iO3LCyTDHzZbDSc/qgUd/g3zSRr/TWEv2M1jR
 47IoowKIAjnhxqFakRSusONUOqqwjvmCHRAu5BXTKaCJmOFkHSKbuJ7kxM676es4GEM8
 9PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=+IMn73S6AVTxaL6+7E3qbB7qnRfV1zjIrStzs57cT2w=;
 b=epedjE1hK2Tjy3Wp+oROHqxEdJZAVbEM5MMkJVf8l4UT4Fd7eOYEBjTvm6+2N7jwaD
 4CF8x2VsEcmPjZwZNGKu3MkyUR4tn1U8v1YcuRhuhQ2dsWl/WAcie1TvRTivCCYIkUd2
 5plpiuHOOmfrIPMwRBaQQVZW64d1CsvcLZQrbCpqgVCbTSkEDJH6yyNbodLMn6FShF+7
 GcJD3KiShv8rgKDFPJBWHuwjoU9zF5Vs31xCpVl7XZch0rXuvPVrZ29OpP7I/uA+eJSZ
 oLrjBXc7Usiv3rZF7DyuO2QsOqV9qKirl2C5IJM0u9L3YLnm2W2igDwWCVUiLPjXH3g3
 PI3g==
X-Gm-Message-State: AOAM5307khAJL5cKLM7p3XmswTKPuylWg89EQ//fcaXdWUI9c9p6xyTL
 YDIRd+JjMv25LeCKkkCvxuNDsf4HH5k=
X-Google-Smtp-Source: ABdhPJySTAeN7BETLU6boVMHW0nH280cPKGjPqoSqLxjg6Xt0mGeLO9waG88HcEeXUTC/sDyXIYnAQ==
X-Received: by 2002:a17:907:7f93:: with SMTP id
 qk19mr5413970ejc.433.1630786214985; 
 Sat, 04 Sep 2021 13:10:14 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 n2sm1824041edi.32.2021.09.04.13.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:10:14 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMbzR-00049l-IE; Sat, 04 Sep 2021 22:10:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210826220128.C3BFC8DC50@busybox.osuosl.org>
Date: Sat, 04 Sep 2021 22:10:10 +0200
In-Reply-To: <20210826220128.C3BFC8DC50@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 12 Aug 2021 23:17:00 +0200")
Message-ID: <8735qkp0f1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit branch/next] package/xenomai: fix build
 on arc and riscv32
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8425187898829098062=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============8425187898829098062==
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=74196b7d059684e555a87e5409c21c56c727066b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

 > Fix the following build failures on arc and riscv32:

 > latency.c: In function 'display':
 > latency.c:326:21: error: format '%ld' expects argument of type 'long
 > int', but argument 2 has type 'time_t' {aka 'long long int'}
 > [-Werror=format=]
 >   326 |         ("RTT|  %.2ld:%.2ld:%.2ld  (%s, %Ld us period, "
 >       |                 ~~~~^
 >       |                     |
 >       |                     long int
 >       |                 %.2lld
 >   327 |          "priority %d)\n", dt / 3600,
 >       |                            ~~~~~~~~~
 >       |                               |
 >       |                               time_t {aka long long int}

 > altency.c: In function €˜display€™:
 > altency.c:262:21: error: format €˜%ld€™ expects
 > argument of type €˜long int€™, but argument 2 has
 > type €˜time_t€™ {aka €˜long long
 > int€™} [-Werror=format=]
 >   262 |         ("RTT|  %.2ld:%.2ld:%.2ld  (%s, %Ld us period, "
 >       |                 ~~~~^
 >       |                     |
 >       |                     long int
 >       |                 %.2lld
 >   263 |          "priority %d)\n", dt / 3600,
 >       |                            ~~~~~~~~~
 >       |                               |
 >       |                               time_t {aka long long int}

 > Fixes:
 >  - http://autobuild.buildroot.org/results/448efe22e8fe058a1b354a3c124874e30b9ce138

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard

--===============8425187898829098062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8425187898829098062==--
