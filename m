Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675B2C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:05:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2515960F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2515960F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00BE7404DB;
	Wed,  4 Aug 2021 14:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0A6E5sFweBjv; Wed,  4 Aug 2021 14:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D44940554;
	Wed,  4 Aug 2021 14:05:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2E361BF5E9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0179404DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c18phZQjLo_9 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:05:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBB76404A2
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:05:00 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h13so2410639wrp.1
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=MX1A3M6g8m7oFNokuHMAWf75keYyeCxy2brEwm/1E7k=;
 b=ttI0qWKoHEakdPdhwVLpeA2MjjJuuflWG/sXJEJeOGXF7sXI5iOTePb3P1n20RTjx6
 bNPyMINvwG2KB17aSih7/ELTjKUVRzVxqG3EDGgGZpOf1wqCLkvKPS4MNcIc1vV3fmDR
 4dWsFYD4YNfpY6kWifHJMgLsWUNnntG+h54wSb74Bu7zoPw3dys09KO+Og80ueIMb/wf
 eOfOZJcLNrGp93C8WBBnRBxU+nM/guN8NgreURZTLNGdaN7FUcUu+bBlbErzpnz+7jJi
 jjYWERqay0E5A3t1bbVr2v2vMzaV1jen4f74JoJz5K/Gu/9Wol5G0QXziBS0o1y3+W1D
 0RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=MX1A3M6g8m7oFNokuHMAWf75keYyeCxy2brEwm/1E7k=;
 b=cR4Ly/DDonT36xGTAEJvSvkvGG3Ja+fIjRCzUYzzpAjPOa31m8GmyJvGdW6U0uRan3
 c1Z3LGGnOAK+ktvQN8Kpf58UDjKAPp0wnX84hDbmbdYJCe/+gaPWlI1ipCUjx7pvPMKd
 bU1wi0vNlfMe6ijUYbGLpbh7O8asPjUnTFOnAZvuooqEViOEvRlMkTXo4PfmEMypDIav
 QZL8D0EdVOaWHkRxSCjmwlPZdp/Nb2n8ybkwKMa+IXbeBr7jQFl3cMtakROsGyMXyVJ3
 EEMZ00Cmfdyhf4GqTFL6Xbx4U0cxl6v6qa3cVolAiEHJ1yCO/Uaq0qXu5frURAvQ6Jfn
 1Ekg==
X-Gm-Message-State: AOAM5336lQbSyGLj4R+ZNz23S+GyA2uPUoLx5rgPFVUoummzZ0i4Daiv
 cZh5yFQaL7aZO5gsy1Jlalo=
X-Google-Smtp-Source: ABdhPJzH+v140hPRKSK8fsOXfiS2z/Wz8mJRC0YUg6amwDlGGMpTwj/ITzQWlNxCpxvCwO8yMVqNrA==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr28812708wru.402.1628085899108; 
 Wed, 04 Aug 2021 07:04:59 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id t15sm2546108wrw.48.2021.08.04.07.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:04:58 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBHVx-0003KT-QJ; Wed, 04 Aug 2021 16:04:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210718220200.3296878-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 16:04:57 +0200
In-Reply-To: <20210718220200.3296878-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 19 Jul 2021 00:02:00 +0200")
Message-ID: <87y29hqp9y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lrzsz: add LRZSZ_CPE_ID_VENDOR
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

 > cpe:2.3:a:lrzsz_project:lrzsz is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alrzsz_project%3Alrzsz

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
