Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B160EC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:51:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C443610A2
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C443610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3D686071C;
	Thu,  5 Aug 2021 10:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5K0HJJ85SjTn; Thu,  5 Aug 2021 10:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27C6060715;
	Thu,  5 Aug 2021 10:51:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4A71BF853
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6815C82EA5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grGKQKts5rsZ for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 10:50:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C8F782BC8
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 10:50:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso5972154wmg.4
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 03:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=H0yEAekQI5nipsGb6yym1X4a0ev0OnAoO77hY+Vsd1A=;
 b=f1sdJEG3mKfowEvYHtx5hIk5ykaauS+BaH0BkWf1Npvn4vIX2oGg3SsmcJXLZdE03N
 FZmqvu44i11Tzus7hvjRutjfGNjyERclXTH5xa7QAh5nr1bAndbV+XA8NGxf1oZa04R7
 6cuD+Q4Eaq+x+C+JRnGEXQUapGiecSokAIBdSEwELjAFCzDzcQVaAsFZpbbtHBZLa5J/
 vcNGdJhrZ3+g55PCae6QyS9JXiAZSj/cqlADV1KcXbNcvZXyg3a+NIQOHauE5RMU7ij4
 dQgM6yvU4Bi8vw9jB2rzNI7ZzTgORgurHzfaiVhl6ypgRzhjC4GFDvaKRTpiU9w4hl8q
 nNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=H0yEAekQI5nipsGb6yym1X4a0ev0OnAoO77hY+Vsd1A=;
 b=hdKnvpTP8iZ6Lr9DvSyYOy29MtD7TQXIR4maSaVdNxKkUE+b1/lNjDzvHaRn/ikQPs
 4V1n38TrAUkECSvLXEQ/zO/XskuscCwsAVebCDZNhLVlNBzlsXom+JVKOMdVRK2Ep5Hz
 vlpVvT1rUQi38ruGM1Fza92MLhD2BUuAqlhxzXceeDz1huuNmmdKUEK4mwp849C3xg/+
 MtN0NA0YPgyhtq5NPECle7mhQV1iH/rU8s0m0cDxnZFqcv44NuWvzYvyblMVObNRcGN2
 ApI+Irt3LTa0sACGODB7ioWGxD9rpq7PYzWveVk/WhxrUAIWpNeFS1x+2eIEqnEdU9sO
 Zzbw==
X-Gm-Message-State: AOAM530TsovnJ0wNXOqlUj2kt31xTC+uYAAwHhOGohAw8iMyFl55GfX/
 lnIy6xsvmGrQUtdaZVaKxMY=
X-Google-Smtp-Source: ABdhPJzwFEftiZQmn57B3yc+T2fA86BWbPHyScthMZGEDyWs1b/LOoj8IrX/f+WAj8yPaFPOV1533w==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr14311949wmm.120.1628160655440; 
 Thu, 05 Aug 2021 03:50:55 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id r12sm6085799wrn.31.2021.08.05.03.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:50:53 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBaxe-0000GM-AT; Thu, 05 Aug 2021 12:50:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Maxim Kochetkov via buildroot <buildroot@busybox.net>
References: <20210622124121.999281-1-fido_max@inbox.ru>
 <20210622124121.999281-2-fido_max@inbox.ru>
Date: Thu, 05 Aug 2021 12:50:50 +0200
In-Reply-To: <20210622124121.999281-2-fido_max@inbox.ru> (Maxim Kochetkov via
 buildroot's message of "Tue, 22 Jun 2021 15:41:20 +0300")
Message-ID: <87lf5gkvw5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/postgresql: add cflags_sl
 option to pg_config
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, ps.report@gmx.net,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Maxim" == Maxim Kochetkov via buildroot <buildroot@busybox.net> writes:

 > Some external packages call pg_config to determine the installed
 > PostgreSQL cflags_sl option. Add this output to Buildroots own
 > pg_config, so these packages correctly compile.

 > Default value is defined at src/template/linux as:

 > Extra CFLAGS for code that will go into a shared library
 > CFLAGS_SL="-fPIC"

 > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
