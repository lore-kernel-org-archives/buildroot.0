Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB51F9D0D5
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91B8A42B01;
	Tue, 14 Apr 2026 15:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7LpR6zfBajh; Tue, 14 Apr 2026 15:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ECB442B10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181439;
	bh=QhvjGBnr/+2dFxV7tFADIIvyU6td2N1JyFuusUjtNg4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g0RKz2kz4cRryNO7tnxP/GAcMRO19aSbMqLsGQpCVXA58RKv8R06PfiZ94f5c+EZS
	 cXx0t7S/yW8xBCMow1OPZrNwa7WbM2KSz8AECQePk/qT9AhKO90TpN61/f8e9YVy4S
	 LIPbFk4ybgOa+bbVto6hWumIZQYfRpCV4pUxAuKgKYTMDZvjfcJupiDaXar24EjEUS
	 hI1iVriaPvfWZibFq02ZawQsGK2QD8Lqw9DznuH94taqJF760vo1fhbEZzatdqK9BP
	 T9iw/lT7Yro/ILdsaVCp3q7mWyEW/1EVrK4kzl0b719nChDg1545NqtdZC1fJQQRTM
	 vUmRJM9qIGGSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ECB442B10;
	Tue, 14 Apr 2026 15:43:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B53D237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51679400F6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuGG-O2FYQSi for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58D9540078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58D9540078
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58D9540078
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:43:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488afb0427eso70566335e9.1
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181433; x=1776786233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MODhsvrb9XfRa7O5gNN83c7e/DlZemv5Uup6QEKkyrI=;
 b=fi7w5D5u0iV6A64pIAdkNjsQ9UhVFeoAe8VWbg5QFzmP1VS0T1VL7eqOXlldI+ntNZ
 Q8wDARkAgokTp2+BOKCyi46CxK/DU5ineRA60dr7Mml2IDEz00OwU2s9c5ZQuS2GtN/P
 PqpsfDh3J7948c+01NQLsdW6C6Br64ZLE8zJOEGwTH6TzPYJWqOqdbHWtRYE657h2geM
 f6CsIfe0p3lUsdZ5fK5vDWRd2t4maIcJUdgvyynCDaLzlVk6/0v7z1TOVRuv2aAa36oQ
 hVXDX6kePhV5Geh7y9EB51qsbQEweYmywJfRci9qnC7kcrE2P7lSR3q8K3X8Tep2mnH0
 l6ng==
X-Forwarded-Encrypted: i=1;
 AFNElJ8e2sPoIS9NuVEfetBwDdEkvwwmIAw0BFU4UrHcS1EDZ6WuqpsCfRvSwVyB7s+Hy1FEJKq6kM9GG/Y=@buildroot.org
X-Gm-Message-State: AOJu0YxOEalSEgKjTF2RfO1vpC0Tkqdnc5d+DDodjucYaQpZrc3QISBc
 qR/izZtNWUIiSeZ1RsUdxvNhUMTTkf82X14bjyipYx1kI1Y2Vwre3xaSEjNfsO/5XtqjF3PHQF2
 Nfwsg
X-Gm-Gg: AeBDies4II6EyeuKEtfAqDrQZPCUMxPQnXZMvDTOhzzAE0YaNkrkZ+SxpBEqhm+CfkT
 BerMjEytujqGwrGVSqgHXGHpYeOQMG18M77wOkQeX9ayjZp4h+LKt5eYa7+xDYqOdfBD4M4XBq8
 VvbRCCPt8cIE5Wj7B81XfAceyRQIHWulIeQ4fOwQhy42/8xbR5orlagV8tPqV8Xt8ekf9s9dceX
 VtIR2Xk+PN8QKSupTHbQqjVgxHDU/6w7oiTfqtRz1bmiYkltNiFijR9l+bBNSLPx/2fDwFvduxV
 xFxsQuiOXcSzEvk7YjykXdIZjiQBkF41C7WmsNoxwLFvUAzhObkiUjEkNowZtwhHRjYrKermCBq
 DsRtH1+fRwQC3bUlT5PUongqVD3gyCQSlH5JWgStbK+EMcmC+UOzWvxHi6HGQOQnXVmst8EO8WR
 VL8Tnz832WY7mQtnz5uRNpcqOYe38=
X-Received: by 2002:adf:efd2:0:b0:43d:1bf6:30f7 with SMTP id
 ffacd0b85a97d-43d642a4f70mr19705389f8f.18.1776181433049; 
 Tue, 14 Apr 2026 08:43:53 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d7bd2f237sm14585049f8f.23.2026.04.14.08.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:43:52 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:43:52 +0200
Message-ID: <20260414154352.324201-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404102846.794428-1-titouan.christophe@mind.be>
References: <20260404102846.794428-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181433; x=1776786233; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MODhsvrb9XfRa7O5gNN83c7e/DlZemv5Uup6QEKkyrI=;
 b=MfZRRmJc7zCtamd7Nq7YltTl/c2DGk8Ypri3W2S47+M6oVIm3oTvarJ0myGA2PT8e2
 ybZjqQo8CKJAFIu/6aCs/kAwJ77epAC24AqF9HxAaEc5YiwDtNAJHSVX5QWVtItNfWza
 2RNabMLWuSRmevdAmMOFkWZYgxJJpa8YW0JZrtymVj1+4tks/K1lffz0ccxWcUr4v3A2
 0uGsLXRpPSsD4y3CS+E/4DyNxPFw0yBKwh9YTgyyaJjDc29M5qJ2TyDDAAlIS6MyGHXW
 3wLYce110/Gia0+QAWD5ofqIVFgqa5fkHLuO/mNwIi9wbf2vSIgOe4fhfLzKGD87iRxG
 ZQhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MfZRRmJc
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/rauc: ignore
 CVE-2026-34155
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
> Buildroot commit c9f7b876ee5bac0ee7344e5ecb7bd3ac0d5aab76 added a patch to
> fix the vulnerability for rauc v1.13, but forgot to ignore the CVE in rauc.mk
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/rauc/rauc.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> index 92f58c6139..f8fbb5fdd0 100644
> --- a/package/rauc/rauc.mk
> +++ b/package/rauc/rauc.mk
> @@ -13,6 +13,9 @@ RAUC_CPE_ID_VENDOR = pengutronix
>  RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
>  RAUC_CONF_OPTS += -Dtests=false
>  
> +# 0001-fix-cve-2026-34155.patch
> +RAUC_IGNORE_CVES += CVE-2026-34155
> +
>  ifeq ($(BR2_PACKAGE_RAUC_DBUS),y)
>  RAUC_CONF_OPTS += -Dservice=true
>  RAUC_DEPENDENCIES += dbus
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
