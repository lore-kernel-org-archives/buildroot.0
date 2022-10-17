Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E78C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 22:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A01B40362;
	Mon, 17 Oct 2022 22:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A01B40362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyctbKmGviVu; Mon, 17 Oct 2022 22:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E1E4032D;
	Mon, 17 Oct 2022 22:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34E1E4032D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C91E1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 22:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54D7D8295A
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 22:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D7D8295A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mk0a373nRsjq for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 22:39:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14AE282974
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14AE282974
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 22:39:16 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id l6so11710945pgu.7
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 15:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eT8JEF7p7WTd0IpW8HH5NNvvBAWvHNV1LTm/cZk/ilg=;
 b=a6Fe8iQ6qPQPNDPFMoKRMXDnLZLuEOGL9a4v1KkgEtqFMMh7g7RI9xBsj8fTATosHc
 S2HpHSXzleq/ekpfIMnxIUY+X8zgVdQGAoX3cZE5tZGmG1K2bdHX6HqdiDBi9LRPdUE/
 Yj+HAv08twHQ4a8ntM8KxXuPsK7KBiVy5q8x5zNlmb5f6iW0+r7qtiCbWB6Xqb2H5Hl3
 4Vw8zVme8bzRkFiRASf1Um0fdEXX7J0GAujLlW37Gr5Arl42F/ideCS2j642vRggGhpU
 INUD5OCgq2L5iVhFuKEd0DyOO4sEJ7E7UwsUN6rkyjAVgkQdf57N3HAQ5L4tFPaQDaY5
 dyOQ==
X-Gm-Message-State: ACrzQf04eCrO0g5j4F+QN/YdTv0MNvwHkXBB+kgunK9btt79/5gRRECk
 kSfne66nhGEKi6FFlKILlaV2v/cgAWIlB2ZPH9I=
X-Google-Smtp-Source: AMsMyM7994ZyXwUSy68DrHdoKrA4z7vW0reaxCZp6PJEWFHad0Vw2OuO2aLuJAzxGDRloghqFnNVoKw0NtN3rRUTZ2w=
X-Received: by 2002:a63:8243:0:b0:463:10d9:f150 with SMTP id
 w64-20020a638243000000b0046310d9f150mr43758pgd.242.1666046355567; Mon, 17 Oct
 2022 15:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221017201804.995212-1-giulio.benetti@benettiengineering.com>
 <20221017201804.995212-2-giulio.benetti@benettiengineering.com>
In-Reply-To: <20221017201804.995212-2-giulio.benetti@benettiengineering.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 18 Oct 2022 00:39:04 +0200
Message-ID: <CAB1t1CxJ8WD+Ube0X+xw3baqrOwQjEOgJS9c36eqUxG45XchWA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eT8JEF7p7WTd0IpW8HH5NNvvBAWvHNV1LTm/cZk/ilg=;
 b=LVNlkEQ+0sUH8lJEish11oFKKXN0TShw61O4Chor3Q5XTfP+jOJf4RigTw/jsAU066
 Ona9/8zo9LfikEjtshMFrrTn+skVrdXCWS9Mwroh9PfO0QdLKY5Q7QvF0Q/y0uJmqcED
 wfbpPslahpFvtqn46MbMvT1gfFPjJ+j7hIJE7T4ksMp2EqYfsUdKCkKbZIn1WFIM54Pl
 RjxHL4DcgB8f7U1OqYMivCoi3H/Q7Hh4TXtQjZzZvnYEiMrSSNicS3bqCR7tUUj9704J
 ZbRfQ6wWrRHilaOOnsOjDmWWZaGDnYWamStkxbH0uhQkMgCL8pl4sgfHlHTC5XW1ggeA
 z4kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LVNlkEQ+
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Giulio Benetti to
 rtl8188eu package
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

Thank you!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
