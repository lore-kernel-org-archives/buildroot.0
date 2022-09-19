Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95E1ECAAD3
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 03:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B62283F8E;
	Mon, 19 Sep 2022 03:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B62283F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_qVRedrBDcf; Mon, 19 Sep 2022 03:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E81E83F7C;
	Mon, 19 Sep 2022 03:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E81E83F7C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D985F1BF414
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 03:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B488C40AFA
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 03:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B488C40AFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6NKsBnZPJM3 for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 03:36:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF3F4403FB
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF3F4403FB
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 03:36:09 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id a2so20871136lfb.6
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 20:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=3DXy8Ec097wdMIJvhUA35jEvf3T+Xy4JRo2F/XWUOvU=;
 b=5RBhObw9rPMnz7D4nZs4DsTxrjb9+cuis4i5k7muMosweVZrWI1I8iKapSY/eB/Lfw
 24rCWHVVULN0zsqFAeXJ5VLQO0cad0qzq/ib/VTevj9b2GNBf3k+N7d9n0OjkNVKHFTX
 oaBBbSNMJON/j5CIW2aI2DtSxwucwgrltEGuRISVAPa/l1qQDzLcso240LPwiYmI4PB6
 3c53Y6Nfo+/fUntMRGViY1fsdcH5UhueJAbG1pQyUIY6NnFvKjhkmN1R9bmLWic826l9
 rW0jhTrtC1uSIaz/XyCO7Za8L72lCdGOWwzl1ruNWtb+99wL1gMzC1I5PTW6n6GmQcPy
 whqw==
X-Gm-Message-State: ACrzQf2iz0+dlNv1eJfoLypd1UWF+5t+kljiQYazo8ZIepTiqBFgH2+d
 6PZEFgS1/2N1HZl3LzLJWbI6gtSTWyY=
X-Google-Smtp-Source: AMsMyM7c+Ad0iBEx9VcZnWtZG8ULpmeSJtzmwkD+itLJ+0Dd/Bw/nD1HPorbrDYmVTz2aJKn39Sj1A==
X-Received: by 2002:a05:6512:b81:b0:494:78cc:ca9c with SMTP id
 b1-20020a0565120b8100b0049478ccca9cmr5278320lfv.564.1663558567233; 
 Sun, 18 Sep 2022 20:36:07 -0700 (PDT)
Received: from gimli (h-176-10-137-51.NA.cust.bahnhof.se. [176.10.137.51])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a05651234c100b0048ae316caf0sm4986758lfr.18.2022.09.18.20.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 20:36:05 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
In-Reply-To: <20220918195030.GL1419013@scaer>
References: <20220918101317.171735-1-fontaine.fabrice@gmail.com>
 <20220918195030.GL1419013@scaer>
Date: Mon, 19 Sep 2022 05:36:06 +0200
Message-ID: <867d20vxw9.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date;
 bh=3DXy8Ec097wdMIJvhUA35jEvf3T+Xy4JRo2F/XWUOvU=;
 b=GrJlxJgAfKKTUreApFuj/pr42juH8NCO+rU1rcNcGoj7J9YtVu3pFg8MlBDv0aU1j4
 x316bhOqaL//36VxYR9DyIpCSCGHXngkHvXTskU91Bwxg++s+tlzBQECRjKBxq3e9czK
 bp9FTQxRn0lg9be7FbgLTnwzKcOf2/QRRaKK9wZ7DqDuS6ss5ca5FS0OLKhQ+1bRZyfz
 NV3NSOeo5UaJB72lXqO0rjILwrfDoPIzaFwrBvVeWfYFrXXmEUubzmp+hGoBR3aD/PAq
 ppCQVsqRMrGUMCtQPyOuAbB/X+Syuzs8OS3RLlMNoxK4RhkXRtC0ojlbQenr23wD9EoL
 ihAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GrJlxJgA
Subject: Re: [Buildroot] [PATCH 1/1] package/libconfuse: fix CVE-2022-40320
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 18, 2022 at 21:50, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2022-09-18 12:13 +0200, Fabrice Fontaine spake thusly:
>> cfg_tilde_expand in confuse.c in libConfuse 3.3 has a heap-based buffer
>> over-read.
> Applied to master, thanks.
> Joachim, do you want to extend your entry in DEVELOPPERS with
> libconfuse?

Yes, thanks for noticing!  Just realizing I'm involved in a few other
projects as well ... :-)

... also, I'll see about getting a proper libConfuse release out.

Best regards
 /Joachim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
