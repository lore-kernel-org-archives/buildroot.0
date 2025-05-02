Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C4BC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FBD813FB;
	Fri,  2 May 2025 10:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stY5c8zwIEiI; Fri,  2 May 2025 10:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3A0881B69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3A0881B69;
	Fri,  2 May 2025 10:53:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1C83229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97EF6813FB
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMUccxrggfXf for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADC4581B69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADC4581B69
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADC4581B69
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:53:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A9E441C0F8A; Fri,  2 May 2025 12:53:20 +0200 (CEST)
Message-ID: <bb15f35e-5b6c-4f81-ae08-ac657c0cc3bd@rnout.be>
Date: Fri, 2 May 2025 12:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
Cc: James Knight <james.knight@collins.com>
References: <20250418144530.24911-2-dalang@gmx.at>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250418144530.24911-2-dalang@gmx.at>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183200; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DkkGXTlQwIqcZP7r8pC56VEHFgMiIWw8qBebHYuWJP8=;
 b=PgVYgXi8j8kqRIJWiR2LCFa9/LeHAtg85WHi48qoNoRpsINhKpE59LNlsXjRvrFPun8N6K
 eLXfRVt2izuVzUhVqgT+jcYFdqoVgwhy1wF1Pq3A8SEVAEyxI/70JE1NkGtoPmhE6ddEiN
 mNaWFfgIuJrk+OcMh4UkE8AG2Xbmp+fX1z0VYNx87YHspIu/zJqleVQNknW5fipmejeGkJ
 yPd2O492jwhji6WEvAiVZnqXJSVfUBHf0A1hEFYyo9SHCK3aRz8eEMNr+o2qVsHxF7+YIt
 PMTVyaEBJVnIbJwQ5aY1xh9xiEDYJGXZel1AZIIZkWeS9vAfWE1QuIVzFPUG6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=PgVYgXi8
Subject: Re: [Buildroot] [PATCH] package/gtkmm3: bump to version 3.24.10
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/04/2025 16:45, Daniel Lang via buildroot wrote:
> https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.10/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/gtkmm3/gtkmm3.hash | 4 ++--
>   package/gtkmm3/gtkmm3.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
> index 9bfd68e027..3671a1d001 100644
> --- a/package/gtkmm3/gtkmm3.hash
> +++ b/package/gtkmm3/gtkmm3.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.8.sha256sum
> -sha256  d2940c64922e5b958554b23d4c41d1839ea9e43e0d2e5b3819cfb46824a098c4  gtkmm-3.24.8.tar.xz
> +# From https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.10.sha256sum
> +sha256  7ab7e2266808716e26c39924ace1fb46da86c17ef39d989624c42314b32b5a76  gtkmm-3.24.10.tar.xz
>   # Locally computed
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
> diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
> index f4fc54849c..5a7e494bf7 100644
> --- a/package/gtkmm3/gtkmm3.mk
> +++ b/package/gtkmm3/gtkmm3.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   GTKMM3_VERSION_MAJOR = 3.24
> -GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).8
> +GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).10
>   GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
>   GTKMM3_SITE = https://download.gnome.org/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
>   GTKMM3_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
