Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4916CC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:05:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFBF660462
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFBF660462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6D6F83381;
	Thu,  5 Aug 2021 08:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qaZHF85WnfMh; Thu,  5 Aug 2021 08:05:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 663D6831DA;
	Thu,  5 Aug 2021 08:05:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9ADB31BF853
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A7EB608B7
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hF3kwm2jUHAL for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:05:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57A4D6058A
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 08:05:21 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so5612256wms.2
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=CdTS4fwPeXfLAPhC39V0LHYH/QZB0gXVMfXMF58mI/Q=;
 b=K7ZEcj/nqgpEiw2X78n8cIzEOzPaC79SKSHFYOy0T8rSPMcaOaJivdL8Wn0XBGAUns
 filjU4EBN+5RT0Y9dBKB3fIywekDvv0eCN8Ir9OiY3pc8Qrl19304e3QPjwmgRZ1wH7B
 u7WXtW63fs7ZawVoCuB7PP3k60kHcEjd+JgFDqWVYfr5FFw82XZ6+Ghh6K427JijCDlJ
 PDM1nj40WQsOnJ3ZQftpBHTXyx/7kYh767fmwByo0yiQozeB5FKXk3yT53Y3yFDC3lE6
 +PNfT7vh77WfaWmWWS7onfSbFtWZ8kfZogSipbuXj6F5szKAKarfOQF35dNX6feizaT4
 yGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=CdTS4fwPeXfLAPhC39V0LHYH/QZB0gXVMfXMF58mI/Q=;
 b=qNGlLPQOiAO26xQZg/H9mxuSTKDuNeyVaiuoHOMz1XcUBg/3p+qRG/LC28QYAFAPFW
 9q6lcnopsDVDmNILKPi0q+0UpXp1shyBhSlqbWlsO6TWYhWyZ9R66Og4RHSC07B13DfJ
 D45N8xuONGtqzQ1B3ytlmJ6Qp6rHBOyaV6R95i0yjUG0s0+pdHw1IRmfu/FW18I/vRJk
 SLf0BvDFoQ82qszsx3tIFlPwHnqqifCJU3ioSjRer+9Ty9jdZ9ui+ckJeQ+bpLPfAayD
 nbpyxHCo7ZhD+DPXLDn0gug1qHmHRVCX/w92LtpThrZMkRfiRAFVcW60RydW7Yo/tsvS
 NJaA==
X-Gm-Message-State: AOAM532A861mNFIFnKkJI7xN7dAdHICe1YFeSTi8Jig+57vb28KnvEny
 x5KQT9lUKhSUaw4hCRGaIl5fX7CqgWo=
X-Google-Smtp-Source: ABdhPJwyDAAR7siYWhwIZLmh60kgf13zFkhIEI+3hGppss1KIJY3C2oRdR9A7LRqkmi450uzZzcchw==
X-Received: by 2002:a7b:c7d1:: with SMTP id z17mr13772399wmk.50.1628150719612; 
 Thu, 05 Aug 2021 01:05:19 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id x21sm8158915wmi.46.2021.08.05.01.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 01:05:18 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBYNS-0006BP-Bl; Thu, 05 Aug 2021 10:05:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721222656.1168861-1-fontaine.fabrice@gmail.com>
Date: Thu, 05 Aug 2021 10:05:18 +0200
In-Reply-To: <20210721222656.1168861-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 22 Jul 2021 00:26:56 +0200")
Message-ID: <87mtpwmi4h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/stunnel: add SELinux refpolicy
 module
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > SELinux support for stunnel is added by the services/stunnel refpolicy
 > module.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
