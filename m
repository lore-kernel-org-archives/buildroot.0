Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884FFC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 04:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F98360E0A;
	Tue,  7 Feb 2023 04:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F98360E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8yLyM6KFCBvE; Tue,  7 Feb 2023 04:32:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 833F660DFC;
	Tue,  7 Feb 2023 04:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 833F660DFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98DD91BF2C8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 04:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 801EC40477
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 04:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 801EC40477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QF4FQf1CtLDj for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 04:32:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EB674047C
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EB674047C
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 04:32:37 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x9so5833603eds.12
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 20:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CfL32mwd0xRNUEso4/4//SnpaFGi/n4/sRVqZKzrbxM=;
 b=O53co6hsZTic+9uDRlKJh54J3+7YiAeJnAef4kXd4wR04T/nhJnHPNxKaai0qdWMxO
 DiQ+utbKwHxwVnsOpf2wakBds9lc8IAly2IClICDsDhzrLNvVcIBTuZYjv/k668rYrrD
 IKfMXC9xFx/Lo0P4PwF0yYIF2ZRnEf+T1nUsStVINpupsznR595jXD4j/DruxEoPJmDf
 TBsAqzrVE3iBLMkSZgzFG41q4bKPULAf7AajlFejpuH/FB8ElzfOnYSz9oYbuWBmN9z7
 aMhz3yRFpTiulOExV4qUfGaQkOWOCfjFxKosSosFVqKKsiwCtkdZoWinzjXoQSC2KJo2
 UfbQ==
X-Gm-Message-State: AO0yUKXTk1rumDLATXrN+4BdU1DFj7WNHInCYQ9oudInugOfnURjQT3V
 +Qu9xrrmwi5GScS/34Z1ZWQf2BcD6/ZZrpcplaI=
X-Google-Smtp-Source: AK7set/Ghuu5jsJgwxozAj2lkT5gixQH3NgdkOdWrZCCLK2Ama2D41KGb+bjjYmGttGjdGC4NPGhDw==
X-Received: by 2002:a50:d492:0:b0:4a2:4a89:2331 with SMTP id
 s18-20020a50d492000000b004a24a892331mr2033049edi.29.1675744355516; 
 Mon, 06 Feb 2023 20:32:35 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 f8-20020a056402004800b0049cbd334b13sm5849415edu.29.2023.02.06.20.32.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 20:32:35 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id hr39so10520343ejc.7
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 20:32:34 -0800 (PST)
X-Received: by 2002:a17:906:1c14:b0:88b:1344:9709 with SMTP id
 k20-20020a1709061c1400b0088b13449709mr520621ejg.162.1675744354692; Mon, 06
 Feb 2023 20:32:34 -0800 (PST)
MIME-Version: 1.0
References: <20221230025221.1051537-1-christian@paral.in>
In-Reply-To: <20221230025221.1051537-1-christian@paral.in>
Date: Mon, 6 Feb 2023 20:32:23 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rWJgkvo2SnZyOeKotGGHa09g9FYoonMYB+prn=u5_3nA@mail.gmail.com>
Message-ID: <CA+h8R2rWJgkvo2SnZyOeKotGGHa09g9FYoonMYB+prn=u5_3nA@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CfL32mwd0xRNUEso4/4//SnpaFGi/n4/sRVqZKzrbxM=;
 b=H0OvQLcRwG8wMvxvL9MgmjC9U9zaSkAZVtPOPzOIvAD6I40x7KK4GroUm1cheYJanH
 SF7SvHbfxFN0ma/YUd2CHVVTsYUXrWyJGVODpVJQu5L2r9ajMHKFD1pWWZo5VXb52g01
 bwDYCLt9COku/s9tcanHvSQlm4Qh1+fBXr8bs9cMFGb4Oomh0H4rXsRV0f2pHks69lIj
 bSElmtmVa+3ZEqRrgaRg0ft4r7JFbIxShAFTg5M0ko3rFtS9psS0rYGqYcQ8fkFVLCYK
 jiBfiMVJnS2MTGJiX9Nx70YHvm+YvF2yNkPPGmNSgNrV5GF8gnWSkk+sWB9GkNY+GnDh
 Q2SQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=H0OvQLcR
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rtl8812au-aircrack-ng: bump
 to 2022-12-22 version of v5.6.4.2 branch
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Thu, Dec 29, 2022 at 6:52 PM Christian Stewart <christian@paral.in> wrote:
>
> Fixes:
> http://autobuild.buildroot.net/results/4f6/4f65b521d5c6cffdf5f6294ce0257b9a19e441fc/
>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Christian Stewart <christian@paral.in>

Is there anything further needs to be done to merge this? It fixes an
autobuild issue.

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
