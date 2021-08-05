Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5ADFC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:41:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B7F461104
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B7F461104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C83CD607B6;
	Thu,  5 Aug 2021 19:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4AdAv4ND8X2; Thu,  5 Aug 2021 19:41:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2631B60A6C;
	Thu,  5 Aug 2021 19:41:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8521BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05DCF405CC
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGv8gZvUaZ4O for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:41:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0491D405C9
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:41:43 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id ec13so10048587edb.0
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=roKoFG04M2uOHDOIFXDCpoJpb6ptiSFWRyFixlXTNKg=;
 b=Dr5XtyftJkMeOqLGCByxgw0jb646eahzcsBW2ogexgNcjbT63KZ0/fvrdeZvc4o3Jq
 mPmao9lkb4D7lz9uch+dLajrH3a1XSkrTmwXX/MdPsHbNvURnCreFq05Zn7TZ7RtXV/W
 yTO2hw3gmoNs7LXW5EnkpDyBbgUEAEmJT68cJqeXQowAkxT8FepwdTs4p4wnyFiq56Kw
 Rt2qeQ/A1AFVnw6mQwX2SrrEChS4SbN9ibvK3ZvpLAN9ByXND36ZGF0IheJ9wXNWHdpL
 oQaJGr5qpvWdngFxcJcyGzmbcLK4//9BdeXOAzR509XnW5WURTg5itYAjUo/YJc9IbIx
 T69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=roKoFG04M2uOHDOIFXDCpoJpb6ptiSFWRyFixlXTNKg=;
 b=XCZFySPC5iV2BQlUBIcw2zVwc+ask0dy+c1ZEshJ9xrGIy2yLpj+qWdLq8hzGmSQFF
 L/VnvMWQpeLj0nPvfITRScT588u7gSM2Q8WOslRB/pbnnZXK5neuE27yf5yM2P8HEIjW
 0VN6xK64r3UK8G0bSHv1WSIwijlD7ZA44mTb0kHuiyo5IM3jLNeUfvLA4SpGRQ6mDH6y
 DfVzhLalpY5iy7tIocdQdzmXL30T4VZiFdsxQLGAR8nncT5kROSHheeA8gkqcgSUSPvX
 /59P4qr5A24/a9YHZZGUZ7IyY8mUMujQDB/d5QYe2L5OVGsZp/0D2wwG4S7ZLSV9C+zF
 ibOQ==
X-Gm-Message-State: AOAM530JZm3QlDs4UPUhuufEYRcHdnuCVQHS+heNO+6gJvnisujDQy07
 v9VnQUNLIXJ1aKaObNMx6PU=
X-Google-Smtp-Source: ABdhPJyNNYKmOCoS6YbvqLEDG4Wydgqe78h4UWQ+zEAgJ95/73hlYcqooP62RWg9vsUz5qchOOdGFg==
X-Received: by 2002:a05:6402:1d25:: with SMTP id
 dh5mr8665659edb.377.1628192501528; 
 Thu, 05 Aug 2021 12:41:41 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id cb4sm2035120ejb.72.2021.08.05.12.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 12:41:40 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBjFL-0006jd-Mx; Thu, 05 Aug 2021 21:41:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210722211230.1219332-1-fontaine.fabrice@gmail.com>
Date: Thu, 05 Aug 2021 21:41:39 +0200
In-Reply-To: <20210722211230.1219332-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 22 Jul 2021 23:12:30 +0200")
Message-ID: <87fsvnk7bg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: needs host-flex
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > host-flex is needed to avoid the following build failure since bump to
 > version 4.14.3 in commit 7df2611e9e93f9c3efea39bf0b5c217564618a28 due to
 > https://gitlab.com/samba-team/samba/-/commit/942c0d2128cb8e64a9354dde6bdae82a1c1c3d88

 > Checking for flex
 > Checking for program 'flex'                                                                     : not found
 > Embedded Heimdal build requires flex but it was not found.  Install flex or use --with-system-mitkrb5 or --with-system-heimdalkrb5

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b9ed8be51a0eef77d6e48755861ae266c3b9f811

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
