Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC1FC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:48:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59BC860F0F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59BC860F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FA2D83C5F;
	Wed,  4 Aug 2021 17:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHphg_8jwB2z; Wed,  4 Aug 2021 17:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B8A83BA2;
	Wed,  4 Aug 2021 17:48:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EBAF1BF41B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C71883C5B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZJAvDGS5iAd for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 17:48:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90CFA83BA2
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 17:48:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id z4so3140660wrv.11
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 10:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=f3XxaILCs93ojZrpN1N9b9MGHknk9vg/Dc/2XnPe9SQ=;
 b=QmqAgqr0SehCIAuQXhisjCYLVtx39pKSEJavCXwHWqnmapUkJC7LM1xgkGOuvDP+6B
 P3mnknyhbrCwcSUMuFP6IsV7E0mMUW8W4W/THnH5AWeQpFX6D803jTRZ1ySvicT+UE3M
 MnEiXblmFf+AoZkIytuKeZG4AbnQ9qrQrrEuFW3Prmi5I7PnKnL5VvHqonwMB4UnoMB9
 f9TILOUjN9DHYw5G2cGAIYVdjwrwM4ezmXOfoLyhBIKezv+JBm684jvzfI1t5O/RdR+b
 yHSpbZeN1tU8CWTsLQMyvdU6D5/5EmFEPqbV522VZ5wRDO/bhdYeC1xoSzEk5DA8Pbuo
 W7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=f3XxaILCs93ojZrpN1N9b9MGHknk9vg/Dc/2XnPe9SQ=;
 b=ovJLhE7T4Lv+buuKB2exHyROl53ea0rUQkkxbEQT7uN5UrMcmihhOZrPvvLsiPghX5
 9AhgS8yTePNNv6HSa9l3G3HF7ywn5dBjyIer33axDofuGhprA6qyzZaiZ6KvjyE4ONo0
 aO3YJ5kdwZiigglV6ikBI5NAT21NTw6CoD4IbudFXNdjuyTijrF8UBfO7SumwfGPuRHA
 q/v+eA5sNzObO+EgonH5dz7qnyNl7xMHS6fhsIvBaALAk/MvRyk5cyQS+XnLdILwtpc/
 GgRYRjDiCICQjU4woTwG/UBVfm+lZh4g1zUiOQfsOEH3Yiir0r7TxOyqvbgqk2vAB1BC
 l87w==
X-Gm-Message-State: AOAM530e23NrelgihYOzxSr05zd9bzlUE6jvDzQoVH50DR4FjKUdNeAf
 /31Wea8cHoycmBcaEmtUves=
X-Google-Smtp-Source: ABdhPJwMNF6+TlYUpGadPfuaEiIbPsZ02GSQBHOz33bf1FwDmXvwfFmwaur3sfgnOuyfhRuzBNE+HA==
X-Received: by 2002:a5d:5644:: with SMTP id j4mr613060wrw.66.1628099303795;
 Wed, 04 Aug 2021 10:48:23 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id l4sm3264513wrw.32.2021.08.04.10.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 10:48:22 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBL0A-0005b0-Cp; Wed, 04 Aug 2021 19:48:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721170852.488768-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 19:48:22 +0200
In-Reply-To: <20210721170852.488768-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Jul 2021 19:08:52 +0200")
Message-ID: <87zgtxp0d5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/avahi: add SELinux module
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

 > Support for avahi is added by the services/avahi module in the SELinux
 > refpolicy.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
