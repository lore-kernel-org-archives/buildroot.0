Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E72C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:07:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25D4860F45
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25D4860F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F00B860692;
	Mon,  6 Sep 2021 15:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuHZTolxCa_n; Mon,  6 Sep 2021 15:07:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6488F6080C;
	Mon,  6 Sep 2021 15:07:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B4C01BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86F248102F
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prPW7QUOJRjG for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:07:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65ABC80FF8
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 15:07:00 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id i21so14096426ejd.2
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=2TfREvR/IHMwSxWEGpUKK786RIQc6SHran+FVugi5bQ=;
 b=qdMCCE2Tdn2mqMEedYtYi8a3Gmz/bsCeKzThHVtdJ+XVSsDgQrKm/RB8eThXOz2sYx
 bOtXYkatEMEHCFh5CegLKDNPKPHkR+JaqDqGxoPyMOos9B5UF5WgSHu3E9NQBo6xbJu8
 7kRbsrrUBOFrxhKvz4oKrRg/7sfNF3JfCIc3NNcfskwUGvTHr12Dd5+QRH2R9E4OCMfu
 FQQ9yzccApCCghJrjnF48Uji66QVDnm693e6vtpfdyLrBksvrQBtEwmb0yQNsADq8nF8
 EH6cZCBs5DKop2JWwcYy50jBDEmLUWCPigW9G/OUGFy2XRSohUxU05uS2amGc62BiJBW
 JP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=2TfREvR/IHMwSxWEGpUKK786RIQc6SHran+FVugi5bQ=;
 b=nY6rUhGpW8B33VCIa0f0zM1PHa2TnVH9doqpCSLLGoDs8SswIjMAST5w7+Em4uDtHV
 qeBQL6EBpu+0knXifvXCz9nq5fVaznum9bw8k2tCmHHmcdSQvYALDpzqWAIXSji7f7s+
 LovRp1BaTACf86Q1ZDQC6DVM7asK/49X6PMoTVEB10kQT0vB/0S+N16NAv3cawbYxNGb
 sIQQAUCkD8XTmYGIE1fdwSZ9IzEnDsj9AgUujMnetpJ8sVTM/t1jLKE9GPYP7G17aOgt
 mugJuxNSInEzlXWn9W9a615D8/vZ8s640cjhX2y2zAMOG985qvQS4wIrFYbWI9kAaKLk
 qWWA==
X-Gm-Message-State: AOAM53229DZYA71uPo/2LFtPkJHS2mGK05iwtL1NZWDCV2lPHdb1rTbB
 568MuKx+dlmPLr0SxN8QlJM=
X-Google-Smtp-Source: ABdhPJxn7lFgP+lvpSsKvc09/t+8sD9S740cRaHSA+HWYj7IkNYb2pZ2vg5UqGKCUpvQJS7Hz95KKw==
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr14090193eje.526.1630940818540; 
 Mon, 06 Sep 2021 08:06:58 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 b2sm4873467edt.74.2021.09.06.08.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:06:58 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNGD2-0007Jz-SY; Mon, 06 Sep 2021 17:06:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210819214609.20910-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 Sep 2021 17:06:56 +0200
In-Reply-To: <20210819214609.20910-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 19 Aug 2021 23:46:09 +0200")
Message-ID: <87v93divzj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cpio: fix CVE-2021-38185
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
Cc: Clayton Shotwell <clayton.shotwell@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > GNU cpio through 2.13 allows attackers to execute arbitrary code via a
 > crafted pattern file, because of a dstring.c ds_fgetstr integer overflow
 > that triggers an out-of-bounds heap write. NOTE: it is unclear whether
 > there are common cases where the pattern file, associated with the -E
 > option, is untrusted data.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
