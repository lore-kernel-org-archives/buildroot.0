Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1AFC6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:39:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0296161221
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0296161221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC82E60654;
	Wed, 21 Jul 2021 20:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vgd9HDbAj6go; Wed, 21 Jul 2021 20:39:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 431D2605DA;
	Wed, 21 Jul 2021 20:39:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DADD1BF5F5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D9A8605DA
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKuTeJ2ggfhZ for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:39:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7484600B9
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:39:01 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k14-20020a05600c1c8eb02901f13dd1672aso1469336wms.0
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 13:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=9yFOuFyApqAWHz6zp8T/OPVSHTV0Jpx5DgcuEVAavss=;
 b=AkJCfyjQCOEj1IKNGwVvEWclwiTMF9RJpN13vJxU2Wku6bt7PIgpHhsFxUFUZlPXO9
 +FWkeFqOjYDvPAZ52A9tx+eje/8zXRqhGM8PTBRb9zasMBYoLu5hR8C0n2BUUf0e7CtD
 ST+19N9J/bsQRmdTd572zcuwPYOYeFfqcek2gONAw1hZnI2KxBK5Wut4ybrUI8/1kMGl
 +AwYbSkjmH52oMlWLjOeXXYiYqXUDpNzlgWGt7Z7ZzhreaWJ18o5X2Lf/alPFM1iaIIx
 RgVaUu3OiSWjyOxFs0Qc2s555YmL9xzQ4JXLM6v3DgW+X9vPe6DtNdgQjYWXxpEHzvIR
 Nrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=9yFOuFyApqAWHz6zp8T/OPVSHTV0Jpx5DgcuEVAavss=;
 b=fwJP6eiipV5cXJs0LLNHpLPBKHCF8lmcRAt1cQIMiRBe18PfG8/KsslVo2OqGkLO3G
 KhCFvB3LuHIaVosO2rfOW9zJMkqRL3f1ZTCnGQ7jnHwrao0k01Z9SgI4+o3lydSJVCdY
 rTZvphY6wBdV5r3o/DietKIydQXFd+MaIHewC9gEremo6bLyTDjWOW6eYh2+MKki+JXG
 39ydEmXPnYy4RziH+erW1wYYGwgg169FxS5heX32urD1VHndrr8j4jTuVcT99zrvb4Gh
 d1JDiYffPkhw2SEKRhVzoU/s5FBkU6V+EXoI2ZhGska1qQlzAlxI1HMFZQniw1TyIx9p
 YtWA==
X-Gm-Message-State: AOAM531kjkxdOODOC/mZn2HDI+ia1CUdaOnlFZ+mbQ4uswTm4x+iQ6b3
 P7fDsO+WjBM4+/s+oG9lcLcKt9DQJV9gYA==
X-Google-Smtp-Source: ABdhPJzyZkkbD5bxOwwDg6sdZjuPm1PonDZLnbwSoQ6K/fXjaI/P1JXfOGu8EC929fIoro02dgNxnA==
X-Received: by 2002:a1c:ed10:: with SMTP id l16mr5787188wmh.8.1626899939810;
 Wed, 21 Jul 2021 13:38:59 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id o3sm28038162wrm.5.2021.07.21.13.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:38:59 -0700 (PDT)
Date: Wed, 21 Jul 2021 22:38:56 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <YPiF4CZg+woHe8Db@pevik>
References: <20210718204406.899038-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210718204406.899038-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v4 1/2] package/libtirpc: Add optional
 GSSAPI support
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi James,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
