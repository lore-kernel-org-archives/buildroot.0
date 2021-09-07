Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A62C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:54:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F8E61101
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85F8E61101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56E06605CF;
	Tue,  7 Sep 2021 13:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wR7EiYzuE4Ov; Tue,  7 Sep 2021 13:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5F01605BD;
	Tue,  7 Sep 2021 13:54:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BA431BF2CC
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84CBA605BD
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M_zLNDmhlGJ2 for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:54:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F475600C9
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:54:06 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u14so19804750ejf.13
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=8b4hEGrtNHZECUX3eJC1KPgpoMv7ad+E2GTZgRfvCkk=;
 b=pElZttbltmGndYEdEhTrcacS7nEbQBcue1TpTTBzZbbW6i1OnpilBHbRKB+uP/uZf2
 Ick4Zh8LzOj6ywaARr1IoJApiEl9HFvpYMVotULlQPhQJzg5clfJJzyyEiOIR4GjWErO
 emc/TxltPRr4g7w6XN5ElGrwNBg1oiEYjI14AZRDsdpkjV/L83Em8H5q56ABdR9WoBx1
 ts25bbfL6uFqsDwLILT7xV3vBSHsyf0XkUJiTnpeGtHkDbVw8ece/QB99kU4QDI+zo2u
 Va4trJbG8mZ6cHL4QoHDAowscbstSaGeznFgoDLQkLS6nFEoj2iF0ogYRfZZhXxux3Lj
 eekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=8b4hEGrtNHZECUX3eJC1KPgpoMv7ad+E2GTZgRfvCkk=;
 b=ovyOTghGVzCrLj/Vmk9WStpadcfu4V3NrTOmSeO2pmxqhtUR4faUJElFdjvj6KupPL
 GOSZPmFZRO5OlsFGfYm2DAQ7Na9PaTDGReHqbgiOJ+Vs0HSKwf9LtUbNsr0PwKNREtAM
 HQuTfuRx/zPyH8slYHvYfysg+eiYGaxlmlQDZrVgDPF/u942b6PUNtSjhNo1cp2kFnHR
 wWFYfaNCj6WZw0J2cvun+LyHZ9swQRJnhBY3+/L5s0nR7+mKqcsjbshs0D289UAPfoE0
 z7kmf744o/FzBrHhPmu9jZZsfkSpTK5kWzon/Ik+IeLo6Ll372tZfWVkRD23R2RKzmRU
 ZoRQ==
X-Gm-Message-State: AOAM532d45VXXaBebl1ft5iRLKT3zOQTF5IuhP0ob/bYSa/bf+dG3HZW
 HN91WzKGF7qEYZlhrZY77K4=
X-Google-Smtp-Source: ABdhPJwWbjeFs/OA2B0bUJko8KU1hFjcNtwhdcLYMlM/ZqPlDjGmW/37l8APYdQtpeH6cphultByYA==
X-Received: by 2002:a17:906:354a:: with SMTP id
 s10mr18437504eja.357.1631022844804; 
 Tue, 07 Sep 2021 06:54:04 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 n10sm5745352ejk.86.2021.09.07.06.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 06:54:04 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNbY3-0003cW-Ks; Tue, 07 Sep 2021 15:54:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210828150604.946236-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 15:54:03 +0200
In-Reply-To: <20210828150604.946236-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Aug 2021 17:06:02 +0200")
Message-ID: <87h7ewebk4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/c-ares: security bump to
 version 1.17.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - NodeJS passes NULL for addr and 0 for addrlen to
 >   ares_parse_ptr_reply() on systems where malloc(0) returns NULL. This
 >   would cause a crash.
 > - If ares_getaddrinfo() was terminated by an ares_destroy(), it would
 >   cause a crash
 > - Crash in sortaddrinfo() if the list size equals 0 due to an unexpected
 >   DNS response
 > - Expand number of escaped characters in DNS replies as per RFC1035 5.1
 >   to prevent spoofing follow-up
 > - Perform validation on hostnames to prevent possible XSS due to
 >   applications not performing valiation themselves

 > https://c-ares.haxx.se/changelog.html#1_17_2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
