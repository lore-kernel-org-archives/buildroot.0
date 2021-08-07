Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBE0C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:28:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8246C6101C
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8246C6101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34BDA403DE;
	Sat,  7 Aug 2021 17:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5kJDiYbEqb7; Sat,  7 Aug 2021 17:28:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F2FA403E0;
	Sat,  7 Aug 2021 17:28:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8E351BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF6F040019
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7RQYjiW8WWbN for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:28:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B12340112
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:28:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z11so17954593edb.11
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 10:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=0AznctS1X8w6C//AlGZZ/VO0qeB9z6OSVbAme+BsMbw=;
 b=a2ntc2BGuWcy+/mZAFphvFdNPiVS1yBREV+q6nfwQb6+HNrBSKkFYs8aircSTjR7Nh
 WjI8u0M9fZ54Gi+ia0v0JEYyJhkB+68o2TacSopMJd+qmOEW2loRyhoE4b8vxwVK2N+k
 no7b8bpMrEoIZVQp7u04bi25Q+xx3Nd5QJ/ceWBUsoZPkaP3qdThGSrj4wp/8N2Ck+RH
 v2Z0hOGyP6oB8jt2JsjbekjqIeD5ZmGRllfmxhVaBX2WytUx5Wec2yQDLfsLd3FqWqby
 tMKCfZgAihqpBYPcmLGlt56Nzg0Np+uDBPDq7vxDsL+DFd0mudKc0aQnYVMk4HJmZHNE
 ne+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=0AznctS1X8w6C//AlGZZ/VO0qeB9z6OSVbAme+BsMbw=;
 b=kgzSvtuT742D1zM+tZGLZ4zuJMuS8RC1V6pbJzocc6kvI1fVO4ADy26dEAZeqU3PHy
 mhMteVw5lQfPoS5uVf6gYJDDZE282bft8Kuvew11OyC0+oOPCvPbAgT2H9Cca6elZcy0
 TmfAvSA4VO2k0CkN7qNegF01HjkuX31OoRKqjTY8x7d8nCMFxN7HiVGVFxPkZLklHtg6
 a+uOSz1ICpnuCSLGJ8yqOyvVPAdghD72lFfmZcgxLYMWww/WSVK+JHwseBxEJUzfCvNx
 xXyyxFA/hUmy6O2lWHOqLMIMVLMKZXGfoVw0/PvKEozYv+0PHg+BTd6IWVY+HGv5QKhQ
 8QbA==
X-Gm-Message-State: AOAM530jE8CSPwNmMQQoaxnN/rzebAoDke1B5Zc5BCmQK9wXHPXBQfb3
 +o0aLAdkwg6F1Oa+IxHGGPg=
X-Google-Smtp-Source: ABdhPJzXSudoSXwj/OQU8uDiioVNcGBo3FgoKn1SSqxdK2H4CEM8eD5oVz3TlLjvebF19Brh/GO2Qg==
X-Received: by 2002:a50:fb05:: with SMTP id d5mr19484041edq.5.1628357314837;
 Sat, 07 Aug 2021 10:28:34 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id aq24sm679797ejc.78.2021.08.07.10.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 10:28:34 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCQ7d-0003yH-4D; Sat, 07 Aug 2021 19:28:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210801064324.15610-1-bernd.kuhls@t-online.de>
Date: Sat, 07 Aug 2021 19:28:33 +0200
In-Reply-To: <20210801064324.15610-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 1 Aug 2021 08:43:24 +0200")
Message-ID: <87fsvlf9ku.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xapp_fonttosfnt: bump
 version to 1.2.2
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://lists.x.org/archives/xorg-announce/2021-June/003093.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
