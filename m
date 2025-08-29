Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C33CA0FFD
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 448AD616D6;
	Fri, 29 Aug 2025 17:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ch8hupChamzC; Fri, 29 Aug 2025 17:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34FEC614B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34FEC614B3;
	Fri, 29 Aug 2025 17:54:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D774FD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE5A460A64
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoTuWE1eP-1c for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:54:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 058A6614B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 058A6614B3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 058A6614B3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10492B9782D8; Fri, 29 Aug 2025 19:54:03 +0200 (CEST)
Message-ID: <cbd6805d-f9a0-4db1-b92f-22568cb5306b@rnout.be>
Date: Fri, 29 Aug 2025 19:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <20250828220859.468633-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250828220859.468633-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756490044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=y7SxwsAQGes165Y7TLDRMmSsO1+Jntr0MiJpio7XrAM=;
 b=Pu2N5KHuJydOhrOMk2N+0hQS8wSHHivKiPrWUGhkb859muki7Bf4OfihIJv1OoTlLfHI6z
 LJWUjd87dxUW5/4XvrXzppI+oNDOMewei3SG0A8irqPcKGh4/9kMS7a8HOyd1SLEciXnYW
 lUXmLfd2TTqzHP/MFQ3wRfOAkop0uw8DLxhkj9yYui5n7RJlhXdeLQfGHPlghaBV6XScrL
 Ou6Uq1NwS6dD7LoFiO1kVNM5db5FMJN2du51QsxJ+dR4JMW6cHE5fEcCeNkm/ysQQzmyyo
 B0k8tH4GtPgaZPmzMzgYFEg/J79bB5URTC8uE9K2Nlf6Wt1HXsXkqtO/tcWpTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Pu2N5KHu
Subject: Re: [Buildroot] [PATCH] package/rtl8821au: bump to version
 2025-08-29 branch v5.2.6
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



On 29/08/2025 00:08, Giulio Benetti wrote:
> This version allows to build up to Linux version 6.16
> 
> Fixes:
> https://autobuild.buildroot.org/results/588b834b133abfc983945beef37f7f2b0df71c5f
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rtl8821au/rtl8821au.hash | 2 +-
>   package/rtl8821au/rtl8821au.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
> index e79e32ff3d..2796c50791 100644
> --- a/package/rtl8821au/rtl8821au.hash
> +++ b/package/rtl8821au/rtl8821au.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  fd02814e2ab5435cf4213aaf876d28dedccc0bec8c91ed768336727276c5eae6  rtl8821au-d0a49ba401a8661ef0cdc4cf8850bc7c927a062c.tar.gz
> +sha256  d8d11753f88d670be7489fd1d5d30718543f4994ccc5031609f4408a5586ef3c  rtl8821au-4d39880a41201ddb14b19f2e7273054bb812b32e.tar.gz
>   sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> index aa900839f5..afd520b467 100644
> --- a/package/rtl8821au/rtl8821au.mk
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8821AU_VERSION = d0a49ba401a8661ef0cdc4cf8850bc7c927a062c
> +RTL8821AU_VERSION = 4d39880a41201ddb14b19f2e7273054bb812b32e
>   RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
>   RTL8821AU_LICENSE = GPL-2.0
>   RTL8821AU_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
