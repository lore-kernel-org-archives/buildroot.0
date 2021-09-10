Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F7EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:55:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79F116103D
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79F116103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F612402A0;
	Fri, 10 Sep 2021 17:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqmY2ZxBWcDB; Fri, 10 Sep 2021 17:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F7640445;
	Fri, 10 Sep 2021 17:54:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D09C71BF83C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEE9F6064A
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rn35DGnR5kUg for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 17:53:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB62D60071
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 17:53:51 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id t19so5846032ejr.8
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=0XL1PoC1Z5/BJGQa7QwfBT2BKpfe2YWjaqnl8ER2LS4=;
 b=f+cTx2RP3btV6opDa5IWks/d/g+U8WuDAUXhlYn5TQzMORfNJKFFRODp3fvw1oN//+
 89Qd08RWDDNlX+bVQvPM5hKvLGamjwn1a2pLo7oNiZ4DlH/rVymRgxapUBItmWPqYOwX
 CP8V+8lC3lPByGMdfy4Z5P3UPgPN5ua3oYBgjC48PqJSbpzICJ23L/HphRlt/89V9t8S
 xqY+2m1uftTq6b+ddn4Cs+xkg3H/pHAffrCJoP3CvKz36KI1lS/GCpfN8yISc55oHKF/
 9TzuRWY2ogrr+1onpyBVEZRc4GvavV9g6OYOuNd55yEnMbe/SmwvnvNjaHmHPrctLcC3
 +Lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=0XL1PoC1Z5/BJGQa7QwfBT2BKpfe2YWjaqnl8ER2LS4=;
 b=GDcqoTztcgrNLVUkaOJ265mMzGEHCjCaOvrTeB7XS65HMTdUEkBPrnMSgN9f5Y/30i
 h2gUBhi6hRmnyA2gD2c0UvTsJGkozbTq3lCdJfo5aI9YGUhknql/T/0HfDOZqzQANK6P
 ZGLoI6j5eNiWecDZO3TaOxikKV9w9OEMUp9MttP3UNYIJdSMEDfLI6Hz7RUpk5xmT6Vm
 IYyFvb+kDby7/KAeTkG4BOMzW35RLP5ZExYa9WlBfLE9ux8IwAajYPAHsDBhwEJA0Msl
 4XQj8deRp0dOKKteCOrvHa/KKuTHycohgjsP+4QgZsCUWc25By1fCzllfDJZmz71x1As
 oNWg==
X-Gm-Message-State: AOAM530TldViV9yaKOtK0adiH82CxEhk5m4iRTWyTs3YRfRb/aRlxOx5
 tsnu5p+3o1NDR4qVhwNZyrUD3sWzx6s=
X-Google-Smtp-Source: ABdhPJzAJMRwZ5GbNtUYUz+s7528Oo2hANYyunV5pd74JzRPbLw/xYtIj2tjiTXyWdqZtKGYK0ZlyQ==
X-Received: by 2002:a17:906:ae4f:: with SMTP id
 lf15mr10763181ejb.224.1631296430230; 
 Fri, 10 Sep 2021 10:53:50 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 b13sm3142469edu.27.2021.09.10.10.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 10:53:49 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOkij-0001Ft-36; Fri, 10 Sep 2021 19:53:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210910065532.31730-1-bernd.kuhls@t-online.de>
 <20210910065532.31730-3-bernd.kuhls@t-online.de>
Date: Fri, 10 Sep 2021 19:53:49 +0200
In-Reply-To: <20210910065532.31730-3-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 10 Sep 2021 08:55:30 +0200")
Message-ID: <87wnno71w2.fsf@dell.be.48ers.dk>
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

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
