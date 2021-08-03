Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FA5C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:06:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C0326103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C0326103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EC03401E2;
	Tue,  3 Aug 2021 15:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3fTBsaDQ0Oi; Tue,  3 Aug 2021 15:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 488CF40191;
	Tue,  3 Aug 2021 15:06:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70D751BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F96E6077C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d-Byli60MV3u for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:06:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53F48606AF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:06:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z4so25697591wrv.11
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Br/va+FNuVtUGHL90wwylEOS2knasOFtiVHqjHMjT6M=;
 b=CMMlqNVb8jqJAT9mkkbjdYjVrNm/ou6/dPcwNGvetLkDNNKfniGjUC8OrRCWVXBefx
 dyerdtmnBicqtq+vxBnG8dqGhTaI+BewJbn/LyBFi4UeEdutVNd1rysGKUGl8dLOHR55
 dksTVwaLSN4U/q++zZZfsdsT4ZOAbSnxi7AgWRUhlKUh53F3b9Oqbp15Dhh158eioIL6
 cR01cv0Gv9WT+d1rQa9WWUMGpDGsHmCkuOrTacWGI02Abc3XAlGw+Kn7o8pNNG5Dg4kG
 k3NhBo3hsQspam3HA0813PpkvJ8DYFgNr9fgxzZr9sS8I2i3tMIpc1V8RWJl4qrZj24D
 T4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Br/va+FNuVtUGHL90wwylEOS2knasOFtiVHqjHMjT6M=;
 b=O6RxLRoq1T1cVpTikD3DLRUB9HvLjxvxDo8fKmkgNYrG+LPzdPEpYKS8EjwuFLuzbW
 rvh8rYV6vg3V42XPJfsW//LJeEQpPBY/vvpBhm0A0xzX6hL3HNhy+hKwxipGFuG9HawA
 GlGhjL2RiFy9QXYWbBflTcmh0LfBh8aaBxyLEtKm3L6tErPD+Plz6ZoFvOHjriE64Oim
 yXxBjt8AL5FHIBwd26uPeqQO4pWpQqZqeoT7BsRGe+laiShlGT9Lto5NonAsjawqvZUp
 ZaG9t+WluWWqf1k32zadKI027gzRFlCi+CxV8eyWU/sfEjtyGDHgRpv/I3yAi12oQTxD
 BwHQ==
X-Gm-Message-State: AOAM531KRM8QaJ/TjROIr0oKUBWxtUrOnuC1TZ5ub5DJWTRaCf1TAs0W
 q+PHYTUf8EDndU1iwKoy9KitcXhIs6m2iA==
X-Google-Smtp-Source: ABdhPJzGINZNDfuwHVOW4dZ3j/kq4TM070COkg7+t+wf68TbulYKUrQv/XsCfpAepsN1vPQVtCKJAg==
X-Received: by 2002:adf:b60f:: with SMTP id f15mr16923560wre.52.1628003177588; 
 Tue, 03 Aug 2021 08:06:17 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id b15sm15338697wrx.73.2021.08.03.08.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:06:16 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAvzj-0002s1-6I; Tue, 03 Aug 2021 17:06:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210701222638.810809-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 17:06:15 +0200
In-Reply-To: <20210701222638.810809-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 2 Jul 2021 00:26:38 +0200")
Message-ID: <87h7g6wot4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/keepalived: fix build with
 kernel >= 5.13
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
Cc: Ilias Apalodimas <apalos@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9a93d7d76b0a4319c29fbf7b5986bcc78539ae8b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
