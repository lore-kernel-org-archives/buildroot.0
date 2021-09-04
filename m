Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CB1C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:15:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67626600D4
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67626600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17E5F8101A;
	Sat,  4 Sep 2021 20:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7xV0X9j0x8pB; Sat,  4 Sep 2021 20:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 604A580FA6;
	Sat,  4 Sep 2021 20:15:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE58A1BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA82180FA6
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1eaaJs4qa-_U for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:15:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAEE280F6D
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:15:45 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id n27so5060908eja.5
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Mb4IeJjAvoONv7YpK2pZOizKxjU5sWGUGp8Il3CHDlM=;
 b=YVgglFwe3/4s3JNgUjMXtoYuxIiPX1qpnSxcKo0Mscn5ScU1l/rVaLKCstVNUrhWeh
 d3JQGGjctJY9fEleFuX4acJXMXOYdkuKenqEHHx7+tUn63Y+qErnrM28zWH8TFerqZIn
 riye6j8aH/CUtt+icpHGqyLlWwyefInfvrNyHTkU7DJkkMwKv4lQHkQofXn0sFUQBYl4
 2d3939xavVhOeUXjx/vhxhCPtJvmkf27XdZJH5opw0soGpStCXZnOa0fz5nU3axfjsnx
 538nBSdjdWDt83234mjs23TbqSBFe5wUv2fUvOdriXrKDp67HiylfgCxhYHDj/yjpDse
 Qjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Mb4IeJjAvoONv7YpK2pZOizKxjU5sWGUGp8Il3CHDlM=;
 b=VOjnCSlRPxBGWF0Yvduazl35B7tvJBXxcvCLjMxfXyCMgX9sV33QegXn7sOg3qZ9PD
 xdGtymUxzpmj5mNl6nnokfda96LjW9UVSzdow8wV0UV1JZGIhQ77ANVuF0yfWobq3aIw
 Ly0zS9yVheSM09xvW0VZDyXl3FoQSVn42fLNkKrhjUjLgrTZNeOCVV0M1v3Q4+MHfzcn
 Wcf7/hquv+ew449gDqjQEFGnjfEjy6fjimfdAJE4dbXGYhpKMA/ek8QtfBUNtL/HujWq
 JFW1MnZXDYRcyKqYnS/aXiZh8y9vCBxSV0ZgtSVhdUhGpE0qeD4S+y2auPo1hk6LwAV+
 mHSQ==
X-Gm-Message-State: AOAM530CM+0+kXMoYbTxzgLriG3/K+8QphxLAC1yFRG4xfkeo5izoN5N
 UEJUK/BtuMkq83pbtbIBRH6goPWIgho=
X-Google-Smtp-Source: ABdhPJyV4BrP4zqSPZNv9XnpHelg+vXjJ0uANBBqGzdvzP1FoxzyLPh7Okjc3x9JEdS5j+AuUta6bA==
X-Received: by 2002:a17:906:32d6:: with SMTP id
 k22mr5670177ejk.228.1630786544001; 
 Sat, 04 Sep 2021 13:15:44 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 w3sm1806503edc.42.2021.09.04.13.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:15:43 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMc4k-0004ID-NP; Sat, 04 Sep 2021 22:15:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210826220128.DC3938DC52@busybox.osuosl.org>
Date: Sat, 04 Sep 2021 22:15:42 +0200
In-Reply-To: <20210826220128.DC3938DC52@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 12 Aug 2021 23:20:17 +0200")
Message-ID: <87y28cnlld.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit branch/next] package/perl-net-ssh2: fix
 gcrypt build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=3d8ce1975ff90f06818e74aa9b6a0c8ecc6f3d2d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

 > Pass crypto_backend option to avoid the following build failure raised
 > since bump to version 0.72 in commit
 > cd1d56bcde2a571062a1943c88506a8d9d2db357 and
 > https://github.com/rkitover/net-ssh2/commit/86a1274534dd7e0da03d98fb88c9c7ad4b1adb9b:

 > /tmp/instance-7/output-1/per-package/perl-net-ssh2/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lssl
 > /tmp/instance-7/output-1/per-package/perl-net-ssh2/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lcrypto

 > Fixes:
 >  - http://autobuild.buildroot.org/results/25747ec239e0b92775aa883e4f531f77d45f352e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
