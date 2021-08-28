Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06245C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 21:21:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C47760E90
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 21:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C47760E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6271F42610;
	Sat, 28 Aug 2021 21:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HB1SqAzxTvEl; Sat, 28 Aug 2021 21:21:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6B84261E;
	Sat, 28 Aug 2021 21:21:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 622C01BF354
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 21:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 520EF60651
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 21:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=beagleboard-org.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xe6CEFJ0CjG4 for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 21:21:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BEDC6063D
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 21:21:42 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id d5so1181791pjx.2
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 14:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=76k1A04Dwa1e5X80oHsJLP7O15nQTwqqM10fQLgFbRE=;
 b=NVl2xs1taePInOcIgFgBIILGvTOOwdXvQxfaZKTjx0JLJBKtVGA19xU5N819kqZW/c
 Qyj8WHF9KSpP83bWy0cAPjLtiKVfuLMRpXEQyIyVUzNxWybNCPWsA0/5Bp4zavszpgwJ
 vkNCa+QscmQqB2xGMN1djfI04j+PshJrSE1XK0bTIQOJyYyCZkQGGazZTNau7wx+ZLB5
 sQtuVora7n1NV352+6Vh0Yk5/n7WkhmAcYS8kF56y394SYE6JI33C/dSrdBYJDs7S7Zp
 d4s4uWPW86djO/b/4DavPLcdA5mdIaSYmCNEau2IjH1kXwC0te1otYjxFFFut/C65+Gb
 LJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=76k1A04Dwa1e5X80oHsJLP7O15nQTwqqM10fQLgFbRE=;
 b=I/noaLBmmjsb3B6hXs0SOud2PvX6pTZqIYosc2/KU+IhGa528PICSkgI+9RMyIe1cO
 ienA7wfz1h5/UbWBouueEaBUu12Nskla0BQ/uBWgYYHnwmILHgcSs6zVpT0n4V6pWlv/
 EQc6RbIcpM4HBp0DntS7wIKrNk6OP+/nlNMUWbhdjUZITV4as50R5xKUcQuek5+14X15
 eRAWtgR77YmoitlHYATjOxBqyWjvzAhmdBfsG/ohINzQKBLTw5k8NB0W+NEj2jOiTfBo
 g+c35bsuDn0k8Zcjgp32TQzAz2hUR7mxgLKBRu05OY6y4bS2YQn6YfMYvVEsIbPOlQHu
 KVCA==
X-Gm-Message-State: AOAM532sQyXsmDlgU1KZEn6roP+r0dJXu+i/M4zyXrlH71K4dSjPO6ET
 md3YzUxkAktn0CbWOLvthRAWGA==
X-Google-Smtp-Source: ABdhPJy1ahewD8k5OxmRMf4kXXW1nMJC84hiC2e34iezSgP8yVsrGX04WCD7n7IzN5emWwvXwhYAvg==
X-Received: by 2002:a17:90a:ab0f:: with SMTP id
 m15mr31207531pjq.55.1630185701782; 
 Sat, 28 Aug 2021 14:21:41 -0700 (PDT)
Received: from x1 ([174.127.163.79])
 by smtp.gmail.com with ESMTPSA id p9sm12242895pgn.36.2021.08.28.14.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 14:21:41 -0700 (PDT)
Date: Sat, 28 Aug 2021 14:21:39 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210828212139.GA1577311@x1>
References: <20210825192014.1203727-1-romain.naour@gmail.com>
 <dca43476-ea86-85e5-9e97-5f8d985cdfbc@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dca43476-ea86-85e5-9e97-5f8d985cdfbc@mind.be>
Subject: Re: [Buildroot] [PATCH] configs/beaglev_defconfig: update
 linux-headers to 5.13.
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
Cc: Romain Naour <romain.naour@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Wed, Aug 25, 2021 at 10:19:49PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 25/08/2021 21:20, Romain Naour wrote:
> > The beaglev kernel is based on the 5.13 branch, update
> > the expected linux-headers version to 5.13.
> > 
> > Fixes:
> > https://gitlab.com/kubu93/buildroot/-/jobs/1525740895
> 
>  Gah, this has been wrong eer since commit
> 9a1bd7cc1ce512672a5d76baa86c449e36137052 which I applied (and I didn't notice
> even though 5.13 is mentioned 3 times in that commit...)
> 
>  What I also don't understand is how nobody else noticed before, while there
> have been 3 other commits to  that defconfig and this still wasn't noticed...
> Drew, I guess you do your tests with an external toolchain rather than with the
> actual defconfig?
> 
>  Regards,
>  Arnout

Thank you for fixing this Romain.

Arnout - apologies for not updating the kernel header version. I am only
using the upstream beaglev_defconfig so I am not sure why I did not
encounter the error when building.  I must have either failed to notice
the error or had changed the header version failed to commit it.

Thank you,
Drew
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
