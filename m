Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E04C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 06:46:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB51D601FF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 06:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB51D601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 625A382E1A;
	Fri,  3 Sep 2021 06:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tMB2A3rTlZGW; Fri,  3 Sep 2021 06:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FF6C82DDE;
	Fri,  3 Sep 2021 06:46:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC8451BF44C
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 06:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FB2782E19
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 06:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9y5z7b2LCnG for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 06:46:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4831682D96
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 06:46:27 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id n27so9983163eja.5
 for <buildroot@busybox.net>; Thu, 02 Sep 2021 23:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=DNG06RpiRHr0VfpaN3ZtQC1SgnHkjNFyW7ZVlDl22iw=;
 b=ZpNNGcVV3jOFY4QoVlIXcrHeEt2lts+HBjNje93D82gi0DmzOzLFdT0j+lj6IIqzKC
 ww2IXfLrhDLs0CqtQOKPb140RyXqSB0veY0cF14S1TuJEPXy5m9E3eOe1QFu2WNLeSIs
 zaHPA3H1UdRuoqXz11GFMZiWIizE/ohraULdJ/xnDyI4dmW2W5aUW6JVUZuW4erifKlD
 0iyQyAAq+jlVKNFcreE1dNByOvvVP0CUv4uVH9f+ExLYT/V9+cDjDNBGpbvqUGfu2Pkx
 xNnHLSzr3/Mx6AzUvXTC47nAxF7gOZ3F0IhvkTDxND9Ag1T6FqHF4gTBixNu/MMbFRf4
 GJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=DNG06RpiRHr0VfpaN3ZtQC1SgnHkjNFyW7ZVlDl22iw=;
 b=N0d6QlD6M5ibUAKf3UQJT8xXURjRSRKmEDewaSqYHCl+E7gvtA63NPRXGF8sraaion
 N/7MlkAt40FGhfG4NqjDmsLS+4vcoXeBEutu/S2h7eobageS4NJ5qce6lSjZ8wETemHk
 7IizJNky9hUFx0CJFSmpBWdSpJBnF4R4MYWs8RhRafgLUVW7ZETptezINUG533cbA2zE
 s+5ZTCqZL3x/iNURhudWuQ1Omlb2T0Omsqnk/L7wglBjpEcXPm9RcHul7IfMw6SiBavT
 jvtqCe/PaNDmD2CGgI1BcL9gO7V9r8d80LPte1geLpp7lln/eONcmdSz6UsmavI6+hIS
 sHmw==
X-Gm-Message-State: AOAM533yWUffI/X8h0jwgb5KjtfL+N7ysOjwP6TXHnpKTUPRed1lPuH/
 0PSRThuYXU9e3wtkWHiKUwU=
X-Google-Smtp-Source: ABdhPJzDemtmBonzOfvhJNFQmnbL3+c+KJOvtCyNokmWrOOw56j+Gn7KNnJDqJqYKDYKc/I/KxHbTQ==
X-Received: by 2002:a17:906:4f97:: with SMTP id
 o23mr2444382eju.418.1630651585421; 
 Thu, 02 Sep 2021 23:46:25 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 h30sm2343537edz.40.2021.09.02.23.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 23:46:24 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mM2xz-0002Jt-47; Fri, 03 Sep 2021 08:46:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jeremy Kerr <jk@ozlabs.org>
References: <YS/GToWU8Wx8XOR6@pevik>
 <CACPK8XcMS1nW446xL--CLShQTZA0opSNE4Yr_cnY1Ayh3vYe=A@mail.gmail.com>
 <20210903092217.7f02055a@canb.auug.org.au>
 <e65b04b32ae2d249310cdd85647e2a69321f8275.camel@ozlabs.org>
 <20210903105610.790366ac@canb.auug.org.au>
 <CACPK8XeXgXtf69BW1f4xQOrixt2OAzXNsCqFaa+zDNeWqfkomA@mail.gmail.com>
 <690b56e57bebb7a4730273ad3f958d6c23e68680.camel@ozlabs.org>
Date: Fri, 03 Sep 2021 08:46:23 +0200
In-Reply-To: <690b56e57bebb7a4730273ad3f958d6c23e68680.camel@ozlabs.org>
 (Jeremy Kerr's message of "Fri, 03 Sep 2021 11:01:57 +0800")
Message-ID: <877dfyrwao.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] What's wrong with patchwork
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
Cc: buildroot@busybox.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Jeremy" == Jeremy Kerr <jk@ozlabs.org> writes:

Hi,

 >> I just noticed that my buildroot list filter is no longer working.
 >> The listid used to be:
 >> 
 >> List-Id: Discussion and development of buildroot
 >> <buildroot.busybox.net>
 >> 
 >> but now it is set to:
 >> 
 >> List-Id: Discussion and development of buildroot
 >> <buildroot.lists.buildroot.org>
 >> 
 >> It looks like buildroot list changed domains recently. Perhaps the
 >> subscription for incoming-buildroot@ didn't get moved over to the new
 >> setup?

 > Ah, that'd explain missing patches then (assuming delivery is
 > working...). Patchwork relies on the list ID to correlate mail to
 > projects. Since it doesn't know about the new list-id, it'll be
 > dropping those.

 > I'll update the list-id for the buildroot patchwork project.

Sorry about this. The mailing list setup had a number of annoying issues
(the busybox.net vs buildroot.org, how uclibc/busybox lists were also
shown, TLS certificate not matching the hostname, ..) so we recently
worked with the OSUOSL guys to fix it.

We've had some teething issues, but I believe it is working now, if not
let me know.

With the changes, the list page
(https://lists.buildroot.org/mailman/listinfo) now has correct TLS
config and only shows the buildroot list and the List-id is
buildroot.lists.buildroot.org.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
