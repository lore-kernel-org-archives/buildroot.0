Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0835FC432BE
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 16:24:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8562D60FE7
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 16:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8562D60FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5864060AAB;
	Fri, 30 Jul 2021 16:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xF0hDc3Brqn3; Fri, 30 Jul 2021 16:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BACC660AAA;
	Fri, 30 Jul 2021 16:24:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF351BF348
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 16:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F103A60674
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 16:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5O6WSoas6P0 for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 16:24:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24C67606AA
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 16:24:05 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id v21so17805722ejg.1
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 09:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=QZ/kfhZoQplhM3Ze76aqEp4yjZygCn6HRNA2cpo0IN8=;
 b=aJHLLvzwsxZURNfq+gI+E1EOAy/yiDq9hOw63FGdEDsU0NO6VGjYqWKwCBZJxLSmKR
 3Qcpr1Ve5b1TzkjYlO8BLqq7lWgTd6NJLEWjhVPMNGMQD4nmX/b00b808Lw+qnqIr+mt
 sDv7Om+W+pEeYu377cKPGbbzx+KI6s0PzMGqVCtgD9KmAKDVFe0j0DifOOizysfl4sUV
 fH5GHY556BBD6yxg5h79b7emfoLJATp6QCM8JfakwjZ/sLLCi6VF4RWIkAzXBR2gKI9d
 KU0oG/U0veV6gT1v+alxYzqTQi5EEjfjbSTvuK5nh8kJnF571Syjc0Pjt2RfmTewTW3q
 hCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=QZ/kfhZoQplhM3Ze76aqEp4yjZygCn6HRNA2cpo0IN8=;
 b=lsJ9y59LE4in4+1vvuaH1uRsUgN4o+ov+dqgOGG1fS9bFyRvAQ25mBAIlCnUGuBYVv
 8ZaB8gN7vpMTUNw/S1h2KIP4HmWPa0NqkmHE0lbHm1lzgYO8PdssgbRXit6j312vy8nw
 Jvix1ogRIE3NTZ7Y7iDdrJzPCsu5eoFJeHcOP9jjZmEEubXv4F8B42y7E2tgUzjO3P05
 ggSw6nJbbOzSZLOXjKvX5VjfYcmcevZgHuqp0LyQKMTH9ZTtx8/arDJJhWrVkFXa81gf
 JEY6bwzD7lwP+hTJFANBsXDsj1HqdKsDFZwoxEYKjlwXnpW+/xCIiigCJ81S/meayOce
 Wj0w==
X-Gm-Message-State: AOAM532OtF/BtVGHz2EkgfnH6FBislsLQnh2FPPm1xZeokOenqgZOrEe
 hdK7J5yJOVXG53T2uhOKiCi1kiOo/sg=
X-Google-Smtp-Source: ABdhPJyvRG++HBcLyuGJoXRiqJAl6V8C8WuLI9pOKdUt0cQwOXw5G8gbvOsrjEDPo168E2o8peHqGw==
X-Received: by 2002:a17:906:35d0:: with SMTP id
 p16mr3371197ejb.284.1627662243373; 
 Fri, 30 Jul 2021 09:24:03 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 o7sm692307ejy.48.2021.07.30.09.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 09:24:02 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1m9VIo-0004uu-6g; Fri, 30 Jul 2021 18:24:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouanchristophe@gmail.com>
References: <20210726091635.86606-1-titouanchristophe@gmail.com>
 <20210726091635.86606-2-titouanchristophe@gmail.com>
Date: Fri, 30 Jul 2021 18:24:02 +0200
In-Reply-To: <20210726091635.86606-2-titouanchristophe@gmail.com> (Titouan
 Christophe's message of "Mon, 26 Jul 2021 11:16:35 +0200")
Message-ID: <87czqzzs65.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: security bump to v6.2.5
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
Cc: Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:

 > From the release notes:
 > ================================================================================
 > Redis 6.2.5 Released Wed Jul 21 16:32:19 IDT 2021
 > ================================================================================

 > Upgrade urgency: SECURITY, contains fixes to security issues that affect
 > authenticated client connections on 32-bit versions. MODERATE otherwise.

 > Fix integer overflow in BITFIELD on 32-bit versions (CVE-2021-32761).
 > An integer overflow bug in Redis version 2.2 or newer can be exploited using the
 > BITFIELD command to corrupt the heap and potentially result with remote code
 > execution.

 > See https://github.com/redis/redis/blob/6.2.5/00-RELEASENOTES

 > Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
