Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021B9C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:33:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDB3C60F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDB3C60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D45C40518;
	Tue,  3 Aug 2021 14:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeD_f62AhfcL; Tue,  3 Aug 2021 14:33:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF43840332;
	Tue,  3 Aug 2021 14:33:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CC991BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38ACC402DA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMiP44EbbFvj for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:33:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 405E3400F2
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:33:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m12so20773732wru.12
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=SM4acrQ6qsfRus4VVUG/+KvuM9EpRXtUep46uUQNQsU=;
 b=IGiJiSpTPQ4aw+3xQV9ElbXzkfpOkGpib8hTRxIjyNFeUgaKuZC8O18oZ1Nx4A8wuV
 H1lqami4mX3glaUxKUNP1lAs2Gnnbd5HpSZzEe4DLZ1RAGeZVHYaGwtf7mj88GoCuqGK
 izQCUbpk0VALDH9SH1heuQwl3Gu9EhxImTGJOdKSc7q36TkEBwd4ocl+yHM86goKhPOZ
 Is3jjhoKtF8zSsaHLNB4EtznmOLV0aJVsyLB/vyjzJDVeflSxeSKKjrWQ2s50F8ElWO5
 fFuDC8b2sS/XcBCowhKvUHMP0MpZyGPTRGvq/uZ9BtKEgxDI95U+i2fxQF2ISNAVYEnm
 MqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=SM4acrQ6qsfRus4VVUG/+KvuM9EpRXtUep46uUQNQsU=;
 b=q8wxB638yLbOuziVLkqXCgX0GwupcpdBoK05LAqtGqIzM4ZnAQ7rs2KfqMZqL7ujmT
 wELkqxbrm9SnWD337uEP0P3FgZZ/LODfBN4t0w7LNKc1ykHzjy1JZrhQOS7dJnp6M41V
 cDDBCe2FL38ytd7lpxtWCnAmNT5gR2Aw2wTo2V+mJXDpZK8dEdcx306RhDswGzgn6YSH
 T4MQByUb1tW+/inIUCQlHtd6AshcT/3eCiFXJw/+j+qn1FV3EFpjWBiOp28jCb9PS04E
 R1Pya9ZcS7lvH/EKUD77tGF3VZ4P/ClTMvZJN2qe78PNDBuO863ypM7E5JpEhaOSqfSP
 xYJQ==
X-Gm-Message-State: AOAM530W592lCBkYX41ua4bx7EomMgne7OVZQE+4K50r7Sit7FSABmDR
 oX/8K3dzE9XShKbR8IorFs3VZFn8O7P8cA==
X-Google-Smtp-Source: ABdhPJyETeiQthy2HOotwbs9E6a2Pmj4G+SSTLXSfoEilWE0yJvyT5BSox5s+JbJPxogTEQ2zFxsjw==
X-Received: by 2002:adf:f384:: with SMTP id m4mr22797894wro.129.1628001214251; 
 Tue, 03 Aug 2021 07:33:34 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id k6sm14594378wrm.10.2021.08.03.07.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:33:33 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAvU4-0002Dc-PF; Tue, 03 Aug 2021 16:33:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210716221328.347351-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 16:33:32 +0200
In-Reply-To: <20210716221328.347351-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Jul 2021 00:13:28 +0200")
Message-ID: <87lf5iwqbn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libtipc: renumber patches
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 883a33ece55c6ef23c33a41196fddabadf140427 forgot to renumber
 > remaining patches

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
