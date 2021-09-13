Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914A6C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35B1A6108B
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35B1A6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D43CB80CBD;
	Mon, 13 Sep 2021 20:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EwViJLGB1ue0; Mon, 13 Sep 2021 20:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D8BF80C9F;
	Mon, 13 Sep 2021 20:23:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C559F1BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3C8440004
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPaaQhgrUiWC for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 20:23:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F49F40135
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 20:23:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:605f:5a66:ee64:c7e3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D29AB13F866;
 Mon, 13 Sep 2021 22:23:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631564618;
 bh=UL3sc6hxTdJPrY7E6dazWPRqWZjrgbZ6JrhgFtg9Qyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rG6J6vRazcGqLaN703nRTAipcGLfUwqRGjoxWmwPy/+359T+/2cZTW0fSr3JXuHhi
 5o3ild+sylMgHf3s46ybIZZI3R13ty+mMu86bYMifynSa7GxnVE6hA9cfCE2jdMHH0
 BkRG1schsNwVMsLu00G5/5qusDvUcZRn5CZyMS3isrtL96Pct/EU8F9B92MxLhBg+2
 EigqksUfEM/k4PzKCpXosi1H9AJOzSBkv5YyR6yk7ZzYLJXlCYEuSsFxqokbPc9MoK
 tT3VaZ9CPt0xl/FyCawfbFVq4BYZ9wwVP2auZjei45fJu3kWDLH5oghCLx81RSjIzj
 GnLjwjTI8lPvg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 13 Sep 2021 22:23:31 +0200
Date: Mon, 13 Sep 2021 22:23:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20210913202331.GN1053080@scaer>
References: <20210913130716.85133-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210913130716.85133-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/protobuf: update github url
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Michael, All,

On 2021-09-13 15:07 +0200, Michael Nosthoff via buildroot spake thusly:
> protobuf moved from the google org to protocolbuffers in 2018.
> There is a redirect but we should use the official url.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/protobuf/protobuf.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 75791fade2..fa8ea890e2 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -9,7 +9,7 @@
>  # as they share the same version/site variables.
>  PROTOBUF_VERSION = 3.17.3
>  PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
> -PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
> +PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
>  PROTOBUF_LICENSE = BSD-3-Clause
>  PROTOBUF_LICENSE_FILES = LICENSE
>  PROTOBUF_CPE_ID_VENDOR = google
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
