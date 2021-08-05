Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB9DC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 18:54:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98FF260F01
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 18:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98FF260F01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6039C40607;
	Thu,  5 Aug 2021 18:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHg3zRlSDimW; Thu,  5 Aug 2021 18:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C81DC405FD;
	Thu,  5 Aug 2021 18:54:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23E221BF2FE
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 18:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12F63405FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 18:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvCiaRaVg7XK for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 18:54:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E9B5405A9
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 18:54:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h14so7829916wrx.10
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=nVbe4p5tAgd1q1EaTp2WyVH2l9Yws1+2OLJnD//nSLc=;
 b=X3JLIZcTCK3eDyLdlckmhjxvzz8e/mMTk5QEzaoYB3IHQB+NLItYZeOuEXuAr22i9T
 NDV0boBs3nrq7W8I5RScp/Qq/EsmVwH/dKeQN/jRwcTUlH/JNVuItDXJyR6/rFGqhz+w
 wIKxKwMGZyhBBN39zG0oUPxyQlkoMzMAcXh+XrAvREuz5KZazbxFjt4sCbedhhAK8Rb5
 9lHHl0Dye66NhvV3FznJV8hDPQwgpGXIysmpGPRzSQpxU6QaIopzIznhz6nXSS7MR5r1
 sVrIQGZR21ZqCC1wqhzNtf+h8NsNTnxPymnc2fhw7QlhzfKk2ZPkV/rXFchZRxK8+8Pb
 NxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=nVbe4p5tAgd1q1EaTp2WyVH2l9Yws1+2OLJnD//nSLc=;
 b=RKMPaiQZJqdhrc5DojNNO1Fu9cGtOuwbzQf2EhRVvMSHfSRX5yUU44uqDOckdSQ99m
 RscJskQpVc2blW/aA+rWX/WeQgy+hHV9UjppXnZKphuBMW4u/xqtBRiG4yljw1713pq/
 P/IJ7uu3+b3g+TSJnFARy/jK094A6aGrEtMKDVEPZnxYXHNJ/RHTYk1jiSDjCBdImjB3
 9RI8WNSU2JMegvJbo+0Nf3HB53SKDIM3uEuAtEuEEwfDjqBnpnjs3NMzGuQocZg8LyYY
 htw389t0vQHmmKo00qHfOd/yUjrJ7tpMGuwyyISJr5wlywM4GexUjrwdRd1LX+Kmfp0T
 8qyw==
X-Gm-Message-State: AOAM531xpytsd5a/wHTccowNz/vXjhTt9QiVC4DRWmr5FHrNgvTTL2hr
 3b6QADboIT2M3P1TGfjWK3wrTEozX80=
X-Google-Smtp-Source: ABdhPJwWTxy3MTbWZMFhZE35bfDR7QWg4Shfy00u4rT/svJAtnnkUiXDx/Rza0NVumskLELAg8r+7g==
X-Received: by 2002:adf:c3c5:: with SMTP id d5mr6880978wrg.76.1628189653490;
 Thu, 05 Aug 2021 11:54:13 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id w9sm6193539wmc.19.2021.08.05.11.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 11:54:12 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBiVQ-0006Yb-9X; Thu, 05 Aug 2021 20:54:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721214517.806537-1-fontaine.fabrice@gmail.com>
Date: Thu, 05 Aug 2021 20:54:12 +0200
In-Reply-To: <20210721214517.806537-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Jul 2021 23:45:16 +0200")
Message-ID: <87k0kzk9ij.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libnfnetlink: fix build on musl
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Include upstream patch to fix build failure with suricata raised since
 > bump to version 6.0.3 in commit 4c429c3f8c322381991a58fcc37c01da9eb5e8a6

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0b960f40b5d7e4bb0c4ba20638fe66a9e0964ab3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
