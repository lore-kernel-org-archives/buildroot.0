Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66065C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:43:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D408F61152
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D408F61152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A01AA841C9;
	Thu, 23 Sep 2021 21:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id taPzGiVTXRce; Thu, 23 Sep 2021 21:43:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10E6F841BA;
	Thu, 23 Sep 2021 21:43:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6131BF317
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C4D8841BA
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajbw5nmQxdtt for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:43:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7ABB841B7
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:43:25 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t8so21263537wrq.4
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 14:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=bjliQ9ZO0+CsljSVx06J+lTjpUYtmjj7jAQ2LoljT58=;
 b=C1Up/5/46L206DrBM9hrOLC1Hlx3pJTorMD8AgOSdlM88OQLopzSfDr4TvMBQW5OmF
 1RVSmqqicTA+i+tinjmbsTlUr+rGDqd4TzYmqwJaYYSEAY+1s6ySCpm7Z+zhsaeWRRVX
 oCM1+DtBtOczd5H3opR6rjI1fHVPkXI4LfVKkpjUOn162ppwHi3QupKPARcGOvXMNZkW
 VvtF6o6C7sRnylFa5DCAiDE00kJhZ3xRO+lRcWiP6Qq2XVl5xvXpTvRBW9BJycYKfGvX
 bh58zvH8nog6y0znwxM4ZBjLE/zlxbSlsptcUXFds0Gy+Fqq4L7Qt6DaIER9ByARX9Bt
 NEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=bjliQ9ZO0+CsljSVx06J+lTjpUYtmjj7jAQ2LoljT58=;
 b=JT2QkMSMW0P/G9crCr29pYpPfzzs6jnB6ujjAQxnNzVMVEZFSwyxjVH92FJxL8P8Yn
 Mhd1Bwei5DFbggAFdbRv46O0BW/NTpXHYIrtzoArjwg3l8hoDmKdqpMSSgfZJyF1zFaL
 3ZjkyA0HwDTmuAlnyHr0EjcrpkYJ3Qf2pqPMGzVxcvTSsqHthwYrkSXKr7gMNyKWqsIK
 E6Isp0xVg9UGs2i9TL27A65B5KxWktHBOaXJUQx8+krXcoqZq7N5Xm1hdv9AvpadMnIb
 GmgiTmfjp778etGHdNdez+qNjd1c9XChJW6RZh7prMUdRSWOb2j8ikJ5F3dM1tqeQy0H
 +P2Q==
X-Gm-Message-State: AOAM530tI4iSjvORqb4ptVX1u61ejjNASSLD80YwUMc4df2dqjVTxVYf
 Mhv1pK3GeU2M1QNfQr51TTbLEvguk+U=
X-Google-Smtp-Source: ABdhPJzrdW6dpICfsqa7igP+T/zknon1dbpmu+U3vKrDCPWK4P4T9eCzql0M7jUukz0Pbit5SIqQKQ==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr7725035wrs.190.1632433403789; 
 Thu, 23 Sep 2021 14:43:23 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id m12sm4243826wms.45.2021.09.23.14.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 14:43:23 -0700 (PDT)
Date: Thu, 23 Sep 2021 23:43:21 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <YUz0+UVjx02zocxj@pevik>
References: <20210922194446.925494-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210922194446.925494-1-arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] utils/diffconfig: use python3 explicitly
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Sorry for missing this one, good catch.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
