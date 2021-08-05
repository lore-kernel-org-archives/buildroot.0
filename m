Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51EABC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:06:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 132A2610A2
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 132A2610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCCE84026D;
	Thu,  5 Aug 2021 11:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJvKwnn7t79x; Thu,  5 Aug 2021 11:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E58FF40294;
	Thu,  5 Aug 2021 11:06:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FAFF1BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B83A8385D
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFMy7zHU3y74 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 124C68332A
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:06:17 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id n11so3079026wmd.2
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 04:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=DD8MaFdGJCyT4H80gs3+I0x5uju6f+fLYeUPJf3zydE=;
 b=bksU5I2hwgy2Y3p55QVjXRssiMWhYP7cMYqpZaKwmTN5SwNGIhtrE2LnMl7BTysoOr
 noOsbyf9ZHv9ADAAvvMg+/V2IAk9MxvOanXavo/AWmUs3/v3pTKr1ciwCiOaz1uXyF5i
 rB+oG1nCH+2toOHWgk1HKytJcwV2yhLOjoYoaBSplSi5UumIxhUtPm6MAPxhknS4/ApG
 g82vihg+ICt1yLgtGAgise7y7aFt+Hiiu6fLyjgiO4td7+KLrhF6ni/nX9PvEx+hDazi
 62FtR0Y/R1Kq+S0eH95OhueF98nDP+FDfbrDSwNuQ6GJs26LPuvOFMrPjuL6rO3g2wGL
 5zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=DD8MaFdGJCyT4H80gs3+I0x5uju6f+fLYeUPJf3zydE=;
 b=CqR+lL8z9aYiYsykTi+XYfmCL9K9Qy0oEG9EifO2BjFsw4Uaq//1ASHzB6DD0a9jrN
 fmOY3A19wf5D+ds1s86zkc0F1as6ljHM1wrS8kXbvDLv1EWM9PhWQIryD3S48vuX8si9
 ZE3qGNO1XJZTmer4UB9XHv3SLS5C7MauLEEcj3RszgIvJ+usfhKTVFhkoSjQ5NLlKHYn
 8SzMgBlnz8kvzeE2X3TNAzXfKYIVuaQ1R/I6n4eaCHx8Lg3LRooCh6mxGV6BuuMXpcN5
 9ANJUf5wRbfp1efF6gNGF0c+5BSseP1PfqkboxjdQ3Z+0zLcaS77FHpH52LegnBDs6+x
 dhFw==
X-Gm-Message-State: AOAM532bkJObQnI0u2OWPn8qs5Iml5cFbcPPnRmqUvu81VupI/ECxLxy
 Xhgp4UbbhvjW9aGxAO6ItaBh4CCZ2vY=
X-Google-Smtp-Source: ABdhPJxSHXymQDoA9FDR2P/DVupPDW3Ku4u14xuspl3ICfa6mBFwpVQ7Lj1sWffavXa+TtgQeDAqTw==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr14625173wmk.124.1628161576225; 
 Thu, 05 Aug 2021 04:06:16 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id j36sm8202510wms.16.2021.08.05.04.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 04:06:15 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBbCY-0000pa-F9; Thu, 05 Aug 2021 13:06:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20210722181929.24015-1-ps.report@gmx.net>
Date: Thu, 05 Aug 2021 13:06:14 +0200
In-Reply-To: <20210722181929.24015-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 22 Jul 2021 20:19:28 +0200")
Message-ID: <878s1gkv6h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/2] package/mariadb: bump version to
 10.3.30
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
Cc: Ryan Coe <bluemrp9@gmail.com>, Scott Bartolett <SBartolett@thorlabs.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - rebase 001-add-extra-check-for-librt.patch
 > - for changelog see [1], [2]

 > Fixes:

 >   CMake Error at libmariadb/cmake/ConnectorName.cmake:30 (ENDMACRO):
 >     Flow control statements are not properly nested.
 >   Call Stack (most recent call first):
 >     libmariadb/CMakeLists.txt:423 (INCLUDE)

 > [1] https://mariadb.com/kb/en/mariadb-10329-changelog/
 > [2] https://mariadb.com/kb/en/mariadb-10330-changelog/

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
