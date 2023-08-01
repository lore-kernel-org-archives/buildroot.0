Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94B9C001DF
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 07:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 858CF81E2E;
	Tue,  1 Aug 2023 07:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 858CF81E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4r24-fPcx6G; Tue,  1 Aug 2023 07:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E046980F78;
	Tue,  1 Aug 2023 07:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E046980F78
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 367301BF97D
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 07:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5355F40BD0
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 07:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5355F40BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvL5p5dOIohQ for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 07:23:49 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5400540134
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 07:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5400540134
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-267fc19280bso4261469a91.1
 for <buildroot@buildroot.org>; Tue, 01 Aug 2023 00:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690874629; x=1691479429;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X01uFXEhv3YV11jZOR5TjJv+alXNALNGXbUs8f8ZiDg=;
 b=CynyueLKyYNHxqNMoHc8OwAEB/i7ihnkw5mN0JH3KRNwcIj7JSiU4uxZ5wYSiBOWkK
 qyHQdELaO8TXXdsYKnxM2SBNoZMa9KENFt1xWAdifdVmXdCF9nzV8lzvBDGqWHhuPwjb
 3gEBxaXbEhiZyp+KxW8trxbC+N9ePIwSRfX2XBpPMyDPivaAQ7orY+eskoyqA4fFaqd7
 v4KBgLS+G9PVJ47TN7I9WibeRSFwRd3xb3RjFnYTXu/Iy4PdLSc3qa+FpQK6TsG26td3
 Zdu1nyHHVocIakvbG2vtaLc59QZnwO+/Pqs3Yc0rY1PvXkFHSjFQL0c/wNAOl5vNFPNo
 o9VQ==
X-Gm-Message-State: ABy/qLYK7Udz8YoOmApA1OTfLG0cYmRXFUzX9peI9vKyq28hSzL+0UBD
 13b2QVlK82pVoP2ClGrT6B40KyEkkTPH9Fi9Y+KDPobXDIRRZA==
X-Google-Smtp-Source: APBJJlFuOCEnCsyTYjyv2N6jJDjHOohJGVlmWbhqRh42vESGA3ZXo9WFe6mSbIGR5KSjlJEGDNUofv7e5iplId289Lc=
X-Received: by 2002:a17:90b:4c0f:b0:25d:d224:9fb9 with SMTP id
 na15-20020a17090b4c0f00b0025dd2249fb9mr12519137pjb.24.1690874628669; Tue, 01
 Aug 2023 00:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230801050825.1819-1-eagle.alexander923@gmail.com>
 <20230801091804.7b9e2ab9@windsurf>
In-Reply-To: <20230801091804.7b9e2ab9@windsurf>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Tue, 1 Aug 2023 10:23:37 +0300
Message-ID: <CAP1tNvTS6NeD6dvoUNJyq11G4hbCk6YBohQowgaegc_N_Nd0Hg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690874629; x=1691479429;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X01uFXEhv3YV11jZOR5TjJv+alXNALNGXbUs8f8ZiDg=;
 b=oNwFa0bvOqSZJDghlQ2iceMb12bQnPFSLbUQp5G2lXby8mnTSKmZg73YtJzscRbwAB
 XmBWGVBuMZk7Gd2DMImUiCGem0LhPDirgyCa0kKdS2Kv4GV5nilpREH+dqpGv7Zt2sde
 EiNte2GB7uYh4fC0B4R0asTL4AfUugNY1Bc2+i+Y4Jjoso66ybC/ePS3F/rpB72DE8I0
 tSRufk5rqZ8POApDfNWlW7//usjoFFpmgQ6qUwv2kI62H0QTbnd/se+4sQmMiakjY04k
 sn9Ft5yJQxDmwQXVMvm13nt5zOtabMxIZmfpTN4wYepenK3WnsXeofN7VJLVbpeO22/L
 tpWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=oNwFa0bv
Subject: Re: [Buildroot] [PATCH RESEND v2] boot/barebox: Fix building of
 internal scripts
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello.

> Thanks for the resend, but why are you resending?
> I have already applied your patch at
> https://gitlab.com/buildroot.org/buildroot/-/commit/624d50b20cf4bf4a67ad6274263f85927660f8c4,
> and I did reply to your PATCHv2 to say that it has been applied (mail
> from July 28).
> Is there something missing?

Apparently I missed the letter.
Thank you!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
