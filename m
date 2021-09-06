Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4082C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 18:10:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D3AC6103B
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 18:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D3AC6103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A92DC80EE0;
	Mon,  6 Sep 2021 18:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVcO7G8iVfdI; Mon,  6 Sep 2021 18:10:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D85A80E1F;
	Mon,  6 Sep 2021 18:10:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AE981BF470
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 18:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A6D780E1F
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 18:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HU09x65YtYUN for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 18:09:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CE0680E0D
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 18:09:57 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id n11so10456481edv.11
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 11:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=WKXtVzhEt2EWOQq9cpRVWzvih/9JtqW3reWbizqz8RM=;
 b=iX66Bwh6FpeO+1ZffoZqg5/cUoMs4o5+vmaY9asGcFg//ZKqkA/fpM6MzQfwZnE0Xd
 8WgE4pukzWE5fMFhC1h7A1HaNQw2EWlxTMPdRt1bGW5K+jHjUek7a6LWB/B0jcdtHR2r
 uPjVKm+vOoObg721l8rkS+rOp2ayVhwFQr4Iie+OElZoO/MFN5gFEoiILgzqjueLCaaP
 VHY0MCA7ME94QWkiDzW0nrXRehIyNjmIFM4kDfejBol4ohNFUcF+druHWiqhouNhu6TR
 qUGq244OEXiTO6TFYVkKt8Ujc8AU2URdKm4nqIh4BM3YU029dK+Fhhgei3GIb4S72zA4
 vzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=WKXtVzhEt2EWOQq9cpRVWzvih/9JtqW3reWbizqz8RM=;
 b=K6tAttZTC9YtPPWQbBghW9pcPMcU1EOa36nQcv/tmdGK4pftK14Jm5IMKavrYDitnY
 6Vb1vkwvLsqIhGN8FxdWPx2tnlWysmSIrS2rBjDo+0KN5ojHXGncYZZ+SBBFgI0MQ/Ze
 Ok/Yu6TtVFmm3UO9HSofDJxxepr9XVmnkXs7JfZLTnEwTok8HmhZSFqykozYZ38mWj/s
 IU41i7W2yIo85jh+KuiS7E5J9On+tjKqYOnaQNEmaIh42yuRZpOyK74flXtx11njpvu2
 pkk+q6PcoI/dVIIOPlX5hEfkhjnZGwgrGPQ0tZIz6DnSuBI7Rg4wwdSmv8aUzBrsP5Bz
 FtUw==
X-Gm-Message-State: AOAM5325AhM5p1keIKqowcDdsCGo6edzHLh0zosa90JKFwFj0nFbWdch
 o0D4+uut7R3oQXC/eAe+wdvp+iAD+1I=
X-Google-Smtp-Source: ABdhPJzMp+OUbsyqlxQhXdnFtT/mW+P6pQgWOKC6J+Gpf+VYpxHWoP0OdWlpRyhlyB4xbwf7mINhUA==
X-Received: by 2002:a05:6402:268f:: with SMTP id
 w15mr7909371edd.186.1630951795616; 
 Mon, 06 Sep 2021 11:09:55 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 h21sm4325389ejb.101.2021.09.06.11.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 11:09:54 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNJ45-0003Ad-Nm; Mon, 06 Sep 2021 20:09:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210821230613.470903-1-giulio.benetti@benettiengineering.com>
Date: Mon, 06 Sep 2021 20:09:53 +0200
In-Reply-To: <20210821230613.470903-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sun, 22 Aug 2021 01:06:13 +0200")
Message-ID: <8735qhinim.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libmodsecurity: fix build failure
 on m68k_cf
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > This package has -fPIC gcc option set by default but we can't use it on
 > m68k_cf since it doesn't support it throwing a gcc build failure. So let's
 > disable it by passing -fno-PIC.

 > Fixes:
 > http://autobuild.buildroot.net/results/b92980a563fe7ee331e70f288ce041be0bf29d40/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
