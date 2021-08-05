Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D99CC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:12:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7674A60EC0
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7674A60EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45462608A1;
	Thu,  5 Aug 2021 20:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIcDZQZTfku5; Thu,  5 Aug 2021 20:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4FD96058A;
	Thu,  5 Aug 2021 20:12:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95A341BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92D1883A6E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7oczYiudiy0w for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:12:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB99F839BF
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:12:16 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id e19so11518874ejs.9
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=InSlg3K/adwWBpMVH6Cl5K1daLZ5+mLfG+rP62KVzyI=;
 b=usUGZP4PdM5a/LXsi/5y9fcRwyqXETsyn3ZQdiSZ9b+iRLpru0U4F9McueEdYmcEoT
 PQN8VnoJ0CTeCwBGrVgMnBxhOA88YkWAs+AV0z+i/hJDhp89A6Ln3XrIl6Akq7tJOsIL
 07fOyzEmAT2awc53260pEHdLoLsvMJ1HSl48/VR/qcS9qxD8t8SdgeuBwgXkP9dzOjAP
 l9JKZ/Xbd2kvcB67A0QILBLGoz5xsZ/CqA+ZCuyEc29w5r14LPD5grwKIbTMGT7wWg3T
 QtOGbPhuxMMECug7ub6w2BD9QFG5JuyuxUxiIVpg46BTehqG1eiSYeDlxSVuKgoO2xpd
 3XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=InSlg3K/adwWBpMVH6Cl5K1daLZ5+mLfG+rP62KVzyI=;
 b=e+zrCwiqo2BN+wDOo3liEon54sV5Uh4ogdfNRe2B0dLDnE1/XJI3k7YUMggnLeDxNz
 tcVTYoxKDXir0XBDKU4CB9MMsQYXOie5fK4kl0qtlVelhKC+GXGwCR2Xumx5ik8/kour
 IoKvjEX4hnhHO9/Yc5XYW7BPFfAuUC6jAlR+Duo1aAp71S4AblCskuZPNBjzTp1hnnm9
 NVcbkWbuxCGH/om7fzXUuxP1B79/CzZaZhdGMIu4ZmvW7m2fZTYdgWKraU/NoSXlakWX
 iJAUM8R6AV7stAn9dxmFljRPmvANTEO3UoE0IoVEcSW2/nDOOmBCI399CbFcogNkUhRA
 tUrA==
X-Gm-Message-State: AOAM532/bgv1j5vaFwtPgMCOrMQAWABGMv6D2BbBBOqTEozHgnUlL+kB
 NLHOqc6i3c8VlbZIaQn4PiBpmNYr5rk=
X-Google-Smtp-Source: ABdhPJzeyxf95hboL29QkGXRD1QhZ8U90bw5IrwsdwRzZp+ruKR/stNMiEQf+g2V/2bghVIBF6P5FA==
X-Received: by 2002:a17:906:9450:: with SMTP id
 z16mr6563396ejx.52.1628194334716; 
 Thu, 05 Aug 2021 13:12:14 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id p16sm2765207eds.73.2021.08.05.13.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 13:12:14 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBjiv-0007Gs-G4; Thu, 05 Aug 2021 22:12:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210726084303.1708442-1-fontaine.fabrice@gmail.com>
Date: Thu, 05 Aug 2021 22:12:13 +0200
In-Reply-To: <20210726084303.1708442-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 26 Jul 2021 10:43:02 +0200")
Message-ID: <8735rnk5wi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/iodine: add IODINE_CPE_ID_VENDOR
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:kryo:iodine is a valid CPE identifier for this package:
 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akryo%3Aiodine

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
