Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6D4C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:26:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16DC36069E
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16DC36069E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D34526065C;
	Sat,  4 Sep 2021 20:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2MCjFrqiwU9; Sat,  4 Sep 2021 20:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E776066E;
	Sat,  4 Sep 2021 20:26:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 220AF1BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1193F6066E
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J0WGDotThA5Y for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:26:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B87B6065C
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:26:25 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id t19so5069942ejr.8
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ZrbyxZX4QaPdekRvKen1e1WQZtEoa1VACVhi7QxFl50=;
 b=pbx6bRy3W5Vmr+tc7i0/CKlFBEawRdmySH3suYKbi9RrdB3oUpZvxYWO1PZl5cVHCr
 g6ZS3JQaVw5xcdy+GSbgXJRGi4yWFhpQZI/GuLUfsYj9MbTSyUX5YNge6esarXhKktSn
 hMYtaFrD7i80Ku8gIiQB4oaeb85cG+LN6lJZM3F4dsxd7qrlfzM4oVVIVk3d0V53kZHb
 cqbQP3uuo2DRM5f+4OPqDCZELprcYONK/KT06+ePCeuLSSUrVeHIzW8OhamP3tpwQ12i
 g7fEhDbCZTjmV6uHSWaJRqrc0oXeROJ0Yt9rDuMPYd2XkK4un2xJwvTEcfAtkLo/63jd
 4y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ZrbyxZX4QaPdekRvKen1e1WQZtEoa1VACVhi7QxFl50=;
 b=nd27L39CNAHNxxO5uuDGfTW+FTXs4S7qhWbjMxVt61lbOEERaHI7E+OQwz1YS9Pvvq
 /JyajX2z/q68OC/nUHmhUL/ixhfS/nQiOvbN7FZHi5V/yjIfGr9DtlJoosrtilLdiR1L
 ynBJiAZHXWiN2U/mYXhigeWs8r0dzMRui7yE1sv2Jx0Jj6w4x1dTKdvswrm0b8T3av8v
 xTapfOr3swAhbSBtpkBxKNuZMgl4ygtDKgGnJwEFeCUS8jDj4A5IkywHuJySpyx9ItPY
 I9Hro6kzbkCBkrm6r9AMkVDJU2nzlSnR8usJTIZvpo11x9Rq3yGAZ+9nBSz5S55N1fuR
 vFgQ==
X-Gm-Message-State: AOAM530bXEtqIhh8DOQgJ8sC3cALzkUFnwiB0+XyWh3MMeZjNA+3tZ/7
 szf+X8wMQBIWf8RK2Qw4zUU=
X-Google-Smtp-Source: ABdhPJzaPsE4pQ+tP0U0BAokrm23kYPZBU5IfDTU1ZNWxiCVbkrRlwWvo3K3YipJQfeINSKU3sM4eQ==
X-Received: by 2002:a17:907:10cc:: with SMTP id
 rv12mr5772800ejb.423.1630787183442; 
 Sat, 04 Sep 2021 13:26:23 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 r6sm1470650ejb.119.2021.09.04.13.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:26:22 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMcF3-0004hq-Il; Sat, 04 Sep 2021 22:26:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210809100037.1102402-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 22:26:21 +0200
In-Reply-To: <20210809100037.1102402-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 9 Aug 2021 12:00:37 +0200")
Message-ID: <87tuj0nl3m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/jszip: fix CVE-2021-23413
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This affects the package jszip before 3.7.0. Crafting a new zip file
 > with filenames set to Object prototype values (e.g __proto__, toString,
 > etc) results in a returned object with a modified prototype instance.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
