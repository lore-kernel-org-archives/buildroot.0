Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46480C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:05:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7B06104F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD7B06104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 995326058D;
	Thu,  5 Aug 2021 08:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Age2y2jmcent; Thu,  5 Aug 2021 08:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABC4A605D7;
	Thu,  5 Aug 2021 08:05:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0165A1BF853
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E253D401EE
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B18yG9PbBwLb for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:05:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9217401E6
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 08:05:00 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id u15so2736291wmj.1
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 01:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=N6FfJ8Kds93R81liJHRccwqwY8QTLbEiagNxkaN9qXQ=;
 b=Dm+m1IaBOymvXg4XYrFFXUeWFG+uUB5oj6yeUaQgk7pRGtOxBospCfp2rbxDFRqJyl
 xSENwP+36aGgUYtfk8bTfGPDWNGusRJg15Ula3eSkTSipyuMqHDUHGnPHRi97ioxeuB6
 u1gvdojk1KyxQq098nDJLUS8wxG2MXyLeERcIyFNcJnXzKmgtsEQ/eVDWo9Oq92g8n2S
 OFQv8hFKq7VSu4dz7Xyz88s3ep2QdVjpJrwyLbVRxKrVHdfiWsKs1ehThzrfIdi3PoFR
 fsQ+9S5RL5yTuyIWsTh71fvzu5MK99PAWh9whk4ejGqt8nXl8fPiLUm4NNj3CzuaGp74
 US9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=N6FfJ8Kds93R81liJHRccwqwY8QTLbEiagNxkaN9qXQ=;
 b=SSKhu1MR9HGw9LlEBP4NdyirZb0Q64JHkjbjmAzzK5zzQKWAzS9IrZjzW9o0eujT4M
 I1FKH88j+YGzz/+16JqgUmOIBlKMwUT1GLgGk/OIJFapkoRktwArKwp2gGsIsAgSmcCc
 yPh+fVi4BshqG5+ie8uoWlg1gofrCxbefKsdF0TE2inoGI4LLF6KbIjfBm1pd1fbiIOB
 W1v5LhdDZ9K7JYJFH1pnHmBLnGIsrhSyWhOInLI0ClS5QqtRPSxO2FjHHmdn/yLD+A+g
 fTUErCF0fSAS/wVjMMdk18kG0jNlRG2zx3lkhIQpbDOxSSGd0Q/E12J7osWSjVUz7fjD
 5/Pg==
X-Gm-Message-State: AOAM533BkXAw9S+V9id79DmnVm9Jy215aoQxn8mjfsK+qGGNzUfFTLrh
 6HOqf5fPdtJI4y4u/SL2iddlT/GK1oE=
X-Google-Smtp-Source: ABdhPJyJ3yDx82uj8k+qlAoM/ki46zseuRt0hZSd0g/EhxAoGjwvVrX1omXXGAI9/ulc31KcpgyNlA==
X-Received: by 2002:a1c:4c:: with SMTP id 73mr13703045wma.139.1628150698710;
 Thu, 05 Aug 2021 01:04:58 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id s2sm4608271wmh.46.2021.08.05.01.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 01:04:57 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBYN6-0006AB-Je; Thu, 05 Aug 2021 10:04:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721222614.1168721-1-fontaine.fabrice@gmail.com>
Date: Thu, 05 Aug 2021 10:04:56 +0200
In-Reply-To: <20210721222614.1168721-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 22 Jul 2021 00:26:14 +0200")
Message-ID: <87v94kmi53.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/minidlna: add SELinux refpolicy
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Simon Dawson <spdawson@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > SELinux support for minidlna is provided by the services/minidlna
 > refpolicy module.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
