Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06404C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:40:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33146103E
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A33146103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 736BF40386;
	Tue,  7 Sep 2021 12:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHHm-pWkl8V5; Tue,  7 Sep 2021 12:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2FE1403B4;
	Tue,  7 Sep 2021 12:40:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7931BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A51980F36
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5fK3DCMFUO8B for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:40:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBEB380F06
 for <buildroot@busybox.net>; Tue,  7 Sep 2021 12:40:07 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id mf2so19346198ejb.9
 for <buildroot@busybox.net>; Tue, 07 Sep 2021 05:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=jNg+jL4EfEHrRXCXM2SjcrC7CZQ0ESz+C5VPW++HpmU=;
 b=Dsrye0b/L6hW9PJBq60JbbeYp+X+nVDXJ1eOfPQSNvG/A3ZmsPy1cgOTMc1rjBr38I
 GS8bwScqN3+fgmpntWc3F8EBceX1wqG7A0FK1zMnS+FkzZxnodJKjkRsInvg6hQhcEl7
 GlrogbZo9KuFDmDgrxRDlGhhKS0xZmWgzacUgd/H05043zDgRkKDKIvm8mFczptaLRUv
 jNqv6XExUsNjpbq4KhL9B8KLhi+i0nye7LKGF4hTxD2vkzAk/tGZrIYCvIxJtWa86HlE
 73c+BcKzQBdl+ju/WOv6ylrIKR0NHPn2/4RBmJbQTNPWGFB1Pn3G19TktQbwf8ZSKhAh
 wXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=jNg+jL4EfEHrRXCXM2SjcrC7CZQ0ESz+C5VPW++HpmU=;
 b=XXEIsHQlJIMwiY8nZhcn5LQIzsuJusuk058ipVExt2Qo7xCq7l7EaCqOz5kD0Vyhgf
 5Ww5+hmtexIrAfInmReDm9wHUyi/md3Vjyv7wSkPBGdq5adiRxuFsiUOXUupvVIK/+Gn
 6mW5KFcsMqV2c8pYooHvr1+VtqgkKsSstf66vaMyH+56sDg1hK2TWKLB2oFSyWFjegsW
 1lL280fZTggRncUfdbn8XMlSDRijpn0YnokMNzH/COmu0MuZPXJ995yfyVbT/Yuab6cY
 LkPlX7Ggxf2nZw8fliCaw9SofBIE7YXxS7Ok17PjEEUzm6to31taPt183CDJJkSiOKjZ
 mBDA==
X-Gm-Message-State: AOAM5326QHyPIw6e/SA7vl6ORclvpkUz4TMk2DV/wDImRYRrnqSk5JS5
 giujmwiWXYPlNgsq5D4wIJy/xbmvEjA=
X-Google-Smtp-Source: ABdhPJxH8kCeA01N+su1n1LP/E4aUMQHnCEfeMwhLJoDnFO40m7dOOm6drFk3Tl+xJDx5wD6gYUCxg==
X-Received: by 2002:a17:906:3542:: with SMTP id
 s2mr18737018eja.379.1631018406117; 
 Tue, 07 Sep 2021 05:40:06 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 n10sm5639263ejk.86.2021.09.07.05.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:40:05 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNaOS-0007ae-DL; Tue, 07 Sep 2021 14:40:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Conrad Ratschan via buildroot <buildroot@busybox.net>
References: <20210827211426.77376-1-conrad.ratschan@collins.com>
Date: Tue, 07 Sep 2021 14:40:04 +0200
In-Reply-To: <20210827211426.77376-1-conrad.ratschan@collins.com> (Conrad
 Ratschan via buildroot's message of "Fri, 27 Aug 2021 16:14:26 -0500")
Message-ID: <8735qgftjv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: Prevent overwriting
 of fakedate
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
Cc: Conrad Ratschan <conrad.ratschan@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Conrad" == Conrad Ratschan via buildroot <buildroot@busybox.net> writes:

 > When BR2_REPRODUCIBLE is set and host-coreutils needs to be built, the
 > fakedate script installed to `host/bin/date` will be overwritten by
 > host-coreutils. Disable installing the `date` binary in host-coreutils
 > when BR2_REPRODUCIBLE is set.

 > Signed-off-by: Conrad Ratschan <conrad.ratschan@collins.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
