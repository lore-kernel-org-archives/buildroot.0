Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF326C6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:38:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 962D960725
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 962D960725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CB2140136;
	Wed, 21 Jul 2021 20:38:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7a8T1VN4E9Fw; Wed, 21 Jul 2021 20:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A175A4012B;
	Wed, 21 Jul 2021 20:38:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9652C1BF844
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85F844012B
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjWK0flnoUwW for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:37:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B106400E1
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:37:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o3-20020a05600c5103b029024c0f9e1a5fso12349wms.4
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 13:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=3sCueUkZq85bN9Q+FIWfdBYo/zR4rdpRFxwFSozneMs=;
 b=OEHJrZGUlEdTMPaZ1kjZexyrOvrXBRCaxTqycSmup/hGHG5GOwBhVtV98Zq4+6+Fnh
 GZWnvGfn3GhiX3RzgKDSiAiCcXhTf5/0KM42bWGPK/PP/zlsEjy+TPFfPBs6taGV0Yck
 M9Gf6sN3itwOjOL2Pk+ZGmJxsIxgu8QEcoLfs9DlXrtUpHWya3E5PzajCpazE6dRynIA
 sP3mdnKnGhhbog++6xCahPXsJUQn0H/eEzQGEnWhfmnx7IiKo8UgvebevPmQ1QIwpDzk
 I9mVPyjL/Pxuyv02imtUb+qOt7LHzzDTa++fvMMu8SX2PB6NslGoRFWxZb6/XSPGIJoP
 PfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=3sCueUkZq85bN9Q+FIWfdBYo/zR4rdpRFxwFSozneMs=;
 b=JDWnTjKeY+9EsNY7OgOIE9odwQWGPmKSmZZahT9rvUZeGSZoEk0vewMR8i/xPI5GK0
 0GwjQsQFggAe4E2TilvOhr9x7wgzbugrTPyhlpi+wuhNdUiUTJpunZPRd2iZovayMwfj
 RdZIwkTFRcZ91EEURf6n7l0UU5HBJaumZvPtAzVAt1Zi4TlG/QvCox/Aj6aK3HulJs0B
 M6p4rGzG9Tib/kLofWIFsn8XHQXlrpLXrwvJekDY0xIMueZXTXmh3hLB/X9cuTlFYrWP
 kbQqOcCYYGMZ34vsiEpw6cGf+EN21z7YCtVq4q47rJd5CBxVQDCImucpYbsd6DZDL7yc
 8DQg==
X-Gm-Message-State: AOAM530B3CgrXMQVIaYrefiW0G5jtA149lfDUTxNsOziPyEhM0+QIAPu
 uE64p+YA+v735k/cRaLFeBhwLxGah0PjxQ==
X-Google-Smtp-Source: ABdhPJxdRYGQ60nht5/liUuZUuqrBXCEq/QP/AP6HoJmVQeoFMaCODR4S7mFKjmgic+iMFjmokwEkA==
X-Received: by 2002:a1c:4c18:: with SMTP id z24mr5938809wmf.168.1626899876814; 
 Wed, 21 Jul 2021 13:37:56 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id l3sm1750412wmq.2.2021.07.21.13.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:37:56 -0700 (PDT)
Date: Wed, 21 Jul 2021 22:37:53 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <YPiFoblWuub2BpfY@pevik>
References: <20210718191403.2705796-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210718191403.2705796-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: drop rpcgen patches
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Fabrice,

> rpcgen patches raise a build failure with host-libtirpc since commit
> 0a5a9741e03e666204d577f82d29d93ba610381b because rpcgen is not provided
> by modern glibc:

> rpcgen -h -o tirpc/rpcsvc/crypt.h tirpc/rpcsvc/crypt.x
> make[1]: rpcgen: No such file or directory

> Those patches were added to build rpcbind back in 2012 with commit
> 18828103cdc8b929b29f5cbc27cd771ab1a26326 however they don't seem to be
> needed anymore as rpcbind builds fine without them
+1.

> So drop those patches and autoreconf as well as the host-nfs-utils
> dependency from the target variant.

> Fixes:
>  - http://autobuild.buildroot.org/results/6607cb9bec426b8c78e649484d5a149a1bf12a7f

Thanks!

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>


Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
