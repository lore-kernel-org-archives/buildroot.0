Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7A7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:56:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0154E606A5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0154E606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBA4181020;
	Sun, 12 Sep 2021 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DT3LBS6Pqv42; Sun, 12 Sep 2021 18:56:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 386E38101C;
	Sun, 12 Sep 2021 18:56:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9D851BF40E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8C898101C
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYgyxIdLkYEK for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 18:56:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 231538101B
 for <buildroot@busybox.net>; Sun, 12 Sep 2021 18:56:40 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id i21so16107791ejd.2
 for <buildroot@busybox.net>; Sun, 12 Sep 2021 11:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=64hsHoEAerfbD2XesXefx3mfN7OzP/xvdjub+7l/Uro=;
 b=C303jlvPH38ChacSsYNWyKrLH+lSggs+eLYw+qkR7debormPowYJ1gKBpGFUMHF8/6
 u+6968/cKOS1XhB6ARbdwUFQCUyn+7yvKn7t5E3g+URjncJ+yA7xLmuIDrIg2IvatvN2
 ZmCJ63KTh4gPnycl14w238DxJheMBcaTTRqthPcmbIqzt+HmcrnrVdl5XCG5wY/StCv3
 OVTaN6ebdGGJfgNMKHmWMQgKUJzN/a2CdHnnpOpen4MPsg/CRPdo+9fn8/TiLm2Uy6gS
 BrhIJekIThAC2SiN1o7FnMk7eUerfkO2xXoJk+0eQL+XjCbLVCzJM8ih2lvzYwxKny9z
 K+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=64hsHoEAerfbD2XesXefx3mfN7OzP/xvdjub+7l/Uro=;
 b=HZBrXUVXTlxyrK9IdGfHI5eikDIt5Um+VjEjC7a3lwX1tuuWboKgEqYfkKr7A3zTv8
 KI46AB8M2gJVwRaHLqgy0zWMzystFmKwdzC0PJMP28MlBrcAmyl+TKSyGhfXq99zIQ1E
 HgEbFxMb4eY9xWsWrzltnTcXzpJWirbw/zUUYFaYzsG06gRWAa1g5J2EFqCpiEZQs3I+
 +ovC7VoQH56H0G5OoXQAEa1kPccnojVR0JDPO6+xelyLSK5KLutQIk1KFGCYbcJ9SXGW
 G5GDbmzyTs1QL63WBC7yEteP/2z3pKEBQn7FIjdUpY1zUgXl5OptaR0ZDlNF46FW7pyU
 Mvwg==
X-Gm-Message-State: AOAM532GlD+5stkmsYXL733UVw90tHp1kUC75yOdHCUMRHg1BL6+vNtu
 ZC1fTkZmqMrh/0nPNYs8PiOwpza13sw=
X-Google-Smtp-Source: ABdhPJz5dvRApbPFyEGCDfrcLTsK1m/w5kuvuCAsL5919x938e1GVXSd6snrlgM5lECEZBPKJwnVuQ==
X-Received: by 2002:a17:906:7d83:: with SMTP id
 v3mr8733237ejo.216.1631472999373; 
 Sun, 12 Sep 2021 11:56:39 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 y8sm193753ejm.104.2021.09.12.11.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 11:56:38 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPUec-0001cO-1H; Sun, 12 Sep 2021 20:56:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20210909083514.2066928-1-francois.perrad@gadz.org>
Date: Sun, 12 Sep 2021 20:56:38 +0200
In-Reply-To: <20210909083514.2066928-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Thu, 9 Sep 2021 10:35:14 +0200")
Message-ID: <87czpd4o7t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gnutls: bump to version 3.7.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
