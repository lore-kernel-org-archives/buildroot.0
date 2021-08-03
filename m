Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D10DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A49603E7
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02A49603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B88E84027A;
	Tue,  3 Aug 2021 09:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTlEqYapOh9p; Tue,  3 Aug 2021 09:19:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B367540219;
	Tue,  3 Aug 2021 09:19:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22D841BF2B0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FA676072C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CmD610QNUJK for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 09:19:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B99D6063E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 09:19:47 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id e19so35345041ejs.9
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 02:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=G2NTgZJHUQvPNPHvPfG1b0lVLtD0p7GP4sclKHG0MmI=;
 b=Ci11Z/PauPYzDSPdVTtW/HuykaH2AEBSM2RT58ZKEL/lsezcR0pbdX6DRaq9Y0/oBg
 l+1Gt7W3CcHOki6KAj/ALkGeJ/YWCEtQBsUR1VNCWfCflz6P1CWW/fLKHx8yFWPQSUSp
 kat1/4pg0Hm3eEX2SZ9r0o9T6K8lCR/g36QUyEhxlAj9pmxrfAkNxhKmE8eJF+EUlLVf
 X7IPv+C26ZJ1nM+UuKH+dnAPjD4oJFBTwOLmrj/fNzr120tYvO/eqVGEYUoijmgOYFWJ
 1cAKmm0crRXPTtqxFPIAaspjBlxdavCGKpplC9v2sapQblE7QFgWvVDrG4QHB666/s5c
 zmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=G2NTgZJHUQvPNPHvPfG1b0lVLtD0p7GP4sclKHG0MmI=;
 b=bZsoMtltI+GN/WgjPX2UutMN9IMNhPKJGkrvJvi58WIOpsy8cc0JFUcrJ5RfsVg0n3
 pUcrZwqBRxVKkNnJdNSsG1fiB+mn83CuAPWUXXokvwVv9eigif7oU0pATWYSRv1Jd2JM
 aEWlLRr0/XIHDhWJUNpZMcZVmsIfZ3C4mOsYVamDQTlmsK/VhAFn3+Tkh7A9rAvTXGTr
 QDLK6LVuIcq4FidwVdy2S0jbDBoHv+ppyWa3f+jGcTVfCeSPQctgkSNNeQz4iFb+ZhnI
 KfyWpQez194+3t6bNl8msY7py9jlBcRYtRbz3uFZV5P89Dj17bJNIqQB+KaoOO1qA98l
 am5w==
X-Gm-Message-State: AOAM5318WsNo/BlIwfT1pTaVm7m9WQdRtCcQalE2TlyOxmS2gY42CiZV
 RCbR6PGOvAh6z29D99qW02o=
X-Google-Smtp-Source: ABdhPJz03/UbzIq43g4K6j8aacmvJNWDUE3cK5/r5ihnmeZbaDtrExtXomRirGdOl9+pTAPnuJHfUQ==
X-Received: by 2002:a17:906:5959:: with SMTP id
 g25mr19077636ejr.243.1627982385324; 
 Tue, 03 Aug 2021 02:19:45 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id h10sm6777464edb.74.2021.08.03.02.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 02:19:44 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAqaN-0000oS-9u; Tue, 03 Aug 2021 11:19:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20210708111627.3795182-1-james.hilliard1@gmail.com>
Date: Tue, 03 Aug 2021 11:19:43 +0200
In-Reply-To: <20210708111627.3795182-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Thu, 8 Jul 2021 05:16:27 -0600")
Message-ID: <87wnp2yjf4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{chrony, ntp,
 openntpd}: turn off DNSSEC validation
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > We have a chicken and egg problem: validation of DNSSEC signatures
 > doesn't work without a correct clock, but to set the correct clock we
 > need to contact NTP servers which requires resolving a hostname, which
 > would normally require DNSSEC validation.

 > Let's break the cycle by excluding NTP hostname resolution from
 > validation for now.

 > Details:
 > https://github.com/systemd/systemd/commit/abf4e5c1d3ad767bc0ed67883e8e4d916af095ec

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
