Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4A3C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:19:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BA1360E96
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BA1360E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4818A402DF;
	Sun,  8 Aug 2021 19:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMufXbnV8QM3; Sun,  8 Aug 2021 19:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D7FA402CE;
	Sun,  8 Aug 2021 19:19:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47CBE1BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37BF6402CE
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FtKn_I6v2OB4 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:19:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BE7340284
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:19:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z4so18457598wrv.11
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=oxVuy9WmwLLWl8IWqs34eEkkWRccYAN1nwWtiFY3cKc=;
 b=tSg2wkujfOf9LMme8CutKoYgNGiondVjv2p9Ga01cQbudac3IeUSOCL0nHx0uYIsYn
 I7BJDO6cwk3lqUdNPTCfzbF4wffj3Ow61J5KDl7gzk00zkRcaGKWE208nOIoVpz18xIQ
 3ytsShuKib9wzq06IgroQKjLRaUxhkYvdq3tOAU7wNk53DMjRL6JuaBAiMhFtCopx9xJ
 8StN7qUmwZ8xHTorNfTgdtmA8Dh86Wo8pj1zae2hDhYLnumQR2bWc9XzEu+bmpca61d4
 zzoOseknVsLMQ3wSWOBh96/XGBhjKcAoSdPugXsRCuNEu/AJnHy2WqXiLk1KM4uvTLOL
 0ejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=oxVuy9WmwLLWl8IWqs34eEkkWRccYAN1nwWtiFY3cKc=;
 b=FFY2WI0Ww0vQ4+oJwEFa+7UVWWazisonUNOVvL71KTq15OGFXaaGtIiYzvzxHU7/MR
 r62ZvP+n6LB3n20w/engPx4n0wpO9AQOw2f4ngo+vVz8VUrLbKNyLEyXdPxVFnUx+zLg
 vOTT1QX0qqg9fvtVxn+SuKQdiER5tgrc7Z5er4OG4QxyIRU3M3fKdibyDvCoLAsnWw6L
 szLK3InnFj/5xkOe1kFwMLrzrEFnpua3XWX+5qzb5nIXGLq3hYtBao+nGDEDLI+/KWR1
 iNu47mkSItCrG2pPJfSK6eywuTGnt3zLrv2eR+6447DBeUA/2nqQpcOELf933TsttuS7
 Ho+w==
X-Gm-Message-State: AOAM533NKc5FWMiSOMi/GCCKvaBOHdnAgkCJatwlqVtVFAe0Ny4ib6w8
 Pcod/0em5Pc52Jg4Xp9PGbY=
X-Google-Smtp-Source: ABdhPJyiHsou6fZim4LDpbSZzC3JtlE70smIxw4aC5tZ2P1fnEL5NVWneKoiFppWEZDre/LFa+c1wA==
X-Received: by 2002:a5d:5343:: with SMTP id t3mr8831778wrv.273.1628450343616; 
 Sun, 08 Aug 2021 12:19:03 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id j2sm6758043wmi.36.2021.08.08.12.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:19:03 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCoK6-0003dG-Fv; Sun, 08 Aug 2021 21:19:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210806202746.4064407-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 21:19:02 +0200
In-Reply-To: <20210806202746.4064407-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 6 Aug 2021 22:27:46 +0200")
Message-ID: <87lf5bagnt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: needs gcc >= 8
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since bump to version 0.22.3 in commit
 > b6576a458ca0d2e01b97799f64fef4a34a0dc6ea, mpd needs gcc >= 8 (following
 > upstream answer to https://github.com/MusicPlayerDaemon/MPD/issues/1112)
 > to avoid the following build failure with gcc 7.3.1:

 > /tmp/instance-7/output-1/host/opt/ext-toolchain/aarch64-linux-gnu/include/c++/7.3.1/bits/stl_tree.h:2091:28: error: no matching function for call to 'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> >, std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> > >, std::less<std::__cxx11::basic_string<char> >, std::allocator<std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> > > >::_M_get_insert_unique_pos(std::pair<std::basic_string_view<char>, std::basic_string_view<char> >::first_type&)'
 >   = _M_get_insert_unique_pos(_KeyOfValue()(__v));
 >     ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4888d99404cc4273349ab036035c5ff7e086b83e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
