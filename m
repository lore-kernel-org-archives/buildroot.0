Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E7ACCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D0F683126;
	Thu,  9 Oct 2025 14:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6-bpW7xNwQt; Thu,  9 Oct 2025 14:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D32682B69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D32682B69;
	Thu,  9 Oct 2025 14:54:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6200119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBDCF4105F
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxYOJjfy8mo5 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A763D41068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A763D41068
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A763D41068
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e504975dbso6781925e9.1
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021688; x=1760626488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fRCAvWTF85atL6T/97qQbUlTgV0rEIAbadZAri44wa0=;
 b=JBFteg60Z/8fDsLuhEYJq/1HQq5UJ3sEayVd9Td3RZYQNnIo9AbJ1xnFXxsfLWVbIF
 YoR61GM74S4xMVaQENidIgnheaU2Pl1TsQY/bCXB1pUPx9KVk77YbrK8ECFExZwgczKf
 /zoOdByY66Y4LVLe3vw8gCf8FajqSyCur57Fn/vqG3YdfMxxbDQ7OHDos9rP6Oe2F4cl
 FiF5ZxwEZuMmdF0yVdHn76b3xZWaZM0L/a0FWmRgROiRnakXLMr30zCcsQ/3Ze1J7x/F
 uMlj8to3PW7GaT83S32zleGh+cvt4xhsRTiEaUSQHET+H4Kwwg8gnsnJ7GZJoYm9wmXY
 hD+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVryYvahMIMTgQKwA928pzx2I+xofyPFaA5RzPPPYpF/YH/Nnioq+bx3gBbFmWP97sVR0/OG88HTYg=@buildroot.org
X-Gm-Message-State: AOJu0YzuCKKrPgwX0NbFRo0sI7awVV1jOkBdC7ms4WfNn9EE4ff6bBi1
 4g8pxl5KE4nHooM9t+xDS5niaK34FZtFLOzETvumBazlH8rnmU5DPNPAPkpq+dCBFv7fb7JmSNV
 DIaXN
X-Gm-Gg: ASbGnct3x3T8ZfLBHzwXTa3iAUlDTDiNwZGCTERFVoNSim3knY8717DIlM7ZKAXLBpR
 E1xwhYdZGmVgTv90V0ql5Bl82F0W6pf0wEDYvcg33nI1NZTCo66i4GgcpCAYSAGExk4M/9bYSFy
 9wZ+j1+miBAp6CY5pNY0hOjeWv/2hFdtPUNlsTSnpfjxwZ9e/s/vNgH5vrUC2zZhcyeTPpl9NCC
 IBUhK15hWn7ni0jrHddxFRVOM+ENw8DVh7dlQs0E4UuLDtJQh7mz44g6oBaNFj87LaBFkSaBw59
 PdYPpDoumg/P4nkfP2Y8NVJfFhyi3osFJLCKj9c1Om72xzKeVwhnvfMaLa3jz8xBIJyqpLX752O
 aeFGthKbngvJxEPy/fLW4Zlk4ckzegiPkJp7zOLcw
X-Google-Smtp-Source: AGHT+IEP2X4etdLcuiotMaq4kcJq8UrsRi18hTNV1SUYEkrC8+WQHtZwsVasoJ/q29M/8IQGeExc3A==
X-Received: by 2002:a05:600c:c162:b0:46e:5a5b:db60 with SMTP id
 5b1f17b1804b1-46fa9affbe0mr62262905e9.31.1760021687614; 
 Thu, 09 Oct 2025 07:54:47 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb484d056sm1216835e9.9.2025.10.09.07.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:47 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:46 +0200
Message-ID: <20251009145446.482578-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003143803.648043-1-bernd@kuhls.net>
References: <20251003143803.648043-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021688; x=1760626488; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fRCAvWTF85atL6T/97qQbUlTgV0rEIAbadZAri44wa0=;
 b=BH3brb7tveMhGy9cGrkLzIEAcOO8n5Z/GG/ssGR4u3PQ9bcIotZvIHWS79VevkvNRA
 Kx0II295scjF7R07vBH5sMtPesuqNceP9y6DMIDCeeu0pZ3rCWZC+OONVjiZhodabqBC
 QuvMGneFMAoYJSPaDXTzdAXHTRmionch4HJfuS9olWj6UgZX7XmH6VTI/k+gVpQdpONo
 sFXU66odCRbJFjnfhHL1f2VjsLESlkKfMvflGEHN4cgjUas6FfQKCd44yvKCl2ESrfd+
 UaajsPX4qs6FcHhOWvuzTc1HNNWqVlGYPHDxNnSTMXDIocZhiagDgz6+2IOsZb6sfJhJ
 LNRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BH3brb7t
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: security bump
 version to 6.5.6
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
> Release notes:
> https://sourceforge.net/p/fetchmail/mailman/message/59241831/
> 
> CVE pending assignment by MITRE:
> https://fetchmail.sourceforge.io/fetchmail-SA-2025-01.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/fetchmail/fetchmail.hash | 4 ++--
>  package/fetchmail/fetchmail.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
> index c4b968a89a..9408aacacc 100644
> --- a/package/fetchmail/fetchmail.hash
> +++ b/package/fetchmail/fetchmail.hash
> @@ -1,4 +1,4 @@
> -# From https://sourceforge.net/p/fetchmail/mailman/message/59238340/
> -sha256  f989b62729c76afbcd65ec43b9c477f2d990f0913da141ff8166aa4e2bf56025  fetchmail-6.5.5.tar.xz
> +# From https://sourceforge.net/p/fetchmail/mailman/message/59241831/
> +sha256  ec10e0e0eaa417313559379ede76c74614766d838b39470b66474863aa690dab  fetchmail-6.5.6.tar.xz
>  # Locally computed:
>  sha256  a502ffd59034feee7e924b29500451b984992ae361bd8084736afc470f32135a  COPYING
> diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
> index 3eec63f071..e7539c5d98 100644
> --- a/package/fetchmail/fetchmail.mk
> +++ b/package/fetchmail/fetchmail.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  FETCHMAIL_VERSION_MAJOR = 6.5
> -FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).5
> +FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).6
>  FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
>  FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
>  FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
