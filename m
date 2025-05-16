Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3FCC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E17607A0;
	Fri, 16 May 2025 10:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIWVijFSv6oX; Fri, 16 May 2025 10:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61B6060863
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61B6060863;
	Fri, 16 May 2025 10:52:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2177F1C7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02F7C81289
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5XJQEiVjZ10 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C74481268
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C74481268
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C74481268
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:52:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C0351C10FA; Fri, 16 May 2025 12:52:02 +0200 (CEST)
Message-ID: <9bd83a4f-ac8c-4c52-8667-2ec33c61eb5b@rnout.be>
Date: Fri, 16 May 2025 12:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>
References: <20250501085721.58508-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250501085721.58508-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392722; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xCx+E6FqUGSRQufNIfTN2Ja/+eHjrLQ6yADPEEGfxkY=;
 b=IWSTAKVf7icowzdfuWhV7+cPZkcocYim2RY6VUAk8VWTyvUpKl3OcwMKvThhD/6nKm4U2S
 c3+KTuYU8AXq6dVPG0/0yme+dLPO5nbm6GW8fb4/9v8FDzUYpo06nzAe14LV+1sXc+Fc5o
 BJQs48y+2Xivog8LJ/liduW1AehXnNYpjm9Mim4lXm/miXUOa5zkVPqyhVWIKLT+/FSA5h
 O5Jykisnge72H50PfhEhGQsixQrP4XuGA6rKMO/9NiWHiG9oNtuEe+LGULTPfZ/S181XuW
 yH3Y7yToYiYeKWa3kKJR9E7HxWSvFVV2na2mVVSKPaOyf9/i4u+tZjBGmJ/dDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=IWSTAKVf
Subject: Re: [Buildroot] [PATCH 1/1] package/traceroute: bump to version
 2.1.6
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



On 01/05/2025 10:57, Kadambini Nema wrote:
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/traceroute/traceroute.hash | 2 +-
>   package/traceroute/traceroute.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/traceroute/traceroute.hash b/package/traceroute/traceroute.hash
> index cf2eb127a2..5619338848 100644
> --- a/package/traceroute/traceroute.hash
> +++ b/package/traceroute/traceroute.hash
> @@ -1,5 +1,5 @@
>   # Locally computed:
> -sha256  05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce8b5d64806459a7e0412  traceroute-2.1.3.tar.gz
> +sha256  9ccef9cdb9d7a98ff7fbf93f79ebd0e48881664b525c4b232a0fcec7dcb9db5e  traceroute-2.1.6.tar.gz
>   
>   # Hash for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
> index 133f8d3c3e..bd246e5f9e 100644
> --- a/package/traceroute/traceroute.mk
> +++ b/package/traceroute/traceroute.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TRACEROUTE_VERSION = 2.1.3
> +TRACEROUTE_VERSION = 2.1.6
>   TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/traceroute-$(TRACEROUTE_VERSION)
>   
>   TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
