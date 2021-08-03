Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EF7C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:44:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14E6060F0F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14E6060F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE0D240270;
	Tue,  3 Aug 2021 19:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBI14azFfvJp; Tue,  3 Aug 2021 19:44:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9580C4021A;
	Tue,  3 Aug 2021 19:44:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 896281BF2E4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7812240544
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLiD5TxpupZ6 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 19:44:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A083B404A9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 19:44:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id n11so13125061wmd.2
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 12:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=g5RWXBB7qetARqJ9r+juMuNYTPRPUgQ0cmmOfAWx6o0=;
 b=c/qyk40cZrAhSmGSquLVbwG5dS1ufHLub800qAUltPydINYkllcTcoMrCxwX7xibO7
 f1LMcmnlfgD9F4zUJJfmPoY3oE0a673teCih4YsMva2uyNrprFELP8+cyqEsn5ikbVlH
 04ZXYkkwIuJ15k5/JIAw/p5VNJYJ+odymANbW+FYoI/N5u068n59FW0PVHpFICJZ69Mo
 wQYAiMnqCxho+NAzm89GnzvgkGywJnlf6AKxmMQ6WgZIHVcmlXQ8YECdeYTGZYq/hLuE
 ZF1XuuWa5tJW4UDjARcS/a0SuicuW+A9Msg9Ew4cqOuSRmjpAz5F5Jo5tWNn8kqGdkYI
 FHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=g5RWXBB7qetARqJ9r+juMuNYTPRPUgQ0cmmOfAWx6o0=;
 b=k5VBOXiG4jLAkzMmxIPZK5vwjdqUbVj1e4IKndhdWa9V0Z4XjFLXYYfgTDFsudZZ4q
 XN5+mak5B5qw2sYuYbAi5UiGDQV1d1vi9rTdUq9OU5lYpxu3MbnbkAc3j9u0lVduEKI1
 MVWKV0XJdOTSXo7WXU94zelhmcl9SJYKNQXoHswyAN1yxXgZ6BGVuAys0lSgAkrS6BF0
 XWY2doJOZSEYQmpMKXZHICxotMxU2ZGbdHiPw77laMAiEsmYcrt7lFP/ceU72aOKU+So
 NuR9vB8JjDQGafLy9O/hssyxQaFy7oMO9F/qdZ2JvgKASiNnnAuDmLYIjuhizv1cns0s
 2Pyg==
X-Gm-Message-State: AOAM530Wqev2NwUTWeIcGMkCCzs7AptBwEMni+rZWPO5d8WsnYNJxWXD
 o6zvYE83IEvZPNI6Yb3ESjSTYi0jaEM=
X-Google-Smtp-Source: ABdhPJweZ9ZQHSCm9d8Oqb6njaqs+h0h4O4MJC+IbAYHV65PgZtJI4EQSNrdlcikzre+8zsJvmZ8Dw==
X-Received: by 2002:a1c:7506:: with SMTP id o6mr24193121wmc.155.1628019856833; 
 Tue, 03 Aug 2021 12:44:16 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id v18sm14271038wml.24.2021.08.03.12.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 12:44:16 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mB0Kl-00053W-F6; Tue, 03 Aug 2021 21:44:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210717093914.954546-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 21:44:15 +0200
In-Reply-To: <20210717093914.954546-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Jul 2021 11:39:14 +0200")
Message-ID: <87zgtyuxdc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/pcre2: add PCRE2_CPE_ID_VENDOR
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

 > cpe:2.3:a:pcre:pcre2 is a valid CPE identifier for this package:
 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apcre%3Apcre2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v2 -> v3:
 >  - Fix title again (pcre -> pcre2)
 > Changes v1 -> v2:
 >  - Fix title (PCRE -> PCRE2)

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
