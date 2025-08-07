Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF7EC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 081CF80EEA;
	Thu,  7 Aug 2025 18:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-3gmI6E1iOw; Thu,  7 Aug 2025 18:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1741F80EC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1741F80EC1;
	Thu,  7 Aug 2025 18:25:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 227794C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1464A4059B
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOlWe5fXPQJk for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 149F540589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 149F540589
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 149F540589
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:43 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so9024945e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591082; x=1755195882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WXV3xJ6ckin5iyEIFUvE2S0/7MkvP0Q0PyHrBfjVRGk=;
 b=U/QtCByxQGOdaym97WOtx8KogvYAwqipTMl40ucmD8GJ8MxXHzdtQPlBVdc7YhHlcb
 9Us4sPZPbDrKBoV9rikTZPHGzvYO+iil5qeAujstY+3BpgAuBLep3a+PUsWJCN1MNXuI
 QWlmEgwFWZ7nsKsW9/7537ofZB8HX0SQvkzFsoa1GbJMllowYJglrK2ukCiaJPNW4Sdn
 5owD6HKHTCqxPxXWYnNn1iYjoGXqAXGEE5RWZy28GlQcERD78C07QtaoEmbd2iK1LQgU
 nWGjUTOBb1zFAnAgYINSEWCGZsLfCOpZ4bBk2aJG68BNWm5q8x/HN5RVk8FSfoPEkgwd
 1Plw==
X-Gm-Message-State: AOJu0YxJZOW7nNpoM93mis6CKKi4Y4AseW3CxPme8ICEvc5wvL4pooQL
 Tk/igBv8fQvaYZKviRjjVpLu7VUxfIF17SL2kHsrt3S4vKgAqvdtSOLcUGKeFZNgWx/y9RR/z1d
 +SC1k
X-Gm-Gg: ASbGncsLf6lMkyb1vJpAK/L0F2jemWgngTDqFviRLEJOVQezf3lUVvZsAk9i3pj5ygC
 TW488rMSRERTmrGM+GNPZU4MJ9n+03CbvCsHnmW5vsIcEC70EGliU5T1thDE6WuqWC1DRzmsw6S
 1fDky03RwZFJjMEgSSPbUTj5uFHxmIz6n8tkRAdJce/25MzsTY7ttTnc6lhLseWEtdzqXCiOr79
 /cqJ8y1/wJqRU2Me/TNZt7mSHaKZ4DLkUBDrfS9ZJiNyxOy+3E/NRxwdx5/G0IKWq0PhDLV8ZZp
 VogifA6ybhguz005OT6eSV9yVNcDzHY9/+yQvj/EAaYYk4nImmjCqYKLbRiLsPHAIdhcmn4kprR
 mtFQhT6ZA+rnrsQ==
X-Google-Smtp-Source: AGHT+IEaRyeam1ke3jn9d0ydfxIB4/UN5o8FuCNJivx/fsdnh1HIFWYnMnQN8fdghSYKGkYY+xI7Ig==
X-Received: by 2002:a05:600c:3590:b0:453:78f:fa9f with SMTP id
 5b1f17b1804b1-459f436eeb4mr7191735e9.11.1754591082067; 
 Thu, 07 Aug 2025 11:24:42 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e577d0f5sm104504435e9.0.2025.08.07.11.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:41 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:41 +0200
Message-ID: <20250807182441.726055-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250727095526.1006204-1-thomas.perale@mind.be>
References: <20250727095526.1006204-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591082; x=1755195882; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXV3xJ6ckin5iyEIFUvE2S0/7MkvP0Q0PyHrBfjVRGk=;
 b=aLJBW39/DrzG9SGzj9/ATQGdYoE+23Nz3en2BeirC6z1pyHVuYOaBgQYaYxMVP01eR
 qFkyP1lWf3E8l9MbgPHyLwlqTepnIcOIkf1wOEcZNgRCqKyoNI/qs2Dqtyc8Gwj6FC5t
 NtYWg4qDIoLewjwVtgQR9ipJDe8trSBTuZdOoNZYEE8iTvq59grdh9OsDGMOTjoO8b8p
 Ep3CgTsz6tgDaXQdNaNbLVifnShf40jh9OIvrRiik80ye8HJRcm3qRw2exB0fK7eNsSX
 XO5NuQVlDd1z2iXsN8zo4XsgkNyFMOC2XYM7qBryFTnAOuBdjHqwPS/TqK5L2QLYm2vK
 z0UQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aLJBW39/
Subject: Re: [Buildroot] [PATCH 1/3] package/orc: add CPE identifier
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
> The cpe:2.3:a:gstreamer:orc:0.4.34:*:*:*:*:*:*:* is
> valid for this package.
> 
> See https://nvd.nist.gov/products/cpe/detail/37DFA009-0707-4825-B28A-62451B1E2AFC
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/orc/orc.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/orc/orc.mk b/package/orc/orc.mk
> index b2d2bb461b..436dc9d629 100644
> --- a/package/orc/orc.mk
> +++ b/package/orc/orc.mk
> @@ -9,6 +9,7 @@ ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
>  ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
>  ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
>  ORC_LICENSE_FILES = COPYING
> +ORC_CPE_ID_VENDOR = gstreamer
>  ORC_INSTALL_STAGING = YES
>  ORC_DEPENDENCIES = host-orc
>  ORC_CONF_OPTS = \
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
