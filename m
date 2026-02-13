Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84944EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 566CF84844;
	Fri, 13 Feb 2026 19:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMWeJBmqkxuF; Fri, 13 Feb 2026 19:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6907184A19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011688;
	bh=jRhnAdBi2F36Y5eOBHzUiELxi/3aEXysybuBV1Hj8nw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EjOgiCve8+eqMWTNOQZNZkeE0Z7WJKXWd+a9s1Y0BUbE+h5fjIYv1lNZOVuf2+CM7
	 HcHv7Q8kfR+e9v/cQh3E/RuSOVPCNSK6KXT9S+/KWT2aDzaAEZ6m5v/QsKWj5K7MFY
	 fuCP0A5QR7cOwe5vyawN8oIe5681ZQg8qx1B6VNJE7+pZmCzn24dsj2hroGA6zSHeu
	 3SsbAjMQWmiLTBKIpdVV5fbZbqJ9zE4QO1bAFiL8R//3ozT+HtLt7jTwu9UL48vJxe
	 nJWXLeUKRIs+wpfqG7BqiQjQA4F4Fs0zANwqXd8HeWezKZcgX0varDOOonksyYijIJ
	 cEWOn/UO+YksQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6907184A19;
	Fri, 13 Feb 2026 19:41:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33391283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21B7561429
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUbv5SemR3Tf for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2530613EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2530613EA
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2530613EA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48069a48629so11765815e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011679; x=1771616479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wj9Vat5NyEhO485HXB7t2k/JGxmlyxUzSTAIaIjPegw=;
 b=WTDsx7XWhOhEJ5dcd+Gbb/cBc8YrD6yLPgrCCme1QGgObjGJ0RMg3aLBCg5tasuANZ
 JbQnbJ9K0RrNSglsDb5ByqjYie36KvZYpNwEgx0Ih1HOoevIU4IJWhecLrtp9FbcZbP6
 1jh8GCCVkL1bZKllr2Qq0N/ZIPd5VUKpk3sEqHY1yzALQI7He11dfSZiazY+Wo8T+SOW
 DSWR+R0FSOvBVqN9gr9tmNtEkUKWe01y8Q7iy+BzFMnWmxnYhoqMzBYXfDYLrhQDxoeH
 jcsx4Zz+J9y+ET2bn4OSjlhbPhAb8cBwwoN+Y2tdp31PiWXJD7GdSM8vLSUsCR1ysEDn
 gQaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFO2mV22I+5wVJRW+swoVp51Yn4n2SKIn5AxgVPRvnLdKGlWAfgpNDLU3NVgTsH0Fbhhm6i21lUrE=@buildroot.org
X-Gm-Message-State: AOJu0YzCRGK94aSUfdle2i4aCH7e4BXUMPn1OqGzRE5MkNKy5+zXzTzw
 Tkw53JUmfvH/Ke7YeJo+ESEBwYsqnCS7TAOGfcDY/y95oBQRn7uxVMUIezVWA6iRxyEdsSaHH7M
 RaDvg
X-Gm-Gg: AZuq6aIAOSUI+dwXsYWhTBSAEV9+8Z8fUhCj3yHvjOc7/mFfyZpPs6v6BUBy4S2J9J5
 aEI3RHyLR0OLMNyFYnhzztf+awzKjQ9X47iQNC0WhpJ+zCNPKGFh9Xqsd8ASyEvXDnEbwWJiEga
 6ZcLeq/oeQYVica2SEkUTNVE5JtBLmKshgCH3wuBK+hBm1rPwEh05Wk4WjhaSOAL5KCuuUySwUX
 sRwbYbz0KnhrYIUAZ3esAbhkZ2g1f4F09MzJPPHxcTSl44qhp9hpjaEBzysCPxc5QzMxAXBnlle
 5SUaCpkCkvIR4TqF6KT+o8yYvoMSTY3ZV9TKcOCpiWPtKNj+E8uX/+BGVsNDbS5grawKhUB3dm0
 gsM0dF+I9Bl2kJViZasgEhVLTHSM+ZWOgVJYHFEcnsXQny0SO4eXMSqIDJrt4r9u4eniG5j6C7v
 bWMhyT99zDVBWfBEE=
X-Received: by 2002:a05:600c:64c5:b0:47d:6856:9bd9 with SMTP id
 5b1f17b1804b1-48373a3e73dmr48638345e9.23.1771011679022; 
 Fri, 13 Feb 2026 11:41:19 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd0e15bsm182226895e9.13.2026.02.13.11.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:41:18 -0800 (PST)
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:41:18 +0100
Message-ID: <20260213194118.49136-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204164512.243312-1-thomas@devoogdt.com>
References: <20260204164512.243312-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011679; x=1771616479; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wj9Vat5NyEhO485HXB7t2k/JGxmlyxUzSTAIaIjPegw=;
 b=WayyaxDm1QaRepDVess6qPbZBBNu+o1dWPmrnQ+NVDwnOZJtesedNDDB/GWiuCwEu5
 iSNt9DdipaQGGUeIN7CSDEzHigmLEazZe2J9Fl9JsPaUY/1UGBN8Ic9O63g3h4x7EmuQ
 qQDd6h+p76GP9wfviQ9QfcZpq5RnoCzexrYzL8KrSKiVchNWjTpoPrOCzjRxD61UPGyk
 BWvb4iUoTJI5UslExEc1pRjDc6w0papjRnR0XJy6rQGHI4N94kUgZk9t37Tn/uvD8u/A
 z21iK2gXoV01eS59pD0F6vG72iM30o2Ii73MMr65yEY3aOL0qTszkfAuEwy/BMjwugPZ
 7/NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WayyaxDm
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: security bump to
 version 2.50.4
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
> News:
>  - https://webkitgtk.org/2025/11/19/webkitgtk2.50.2-released.html
>  - https://webkitgtk.org/2025/12/04/webkitgtk2.50.3-released.html
>  - https://webkitgtk.org/2025/12/16/webkitgtk2.50.4-released.html
> 
> Security advisory:
>  - https://webkitgtk.org/security/WSA-2025-0008.html
>  - https://webkitgtk.org/security/WSA-2025-0009.html
>  - https://webkitgtk.org/security/WSA-2025-0010.html
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/webkitgtk/webkitgtk.hash | 6 +++---
>  package/webkitgtk/webkitgtk.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 90304074ac4..3c2f7aedbd0 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://www.webkitgtk.org/releases/webkitgtk-2.50.1.tar.xz.sums
> -sha1  b599be86497f57fc5b2eb8b5d60ff181fc651752  webkitgtk-2.50.1.tar.xz
> -sha256  33e912ee6e3cdb4b9803715f50686af85a60af47f1cf72a6acc6a2db1bb3d9fe  webkitgtk-2.50.1.tar.xz
> +# From https://www.webkitgtk.org/releases/webkitgtk-2.50.4.tar.xz.sums
> +sha1  719c304539cecca945846700cefebc7339eb5924  webkitgtk-2.50.4.tar.xz
> +sha256  d3bfa473845acfab72635bada5e0d134fda6792c5b95c5c5cd141b46125bd8e4  webkitgtk-2.50.4.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index fecca3529d8..d9aa48f024f 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.50.1
> +WEBKITGTK_VERSION = 2.50.4
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
