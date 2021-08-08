Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE729C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:50:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 665A660EB5
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 665A660EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 314236076B;
	Sun,  8 Aug 2021 09:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnhBIc8Cva4e; Sun,  8 Aug 2021 09:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3476D607F6;
	Sun,  8 Aug 2021 09:50:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9511BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D131607F6
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zdB9ObgVcxX for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:50:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCE9D607F3
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:50:29 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y12so19996150edo.6
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 02:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=r/wn3F6oNwichX6EJrFEskOST54YEqmlzd762pA/2xk=;
 b=JH1TVUUmcHn0Wl4+1T4pC5LAi15+obSU+S4TqvzigBlosejcYSx2xHKuYj8AOKrIP0
 x7KZfk/ptgL/zw3np8qOt8nFgzjl3K7cILT2ScnwKHYJibLJESYVGyvL60vQYrVPayft
 DZR6fJ8AGmVeud2Us0/6wReuNBXIQ/12VN0FNpAxRe3pb3kG5chHRr890PWmk8vTp1K/
 rNad3q3zLFHoYZ/mbP642J3MZRCdkg84u1/RJnsYolXffRZq27xmA2kdRpzopHi+lUCg
 E5KPB3aZmHzvAPaonPBJFD2jAblXaPu2PewCbIS6q+weUHlUhpyhT/Ks8ZzzqK4i7ruv
 +RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=r/wn3F6oNwichX6EJrFEskOST54YEqmlzd762pA/2xk=;
 b=YVHjPvEwpbOI00Sbwrj5+xF21TLHa4c1cDrs5BN44irYcmManLw42RecucczsMIyzX
 jJqzxlvlKVMxnYOVcAKqvVX2SrH745qW+CcWXbI3cac5K2bemOI+jLM/s2Nqct2hlzIc
 9YHoaC7Z/nPe4NJJsSrxXEPSISy8LqtUq+uGR5ykbr+DkGAxqSiq8EVSU1A0MC5IACjT
 Erb6uV3Z++4He2UCLdiyYXQpDk6yfMIXv2YNj6kYxFyAS66suRIv91kAYSw/YJKu1AMo
 4U+qpjMksl8YK/cEw50Ufoul01vuhc1O65tHGl1eoCISykCIv7hSx2dPGjzKQYCF9iKR
 cS5g==
X-Gm-Message-State: AOAM530AmJUk4B/q4PCKCrSIXSD4lexxKa+Wxpb9dAieU+GJhnafazYj
 YO/QrfhlATlg3W/PqM7Ss4es3fVnJTnJbA==
X-Google-Smtp-Source: ABdhPJzT4pk72vOjjE7M7o+kA5VIqFNlcJkgbi8mf3gcBGdc2NpMSjXZF1Fwa/kRTRuAIjw7Ix6TGw==
X-Received: by 2002:a05:6402:440e:: with SMTP id
 y14mr23368133eda.38.1628416228076; 
 Sun, 08 Aug 2021 02:50:28 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id cn28sm643288edb.18.2021.08.08.02.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 02:50:27 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCfRq-0003RK-Co; Sun, 08 Aug 2021 11:50:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210805090920.2107925-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 11:50:26 +0200
In-Reply-To: <20210805090920.2107925-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 5 Aug 2021 11:09:20 +0200")
Message-ID: <87wnowb6zh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qpdf: fix CVE-2021-36978
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > QPDF 9.x through 9.1.1 and 10.x through 10.0.4 has a heap-based buffer
 > overflow in Pl_ASCII85Decoder::write (called from Pl_AES_PDF::flush and
 > Pl_AES_PDF::finish) when a certain downstream write fails.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
