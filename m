Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0BFCD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BB5640280;
	Mon, 18 May 2026 20:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2xZTHBCyQAZ; Mon, 18 May 2026 20:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D617940275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779134440;
	bh=APi8IUgPPEB+f0V9xn8kuWkiy8hPI81+AmcrYDsVEro=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QoVIMZPzOkwi6YjKqhBmaOLTq8iyjOL1LKn+RqunEOZ1SyLpk11+UWm/qXuiUs8lY
	 MvLS6xt8pHatkM6eSIqeQZe6vqGG9Dq7QpiWy6mbotUQAqfO7UVDHcmSZ/JApTtIl6
	 x3VWNICMvpNIjajR6DPsgHZob4Cm+7M6A6yRddwHX3D60WMFqfi/9OJKXpO5mzEEqb
	 LASxDMzN8OqQB4EKOUckOwK/kqeaTyaQaksFYurBaGJBFOKQ5RHYwBpt0xzc+L7uuD
	 hbEGtZGCmNXxMmJUXzu1/avY9d2ZRWYQwNAy9kVU+C1+j91CoPyET2d+/6gsEwnGMG
	 nXkao+mI3Lm8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D617940275;
	Mon, 18 May 2026 20:00:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96F68265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CC2C6079D
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84JkI1V1dDdD for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:00:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 321286079A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 321286079A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 321286079A
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:00:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A84E0B97BB03; Mon, 18 May 2026 22:00:34 +0200 (CEST)
Message-ID: <9576707c-2397-4598-b083-fec5a0271d21@rnout.be>
Date: Mon, 18 May 2026 22:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: john.ernberg@actia.se
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-9-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260510193826.2846038-9-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779134435; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=p9jSmS09D+FRiv9QQQHyG7B27mbgOsMFk/Iwe2kMSK8=;
 b=EEFZ0fPYnDRKGXZ2a7Zg8z2P0Mt6QHtFAshIr3Yazl0meqL9Uj4uYCDH2WI8SKYtRG5+5G
 iNjm2Ai6n2DN7AP+VRSMILsyXkDTpf8Xs0FFMKbakmAKbNzYcGvqY73oRUF6/gGpOtbkEe
 y0rJSYrG0qZjsod2tR/YeAx7TJ7z+aAY06nSzI+ABPx1fvF9mOdu9CXs71UXYptY9V0mRr
 LANfr/GhmkZ9ikn+1cWBoaOLomEL41gtMttL64x5R7OpymgM1zK4bY8E42bDEeSMdopELE
 fLMDjY/eOm0EqQtSwufOZc1mNV9BYhhwlvCRWAHFGwOFwbEHbrDuvy+bqCNXyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=EEFZ0fPY
Subject: Re: [Buildroot] [RESEND PATCH 8/8] package/tpm2-tss: Correctly
 depend on util-linux-libs for fapi support
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



On 10/05/2026 21:38, John Ernberg wrote:
> tpm2-tss is a dependency of systemd, which when enabled becomes a
> dependency of util-linux.
> 
> tpm2-tss only really wants libuuid, so depend on util-linux-libs instead
> breaking the dependency cycle.
> 
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> ---
> 
> RESEND:
>   - Forgot to subscribe this e-mail to the list
> 
>   package/tpm2-tss/tpm2-tss.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> index 08ff401328..11da37a5b4 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
> @@ -33,7 +33,7 @@ TPM2_TSS_CONF_OPTS = \
>   TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
>   
>   ifeq ($(BR2_PACKAGE_TPM2_TSS_FAPI),y)
> -TPM2_TSS_DEPENDENCIES += json-c libcurl util-linux
> +TPM2_TSS_DEPENDENCIES += json-c libcurl util-linux-libs

  This also requires selecting UTIL_LINUX_LIBS in Config.in, otherwise you get 
the following error when only tpm2-tss is selected (and not e.g. systemd).

*** util-linux-libs is in the dependency chain of tpm2-tss that has added it to 
its _DEPENDENCIES variable without selecting it or depending on it from Config.in.

  Applied to next with that fixed, thanks.

  Regards,
  Arnout

>   TPM2_TSS_CONF_OPTS += --enable-fapi
>   else
>   TPM2_TSS_CONF_OPTS += --disable-fapi --disable-policy

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
