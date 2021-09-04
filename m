Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71706C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:03:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED0E860EE6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED0E860EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8106404F1;
	Sat,  4 Sep 2021 21:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1glnnNbmjRV; Sat,  4 Sep 2021 21:03:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D32C3404EF;
	Sat,  4 Sep 2021 21:03:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B1781BF28F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 484DF80EDE
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfvSJkmQyELN for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:03:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CF7880EDD
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:03:01 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id e21so5145044ejz.12
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 14:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=rv8U5yik5iJJx9Pj1iAKztTVm877kKhP7si/Ta8NJbs=;
 b=GaixcSEoNr+ha0bD5WzZPVnlrb0AEE6beyDUS1yeLz9drJgvPMbc0gNu8OTZr9/bJG
 Ttqwydxg8Al8G+N4NgxE5ytToDxb7vw7ZkU4AYs/lADI4qWr//+RgrxeFlea3jlpyX8o
 OX7gmE8OgRw00tsV1qdrVwTqjuCx3M+2MMYUSeWDA1ZknGr10EHIP+uUMFOZAO6OMXai
 0AlSVyy35vYl9FlkSt526Ozgah30uVBihNh0I82bzyDnxJ/DzL/mT1y7O6uhA7taGqzK
 2xBuLl510Y3aoek3vgHE53dxjOXgzqaVo1qqs7F89pJiefBHjalhmWbtUU2kNyXYWjkC
 5H7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=rv8U5yik5iJJx9Pj1iAKztTVm877kKhP7si/Ta8NJbs=;
 b=lGAnwDT0ieh2t3HfDFRrxIKmaxwqQCY2VUzfUI/8v86qKttRypOHeX6F4OR9Qa0AaB
 x5eilbO5gIFsXh8gm6/MmYPIb9DLgnN9L/L8+n1+7SaujDoIGBWrPp3VuOB5AEzdOOE5
 seqEa4uocj7EgPr/L9rWx6HY2+I7TDxWUhU9DdGh8fZcsqGpgkGrAxaaBhiPkiJeGKIt
 OBy8xL3BRt6Bb7gOaAv50uWCm6LCNBZyO+nIWYFEC6B6ZctGRNnSZfSN94k157nUTW1y
 JEnu4jKSPRQdhVbFbLuSKSCjqC7PymQJYFLMAZLrREQ3mjOUuoijB6NJFHocCHsRlnTu
 3tVg==
X-Gm-Message-State: AOAM531igJM6qWOzmzle0GjwE5TIkd5wpiuNdBb2/NwjKM3tbxgodqhX
 ccEcgiNV814EDYI1Hty+AOB0Hrx0A3k=
X-Google-Smtp-Source: ABdhPJw7IWxNx7baZ5k+GzAXOd3pVj/viNCptY2udEXc/LVywlzys9QZwQ1KqhGxUc4GLosWPRGUmg==
X-Received: by 2002:a17:906:7847:: with SMTP id
 p7mr5757676ejm.335.1630789379729; 
 Sat, 04 Sep 2021 14:02:59 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 k20sm1517701ejd.33.2021.09.04.14.02.59 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:02:59 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mMcoU-0004xw-JS
 for buildroot@buildroot.org; Sat, 04 Sep 2021 23:02:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210817102754.7B0EA8D367@busybox.osuosl.org>
Date: Sat, 04 Sep 2021 23:02:56 +0200
In-Reply-To: <20210817102754.7B0EA8D367@busybox.osuosl.org> (Peter Korsgaard's
 message of "Tue, 17 Aug 2021 12:19:22 +0200")
Message-ID: <875yvgm4u7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/busybox/udhcpc.script: ensure
 action argument is correctly passed to hook scripts
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
Content-Type: multipart/mixed; boundary="===============2626034905784681333=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============2626034905784681333==
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=94c41eef615bb33ad26fff71d341f66e35286f5d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > commit f79a420825479c47d (package/busybox/udhcpc.script: support RFC3442
 > static routes) used 'set --' clobbering the positional arguments, causing
 > the action argument to not be correctly forwarded to hook scripts for the
 > renew / bound cases if static routes are provided by the server.

 > As a workaround, save the action argument at the beginning of the script and
 > use that when calling hook scripts.

 > Reported-by: éãê <wangwangqi2011@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard

--===============2626034905784681333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2626034905784681333==--
