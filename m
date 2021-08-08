Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF3EC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:33:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4E2260EB7
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4E2260EB7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57AB840203;
	Sun,  8 Aug 2021 19:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IycXyiMyVyu; Sun,  8 Aug 2021 19:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 477B7401E1;
	Sun,  8 Aug 2021 19:33:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 343C61BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FA0182CC7
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Ka3OVGoo_jt for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:33:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EB8482CA3
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:33:48 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id b15so971452ejg.10
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ZNmugMjsL6v9y35b0p6PVPavlbReipk2KwLIfOnfH5E=;
 b=mxMKQlTv/lfl+NKKG82UWR7+1gSaKXIXFiXFkEdd73vkHpNOlmzYqBTkXXB6SW9uIS
 ID+6WEIa4RU9eelfLVoFn8pHd78Ai2hcJPktbZD5raL9qaZGYmqliszZCzaaKQzeALUg
 HO4lpihZrSkGLx9bUFE2ghr4Mm99xEQLkqs3bEb9lSSH5Kge4s6TaIsNSrNo09JsVDC0
 YSfudlh1lokxn2HfI7z6vnOkf1elUDVFhAsqznWZ1Vims2GjD3IcTTahCM4SilY8T5JR
 Hv7psgF2kV/lb8ZkkPYhLTZfivgIVJBgqjPkFzwbSGktHs0OJ+mmlRyiSPDGPA7RxFPj
 rLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ZNmugMjsL6v9y35b0p6PVPavlbReipk2KwLIfOnfH5E=;
 b=KmTiMtrV9alg47xUFIQDsjcxg3c6RIHoR8O8+8zkJMBYMrlM6SDMvvOfzJ9rrVkt8B
 0xj0j5VC5nh/Gr5ACnz/nfkyRUrhL6eUF1v8ehmHLRkKa1pDBFcapTG+qXJwloLjwtm0
 SuVxJlzkpERiUuywtmlJvYfBZTgkzBZOHpMNHNo0llCyCkpCe19wxdtU/RGNIKPcniAm
 e913LOjvllEvkf8blDV8fsU1cSlFQWMg2X5piuuVDrh3UDIUikfI3owtBt1SQLxqHl2s
 MgQHhuphtoATx3ukFo0I1yceJu64vc7ISiaBEikAJ3yy2UM3ZGITXMBS9h6Bq1uKV6YE
 zr7Q==
X-Gm-Message-State: AOAM530d1V1l0Jg2WBN55zfaqBd0NQLh11oPY1pDNFAmam9Hy0F2GbFz
 jmCYKs5iHY7bs4jWzNCjRTlE4qlp41ALlg==
X-Google-Smtp-Source: ABdhPJxs0RznDmhdzBIL/tdwT3Q8vWc/xmyD3v8FtUV573QviZH8Ehd6a/PnGg0m6Grp5mZXchRBTg==
X-Received: by 2002:a17:907:7e89:: with SMTP id
 qb9mr19491100ejc.333.1628451226682; 
 Sun, 08 Aug 2021 12:33:46 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id b17sm6936062edd.27.2021.08.08.12.33.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:33:46 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mCoYL-0004GL-Co
 for buildroot@buildroot.org; Sun, 08 Aug 2021 21:33:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210808090212.9021-1-peter@korsgaard.com>
 <87fsvjbxuf.fsf@dell.be.48ers.dk>
Date: Sun, 08 Aug 2021 21:33:45 +0200
In-Reply-To: <87fsvjbxuf.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 08 Aug 2021 20:22:32 +0200")
Message-ID: <878s1bafza.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 10, 12, 13}.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> Includes fixes for the recent "Sequoia" seq_file vulnerability
 >> (CVE-2021-33909):

 >> https://lwn.net/Articles/863729/

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Committed, thanks.

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
