Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F55C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:54:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D31E60F6D
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D31E60F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F7B61B91;
	Fri, 10 Sep 2021 17:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cDpo_wRYtuBB; Fri, 10 Sep 2021 17:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 168A56070A;
	Fri, 10 Sep 2021 17:54:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1CC71BF83C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EC30606B9
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KdrV5kw1vD_r for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 17:53:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7FAD60071
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 17:53:46 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id x11so5941176ejv.0
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=OUUALa/BzEvPlvRVS2GkpbDjw+kd/tOHo9zFghKQd8o=;
 b=QJvz0ABkdfZDOAo89UCImJmyzEoJ7hFAmx11Egwud8sn3QsvYG4p+EC1yfr87Kmgdr
 B/YZT17Tu4+ZkpqKuI1XonR16Feu6cf+mWKT5Zr4yLtYdA+GVwBL3Jb2+4AhrZ9eHpt6
 xoeiuvypB+OQxWd3ou2i2VNzwxQ0BBU9hyPI9UiLMAL/IlYBgsfSPwT3qYoQg6vsG5bM
 hBUNX/J1t4w1nFBOlxvSesbBfFj5ato9b92098pYy0KLHdRbJmEnNcMHh7FeS3Aej5bl
 Nlw7bEvaXzmEjE0mCYFYEHwUHv2eoNI8Aq5qpGvR6CIu0VFHSZr3VBYZ+Nyt7CA6fknT
 Cz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=OUUALa/BzEvPlvRVS2GkpbDjw+kd/tOHo9zFghKQd8o=;
 b=Is/tCx+e2erkMDMnfiBsroWj56KuVjE8XjfcYc+8eSyn+6u/pvESAZUKHxIZa8ubna
 pIypz1PEQTC+AXUiQci98z+lWxxEfmQ2oWf0QE4oFPF5bYPA8qv1ZKO7GJ0S+WLYqrq/
 oi53bBPa9g5lexnz18oZl9CTMBABIHVaFLS4eExW9qPjRTApbsW43Dkoo5gmjC5qDkGU
 B/zjx8sfN/vJFxdavgo2xk2Y4lVRnXnJzeCy/FJO9JVSFshVi2FsydqGTLGO2SJ7oqLr
 MREHSle64RLdDgSuQSQw3hhnY+o20zd/y9jltdWOzarr1yLAJGpBqfwhRIyDnU7dY0/7
 J+YQ==
X-Gm-Message-State: AOAM5318bMIRNpR4uiiuqDQ54zPaleK8rA+gDO6KYQmha1r/IdsVYwSK
 OljJzv62yKmImDoLbE4lvF5nFWf/WpQ=
X-Google-Smtp-Source: ABdhPJyk7JIdX/9U6k95MNRbg9zvhHa+Z9MZ33x+zTQ+9lr4i9XUxCgydQ37SsxMqOil5qmSRvhd3Q==
X-Received: by 2002:a17:906:e2d5:: with SMTP id
 gr21mr10557339ejb.401.1631296425096; 
 Fri, 10 Sep 2021 10:53:45 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 b14sm2743416edy.56.2021.09.10.10.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 10:53:44 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOkid-0001Fn-VQ; Fri, 10 Sep 2021 19:53:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210910065532.31730-1-bernd.kuhls@t-online.de>
 <20210910065532.31730-5-bernd.kuhls@t-online.de>
Date: Fri, 10 Sep 2021 19:53:43 +0200
In-Reply-To: <20210910065532.31730-5-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 10 Sep 2021 08:55:32 +0200")
Message-ID: <871r5w8ggo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 5/5] package/x11r7/xapp_xeyes: bump version
 to 1.2.0
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
 > https://lists.x.org/archives/xorg-announce/2021-August/003101.html

 > Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
