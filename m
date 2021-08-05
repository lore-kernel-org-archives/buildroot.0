Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83329C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:46:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03F361029
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E03F361029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC4A383412;
	Thu,  5 Aug 2021 09:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YwSGfPXqeGTu; Thu,  5 Aug 2021 09:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2443A8332A;
	Thu,  5 Aug 2021 09:46:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DC0C1BF852
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 868798332A
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHQ8Ip0jVIhi for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 09:46:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E49E183299
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 09:46:44 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b13so5709648wrs.3
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 02:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=cYYisSsfHXeftUPsAPG6634eEt2rSTDqIOF/sNzQo2c=;
 b=IgSKfe+SSJV3LglRN3XTXVZxhY2I8fm3fGP/XjvXZ13l3LRlEuzUkaB31f5DEDd6ve
 ds/OHX8InuSxOkPCO/935URI2JQ0bWfzKl5vqhA7Wxxv3GC63tojYCt66hALOzTYlDSl
 IHLeEWwxW+m0ykPf80soS34HVfXAYxgJn07y1LAkb3d7Sf/bYiX2u/5hqR6cZsJueVb7
 9zEa2MWEyuIYFHQdgMgiWOdhP+G+JYnUP3Pr/65gh8GMX0S6c8NChhm8GlRxF1+vGwks
 t1GFzUzbJ6NzbAuS5uPdEOrtx6NQSjW0+2VXAms9L5e9HEdWJ0M3eLB2V7jd6dcbmxLd
 OZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=cYYisSsfHXeftUPsAPG6634eEt2rSTDqIOF/sNzQo2c=;
 b=N3r11hmjWzKGqm0NWfo80TBobKi/cSbORhwVG/Or+iaeUeNwGIHvSq/CHE5uvPqV9+
 gg33vnbRZA3gsAIRN1YbPkUl9G2noHCAt6XhjgqD6eeMbXfiucAJXAIV9VtsbelGblyr
 A+yssETJrPNIAeSAvUvbVBcwk/v6ZWwf2YbGdeurqw2DBzBcZPnMydEEVidfeFwlrA1W
 1Sv+NvncMpPVr1H7eK+1spDETcC9tIaR7vF/cz0dZU6cjHv4/D3EtzbOBC2sR02DrlVU
 yR/vhsEvvNdulCTLJS7Sobh1QLjM2K+2aRQ34u+/kFg6Fz+HPpLFxuNWFmlzgWLcsMJn
 QFPw==
X-Gm-Message-State: AOAM531EN4y7/lvZcp8lRZ8yGstlmVQTqYyO+7fYUmSXuvk8lNe528sJ
 /1p6VrS6hDZnXoA8MhqrxM5dE4dyZvo=
X-Google-Smtp-Source: ABdhPJyvp+eOB4GG/+aJ2dxhJUnFGXqtQUrRqMVXxkcfywttUUx1lSVgjwejws7qsbCow/9TOdfGnw==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr4135431wrv.77.1628156803033;
 Thu, 05 Aug 2021 02:46:43 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id 140sm5257926wmb.43.2021.08.05.02.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 02:46:42 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBZxZ-0007VJ-6q; Thu, 05 Aug 2021 11:46:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <aduskett@gmail.com>
References: <20210721214518.227254-1-aduskett@gmail.com>
 <20210721214518.227254-2-aduskett@gmail.com>
Date: Thu, 05 Aug 2021 11:46:41 +0200
In-Reply-To: <20210721214518.227254-2-aduskett@gmail.com> (Adam Duskett's
 message of "Wed, 21 Jul 2021 14:45:16 -0700")
Message-ID: <877dh0mdfi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/4] package/polkit/S50polkit: new file
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > The Polkit source does not come with non-systemd init script. Add one that is
 > modeled after package/busybox/S01syslogd.

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
