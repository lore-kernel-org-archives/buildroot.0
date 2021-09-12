Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BA6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:48:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB8A6101B
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AB8A6101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10A78606FD;
	Sun, 12 Sep 2021 18:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-R45gZROsM6; Sun, 12 Sep 2021 18:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F6BB606F5;
	Sun, 12 Sep 2021 18:48:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6248E1BF40E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D4D840449
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4BVblZEM4CM2 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 18:48:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7300140441
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 18:48:08 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id h17so768034edj.6
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 11:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=q+62v/4B1OpJVQUp/2TR4EvD1qnyo4nTl3TzB9c9WuM=;
 b=VTMBCBFzWAU0BrJhUJWxwA9yZnOKLGJ7svO9EytOBPnhhdbxtMVNDuiijuHzFpke8n
 Wcej1Kdfbb3G0UCvkn0NbJ+KcoS7+qOPb5MXmTJyDDkCiJX9gL6EzATh8aoF18aneMUh
 yHoY9TYFzSEsGpalmjJL+zSx20rBFKAlsmU9dnE5hein1OkVfF4+FgSbKLwsdXBhFh7Y
 Mrzk4dNq3D3jA/vYA0ygv9OyX9F6zFi9CvJ27l6xat0Y9sjVWIgKx8chelpxW3LoCJvX
 qLwKs6lNjRCrFGglv+ELqTlfMJpXCGO/vsIMu1gwR5WRfSo3fhUvsb0j8D0UqBuBNo4j
 f6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=q+62v/4B1OpJVQUp/2TR4EvD1qnyo4nTl3TzB9c9WuM=;
 b=VJCaWH52j7ed8hh+RoZ7Sy7mV+C4bR4YQeW2VmsSIcxP9ArS4tHB2p3HuE/7Y2qgRE
 Utc85O1/qHCovI47k8neiurhJSBBm0S89uexWPRBXrmd+fvgPvxAp9U8VT5Kpv2pq0mf
 In7jDlciYbSlWkpzwnKtIy6IpIzsBgf/vTqnaXYUzVfZVqpNakHTeIe1QoCHBeSfWk6n
 vJnWKpTIPpIF5WqUQhmlTTtOY1fhx+6N/GxVXnXNNipozKMJC6i1H0VnTQ/N3U+1RPmY
 CCPbGqk1tMoTCtjFQAsef5nyMF1aO88Q4+JpO5gcU6mwLGKsfsCbhSp3aSCUZLmytAVt
 5/cA==
X-Gm-Message-State: AOAM531XyXvaFzJSpm6i1SoYQXIzq94R3lXGiJO5qKQWjx4ihnwGYlcn
 IA9PWO1YK6YUrR/OtazLCwlDy/JtFwc=
X-Google-Smtp-Source: ABdhPJxKq+pjEOkEOdhBPsvz2yqbbdTtSV0bh+jMr3AHcgDOf7qk/SmhjMG1wxRmu+4kmsxxZugVUA==
X-Received: by 2002:a05:6402:4cf:: with SMTP id
 n15mr8993711edw.269.1631472486590; 
 Sun, 12 Sep 2021 11:48:06 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 x12sm1961774edd.51.2021.09.12.11.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 11:48:06 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPUWL-0001Ld-CN; Sun, 12 Sep 2021 20:48:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210910065532.31730-1-bernd.kuhls@t-online.de>
 <20210910065532.31730-3-bernd.kuhls@t-online.de>
Date: Sun, 12 Sep 2021 20:48:05 +0200
In-Reply-To: <20210910065532.31730-3-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 10 Sep 2021 08:55:30 +0200")
Message-ID: <87lf414om2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] package/x11r7/xlib_libXfont2: bump
 version to 2.0.5
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://lists.x.org/archives/xorg-announce/2021-August/003103.html

 > Removed patch which was applied upstream.
 > Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
