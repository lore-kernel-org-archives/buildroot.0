Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CABBC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:34:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8E4C60C41
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8E4C60C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4D38401D9;
	Sun,  8 Aug 2021 09:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHRstlYRph9A; Sun,  8 Aug 2021 09:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00B0F401D3;
	Sun,  8 Aug 2021 09:34:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AADEC1BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FFB782951
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGeSQPmwYvRV for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:34:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 025208294A
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:34:49 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id hw6so23554240ejc.10
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=7hhEmQEA6r2OLE38gE6fmDIjByltIv7KT40XGP0LBZE=;
 b=c44YEbjGzmCIULCT6OGnx0kOOLL0gTAIs3oVXlDTDw+tP+OzN9D0e59JMWD2WtCJAp
 4+23xjstGUVK3u7Snli/cHcqhUMz4Luz3ZZQEja3x23M9De4MQGKlQ8CUk74f6j8RFff
 +9cA4EsiT7y3cVk0iqIZKvK6fOYSPTY072qYmYvx8oSd5xbEwpG/2DHQN1Ve1nfo0h8o
 5pn25sF0txgiiTw2+nnDx0HBm0tt3vu66Gx3I4cL3rjgt6ZUd3eLhW6kFAb0yrEOaZbO
 Vzu+6Nci0lJTmOfk5L7d16KVbkKaEUxvJAz9HhmBoLfZSbRe5KUXajPa72olEnLp3GVZ
 /xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=7hhEmQEA6r2OLE38gE6fmDIjByltIv7KT40XGP0LBZE=;
 b=s8vnlpz//NBTSMoL+f0DWsMrB9ecaMh9PLbtp7/bm8MLvSL6NPW5Cql00AYK28SwV0
 zV/sF7KAMYFXbCGGAqONiTgeYWkniLvAg211b3lAIMsYn7Y9J5uewpKpabYSiR+Ibgy0
 SQjlcF3LuBtWY81MxuQlf1zkuhvHfiIEShL39DwSYATqUsCMGy+0cZFaaHfljzCyzAQ6
 ZbjEXXwpxuXQecPqXi+/Kgk+qImb0MmzyDK/nRb5+OX8QtP709Ct6SyPm1YQKWxMKUCg
 co70pyQr/ynChSC6+T3z5nkn1cSsXm+VWAtJWGVopuZhCrg24fcKn3xj7jjpgM0GaFvP
 nsXw==
X-Gm-Message-State: AOAM5304feO4sKbihi1dSVuRvaW+RCT//weppnKhBRiGAOahsZ/ps+Sq
 3S+CmPihjVNQD2yq7pRHO03c0CJJvEVutQ==
X-Google-Smtp-Source: ABdhPJyl/hJmqrz9U0WvvczOuNGhCu/2CuGgEs+H9In6WQUfrN8rsq7bJUFTNBbIQ/L95ja34EaAGA==
X-Received: by 2002:a17:907:2676:: with SMTP id
 ci22mr3284405ejc.442.1628415288230; 
 Sun, 08 Aug 2021 02:34:48 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id c21sm4796278ejz.69.2021.08.08.02.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 02:34:47 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCfCg-00033x-My; Sun, 08 Aug 2021 11:34:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210803164442.169821-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 11:34:46 +0200
In-Reply-To: <20210803164442.169821-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 3 Aug 2021 18:44:42 +0200")
Message-ID: <871r74cma1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sysdig: fix C++ comment
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Replace libjson by jsoncpp for C++ dependency which was wrongly added
 > by commit 74fc60a267341879ca71f8eaa64a80f5b5aaf78b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
