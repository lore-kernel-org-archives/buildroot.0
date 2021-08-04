Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9B8C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:29:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03CA560E97
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03CA560E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD2F8606B9;
	Wed,  4 Aug 2021 14:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id la8lFECytkgI; Wed,  4 Aug 2021 14:29:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CEC360661;
	Wed,  4 Aug 2021 14:29:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9763A1BF5E9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8512E4020B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7IIpYD5f4un for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:28:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B710A40100
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:28:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so1588500wmb.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=1Nerl52tuzA9bv3APKtwMr2Zwt+HQUJlN1QJTqRYFK0=;
 b=ExRggx3MSu6QCOLOV5AqKlHm/jDwZXnPfceGu7FtSKcpyX/yBwjkXQpIKtIcJigbwj
 Bf4IiGN5TUBvLSmH8TxLpGvjas51UzL8AJJgqZhEa3n0e5Wm0x0zJqvlvnmRc1+i42if
 4Q9h/mvmGYnr+SBRtPP4lZrkcoa2RowwXl54Vm63KCgF4YmxJWMV+frltA2FIlapeCAQ
 A/FjO1FlxCyLQeO1M50akPn/xlEXKp09Bz3IZmzUQ+HGPOmmhM5vR04LNq1VXFT16uNn
 twFC+qXamEd+1IVdjxHWkYgmNhs1hjk008u77VPTbNTDp0mk0dfa1/kk5aR5Qm7pzuKQ
 XVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=1Nerl52tuzA9bv3APKtwMr2Zwt+HQUJlN1QJTqRYFK0=;
 b=j7be4t5z21qbuokkDwGOXxzSZjg30ik/J/Yj5cQ+2ITKj02+oomLHS/mWkOaGGjvws
 2R+t/3LlsrRgiivmorKKVJN4LrTx2QB56HCtCLBXoMTBdPTue5ku5N0+1nq36blA1hoP
 udvh5f+l+uq5FFVBBgvjLbzi1utOcVs8pQyNjNbPRiq2lGEFntZSltCxpAij1yhIS6UK
 OwMVcdU7bhHtM6DmrrWahIs0HhQFyB0dccVbmop4n4BAB6sFH8tDb+s/S4pXacQeMCHF
 NRIojCS5cqMNNoja03o0WqO+Jvvvw/HqRk/VPRu6V08246KecQBeDu3vyPAhOOv+wEm+
 THCA==
X-Gm-Message-State: AOAM532TBtfoolVftRXa8M/eMeJPiATqNMVwzGOq/nZTJnIU/DQl1YrS
 XvmGn3FY+29fyb/oacP9zLc=
X-Google-Smtp-Source: ABdhPJyhtOY8cLH5mN83nbKjSiiEoKHwx7mBECKfDZr3QKNMCQwfjjbXpVvGA8wYr8w9Tgw61dihog==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr10109720wmg.130.1628087338006; 
 Wed, 04 Aug 2021 07:28:58 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id j1sm5895517wmo.4.2021.08.04.07.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:28:57 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBHt9-0003fk-DN; Wed, 04 Aug 2021 16:28:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20210706141132.18307-1-ps.report@gmx.net>
Date: Wed, 04 Aug 2021 16:28:55 +0200
In-Reply-To: <20210706141132.18307-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 6 Jul 2021 16:11:31 +0200")
Message-ID: <87pmutqo60.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/2] package/linux-firmware: remove
 duplicated entries for brcmfmac4366b-pcie.bin and brcmfmac4366c-pcie.bin
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Remove duplicated entries for brcmfmac4366b-pcie.bin and
 > brcmfmac4366c-pcie.bin (present since addition with
 > commit ca6e3f4b900a2cca605d44cffcc463db432ac0ac)

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
