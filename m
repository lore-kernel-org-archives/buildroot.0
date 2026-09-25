Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04064C98328
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC382813F9;
	Fri, 25 Sep 2026 14:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAMN01edeCYW; Fri, 25 Sep 2026 14:46:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DC011813F3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347598;
	b=TGYtV/5lSSwPHrBdIJ1A+2WKcklO4iNjU623MX/Egz05+2r3IsnvRpHuIEODf48L0I2z
	 Qw6dTqdP7pzUJ8abcARpf0L3i2VxK3dWFG+y6xhUCHabSC/vcurLoVjcGRp+4IgquWDhj
	 HIPxazjPON5FoDy/Kycy5PObVzYfoNrzXpRxiDMM4ReGhRPthH7As4HgABM2JHaEfuLIF
	 FFsGqjp7yDPuNcObWDnB5TP4Fm4oStrmpwGd608hnDjwObk42VMhf88GkW6XLjXeU8mXj
	 Z9YmLhEeS82fFQOwPds+LsnvgQpxUf4mBZbe2LI7F+B0ahlNLUJKXYGBN/X8dWRbcYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347598;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tAI/5jBzys2KbesAmj69QXVd/ot1XQMlnsxmMhmFvs8=;
	b=q2wR3wk/yI6CwVJ/JPVLX/lfw1NdV1ndxusUK50Jrf5arAIerrP4bYR/1vLMqFGKoWB+
	 P42zB0vzdzHeBs1sVQYq9Lw8ExAfTSoq3lZh6oRsxhu3J6AYhQyPUY8t/QyzvlxDZFhC/
	 Wu11uhJ8IcNjv3m7BAWZmlVJmdfS92AyrMXus4TVme2xW1zhkn/1kj/dzVd6G7p35S1CG
	 RQQwim1y87+8of7+GpGkqqwkVMJ3/n8c3i+ck5lp67DxDtF4Q+psPepnXKx69Lv4p/d4b
	 LSn2yYbGIm2zFGIV5x6Q8dFzquxRdhdm+gV4Ao2CznzSCtznFyMZAmRaklasx/I6lMg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347597;
	bh=tAI/5jBzys2KbesAmj69QXVd/ot1XQMlnsxmMhmFvs8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oNTyndDgeLOU5/dTfoJICzBUX29adT/oQ6X25KPJEiHepObHLqqGMhPpvn6NuZrMZ
	 Lj+bhaUpRwKj1Uxjj2UCJ7+NmBaHcLN9JJNz1u/hcTRL2Adp+rmpmoaRtT7S/l1q5q
	 +sFMAMQXXr1hGDnqzk8rsDXUzzepTuh2Sf7zOUzNRU4h+96VH5sXr0Arr5WBmGfQSR
	 FdYzgw15O30wOseCc+IpuKAql2A3jghqidP5DIhfjCB5911mT36aRwbtn9SmkqBDJ3
	 rvPwlY4HnfEiGhaitEFUJ6EX+sZ37CulZ/vItNf2olkqlyjItj4RlW9Ezgo2PqYM27
	 N+NBj5JXU+sKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC011813F3;
	Fri, 25 Sep 2026 14:46:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86933B00
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AAB560E5C
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NL3XZbprJlCG for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F3F0B60DEA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347594;
 b=KT1pSe2T+q9VgcAU7F3NkdGh8eA+K5SsmVV/INQmideWlpkvn52LnodTd1kvbVsQVvH/
 0J0Dcozn1VjP0VmihJmMlUQpiQZAdTdyT7MLcJF/JKyPrPSPK4AF/2Ma1IREjNZxIBcy6
 rxTiXLDmMHxA4TXsiKbYyFieY4po9FeMqBnG5MiyIYhdRluHhSt4zNkXykV61Fh1rcnV0
 cIythDxeemQ+6pwH5+RvXSvqT+yY+o3MxoZC5knJxUP4k807xzlu1f/IxL1wRhWCT7Hkw
 1HStuDdtoHMRDHB5uzGOGJisMIdsPv+nvYQk4iE9A0UxSirBUEm/1757oVttQ4+r63g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347594;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=SUEwtxx5QP/TxyTbnynHMSJgrP9hMF0kKbow8UX1ZHE=;
 b=FZivmBcWa+/XMDlQzq6bSJYMCuvAtL9dwFnp+1N6014adM4lnEjX4L+Wi1C0UsMtJH88
 RNlBqkgGgSMPwb8pdv14dF1+BnqAjLfBt5ioVZF1KY0z+jKpJ3OXAc3bdQAXSWrfb6TIE
 2UXPVOdKxcTRBooJXjVwbfWXdUUImv9Wlr3mAAzY3wi85mK+Bl7fTu6lLdo61Mvcc6Bn6
 F5xN3jDKrj9eTOYqM0MJlVH4zhGnUtJH/pJVohU5ZtYe23LvTvvES5uL8ddrHetujQC5n
 s36Pls8ukgEOPcG3OBT5cs22qg9UTVP0rvro6klyqxTz/oR8g2OJBQr/WEKB4MNj0qA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LpW1H+PH; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3F0B60DEA
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:33 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-4887f690df6so547812f8f.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347591; x=1790952391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SUEwtxx5QP/TxyTbnynHMSJgrP9hMF0kKbow8UX1ZHE=;
 b=Jdclxw/QqN4Jeohj20NldGRrBHee1dOueF4KQPHLsMeyEd7iLFZ8h0TEqAJd2tmMFy
 J4fPnTNf1sd78pix3DKJr5OqWylR2griF5lmAUIJ5sQnaRlhp9jOgZagS11ZdmrRHP0g
 8nQCVWxIrw5++RVUXASAn/oMIgnD33HYZp87akFNo8d28R5mzZfin68EyKIEk9jIEvDm
 UwiVU65Bivnindae4tqjory2/EqLSXu5fnNLL6mtRBc94S1FRJZKRNLsGwIZU2zSbpym
 03waNEx3uacGoPoBdQX8dAVHXlXwl3vDTRfM0GvVCnp8OOtsPOY0JqUX7tesW/m9oInW
 rwJg==
