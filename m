Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6292C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 20:04:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BEC660F9D
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 20:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BEC660F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7CCA80E18;
	Sun,  5 Sep 2021 20:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ST1HN705u0TL; Sun,  5 Sep 2021 20:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17B6B80E1C;
	Sun,  5 Sep 2021 20:04:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7331BF40D
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 20:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 293E1401AE
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 20:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tUTrC4jssNmW for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 20:04:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E67644016E
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 20:04:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id dm15so6429095edb.10
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=X+574HrFZTNUSjc8FkqwHhxOiytVub+q++2scKKik0I=;
 b=Av4YFk3CfFbQgLYfmL1PMJHJI++n8mwFQf9cVrWtf68IepAVWBV2N2Ygjwom6hH6Th
 InDJuI0WhAO54w6M8JVnpxS8wou77B5Jz7n4TwBir3wdfwSADsJEh5zGhJrD2uycdro+
 HuyZOi+WCSM8sAat8+MxQDX47Efw3TnI79KUIAKH6IEuk7negJ+t68xXns1YRO0+hSt0
 1kTLh4vKyJ68slihdSqKUFwYBxnglXkW+EhEv4koUUC1zBr3C0yFZaEyg9XVaZMbhPFl
 NqwG3QWD0V9DC38yg0jQdNO7XDCdqiTwqkOY0jEBmgMUwOMAUVsJhmv1MlOUj+DRMmIY
 994w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=X+574HrFZTNUSjc8FkqwHhxOiytVub+q++2scKKik0I=;
 b=l0MkbOnxGhQkKCNky1gfPEfJBDJn1ljF96v9q0AxoXkNAK944RjdYhx9fewOggU/sU
 JoR5EHCaBSyPtow2IZB7cmMI0ZjmKybNRS1DWcFyMON9r3bVzlP9/faLJcE0Er774I0H
 uqe28JCPCubmgcM/OyS+tZyVSzsCReSz3/ek8mXSK3feo+2yEPBes4UwXMwmo/LgbFLj
 GgzCbRV3sSwuJJQuGo5yEdOUtiyKUaShuCN0MPq/ErF7s27vH2B2oXO9L3xQxgQ20VGJ
 g1DYdwsvXqplNrSYu9hepeKTQhMkhpIOficPvC7qY+l9AQIdUtT8hPRt9U+tS1snhOXz
 hLmw==
X-Gm-Message-State: AOAM530I3+KEmuR9qD+ZkmjRzlapONoIJxcRF+NjRy7svaLjn3FiVZTP
 th5WLE2/rJA9G/QRQQV+oHa/TBfuawA=
X-Google-Smtp-Source: ABdhPJzy5/qAUzEwRsLmz7to2/GUr8ow/GblWwCwRt3s2l5NHZTwq1la9SU0wuy52rcdoedQylSGAg==
X-Received: by 2002:a05:6402:791:: with SMTP id
 d17mr9882960edy.321.1630872290012; 
 Sun, 05 Sep 2021 13:04:50 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 lm21sm2737505ejb.58.2021.09.05.13.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 13:04:49 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMyNj-000105-IS; Sun, 05 Sep 2021 22:04:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210817163733.57255-1-bernd.kuhls@t-online.de>
Date: Sun, 05 Sep 2021 22:04:47 +0200
In-Reply-To: <20210817163733.57255-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 17 Aug 2021 18:37:33 +0200")
Message-ID: <87h7eylrfk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.6.7
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

 > Fixes CVE-2021-38385: https://blog.torproject.org/node/2062
 > Rebased patch 0001.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

For 2021.02.x / 2021.05.x, I have instead bumped to 0.4.5.10, which
contains the same security fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
