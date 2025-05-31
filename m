Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D88CC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E916C4123C;
	Sat, 31 May 2025 16:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cv4U7toBNR8q; Sat, 31 May 2025 16:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09C4A40A54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09C4A40A54;
	Sat, 31 May 2025 16:39:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65BB6235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 570B18211B
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1b2TDBB3TcV for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:39:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64B7C8210D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B7C8210D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64B7C8210D
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:39:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 608BC1C0D69; Sat, 31 May 2025 18:39:11 +0200 (CEST)
Message-ID: <a71858ba-f873-476a-847a-46f850e63bd8@rnout.be>
Date: Sat, 31 May 2025 18:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
References: <20250517202418.3516858-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250517202418.3516858-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LbNlKPoVmTAIBH35Oh9H9DJdQHP8N4AQ8d9/RnOl+3g=;
 b=TLPj1m/8GffZhWbwNd625FhXMeg3YIXwLZT6BUYyWoYXFExyHBTBu+8JbAa/W463I3MWEe
 fXy4KH4rZZdlXfbzwHlYAjY6qzTusslpX0kkkzzLJpDhOfgwmZ0gxU8zHCz9kCDKBOWBQ+
 Dx7qqovzPmpoqtwTP2SBv9u/IiF/DWG11mAFb82XGioJ9c7hbP3pbTBUFvDRmlk2nkPTBB
 KOf2Bz5PY+hVTZZfFKKZhwH+hzlfXFi5zokVFX6H+RxskpPX/eD28BO68oZSwr5ipWUqyx
 8xbcaZdDBDzKkV6JVhuplxOFp3iH32DUdltyAfkRXZsup98cOlEwek+uVMlVDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=TLPj1m/8
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: security bump to version
 2.48.2
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



On 17/05/2025 22:24, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2025-24223
>      Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
>      Credit to rheza (@ginggilBesel) and an anonymous researcher.
>      Impact: Processing maliciously crafted web content may lead to
>      memory corruption. Description: The issue was addressed with
>      improved memory handling.
>      WebKit Bugzilla: 287577
> 
> CVE-2025-31204
>      Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
>      Credit to Nan Wang (@eternalsakura13).
>      Impact: Processing maliciously crafted web content may lead to
>      memory corruption. Description: The issue was addressed with
>      improved memory handling.
>      WebKit Bugzilla: 291506
> 
> CVE-2025-31205
>      Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
>      Credit to Ivan Fratric of Google Project Zero.
>      Impact: A malicious website may exfiltrate data cross-origin.
>      Description: The issue was addressed with improved checks.
>      WebKit Bugzilla: 290992
> 
> CVE-2025-31206
>      Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
>      Credit to an anonymous researcher.
>      Impact: Processing maliciously crafted web content may lead to an
>      unexpected Safari crash. Description: A type confusion issue was
>      addressed with improved state handling.
>      WebKit Bugzilla: 290834
> 
> CVE-2025-31215
>      Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
>      Credit to Jiming Wang and Jikai Ren.
>      Impact: Processing maliciously crafted web content may lead to an
>      unexpected process crash. Description: The issue was addressed with
>      improved checks.
>      WebKit Bugzilla: 288814
> 
> CVE-2025-31257
>      Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
>      Credit to Juergen Schmied of Lynck GmbH.
>      Impact: Processing maliciously crafted web content may lead to an
>      unexpected Safari crash. Description: This issue was addressed with
>      improved memory handling.
>      WebKit Bugzilla: 290985
> 
> https://webkitgtk.org/security/WSA-2025-0004.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/webkitgtk/webkitgtk.hash | 6 +++---
>   package/webkitgtk/webkitgtk.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index fd9420bad9..82b5cb4651 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://www.webkitgtk.org/releases/webkitgtk-2.48.1.tar.xz.sums
> -sha1  f7939f920f92f6b1395b8573f069d3fb9c085b3f  webkitgtk-2.48.1.tar.xz
> -sha256  98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f  webkitgtk-2.48.1.tar.xz
> +# From https://www.webkitgtk.org/releases/webkitgtk-2.48.2.tar.xz.sums
> +sha1  e1a216588ad5eaf71b548b035699319f74cbd8da  webkitgtk-2.48.2.tar.xz
> +sha256  ec58f6dfc25d3b360388e192f865068d69aab09b4d7df021f90e314d2fa54f37  webkitgtk-2.48.2.tar.xz
>   
>   # Hashes for license files:
>   sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 2c22bfb607..246afad3cf 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WEBKITGTK_VERSION = 2.48.1
> +WEBKITGTK_VERSION = 2.48.2
>   WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>   WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>   WEBKITGTK_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