X-Gm-Message-State: AFuF++lAgnWw0p6VFh1TGnRtDAiDUKQfn5us91teGWCdVeurv/k8jy41
 8ahyFV3KW/L0u2q4a5i5RoUhLW77wMNNepTjnWLDVFbgHqOzk0eBawrA4qyVxDF9XMTLFCXhqD9
 +NVDPWbPoWA==
X-Gm-Gg: AYBFou03v09EW6uum2GVJpUcbbMyq/7OsuEYLOOa6KbG6p6GyImkESyLUO7kAU5Kcgt
 Ge6uY0EkmKFpACrk5Z5oQ3+tPj5Atq1DeqT/g5FvQfXACuxLu6b93FekzuQyKpar/LlU5t7sTHb
 haPiQB+DnxDu0LUqlVSv4SZfX272comYFI7G7jhRxBM1MmcOifdj/kzLeZKkYAqMeuQWLHUdDvw
 0EEihmUcJHfTGlE3QQy0owuwsxp0ZRabt7rYXGh2UYTf7Qi8TKux3NeiAXeGWVptz4zt4IZEhwl
 +6BWZWLd5i278kt8MSSbmAA4L977DRnLHsezJHObUVXGLwhoq3Nz43pVx0EdJ2R9pkn78GRCPXU
 qDrz1QHDDumGDBEGz3ue66wl83JCdqWjEmXDhbNFdLxoTcEU4Yts7izD0xxcK/XuaOQ66ygrvnE
 5Yi/qojnhQB7f58/2cLNkh4V95Mcef6W/GqzRe36iG1ncYH75Aw7IeOdF3utF9ezk+XKtcoh92N
 i2bLJfoIXgCQoflr4triFw++jc0fv+abIvYM6xr/w==
X-Received: by 2002:a05:6000:490b:b0:487:27f6:a4ce with SMTP id
 ffacd0b85a97d-488828c8ad6mr2137469f8f.30.1790347591620; 
 Fri, 25 Sep 2026 07:46:31 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a35607bsm7118872f8f.16.2026.09.25.07.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:31 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:28 +0200
Message-ID: <20260925144630.4099444-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917000152.3060291-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sofia-sip: needs OpenSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit bb254e2304274dc308e3d8699e92ea77e4189fb7 bumped the
> package to version 1.13.18 which includes upstream commit
> https://github.com/freeswitch/sofia-sip/commit/8081a1a6d05f174cb902664f73182c32fd2eee0f
> that added the unconditional usage of OpenSSL.
> 
> Tested with both LibreSSL and OpenSSL, the latter with all suboptions
> disabled.
> 
> Fixes:
> https://autobuild.buildroot.net/results/afe/afe7b327f12db86e4dc31ecc25b576bff5c4a0bb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  package/sofia-sip/Config.in    |  1 +
>  package/sofia-sip/sofia-sip.mk | 18 +++++-------------
>  2 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
> index 2ad1940833..37961273f3 100644
> --- a/package/sofia-sip/Config.in
> +++ b/package/sofia-sip/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_SOFIA_SIP
>  	bool "sofia-sip"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_OPENSSL
>  	help
>  	  Sofia-SIP is an open-source SIP User-Agent library,
>  	  compliant with the IETF RFC3261 specification (see the
> diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
> index 1d47b43fe8..b8679f6961 100644
> --- a/package/sofia-sip/sofia-sip.mk
> +++ b/package/sofia-sip/sofia-sip.mk
> @@ -9,11 +9,14 @@ SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
>  SOFIA_SIP_INSTALL_STAGING = YES
>  # Fetched from github, no pre-generated configure script provided
>  SOFIA_SIP_AUTORECONF = YES
> -SOFIA_SIP_DEPENDENCIES = host-pkgconf
> +SOFIA_SIP_DEPENDENCIES = host-pkgconf openssl
>  SOFIA_SIP_LICENSE = LGPL-2.1+
>  SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
>  SOFIA_SIP_CPE_ID_VENDOR = signalwire
> -SOFIA_SIP_CONF_OPTS = --with-doxygen=no
> +SOFIA_SIP_CONF_OPTS = \
> +	--with-doxygen=no \
> +	--enable-nth \
> +	--with-openssl=pkg-config
>  
>  ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
>  SOFIA_SIP_CONF_OPTS += --with-glib
> @@ -22,15 +25,4 @@ else
>  SOFIA_SIP_CONF_OPTS += --without-glib
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -SOFIA_SIP_CONF_OPTS += \
> -	--enable-nth \
> -	--with-openssl=pkg-config
> -SOFIA_SIP_DEPENDENCIES += openssl
> -else
> -SOFIA_SIP_CONF_OPTS += \
> -	--disable-nth \
> -	--without-openssl
> -endif
> -
>  $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
