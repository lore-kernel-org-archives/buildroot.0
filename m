Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34D0C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 00:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BF8641B50;
	Sat, 14 Jan 2023 00:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BF8641B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDZP-LtwvAfQ; Sat, 14 Jan 2023 00:27:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8737F41A55;
	Sat, 14 Jan 2023 00:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8737F41A55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E899F1BF3C3
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C23E141A55
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C23E141A55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OlVEIZT2UMm5 for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 00:27:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3435D41960
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3435D41960
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 00:27:50 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v10so32165331edi.8
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 16:27:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aWVWnu1On61GFG0pY1kuccIUSw4A+FALnsjcyxy1pK8=;
 b=DQQngXH1d/0FVCTK53UvXPObmXKV8oEgtINF6tmKjbMb8MFk+rvMjg2rvcb72lG+r2
 eCo2mZheTlv80/eqTSL9zwCcedWWDoLAFusSUt2LWDZdU5icR8qe6HXEH1nVFYNR4c4t
 rVaXiVyDWu9uunBGVtOhSiNUKlIZ32so2Fwkrm2HlbVCaKYFt6IDcIIQVlfq9Z90EOIK
 bwQquWGYkei+wi9gyk0Xtg8vLxD4Ba2e8HRH3UB4TTXpYlkYji8XIF/O8S68Z8zSP5jA
 VTeAoXQvvGWMJRc/jviGUAAvkTGeff/chHQnxENR6pVkS/g6ptYfqNfva5bSJMBpZ+zJ
 RW1A==
X-Gm-Message-State: AFqh2kosstkRGR6dKfwwT2AcCNMdVYiofHyekRJrNXMInXVLCAPFe6g5
 dUkroEBZq0TSNcENuccgAfC5Mty7q3A9v/Oz
X-Google-Smtp-Source: AMrXdXsy4cIaAWjbxr2sa3MkyVd+agbIy22K73D0C98x6tMyaavK+CnO6twxeqBScjInlmiz8AZfkw==
X-Received: by 2002:aa7:c603:0:b0:46b:203:f388 with SMTP id
 h3-20020aa7c603000000b0046b0203f388mr1402273edq.39.1673656068078; 
 Fri, 13 Jan 2023 16:27:48 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 ed6-20020a056402294600b00499e5659988sm3491563edb.68.2023.01.13.16.27.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 16:27:47 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id u9so56028990ejo.0
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 16:27:47 -0800 (PST)
X-Received: by 2002:a17:906:dc2:b0:84c:feca:c267 with SMTP id
 p2-20020a1709060dc200b0084cfecac267mr3563339eji.261.1673656067179; Fri, 13
 Jan 2023 16:27:47 -0800 (PST)
MIME-Version: 1.0
References: <20230114002433.1388538-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230114002433.1388538-1-giulio.benetti@benettiengineering.com>
Date: Fri, 13 Jan 2023 16:27:36 -0800
X-Gmail-Original-Message-ID: <CA+h8R2p7SL6FuE4tmtVgJJP76ogekqz8+XW_aA17bYrp75QPDQ@mail.gmail.com>
Message-ID: <CA+h8R2p7SL6FuE4tmtVgJJP76ogekqz8+XW_aA17bYrp75QPDQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aWVWnu1On61GFG0pY1kuccIUSw4A+FALnsjcyxy1pK8=;
 b=EdMe9td2T2rDndcz/GMZo96q8AOkse/1b3m4AESd0rozL6kc66vL5lZBZyhm9q4cHI
 5I0fMwE4h9LFQhaHkCeuvCx06iza75eX7cRk3oEGcKuN4wFcjqKZv+ymBK4a/5VsDhQp
 ni1soJQCPiGxVh+BTMBcpB9bNfh77qeQihwSvMCp7zKap6NmK+XmMApamJ4sGf3imifq
 GA7SA+FBXhJQzZR2VlmD/Q+5Q/3dcyBxXaiUpGzvEvNlv0CWubU3guX2EO2wF8c6EWSc
 uFcsC4D9Oiu1TFK8wHuPW/u/w3mKt2iMqtOAy6jzRrq0cNl7JJ0BP7KuJ4eec99Njpd3
 ndAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=EdMe9td2
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: fix build failure due to
 missing Linux options
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
Cc: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 Hi Giulio,

On Fri, Jan 13, 2023 at 4:24 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> After fixing build failure due to missing Linux CONFIG_CFG80211 an error
> of conflicting Big and Little endianness came out. So let's fix it by
> disabling the default CONFIG_PLATFORM that is not CONFIG_PLATFORM_GENERIC
> but CONFIG_PLATFORM_AUTODETECT.
>
> Fixes:
> http://autobuild.buildroot.net/results/aea/aea6bc1e4f89bd1010dfdc9caa54c37edb567d5f/
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Reviewed-by: Christian Stewart <christian@paral.in>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
