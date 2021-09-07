Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09F4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:52:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C446610C7
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C446610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACEA86064B;
	Tue,  7 Sep 2021 13:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZsMfaXeMGnz; Tue,  7 Sep 2021 13:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18E3A605D1;
	Tue,  7 Sep 2021 13:52:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C96B1BF2CC
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F022E80EAA
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-Aea16gN7KO for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:51:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7CED80EC3
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:51:57 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g22so14014564edy.12
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=09G00yHRRK1RxpQ4vQArNmeYrimCrXe4HY8f7l8Sb+I=;
 b=RaYr/1XlXQHvJYQd0XMC1RK+XeGc6O3pwTxBHga5yVB1hxc17zw2Wd2EVVQFZXP7CQ
 7zsJ48q/vCtLiFSAihqT3fXAsoerIFkGsn8XtyjyWTOwGoTralphnMK7NrfUlk7TDrRg
 z+Ou16qm4v/ZNmC2J3O+Fv7BoWK1pm+EF8oTx3HtScZ6xhFhNDXKnc9ePEQK2fzAPh1e
 wjIbUQoteOH4ZAPIX2Kxi1MUQXXzUjOSoUzka3HQYGz6UCAVcbXDhssjU7XyZzmo/g4D
 JxV4W1RfM/7Ub9uAD+GFM44Z9DqPXQTOmiar/xh5ZhI4Yb9at8xlY2KmBURPIpCGSAI2
 4uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=09G00yHRRK1RxpQ4vQArNmeYrimCrXe4HY8f7l8Sb+I=;
 b=ulKYmj20DTuH5ebcdJV/FLINgmn7FSySV6fKznxb0D7skaj0AthGHakEO3Fd9ONym0
 5rfNs9nKmCYzGr/wUFwPgOs26Rfrk4V+uEbXKuBS+G2ahUevcyTp2gk4RwQP7MM6UalJ
 Q6S1j6aPr03kWXDMExpx3rqL3c+bKrbXp2V8y8Mk/cUM/9VIApNsuqMiAYXYD/BR5Dwh
 bfaGhPD/M4LvYJ+pwBTzQajuQoge/0mdPIOOf59mKAIMyOj3eMQnhQvJOucCoctK9i9z
 8o7bl78u0jYT0RBOG5zlXn/wmKzQaOM/DykwHEuPlpFsizrA+2In+oBymzYvbUi1f2SO
 eJDA==
X-Gm-Message-State: AOAM531dUaL/LIFwxqhwOYXE1t1ydT+vssSjeOmScbHwbJZd+oXJhKzS
 pLn8TPtuW98yT2p6QBBbvkAUq5shQIs=
X-Google-Smtp-Source: ABdhPJygNYS4JO1nwiAhhop5xBJyu9d1IHzXlFUoFKCKRrG0HMxoQLxyzP78NKtBCnNwtQoOjuKgOg==
X-Received: by 2002:aa7:d99a:: with SMTP id u26mr18905584eds.297.1631022716208; 
 Tue, 07 Sep 2021 06:51:56 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 bq4sm5586703ejb.43.2021.09.07.06.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 06:51:55 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNbVy-0003PO-AJ; Tue, 07 Sep 2021 15:51:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210828090953.738865-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 15:51:54 +0200
In-Reply-To: <20210828090953.738865-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Aug 2021 11:09:53 +0200")
Message-ID: <87pmtkebnp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xen: fix build with 64 bits
 time_t
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build of xen with 64 bites time_t:

s/bites/bits/ ;)

 > /tmp/instance-0/output-1/build/xen-4.14.2/tools/qemu-xen/hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
 > /tmp/instance-0/output-1/build/xen-4.14.2/tools/qemu-xen/hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no member named 'time'
 >   198 |     if (gettimeofday(&evdev.time, NULL)) {
 >       |                            ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/136ce42f44bf48d3db4eda7b1548bf7ac1b97d51

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
