Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C433C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 13:18:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C415611C0
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 13:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C415611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 436E840225;
	Fri, 10 Sep 2021 13:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QnvKoo8sZqSX; Fri, 10 Sep 2021 13:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27CCD40285;
	Fri, 10 Sep 2021 13:17:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31B7F1BF317
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 13:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B7BF84A8A
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 13:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gwyael37RM_f for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 13:17:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 843A0849AF
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 13:17:53 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g21so2458433edw.4
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=oUPLr5nsG1697shQJ87quxjj8Lkym6VTsY+M6jiDSRc=;
 b=HB7SzyYHKpvMYxhdqmXFVmWB2+DAIRCgGo9wMUsWveWGVrW8+AapI1IJ3Gn+d3YzZY
 jFg9H/GBGSRUooV58tw7guilBkacjNOYblp668bOVHF7zN7YYhgbhCe7vdImlgpH5WPk
 MNRxF7hDYCugHcn6x0gtTitvdbD7ExVRKUzLqCk4UmjQNf1qejU8EcVxjq0RnhLvZWrb
 UA2xyZsrFWelSPUdU4o7eH59nBuTDJuXi1wZ7QpLJt+j9xd5iJXDFS0YPFtnGGZUan1o
 ScSMfLCdc83GSd/PwlmCmTq8OkCUB6GMBo9g+sRPAVM2VqgMmwiGwuTUFDtT9H6qgS4W
 bK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=oUPLr5nsG1697shQJ87quxjj8Lkym6VTsY+M6jiDSRc=;
 b=ChlZlxKO5qf840tfwdKwCRXcNU3QRUtEY3W3Tc5ghxsBsBBRufCoo65foqEG3prinh
 slygz/6UDzBS22Ys5952RSwEaEYYU1iHHsXLqzC9er706WwN4D0rxiL+2r9uz0WdAQYm
 SI+MoTXSXbFp8yem8oCRqe/4iV3zi+zfVMEKDPNRBuqttahkdJsCt6jI4LkhYSTIzwRI
 lBw0ABMrBt21ONcBQy+syYmnnP71f2s6/KsKkJlo/Gl2sSpFZ/9WGuG2SQEyxcuen9H6
 iStj9W1FQTbKi0VzQQjezZSBXPQGIBDlEaTTvWR4RnPDKIhJipw1UuVnkjvACuB4Suft
 4ilg==
X-Gm-Message-State: AOAM533aoozq0ZWw0a/7BEzg3N+Ups7uQPGdZ5PCDjW5s9CZemQInyFc
 jcNb2AfwoGIS8BDhhsN7qUDRgTCipq0=
X-Google-Smtp-Source: ABdhPJy4mzTslZHqcyC2iDvqMcO52Swul+mS0kB2XY/agO+jltKF4q3G0huH0SQ4de9uyivCOzjrKw==
X-Received: by 2002:aa7:db10:: with SMTP id t16mr8873061eds.357.1631279871808; 
 Fri, 10 Sep 2021 06:17:51 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 y9sm2749996edr.92.2021.09.10.06.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 06:17:51 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOgPd-0002ZB-Vl; Fri, 10 Sep 2021 15:17:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20210910094414.191178-1-christian@paral.in>
Date: Fri, 10 Sep 2021 15:17:49 +0200
In-Reply-To: <20210910094414.191178-1-christian@paral.in> (Christian Stewart's
 message of "Fri, 10 Sep 2021 02:44:14 -0700")
Message-ID: <87r1dw8t8i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > The fix for CVE-2021-33196 can be bypassed by crafted inputs. As a result, the
 > NewReader and OpenReader functions in archive/zip can still cause a panic or an
 > unrecoverable fatal error when reading an archive that claims to contain a large
 > number of files, regardless of its actual size.

 > This is CVE-2021-39293.

 > https://golang.org/doc/devel/release.html#go1.16.minor

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
