Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A15C433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 18:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3052460B22;
	Sun,  6 Nov 2022 18:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3052460B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QfFqMJ8hvMgj; Sun,  6 Nov 2022 18:04:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5972660ADD;
	Sun,  6 Nov 2022 18:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5972660ADD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45AA11BF27E
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 18:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D0F0817AA
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 18:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D0F0817AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLm1aPichqS1 for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 18:03:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59DC9817A9
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59DC9817A9
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 18:03:59 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id kt23so24836223ejc.7
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 10:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mgy2Wi5ewrPmRLk/BzIUasrFJggRlalcgihogOaSCYg=;
 b=t6TSFicA6HjLBkANPIaQRL34vV8/rStQOWnOU61vd8h0RexSFWrzmIDOmklmlalobi
 AR9EgCFEJHUtpiVgoyBhB6lHwUGdwU2LX89hW6uxH2y7+10Dcsy15SHXQXiYqCHDFxXs
 NEi0xa3dcPbLMmRjvMGiT/Vyjh7cJ6/28yy5lVZA5rCXBrxuCmghMHzH3qrgxmCLQHRj
 Samc58CeFMLgSlf0OeGhAwn1ZXHIPCk3w9LueWTdV8JeNfYoD+yq46Cf77qPHmJBqeha
 w0pmqs5z7kAokArvuW9IzGZm26kTfNVcZTr5jM6zgzobSqVpKxFjC/6SK0UfXsMxcyJn
 smOQ==
X-Gm-Message-State: ACrzQf0wA00o088ZjvpI9yPi2K+ZSU5ii2KlJBYrQc6bPLAXLCh2t1/r
 hRt0g33NmRzczD8EKtcEBesA22vl9iMlrJm/
X-Google-Smtp-Source: AMsMyM4JGc+aDSGsPCMKzuCTqHJJAmQ5+DLyUGVYAHiI8qy9XPqNm/CihWZMEg97F0w5He8x9dwCFA==
X-Received: by 2002:a17:907:805:b0:782:1a0d:337f with SMTP id
 wv5-20020a170907080500b007821a0d337fmr44928969ejb.475.1667757837296; 
 Sun, 06 Nov 2022 10:03:57 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 g18-20020a17090604d200b0073dc5bb7c32sm2371850eja.64.2022.11.06.10.03.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 10:03:56 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id n12so24802794eja.11
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 10:03:56 -0800 (PST)
X-Received: by 2002:a17:907:2e0b:b0:7a5:fc2e:dc7 with SMTP id
 ig11-20020a1709072e0b00b007a5fc2e0dc7mr42043685ejc.257.1667757836044; Sun, 06
 Nov 2022 10:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20221106105309.350587-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20221106105309.350587-1-fontaine.fabrice@gmail.com>
Date: Sun, 6 Nov 2022 10:03:44 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pHmjLfKPN0g8rubJi6gd66E4L9y=WMeco9r9b9voRmFg@mail.gmail.com>
Message-ID: <CA+h8R2pHmjLfKPN0g8rubJi6gd66E4L9y=WMeco9r9b9voRmFg@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mgy2Wi5ewrPmRLk/BzIUasrFJggRlalcgihogOaSCYg=;
 b=JmlBcqMk6J49uC7sB8Vmpcxcu58lQ9Mgdi63zaRTiVwUFJ0Mp+VjnNVCcsy+PSWDP2
 Qljl6ckgX2894iGfCnW2NI9KD2Yjg1A9283F1vbH/wuZVm4Hh2Sd5xOj8dRlC/ghUUof
 qMXNS1gCy01Iw/fUTUR6pWaJBeHV2eeltJnt7HfKi6Ai3xUE+5YPJdTbodxQA7OhIigq
 HafqCT46CG+vvMWPfUlhBNnIUgXK2EiB46B4JlsNCmE1Ju4dibnx1Q32xQDRnlS+zdNe
 oVXIm/Zhd5Srt7CYYOIcIpz3KX0061S7Y9Xa+QlFvWfWtGdf6TEiEvyF/G539cAZNtRV
 BktA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=JmlBcqMk
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: fix musl and uclibc-ng
 builds
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,


On Sun, Nov 6, 2022 at 2:53 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
> +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> +CRUN_DEPENDENCIES += argp-standalone
> +endif
> +

Lgtm!

Reviewed-by: Christian Stewart <christian@paral.in>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
