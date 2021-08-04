Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64B2C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:51:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8180660F0F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8180660F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B9F560ACF;
	Wed,  4 Aug 2021 17:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQ5zNmcRlmdX; Wed,  4 Aug 2021 17:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE66160A8B;
	Wed,  4 Aug 2021 17:51:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB6961BF41B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB7BF83C5B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWxUWKBijgeY for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 17:51:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82F4283A4E
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 17:51:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so1956573wmd.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=CHSazalU8owLG8bg1HClbg+uGXvFm8UPjsziYhB1OO8=;
 b=Qqc6V+lMZfkgPvTtke/eVltf4vnagmeMhyIQEJqY9Ul9XOyJPmhjqWMcebppbZYO5c
 1vsYd4isbFDfpZyqZzk/TgvA5EDWnfPlGUgs/VDp2WKHncZz+ffu/2SCRWQjz3ct0X+7
 ZDM2aZ7d2EMX5F6+UIStYi4Bm30n9tmRTfRWUrTcUoIY2D535HAHfvJqVxAW/qlily3q
 8orTdql/A8BZ/oFG1HaAC6MY32UsbibI9h21Bpj9mWaWQ3gk1eovfi4jHND2wLjfZTzf
 kx2/7gHeNNiCWs9sHcdGIyc4PPiLMCPNTG4S1Pwh8Xr66a0zt7hSAJiHfO+SSWUupUvI
 JsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=CHSazalU8owLG8bg1HClbg+uGXvFm8UPjsziYhB1OO8=;
 b=Rf+qmdkZcBQV1ZCI5ZRoxvwbKGbTerxue2ltMaOxV7EapIWMi422NArUDhAolUqZWs
 L116uFAUYs9tWrmM4MTVdnIxWF/JKAkfEfRRXEHeGfrL88s1rqsx2wMKyE9Hqp+nqzyf
 aOLuPgzOusyvM3OaSgKjPRJsmBEHmStzK1rMUJdcBSVWGC8K8PGFMekftHmx3NlbApC5
 udnMgFAjKnFyGra3Xm1ZDln/+UymqRRvtfVJx3YCaKMYbQcdanImb5ytGPoQAgisv2/9
 SjwbOP5Ubg7t1WYWXuG9p2F5gfUGEUwQNTdLbvYteFkaJYnSwWioo6Q7CGO8NKvXdr1a
 iI/w==
X-Gm-Message-State: AOAM533aSzeVKL0kNR3TBQcKN57q3YZy0BhuJt/CJGm6nkN0mNLLgygw
 sCGmue8q0H7TYoiuXfursio=
X-Google-Smtp-Source: ABdhPJziwSNdV1NMU+dGZRToj5FwMRBFyMTZ0CPX0AgMfdbu7nPyhLrLL0mkojVZo2SmkN2NrziqOA==
X-Received: by 2002:a1c:9a97:: with SMTP id c145mr10945224wme.42.1628099497778; 
 Wed, 04 Aug 2021 10:51:37 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id h16sm3332946wre.52.2021.08.04.10.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 10:51:37 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBL3I-0005oB-Ko; Wed, 04 Aug 2021 19:51:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721171354.493806-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 19:51:36 +0200
In-Reply-To: <20210721171354.493806-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Jul 2021 19:13:54 +0200")
Message-ID: <87im0lp07r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nbd: bump to version 3.21
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop patch (already in version)
 > - Update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x given the fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
