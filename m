Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5992AD111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F0166083E;
	Thu, 27 Nov 2025 19:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9mWcXn5gL_9; Thu, 27 Nov 2025 19:54:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF5D360845
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF5D360845;
	Thu, 27 Nov 2025 19:54:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E891708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43F2760845
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VZrhh7-jI5h for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:53:58 +0000 (UTC)
Received-SPF: Temperror (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B52296083E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B52296083E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B52296083E
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:53:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 106CBB979CA9; Thu, 27 Nov 2025 20:53:11 +0100 (CET)
Message-ID: <2054089d-0df4-4222-ae5c-d6c1be5e6f32@rnout.be>
Date: Thu, 27 Nov 2025 20:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>
References: <20251106204737.3273902-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251106204737.3273902-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=BrJmjgtxUISzCJGSllqfj4LUhqLtSFqSSaamRgfaD24=;
 b=FYh30jLXHMEJDOl6T8G+Ch8YnS2rn0EWFQzlENbQrPaWlV9GUunRFsKmVyJE0dTsBIYHg5
 S9nniGVx4pE5mtobeMHcKnUPrl/VGUEWWFjS1Re6fH7oz5edsRjbo7dbzNwXJmwGntTaWn
 8PBxR8yrmTSaaIjjYUE9vv5XiHkZrel5RxxREzyzk47kmxG/fHOiqT1DnWoeKmgKSQxehi
 Qj/oyxmkhj4PholdnN9YpYq0/VA53fAQI7WR5q2xyedQHY6zoAM8f7t0cDIGfHMxK43CP1
 sTBFUHYBlHUDr7uAY7aHRUDLFQP77qZ3VHBChC+wuPqoJrBVxoV/jd2ewll1BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FYh30jLX
Subject: Re: [Buildroot] [PATCH v2 1/1] package/asterisk: security bump
 version to 22.5.2
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



On 06/11/2025 21:47, Bernd Kuhls wrote:
> Fixes CVE-2025-1131:
> https://github.com/asterisk/asterisk/security/advisories/GHSA-v9q8-9j8m-5xwp
> 
> Acked-by: Titouan Christophe <titouan.christophe@mind.be>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
> v2: updated subject to reflect that this is a security bump (Titouan)
> 
>   package/asterisk/asterisk.hash | 2 +-
>   package/asterisk/asterisk.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index f11ed08ef4..26175667c3 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  4cc403c8885d4aed3956dfb75d315d3e5bcc129eb9cd47c156d3b12ecceed1ba  asterisk-22.3.0.tar.gz
> +sha256  8a94650b6f348af1f1c9cce7ed3585d280f3a31b0d3820084a42b03712df95d5  asterisk-22.5.2.tar.gz
>   
>   # Locally computed
>   sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index e7e802aa45..9a071fb8e0 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ASTERISK_VERSION = 22.3.0
> +ASTERISK_VERSION = 22.5.2
>   # Use the github mirror: it's an official mirror maintained by Digium, and
>   # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>   ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
