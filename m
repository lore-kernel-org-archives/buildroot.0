Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31618C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:20:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A556160F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A556160F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60012404A7;
	Tue,  3 Aug 2021 14:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUp2ZZghxHqE; Tue,  3 Aug 2021 14:20:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C309640412;
	Tue,  3 Aug 2021 14:20:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 934391BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82DF340412
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6pAkDfomrqRm for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:20:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A69F2403F7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:20:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so2243525wmq.2
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=jnqFGKRdtfSfAhxTe+MY9cDEvO3UdRJIrsiGe7g9k0M=;
 b=AL9vIG7wfaxbZ6gwhuPb/q124L8vCVgFR9bJRli9x+e7kcRKG09DRYoaQP3pwPu4Rg
 CldqgGybW8adK+QT0XrZIjX7O5GO3VhFcmPoRdGTMiG/UZJsb1PS/ByN7vVEmmPSYVFI
 eSRz+JGIYjfri4jrZInWL6eZO3g4IJSvBoOgtYsE66diWjSn2qz433RguhV1VCACmITk
 UIqeZsJeY5AAbVTtu3kX35GkNVzzOnbwGrp1RogsFskkzbyANQflry8aRGztfeMNlEIK
 uOBwZMIzQf0TM32JK/3in5CBlpGGle+Zs9GsLdxksiAXhT4zZhiRaoNXBAJ9q+HE9u4c
 b9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=jnqFGKRdtfSfAhxTe+MY9cDEvO3UdRJIrsiGe7g9k0M=;
 b=piXr76cQ1D2X6fnwal62DJapoMVYxkRSiBAiEEUCTfJMjhrhWUWz1dDrKDelFymKT/
 aAgX0nRb/p/trgfJXM/TxPypGr72v0JSZfKNx1t2onYA6fR/adaXsuirx2OjBrpIsHdb
 1GfFAWNxTNMT/0l9orFENJZcvDTTvrE4ov3u4ep6rYhDj+tb14EBqhswH+hSuZ3UyU02
 1k5H8QNQ8dDMlXeJSkd/3TqSpuu/CykkPnj3tegk3C0UJTCH040SFhIEE6AUx2lCuMfl
 u7Vubk/hqHBe94q7elYWf9uuVOLangwiJqnB+pFeskL/AA6utg7l5xiCDSwlNYb4MScc
 GQvQ==
X-Gm-Message-State: AOAM5307lBdVP8yf2Z1y71CwV+GRRD9wuwiCfH+nR7WqEKlGtmDUuzf9
 INrdkVDiLRYDA4sDbj2fF9TRa/cEOG8SdA==
X-Google-Smtp-Source: ABdhPJyYWlUOaCU4XrLaAbSoPZWjQ+2E1LKrpsKtFdm/YCpqpI4am5/UgKSnccetOtQJM6svAO0ewQ==
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr4525592wmq.60.1628000427695; 
 Tue, 03 Aug 2021 07:20:27 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id j2sm15006348wrd.14.2021.08.03.07.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:20:26 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAvHN-0001aF-0M; Tue, 03 Aug 2021 16:20:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210714213115.2959939-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 16:20:24 +0200
In-Reply-To: <20210714213115.2959939-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 14 Jul 2021 23:31:14 +0200")
Message-ID: <87k0l2y5hz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/gcr: fix introspection option
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > introspection option was wrongly named --with-introspection instead of
 > --enable-introspection since commit
 > d4e7c720aa78dbe659db82f4eb38ff58ebae4c57:

 > configure: WARNING: unrecognized options: --disable-doc,
 > --disable-docs, --disable-documentation, --with-xmlto, --with-fop,
 > --enable-ipv6, --with-introspection

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
