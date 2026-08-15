Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85933C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 17:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4921F80E41;
	Sat, 15 Aug 2026 17:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3iG2Hgx6bvN; Sat, 15 Aug 2026 17:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E903780E5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786814583;
	bh=qjKSmASJ8DP0jc7GYxJWpwRs1P9lE57q/RMUhoLXsN8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qz6i7bSGzP59uLKznD37j/hzYxAt4k+jlVk5DXV2CFwWYz9pUa8Xl2qi+TBoyW+qP
	 21wibIYF/YyvNp8Ws9S+U9jG9JlQb4RfWUoHU1jKzbOoRYXmat59mSaniG0wu2JrjU
	 jjgVyCJEtjdKR5z90+wl9GDoiW8YVMhlFb1BxwRG6+UnIm3ri/BsItM9F0JiLFceVK
	 kc5LcVy85YMON/A1IsTFjlVshuww1QqmLiMEYiteeJWfVwIIv3Mf0+/YYRzfCjH6t6
	 fuwH0vFkDNdCGnwBYDMcGLX47Xf0ibaMRxwXZAiORn0wdH3S3FbhlBWRXck8yeOeai
	 9RImkd0SDhwmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E903780E5A;
	Sat, 15 Aug 2026 17:23:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB9D423F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1E1760644
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHSQpKUoywQf for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 17:23:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB5E7605E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB5E7605E5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB5E7605E5
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:22:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D28F613F86E;
 Sat, 15 Aug 2026 19:22:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 19:22:53 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 19:22:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Steve Kenton <skenton@ou.edu>
In-Reply-To: <20260814054216.7491-1-bernd@kuhls.net>
References: <20260814054216.7491-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <82a72dee6cc921be97a3b87755539c97@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libdvdcss: needs gcc >= 8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/08/2026 07:42, Bernd Kuhls wrote:
> Buildroot commit cd3a2f0ff35346ad5fd6a9867113260addccf127 switched the
> build system to meson which depends on c17:
> https://code.videolan.org/videolan/libdvdcss/-/commit/9f16597859120b96006415c084039f63efc84b83#line_0cc1139e3_A5
> 
> Add the necessary dependency and propagate to reverse dependencies to
> fix a build error caught by the Gitlab pipelines:
> 
> br-test-pkg/bootlin-aarch64-glibc-old/build/libdvdcss-1.5.0/meson.build:1:0:
>  ERROR: None of values ['c17'] are supported by the C compiler. 
> Possible
>  values for option "c_std" are ['none', 'c89', 'c99', 'c11', 'gnu89',
>  'gnu99', 'gnu11']
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
