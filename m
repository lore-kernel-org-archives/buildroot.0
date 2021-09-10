Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E808C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:55:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F286611C7
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F286611C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12FA383E68;
	Fri, 10 Sep 2021 17:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6klOF1zRSWN; Fri, 10 Sep 2021 17:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D3083E69;
	Fri, 10 Sep 2021 17:55:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A4DC1BF83C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17B0840434
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9Op2dDRUNEJ for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 17:53:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43519403EB
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 17:53:56 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id am9so2589766ejc.7
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=01ZzXMGVa4Cyi3csYElbntxEcH2WMGplio4jHPkFcPk=;
 b=jFiPaoeH5MM1zc8DboAz8MB6mqRACLcL7BUcLVENc+3T4LZYw1T1uVt0h/b0B93mr+
 hUgBNxcMUspf2CU4INSUrQPoE5/Mq/zH0cyMij5QJHY8Un+p8OFlSREriZj04r+2WoKH
 zVaWV8UnsInrJpkAasQetATzrLyC96IaT+BSEMiC5ILZL/jsI62Q2eI386fWvlb4G7m5
 f3bsHSjz0pPXByV+r3foRh5HQaNvH+awb1Lm4Gd0Jrtaaqsp9IyaHJFD7MQHKFMfaOCm
 mC0NHxHcNh7IEKgf1aZ1HqlXyh2u5oDnTcAlj8hJBjcEEuEZ1HTdqtMFfZtO19bEnW1Z
 ZeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=01ZzXMGVa4Cyi3csYElbntxEcH2WMGplio4jHPkFcPk=;
 b=BD7g7LwQGjGAZr/SMovvW1XOSGY5bDOcy7z+GbGknguJX7XVltIoHuhwD113Ttp2Z9
 gULnMaBrkbQhYEuZgveIJSatdYFVaDMSl4BHIytJJts3sewuW7zmrXFWUxcvD1wyDFk6
 xxdjRmbl4cd1/QLDRSMANyRw41/2nfthLIUcF5Jcyja3kJO4Jmj05FTjxk2wb9wJ4hij
 iQhJOivTvERKKRKjOaXIbXKF8Db2yMo66xonc2exfKbttSXCylE2ZdLietK+oQpKb9SB
 lKGucQC2XHRU6SmJODkAxGADRfkiouTDCJZxegpRJz0i9S8Y+vc4WQmxGW8M4TcaoAf0
 vwYA==
X-Gm-Message-State: AOAM53146kK9sLU+kZyx1e/Mt5sJ3co/B3KM7/aMFLRm/F6eU4gOFbU5
 DZHgEK1Ih/vxnkB9OeJwvso=
X-Google-Smtp-Source: ABdhPJzia6IPaPArLFu0riP+y+kI7wM8BhXMzGDJ62HLUJgNsm50Fpddk5vOnpAwjacMn5twLe8Sug==
X-Received: by 2002:a17:906:6445:: with SMTP id
 l5mr10370285ejn.194.1631296434496; 
 Fri, 10 Sep 2021 10:53:54 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 dm8sm3113416edb.90.2021.09.10.10.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 10:53:54 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOkin-0001Fy-CM; Fri, 10 Sep 2021 19:53:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210910065532.31730-1-bernd.kuhls@t-online.de>
 <20210910065532.31730-2-bernd.kuhls@t-online.de>
Date: Fri, 10 Sep 2021 19:53:53 +0200
In-Reply-To: <20210910065532.31730-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 10 Sep 2021 08:55:29 +0200")
Message-ID: <87sfyc71vy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] package/x11r7/xlib_libXft: bump version
 to 2.3.4
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
 > https://lists.x.org/archives/xorg-announce/2021-August/003104.html

 > Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
