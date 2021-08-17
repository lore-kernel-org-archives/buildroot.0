Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10287C4320A
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 10:35:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC34260F14
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 10:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC34260F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73E24400E9;
	Tue, 17 Aug 2021 10:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTuT-9WjPtIZ; Tue, 17 Aug 2021 10:35:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9F3E400FC;
	Tue, 17 Aug 2021 10:35:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21FFC1BF271
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 10:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E38640015
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 10:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EjcUNr3HWG1D for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 10:35:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD78F4035B
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 10:35:23 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id i22so12142093edq.11
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 03:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:in-reply-to:message-id:user-agent
 :mime-version; bh=qLWbsXhRUzWVku24oVuuqaX3RogXUI/8IXXgatAwXm0=;
 b=tgbkOe2GoqhrigneX3HPSNumG1wSgalLG514z3L4BhOXGbv9Xp6NK7jKTb4xkKk7yi
 wrheFQFRLMBajHTzMMjzfPcWHr38+1zHMZYLJqEU1uCotsGc4YJpP7mi36H8QR+fkGtM
 SGdIIBm35GdKwvAZUymelGecqXfwfaB/rN8Pl2sWe416UR3v9g/+HGGzvs6FTD5udbvv
 8f65nwiMFcpBazOXOkhWnWPP2WwKyIm2D5x4EgAEburnMrGk4gjORXl3H2ygo5TA+7FW
 UQjSjT/PbjiRp9TMuDtl7cMpjypnwCKxD1vKtQzmRKWKoKSi6ttjvEoUu0BIaFlvAl6I
 0JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:in-reply-to
 :message-id:user-agent:mime-version;
 bh=qLWbsXhRUzWVku24oVuuqaX3RogXUI/8IXXgatAwXm0=;
 b=SH+qL1VcWZvE/BkJjycyctfhS48ZkQkxsEUgY/2usnsk/e3jCVJygG0TikQE6qaDBF
 b+GKy55mGPBcm3CztUJ7+1RrUKfwz0Nge/mIsu/lGCOJN2VkgS4nZ8O45zoKIp7JBhf+
 QlBHYrXeFyZphbc7cEWtT9FaLCi0z/wcr8uYraUkDxSJez8Wp404BEhMEiO5TOrIf1WP
 hnstVQkHBArFr7YpMVf7QR6sCt67aXegCLMLwplq5diamGdNUDsj/CaWa7yWgITDvNzz
 ASKJp7ymeuceMztBKpo28T9oaz8o5iJFDx5A0m1q371AROT6Dlgo400/7SOLM08hD3du
 SxwA==
X-Gm-Message-State: AOAM533+2E2/CQd0WPXCkN+b9w1GLGK1eo2wDBpzhUglBwmmdPjkFB+E
 cOZ/YQIC2lajCBT1Samgt2ovtTUrNcY=
X-Google-Smtp-Source: ABdhPJxI54MQ+6U06WMnziv6k+n5+2ExALVQ9R2IQ+Wf2HEUAeRqEmN+Gzk5pa87EWFUUE/OkQWhyA==
X-Received: by 2002:aa7:de92:: with SMTP id j18mr3349560edv.141.1629196522039; 
 Tue, 17 Aug 2021 03:35:22 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 d3sm855328edv.48.2021.08.17.03.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 03:35:21 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mFwRE-0007ds-HL; Tue, 17 Aug 2021 12:35:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Date: Tue, 17 Aug 2021 12:35:20 +0200
In-Reply-To: Thomas Petazzoni's message of "Mon\, 16 Aug 2021 06\:56\:46 -0000"
Message-ID: <871r6s4avr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-08-15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > Packages having CVEs
 > ====================

 > This is the list of packages for which a known CVE is affecting them,
 > which means a security vulnerability exists for those packages.

 > CVEs for the 'master' branch
 > ----------------------------

 >              name              |       CVE        |                             link                            
 > -------------------------------+------------------+--------------------------------------------------------------
 >                      mosquitto | CVE-2021-34432   | https://security-tracker.debian.org/tracker/CVE-2021-34432  


 > CVEs for the '2021.02.x' branch
 > -------------------------------

 >              name              |       CVE        |                             link                            
 > -------------------------------+------------------+--------------------------------------------------------------
 >                      mosquitto | CVE-2021-34432   | https://security-tracker.debian.org/tracker/CVE-2021-34432  


 > CVEs for the '2021.05.x' branch
 > -------------------------------

 >              name              |       CVE        |                             link                            
 > -------------------------------+------------------+--------------------------------------------------------------
 >                      mosquitto | CVE-2021-34432   | https://security-tracker.debian.org/tracker/CVE-2021-34432  


 > CVEs for the 'next' branch
 > --------------------------

 >              name              |       CVE        |                             link                            
 > -------------------------------+------------------+--------------------------------------------------------------
 >                      mosquitto | CVE-2021-34432   | https://security-tracker.debian.org/tracker/CVE-2021-34432  

Hmm, looks like we have a bug in the version comparison logic. We have
2.0.11 and the CPE data states <= 2.0.7:

https://nvd.nist.gov/vuln/detail/CVE-2021-34432

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
