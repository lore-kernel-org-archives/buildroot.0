Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43F3C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:28:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D15A60BD3
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D15A60BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 317B280FC6;
	Tue,  3 Aug 2021 14:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVEmBdXDf7tw; Tue,  3 Aug 2021 14:28:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A74E8385D;
	Tue,  3 Aug 2021 14:28:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D77A1BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39079402CD
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUwamOg0NgU1 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:28:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01156402DA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:28:40 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b11so20210775wrx.6
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=dMbg+6LgruE3JBYnqgreYZiD7GoCTcXbbTYk/9qw1ME=;
 b=b0wzxFjp3ofTVSnaovbb71EhDNOkGVNdx+qKFQBya2dwDMLU0/sFijxtR2TMMDtRrc
 P1X9i3HfoFiwyYmDTpbAgmPji8s/0bkauN2ze/iVqjNp7aoAhQ12yIlhWK6M361MsoRJ
 +IZmf0NVfcUhVzHwsqn0eZuyH78w353Kxcb/I18a5L3bBEy2RY3u2vuO1WMJtDBDZf7y
 P/861o70LGzTz8knN1xBAaDA+yb+MQHhpGuAOx8af5NvxwVpUDr2ztyOl7ZK/0S0/wYS
 +JuqIUHR5kDfQIWndQZ6VNKhWxf/fjnxqtMzOwdFCkHrnAo1B8RTHMyiVXInewuagFPL
 oh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=dMbg+6LgruE3JBYnqgreYZiD7GoCTcXbbTYk/9qw1ME=;
 b=r3AQ6tfy8TCwBXtH3invpa1jTtSThIf0xB60F8Acatzny4vDOveV+xmzDYDPGPuXaS
 O36UC7AB/Wb7OUNZs8ocgAJvPa7jK6rk0xSJjWv4sKlkDnhwtQxhDjm5Cm2VRB9uFLoV
 EuGjWGmug/Vj+QjIh9++PuC/AXAw5/oAJj4wcAf01URDcVuQF+OOInvPjQ1qh593J0Sv
 gWTy00n54wJhHuziWJNxWLjSKHoe7XChodV7BEMqfuPNS28Yh0oeiFdI2jeFr7jQXc5b
 0C2Lq4MRq8+wvVz47FX95WJ4fNOHXI943SXOxEYT4z0WRjngDnCrSR6qFBhnxX2W9CKG
 6ZwQ==
X-Gm-Message-State: AOAM532oi9538VnKwDmP87PAPc6j1/i9rgJjBSUDvcoIpRW70kVMWZm5
 HI4ZC5OtO77Hr4skRnH8/HU=
X-Google-Smtp-Source: ABdhPJwm/sbQMH80uns9d2uMyR0eidiOh29UOr8lgSVzUQ/ueyTrZLS4LDZv3gEfA1JWq+CxgYUg/Q==
X-Received: by 2002:a5d:4207:: with SMTP id n7mr23388740wrq.326.1628000919227; 
 Tue, 03 Aug 2021 07:28:39 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id g16sm17657137wro.63.2021.08.03.07.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:28:38 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAvPJ-0001wf-VD; Tue, 03 Aug 2021 16:28:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210702192548.956881-1-fontaine.fabrice@gmail.com>
 <20210702192548.956881-2-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 16:28:37 +0200
In-Reply-To: <20210702192548.956881-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 2 Jul 2021 21:25:48 +0200")
Message-ID: <87y29iwqju.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/suricata: security bump to
 version 6.0.3
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

 > Various security, performance, accuracy and stability issues have been
 > fixed, including a critical evasion assigned CVE-2021-35063.

 > https://forum.suricata.io/t/suricata-6-0-3-and-5-0-7-released/1489

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
