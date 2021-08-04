Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD568C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:49:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E2A260E78
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E2A260E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63942608B5;
	Wed,  4 Aug 2021 17:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTAvxa-l9WT1; Wed,  4 Aug 2021 17:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFD7060751;
	Wed,  4 Aug 2021 17:49:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1891BF41B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29BE940580
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGbS79ojm4aM for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 17:49:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D71240572
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 17:49:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l18so3159462wrv.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=T5WjikmRcPX6VMwqTuqVsqpRt9zHkxXn2HzPrY1cLBA=;
 b=TI59G5bN6J7tQDWdXgAoRVMohfkmOj1f6kaJTESF8N82XzPzQsTP8q0kv8jnLG5vIX
 l8oGL8b44g3gWVtLKjPzh1n99/2kaxfgJwZ4oJKyOaPSkVCz7OrXCRgD/tlJD23xgaws
 amutW5I4aUfQCdoVPM2rTP+9wKX3OUW4P2IjH8s6LfKR4xjxKMcgXStGBeCPHAmrdJ7h
 TS20hjNOzTfheCLD7Ce8H8jaFTM4AJYdfqSF/avRS+uLrDun1l8QLmrQQfZTRzLxn9JQ
 d2QnNCQzjoYnFYZiD67kRFhCEiMEhVlRmVLNIbgpsSsNAsJgx/vDX+epuHrerayO6pbL
 iGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=T5WjikmRcPX6VMwqTuqVsqpRt9zHkxXn2HzPrY1cLBA=;
 b=e64laitM8D7IqFzkO3CjW5h0Uit3JVjUQYbTnFUKU8CLQp+XXPbBfnPZ1SJP1uuCLb
 1XcgXbQUY4JDbGQqNI1ewoswNJx5qNvgXKUjTNYoHrKc2jZYPIkJRiidq1i4kUrfL/O5
 /Wts0RY5aVHUs+KCyB3dNWZ0AaNqjMoa033IQG1Q/VjdsD9922QFoaa1HTP9rilPCqXH
 4yNlJGNFO1dkGW5eg6+9LDDzl4OJL7JLbL6OvX++6VX8FXl1xf34zl7wF0GKUmF7NGZ7
 JAqRj5SLV3EmGsCZI9loUSWMt/8N+9hOMly5DWWbwtaE/XfijDPmyRmJ0OmAc2Jt5NuT
 /Bqw==
X-Gm-Message-State: AOAM532Zoa4DkNcRdco3CbL5WJZI0Vl/L7rZXLuxxWNsHqr8ndQPaL5b
 ut+F7ACXetQ2QD0zc6Jopkb/BQWfER0=
X-Google-Smtp-Source: ABdhPJwtI7FbLxS60fIVYv3kxFw2zilF3Zpfc3sLQGt894r8djZeLP4qPldj/BaOXSzUs4PjHTnKMw==
X-Received: by 2002:a5d:4d85:: with SMTP id b5mr516703wru.317.1628099359850;
 Wed, 04 Aug 2021 10:49:19 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id p2sm3435472wrr.21.2021.08.04.10.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 10:49:19 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBL14-0005g3-Ka; Wed, 04 Aug 2021 19:49:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721171026.489098-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 19:49:18 +0200
In-Reply-To: <20210721171026.489098-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Jul 2021 19:10:26 +0200")
Message-ID: <87v94lp0bl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: add SELinux module
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

 > Support for apache is added by the services/apache module in the
 > SELinux refpolicy.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
