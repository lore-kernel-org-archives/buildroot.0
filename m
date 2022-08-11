Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3664DC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA47E417BA;
	Thu, 11 Aug 2022 20:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA47E417BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYWY5QUpB7wk; Thu, 11 Aug 2022 20:16:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8211F417B3;
	Thu, 11 Aug 2022 20:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8211F417B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4C891BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF7024013B
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF7024013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1b_y3-rNsmxd for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:16:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35382400E2
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35382400E2
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:16:38 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id a8so18636008pjg.5
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 13:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=E4W5rqp5azjg5A+V7Wx+ywYJkJb28f+pO2p9mZZb9BE=;
 b=4JVCzu+O7Ta+Z81fvr1ODrIMisZqIwJy9cQc4KZ3PESuXg4D/sREa18Gm4WstEZ9X1
 +KKNhKBF2FnXLyvD36cFlQylDVxxfjxHvfN8I9oWvRWXhVvh1nrvc9yjUGF+4YwD9mDa
 bIz7FTVeiL1hOXc+KyNsjuTzpIgDqhocRk3p2l4nt6od3R3/YyU5VZK1P8UqnLJLA5pR
 CI4dNnl6BuYrMLsPkt7BfTATC1GWfjjNWIbwN46LXROwJt9O0thqAk2ly8wrLZkTAHPz
 1JWIUd45ujysL/cqnCfqhsy1s6iOM4I6gw3SDSgDQ/wgjC4CWFw1CVm8F3H/rjE2RJ3V
 aM3A==
X-Gm-Message-State: ACgBeo1GFanDuWLzK/xd0w97NAYgxasmr7KqaqVuT5G6s4zG/0rv3QBK
 d0ikn/VhRN5vPj0ZaIncjVByVvkxjPjCuxqCf5OUhrUG9ptAgg==
X-Google-Smtp-Source: AA6agR5CHAyE/KAK5kDXT/afa631bfC3EU+NcBlGVr6wnsSfTJu8cZlnKEPi71PwhAEEkSpthFYWHVVk229oSoKoioM=
X-Received: by 2002:a17:903:22c1:b0:16e:fbcc:f298 with SMTP id
 y1-20020a17090322c100b0016efbccf298mr861295plg.2.1660248997665; Thu, 11 Aug
 2022 13:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220810215104.107714-1-giulio.benetti@benettiengineering.com>
 <20220810233824.714623-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20220810233824.714623-1-giulio.benetti@benettiengineering.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 11 Aug 2022 22:16:26 +0200
Message-ID: <CAB1t1CzcXYJXC0oj7+80mzhErncBPVV31ZOJ5DNUia1y0=d8HQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=E4W5rqp5azjg5A+V7Wx+ywYJkJb28f+pO2p9mZZb9BE=;
 b=HJMOsDap6SnI11+bfs7bHzKQTT36ckVjl40qfZaM2Z7R+zvtI1f/PpgSmxCKsZZgRO
 +uEZ8AQqFGBirBeHF9/hP6fKOkFtW0Y1W0AhCbU8cjyw8lpUxnF2YoTboIgvyLTX/j+F
 3CUNSKYhjALXZJJ57Fy0WbpuqMIWIBQnTEGYcnUWe617h3nNhXcB7yMOjlXeCFyFVW4b
 CnCZJog6y187LcHBySFoknar3I6tFGl1RFzu3rTf5/wx8ccS5/BTfVdO8UgRK73k3z+h
 o9H9xU6j3FmsS/Gl/HUawznTzSeNuRg3SYY9VR1W4l7hW1clvQVFEbcyUmykVNSPt3B1
 oylQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HJMOsDap
Subject: Re: [Buildroot] [PATCH v2] package/nfs-utils: improve local patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0803777434476234698=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0803777434476234698==
Content-Type: multipart/alternative; boundary="000000000000bea0d605e5fcd750"

--000000000000bea0d605e5fcd750
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

--000000000000bea0d605e5fcd750
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Reviewed-by: Petr Vorel &lt;<a href="mailto:petr.vorel@gmail.com">petr.vorel@gmail.com</a>&gt;</div>

--000000000000bea0d605e5fcd750--

--===============0803777434476234698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0803777434476234698==--
