Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60C8C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CFC380F23;
	Thu,  7 Aug 2025 18:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlgfgMHrqAbD; Thu,  7 Aug 2025 18:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CC4B80D41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CC4B80D41;
	Thu,  7 Aug 2025 18:25:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7448A4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A7C440550
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mO1z_t9IBzUk for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 627B0405BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 627B0405BE
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 627B0405BE
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:45 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b77b8750acso882477f8f.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591083; x=1755195883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVjESTRESoytw/QxSLIw4t0t6KL4xBHa0I+MeAkq9yQ=;
 b=iN5RsRdxLpQk9HvwcVrgD/HxHvnjGmi3Vwzmqg4x1W3bbuMvfiGxuDFh31dWnGPKCc
 UtNb7BceVFyBdNXS3Zw61RThyGOXNmCArbuIcMGcILMQLZUHWbL2ZKlwXqNxN+Qsat6B
 7kLpfVmE+H6yCIlwm5OgOfFfYuYCpm08KzT1QNeXrwjpBbRUXDk5F+X3t/MDO6ttTdju
 YUjsN+AA1vUM55xFsHh6BG/qXP+v6Ga9k3lNrqqaKdhvCts5X/J5t54XQ4fT3f6JoWZp
 8Tfd0q5RVgkE+Qw1WJAuDSI72U/lRiWicXlA213+RTsk4Kx7HFLUVTCmx9ekhOkdDSDt
 iHnQ==
X-Gm-Message-State: AOJu0YwIiFcGzIAWPDnvNlnd/Mx32XigQ3+AAY5QtvmER9DJF0/rm/oO
 4Es24NxNpIXT8LFHlHAO6PrFBPVa5CFOF1AUpbmza3QVocQ2LiAu2O2UEriCkR9embk=
X-Gm-Gg: ASbGncsqvrBEmktDe5osujXdh44LxR9N/fRHFW3fZHOpKVN/7OMwkIoUA4k6cCo7RTL
 K00UD3II1Qewr99RgLnHhxeYllumlQrATHG4sxr5jIPkO9aprgJQYas4rxWhjio8SeC7uygf1ie
 mx8pF8SUCGZgvrsI0Acdr+vPtLsCQdfXz0J2Ubx0kUGAmUQrmnaezCwbraVmldrEVmxUApFzvh+
 fn7tp/aTI6BvVbC+c0N1ewXp1ou2pxsaXxrAu9oX3OZNcz9K5blhW0eVhusnkJv/YclpB//Hi2D
 uimTIQsGjAaMsGiBlIT6JuP2rqvjR27gGN7VeiUe8ER67QmTDJvfEhrzo63fDoi4qDKbGwaZFoe
 X8IbktHdeFMt2Kw==
X-Google-Smtp-Source: AGHT+IHWE5MvaWLfDxyPDDPU209D571gB1BdExEkHvi6OvSEHX0E03JM+DggvnqFs2ygV2ueHP2tbQ==
X-Received: by 2002:adf:cd08:0:b0:3b7:8ba2:9818 with SMTP id
 ffacd0b85a97d-3b8f97df934mr3081469f8f.22.1754591083474; 
 Thu, 07 Aug 2025 11:24:43 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9160sm27682432f8f.21.2025.08.07.11.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:42 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:42 +0200
Message-ID: <20250807182442.726104-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250727082253.883440-1-thomas.perale@mind.be>
References: <20250727082253.883440-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591083; x=1755195883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVjESTRESoytw/QxSLIw4t0t6KL4xBHa0I+MeAkq9yQ=;
 b=ZY0TQSNVVHE7nRuASOlUnkvBft29W2aFr4tBOqZJJJ2b1XyCn6PXhwe7Aq4ZW74/0y
 whVXCZI1ux4ZHCvbrHp0mOPDntCxTVxUprGxuAAGRtyv3rFCOgPA1Nmrw1B5ZcZbIpyE
 8bKdJaCWnrvOvlSSZYGXARkQIHwZmTbFy2f0QXFZnrqXOFvE5txkvj5RHEGPzv8M9Ql8
 iiRZA//kGDYATdTh8PPqcZZjAmA1wkfM0qCHVdf2kHO5oOy2bJFnNm/hCw1bsKIkhTKS
 0yNyf1IC5ceW3zukXT8AzDwYhdNIx36NPXvV+MsR1hPMUj20G5VX/cpwxMsK3NxeMqof
 r1eQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZY0TQSNV
Subject: Re: [Buildroot] [PATCH] package/qpid-proton: update mirror url
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The current mirror now only has the version 0.40.0 available.
> 
> Older version of apache packages moved to the "archive.apache.org"
> location.
> 
> Fixes: https://autobuild.buildroot.org/results/853/853c354b9bde4408e122046496fd3f0e7ffb0b55
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/qpid-proton/qpid-proton.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
> index fae6ecc413..1f92068f18 100644
> --- a/package/qpid-proton/qpid-proton.mk
> +++ b/package/qpid-proton/qpid-proton.mk
> @@ -6,7 +6,7 @@
>  
>  QPID_PROTON_VERSION = 0.35.0
>  QPID_PROTON_SITE = \
> -	https://downloads.apache.org/qpid/proton/$(QPID_PROTON_VERSION)
> +	https://archive.apache.org/dist/qpid/proton/$(QPID_PROTON_VERSION)
>  QPID_PROTON_LICENSE = Apache-2.0
>  QPID_PROTON_LICENSE_FILES = LICENSE.txt
>  QPID_PROTON_CPE_ID_VENDOR = apache
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
