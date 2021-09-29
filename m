Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B601CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:27:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CB3F611C8
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CB3F611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E35423B0;
	Wed, 29 Sep 2021 19:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZyLcS8aEnOe; Wed, 29 Sep 2021 19:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490C142501;
	Wed, 29 Sep 2021 19:27:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFF961BF94D
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF89060BE8
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6HbSD6qRp9H for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 19:27:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6FB560776
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 19:27:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so6272498wmc.0
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 12:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=N2kEJzX/06JvsRxFy445f4vsIRLRBRLEcz6vR/Tpgdk=;
 b=qIAiMePoPXuY5C8DDUiqY3+LtBnoS9Xj1REyZCLMi0f3RkBMLp+FglD/cLLfqwMVIp
 XC5sz+BKpk2tfnPN5zwMACVNizFIc2guDty9crS+xQlS8PqU55pB/17b1QM1O/wMN19h
 HR2MG4NUqUqZvqAy6ufs2/yO3J1AaL1HJL1Lmew6B6if4ZJpF9aGVvdelldgwy7ifFtu
 Y8aK/PGrPxULAfSezRBhDIjfACc2+w3elGWJkGrXtin1Ik9zv1cYIM6cPzSeUCPawpOL
 wNpee+iTtwZSiasZ15c2hAEWvbJ5iNQFk9bvYZVG3yoXcxLFOjpnsN/SP2CaCNhKW/O5
 iMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=N2kEJzX/06JvsRxFy445f4vsIRLRBRLEcz6vR/Tpgdk=;
 b=uKO0ulSnE7V7/hGX+nHNCidHxA4uEF4+/wbka/QUF7sM7YQqT5wzAHvXcmm3QdPph3
 3m1UhDwY3wnI8Z9wfjbFzf0ebj2lHLKwYWpJcZIKQcxFDKEH60h+YNLMTY1Auw9uKTxL
 /LxpTV6FJ0Rv/N9o2iEAxvG9JFN7dFd/qMQ70Q+guqrYCRum9Yf3m36fAPP6IXh/UBQW
 zkNhEF/u2O8zC5Gfa0ga2vFiGwBi2wJ5OZXIWnC5rryQT9frkJo/Yj2oIYT2LBl50GlK
 Ud6rAA3xhYJt/PU4iV77lkZ5OGlgPq4UU0PZNl/IRnVEAYbhvTPwORookMLQHTf6Dn3E
 PBzA==
X-Gm-Message-State: AOAM532FKCkj70GQ3P16psTO/xp/ORKqwDB3edM+18Dac8kngIXLpbQs
 8rSa+vqra9HMKNPLkejA1+no5TZbHQk=
X-Google-Smtp-Source: ABdhPJymbkkFmTyAfaUzuzpg5+tYyD4NI1Kfbz3l3t5YGtpb+DgL/ROIUMa0nHnB5eiZpTRQ1K5g4Q==
X-Received: by 2002:a05:600c:410b:: with SMTP id
 j11mr12235053wmi.142.1632943638712; 
 Wed, 29 Sep 2021 12:27:18 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id l16sm746458wmj.33.2021.09.29.12.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:27:18 -0700 (PDT)
Date: Wed, 29 Sep 2021 21:27:15 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <YVS+E1OhPsOXftom@pevik>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
 <20210928195533.1736944-2-mmayer@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928195533.1736944-2-mmayer@broadcom.com>
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: set HOST*_NOCCACHE variables
 only if unset
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
