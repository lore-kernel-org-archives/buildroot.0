Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F562C43217
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 10:11:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFC79610FE
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 10:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFC79610FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 997BE404AD;
	Tue,  7 Sep 2021 10:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQdyAjV2bLCJ; Tue,  7 Sep 2021 10:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4AD640235;
	Tue,  7 Sep 2021 10:11:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43B361BF3AA
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 10:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32960403C0
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 10:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZfQOl79wm6R for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 10:11:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E100A403A9
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 10:11:45 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a25so18632246ejv.6
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 03:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ur+d2wV19H8RDXDzwp+28hPw2Kkbpby7HJ3VPXzvmps=;
 b=I1SRyDJMNUIBJUqSMrH2af2oPFwffJE2pRDXFAzq3knMuFJxGGFF9X6bzQ1q5KK/RK
 xO0GP70UkR7HchXiONgIyDusLmWLdTGjd4kK3sNlHlFuNyhXHeRLad0iE65VMOfdqxxf
 XOFQaEk11m/zIJ3BvGtEn6VzTvBRZMZcXtMwjc7QkGpVO7+LXQY4/UjWVPW6bGdPnQVd
 nIzSraaYbuQnZ22BgCbeye2T2LDzTyRDNW64ddyg6Qn4kQNWVEY+P8qUy5RxK0aFZQzR
 XN6+3BjB7DcyvHoJjHhJCnED7wfMrnxk3J9QZr0sY1cBuDq0J2i6uld8BN3C29YSvMKM
 hFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ur+d2wV19H8RDXDzwp+28hPw2Kkbpby7HJ3VPXzvmps=;
 b=SLMIu6OwF8Gpp3y41hIWmosMgqDII9m+EalwBN0KMLiK9uzEe0JsrFmbhf050pHl50
 H8KxwLIxXljLZqGpDEg9lPtxQYbPhAdhiNlw7Me/N2ttMcoQvmsMK2/UUpWJquLturLw
 dj6svhjggx5tsALVo4t70OtLj9X21HmuLUnH8LLVYHc8zGnHpx7heXGDxp7/fT6qbuib
 kN+XMJw1a4LHh+tbAj6jcZl0uoKlV15CU5H9VNQJgILR5iXn8jPwQR5iL4V2TiZ2lBnf
 +MoKjLdFsGI7xnBufTlDDG8br3pQRnTS9fwPyxbBnoLTm2MPJfPkrlGHrtgczhAzo9MP
 fFJg==
X-Gm-Message-State: AOAM5319Pj153vJo8mWZsMWTPcSGDMVmA3tz6yhj+rJVkOfbR2lrFEw2
 azyxWedfy3jDkhQcjWuw6VIWqCW7XQ4=
X-Google-Smtp-Source: ABdhPJxkzwObS54qfoew6RYXE8Q5bnwVOytL6NzuYNtibX9uAQ7Arz21sDfXScA2AGpZNeJaWQ8Vow==
X-Received: by 2002:a17:906:8684:: with SMTP id
 g4mr17596077ejx.262.1631009504033; 
 Tue, 07 Sep 2021 03:11:44 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 r5sm6292107edx.6.2021.09.07.03.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:11:43 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNY4s-0001Ib-Ux; Tue, 07 Sep 2021 12:11:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210825193817.5466-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 12:11:42 +0200
In-Reply-To: <20210825193817.5466-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 25 Aug 2021 21:38:17 +0200")
Message-ID: <87k0jsg0f5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cjson: bump to version 1.7.15
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 > - Fix potential core dumped for strrchr
 > - Fix null pointer crash in cJSON_CreateXxArray
 > - Fix several null pointer problems on allocation failure
 > - Fix a possible dereference of null pointer

 > https://github.com/DaveGamble/cJSON/releases/tag/v1.7.15

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
