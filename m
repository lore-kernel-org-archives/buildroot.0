Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC9DC4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:44:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0F260ED6
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B0F260ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D707E828A5;
	Tue,  3 Aug 2021 20:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X5XVWKTLyWCn; Tue,  3 Aug 2021 20:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC0782503;
	Tue,  3 Aug 2021 20:44:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F55E1BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F5CD40220
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qfgy5MDdMGG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:44:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE43240209
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:44:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso2543774wmq.3
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 13:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=UhV/kset7INUZOy2tuihsg1Ri9W9FjrPFwsfMdEsT7I=;
 b=X/9gXMYnYlmp+coeyu/1Vk6JR5tLbvYb10Ed9tl4mUpVUzismLUDBoW1rnGNu9ZnHP
 xORRs0r/5G7uRKPmt9edNC6ZdXZV/gq+WG9cHBYDia/3LdbZeIcFOvUS3FiEVK3fz17Q
 OJa7KdIV7kbpEBXnuG545vct4VHgVA+/HUZDPEU67iaNDotuZrbpQfVcBeWP73L6w2dQ
 d77Y6kU3eKHBR7AmS4K/TVcPqbM9VQUoQp41jZUL7lzNEPXC20Pq+6tctyNwuLyH0G/C
 m7fGL2uofH+4kknvn2GqIDxoUu9dO1jG+nsKR9AvVKIdBs2GonC6xIecHsEwJvL76SZ9
 ICyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=UhV/kset7INUZOy2tuihsg1Ri9W9FjrPFwsfMdEsT7I=;
 b=Cy/z8xG5skfoqRS2JpqlA6dJq5xY1pukhDb6ebvvq2kw32hOLa7e+D0ct5hFvIRy4/
 BL208j1G/gItFLFZOKsXLJIMissYO3zIpmCzQlKOY6RZFpNheY25ye5T/+4wgI+7ZxoU
 PB5HXw67o0/puIAKpX1+1X8HGxDy0+1S+OA6I3vJUFX1emrdEWNgkTkIHTy0CX35V5ey
 GWL4DG4U+ZTTmgL24rLjIU7eysLsG2rJ/QEuOML/b7N4A/LN9IqvA7nZ6t2K6xmYstzA
 ffq9rqAy54bG2pItTh5S0OK7oSxKWQI2wIDJyZHLT8nXJlUV3l/Q6nISQ9pDxWfumL49
 kcwg==
X-Gm-Message-State: AOAM531mdFLT21Eo3er7mKSe8BTT+xZWcXCdiyFeijcokPjuptwz0YEe
 p6bYyI76ye4wmQ/afOM7Wb4=
X-Google-Smtp-Source: ABdhPJzoWPDDwFW3M1qxjUN6iqzbxkz09pLhfLmtW2M0cO3GBdnWOQevXYQIFyVAgO6s4iT80RsvVg==
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr23980169wmi.149.1628023474109; 
 Tue, 03 Aug 2021 13:44:34 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id x18sm64902wmc.17.2021.08.03.13.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:44:33 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mB1H6-0006yw-T5; Tue, 03 Aug 2021 22:44:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210717214854.1150900-1-fontaine.fabrice@gmail.com>
 <20210717214854.1150900-2-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 22:44:32 +0200
In-Reply-To: <20210717214854.1150900-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Jul 2021 23:48:54 +0200")
Message-ID: <875ywmuukv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libuci: ignore CVE-2019-15513
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

 > Commit 19e29ffc15dbd958e8e6a648ee0982c68353516f is older than LIBUCI_VERSION
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
