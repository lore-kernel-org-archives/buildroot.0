Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A70CD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 20:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BF9581D0B;
	Tue,  5 May 2026 20:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLavhrebfaFz; Tue,  5 May 2026 20:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3903681D11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778011621;
	bh=42Gc6xuUTaadYKd/dcNILO5B/DR0dBfe8Wk6PHS+dGI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=auxacauNwquJQNSfVbeEXpjryqTjPhzE2Yc67wuMoq3NKIcQYj6t/a7C2y1+Dac+1
	 ney13B7ThaTprIVdL5jU7h7C78uK8xgp7iGrVn4ydoWHuBk5EN7Ki66mEUqQsyB+As
	 RV+3EacH2WgIRjO5WjEAsItvllI+1Gxy7f1ddKjP9/l3bLdhqXMBTx7nFGpEb2d3tJ
	 IlrVJhbafKZYibyVovndQi4eCwEalScTxQT4RLn2X+O5toI8JaaplZaVnM+XK7bgKI
	 ew+GirLhXtD8WQ/mIRgH/KbIPO7xz5m2Tow+Q3ER2HF4zEyYHug8AIr/p5XWGwSPf8
	 S4xKXqrv/h17g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3903681D11;
	Tue,  5 May 2026 20:07:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED88B2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA32A60B1E
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CekFBp8DZls0 for <buildroot@buildroot.org>;
 Tue,  5 May 2026 20:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F73D60B1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F73D60B1D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F73D60B1D
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:06:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D6B7EB97C2AA; Tue,  5 May 2026 22:06:56 +0200 (CEST)
Message-ID: <3d726f1b-2a2c-4f01-90fd-f32b7cc1f065@rnout.be>
Date: Tue, 5 May 2026 22:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Preiss, Stefan" <stefan_preiss@gmx.de>, buildroot@buildroot.org
References: <20260426174407.8470-1-stefan_preiss@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260426174407.8470-1-stefan_preiss@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1778011617; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=bONLw11IP8kPglBwNhxHlVIQBp7MmCeQDG2TCUgMKDw=;
 b=UEDZUEfyKfqCS1U9gThtZaBCNNsTgg+TYjh2SnxF1eThQ8xY9fhhmoKQglRa7cPuF+Aers
 d9czdjCsfevS9nnp2K1/s90kY9lgb8/UjIWq0PdnUtM/t9kq+y7W+vj5FWsUq7MgZ8ybyJ
 V6XmKA1vYsAgplYeVsZy7V1440xKEA3bblWbdeH5u5m1BPdbqe6g/ewDb4Vf0AUx32aaWN
 aFDeknvthMqw+y8y6RuBmxsaZrfWY2Xr0cHkQxhcF1Ztbkr+gtCTDDzQUz/q68VdmwQnCi
 onAL5EbVExZC/cauXOZuFUUQIA8L/unKCRWmLOnkZ18P+agwMgOGGRzAIcmP1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UEDZUEfy
Subject: Re: [Buildroot] [PATCH] feat(package/poco): build package with
 cmake instead of make
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

  Hi Stefan,

  I was about to apply, but there's a problem.

On 26/04/2026 19:44, Preiss, Stefan via buildroot wrote:
> Currently when building with make, the cmake config files are not
> generated. This leads to problems when integrating the package in an
> application built with cmake.

  We need your Signed-off-by here, with the same name and e-mail address as the 
Author of the commit. This shows that you claim that you either hold the 
copyright to this changeset or have the right to license it, and that you 
license it under Buildroot's GPLv2. [1]


  Also, the title line of the commit should start with package/poco: without feat().

> ---
>   package/poco/poco.mk | 88 ++++++++++++++------------------------------
>   1 file changed, 27 insertions(+), 61 deletions(-)
> 
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index fe1dd29855..c5f418a664 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -9,7 +9,6 @@ POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
>   POCO_LICENSE = BSL-1.0
>   POCO_LICENSE_FILES = LICENSE
>   POCO_CPE_ID_VENDOR = pocoproject
> -POCO_INSTALL_STAGING = YES

  I don't think this is supposed to have been removed?

  Otherwise the changeset looks OK.

  Unfortunately I cannot apply without your Signed-off-by, so I've marked the 
patch as Changes Requested in patchwork.

  Regards,
  Arnout

  [1] https://developercertificate.org/

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
