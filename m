Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAACC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:44:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8ABE611BD
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8ABE611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5779F40257;
	Fri, 10 Sep 2021 14:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMEDxdWSjZCy; Fri, 10 Sep 2021 14:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DD1840231;
	Fri, 10 Sep 2021 14:44:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D17A1BF842
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CA8F4068F
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZmgdvMXBuUf5 for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 14:44:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E72C84050B
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:44:25 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id i6so2845457edu.1
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Z8O8z3elWRKoeaBKbdN5+kc9zjd6X+S3F5oZeU3au8c=;
 b=Xh74AK94Ltgw7GH4GuUm2TT/sgOq1axjfVMjlDTCy5V0/ByIgxGXKvwOkHZZ0GQYc9
 JlfRgMorYFGKErdOk9WCSYPnXPstPXrBK6GAqqu8GvxV/2wZnuZErdZT3YS4dgAJ1C2n
 PSZkYuAyfariX5xvWc0TUT6vwrZlV2A678gxTQxFsfEGIFJXEFUNPuLfNx0DV9OwKbi1
 43bf20ABuHcgOCwSIlQiS7WQi+qjnL7KXB+t0LOTq3ZbHkHQW0axcrSILdPcyHcHmYp7
 acFR33cjY6p2tFk98DqrSR1GKyTVCncGzBynabuzp91RYWMT1v6DxRgOoInZRzRR907G
 91vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Z8O8z3elWRKoeaBKbdN5+kc9zjd6X+S3F5oZeU3au8c=;
 b=zn7xxFY8NzErbCgRiMN/gyA3NapY+8LUqySjawJKBvkVbxDI0svBxRtzn9p9unz1Z2
 YK9WZSQYgvfRqN2ZHz5MxG4+1bOKgUiYtUnOszQRXEYWZf1zBCPWNlyroJ/BWRytT+pX
 VlktEPDWcvP1iukhTJ79Era16Ei6v0ZCI7vA/jeHNuPWN4jLT41xROw+P3ibpQt8qj8E
 SZYW1/b+TFz6/Z1nim5Sml0JW+DBpq8kQm/nMQAcQHLNdqH+u7jCsyVPGN24dh5phy8L
 G6OExHM8sNYdXpCUVhsuKOwg4A5JcxHnAiVkpiMSbt7wqZaVK+YXASQB8M4JF56+txgi
 NvmA==
X-Gm-Message-State: AOAM530Z9Fnby/MuHs2rP6pa9t9bHtfId0Nx3im8+jgDdrsmyKYffVRU
 BJmPLhs33VmznDI/hdiN+Q0=
X-Google-Smtp-Source: ABdhPJxd54p3jqU7wzVtBkvBV/KZLk+LB0FoujITS/IUPFvRPVTYANLbN4t/N4qZIXMQz/WfSyx5wg==
X-Received: by 2002:a05:6402:2806:: with SMTP id
 h6mr9313053ede.259.1631285064265; 
 Fri, 10 Sep 2021 07:44:24 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 n13sm2497305ejk.97.2021.09.10.07.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:44:23 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOhlO-0007iw-54; Fri, 10 Sep 2021 16:44:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210910065842.32437-1-bernd.kuhls@t-online.de>
Date: Fri, 10 Sep 2021 16:44:22 +0200
In-Reply-To: <20210910065842.32437-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 10 Sep 2021 08:58:42 +0200")
Message-ID: <87ilz88p89.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 0.9.2
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
