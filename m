Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D379EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F05F61681;
	Fri, 13 Feb 2026 19:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lzyuY-8RuvfK; Fri, 13 Feb 2026 19:38:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D9676167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011520;
	bh=uvxfJzrS2/OmeUo9WXuaKqSqJ1D402kEg3/HZ2cHy5A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sSy8yvlpwwEXVaOzHi3gcPzQtH/bxowYMa71s273SO/YGcWoQOWtenKV8y9frQNPL
	 5jWPKHDak2qO8aAKfrb7Mlk/7/U6Qvi7rwv+a8jI2uqUQKHCmgtlQMdlS67mH3YpTb
	 9ooBK3zrBEb7MNooeN6OdK1cvbqdPzhRGkqkVJRLGA8RPlidE5HidlD3L9MyBIfVRu
	 d/ReXac0/WZe85OaERSRBsa1S7Yc5wn0sNYqjvun5coUOvN0SwYcUXw1ATwWYNlW6r
	 cLUWRhawcs01jZN8kDQYCyHLmfAreLj6lWjpNR3oONxOc/yF0dvKc+W7KrCvPKy0y5
	 DwsxHHA+DZ4BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D9676167D;
	Fri, 13 Feb 2026 19:38:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E5D769
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EC7E615E7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKWYmKIexKbn for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31A77615DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31A77615DF
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31A77615DF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:41 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4837584120eso6435985e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011459; x=1771616259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CEdWg7tyx+iD7ULUQpSPNkjFiQIXDOpGDE1z/hms0MQ=;
 b=lnK2dFkGduW+1mhZEmqiLVuXTHKykr85k67ajU3h1Ccj6Nnx5jAGCiuH/JjalcF0LG
 JB6M68wG8TfDEqc+K1bxrKxBgIbIGn4WGpEEygxfUYJ5NYIKgsxvdp5dOgTPI4l/xufC
 BGK2OMXjLgiy8PiP72XQQezSwE4GBFPC/ZVuIfc4STBOLRR8K3dhz5lPJTenmdrhZ/32
 fvv6hKkBbcr9YmrGfImf7j1CGApP+/qpNNQ4wA6upapUhPQyMTOFPVuUEArUxBa9a3lG
 mztgws5XCkuk5Tsb9Zdeo/SOQkPxXJ9XqE3mWr7uU4eRORy/Uw/DiUwEJROzCYhr8Hmf
 O2+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyP8I3Bl27BkvnF3NyO2lGY6sS/x/L9A+cfbaDdkpx0n4NM4YEnBaFuy5cgLNa6yBaG34uk+mO5ts=@buildroot.org
X-Gm-Message-State: AOJu0YwNaTq42QUy1weI2MLU0ICDJg68JlgMz3SxjUvhHhnXTwcmV4cP
 4m4/yEPRuIzoKvCrZsuQMOzQr0fnY1i/8NkD9Qk4p2i19hu18eVl816iRYohnamkybI=
X-Gm-Gg: AZuq6aLANQv2wttS+UFz3TnlqflCf9x65aAdETkfDkCW5+KB4EHkpGKl4H01f4TBo/i
 U+UkpZShnB2FfeFobunLrpXrPddmYfsve5ypco31BintB00MiHtLvc705tOji80LrdpkKChrzcK
 e7k5pr+6NN1gpAnT+yrVmfEC1z357diigS4o9UviVLRoDmn4QeyNoQKsucc9qIDdNZlJrif7UlP
 7A+e+GgmH6u2cSIIrhND5NFGgfzEOQyMXfHP944cXh3rBhfAMcJQ2Y/s1oJG3BIVfz4f2lmzJrr
 WLaRCSiQXXmDLS1vAATuGUOZX3RD2y3zKnSRaZYIKgtlTN/gBsUjVjgIT8hrsRCMX9BDVSDqmK9
 sQUVeqHZHXmkF1hTK7jfZRkxmJjxp06u5TP7CKgcsA3g3cGMuwh3n5y82n+gW+CHDvEdt2PTDFe
 +cup3VYJaiYX96Pmc=
X-Received: by 2002:a05:600c:358c:b0:480:426e:9d38 with SMTP id
 5b1f17b1804b1-48379be6056mr5570115e9.27.1771011459216; 
 Fri, 13 Feb 2026 11:37:39 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d834ebesm281024045e9.13.2026.02.13.11.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:38 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:38 +0100
Message-ID: <20260213193738.40191-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105194056.2156773-2-bernd@kuhls.net>
References: <20260105194056.2156773-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011459; x=1771616259; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CEdWg7tyx+iD7ULUQpSPNkjFiQIXDOpGDE1z/hms0MQ=;
 b=emSD861pvP8Ay4Y5KExtU8jXa2iLwAX9Ae43+GyAgYQN5zFC5atO9Fzu6UN4Y5A5lp
 0xdBLlb5hXcO+787hXbUXcRlMRiOUbhKL3yRscuq3uSDRC55syIbHyhHKmG19b6fOf1U
 uq8U0RkLz6i/NOVAUQ5Pnx5Sg9rzCP7EXdDfUeDI2UeUJ2E7NtGmNBe9UYqvy5sdCGjS
 fpYKbFrrsyiAGrfCVPXeLU/7Z3G9ZcNNiFrVJAjsAY2MrbNUCVZG8IXi8e3r0XA9N2WV
 DCD2a38SyT5ksOXIT4aqjUvY0O5BHVjIfIwJbGsQvhMg1/bKbOF/ckHw7WMN4it4aUOi
 erfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=emSD861p
Subject: Re: [Buildroot] [PATCH 2/3] package/dc3dd: needs host-bison
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
> Fixes:
> https://autobuild.buildroot.net/results/f11/f11b0b9154e9979f3f2d7ea84a019f7719565e8f/
> 
>     ../build-aux/ylwrap: line 176: bison: command not found
> 
> The build error occured already in 2024:
> https://autobuild.buildroot.net/results/dea/dea779bbbbc08c7192f89073b93db768c41832f4/
> so a backport to the LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/dc3dd/dc3dd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
> index c31ab9e1f3..e9cb6ec7ac 100644
> --- a/package/dc3dd/dc3dd.mk
> +++ b/package/dc3dd/dc3dd.mk
> @@ -10,6 +10,7 @@ DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).tar.xz
>  DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION_MAJOR)
>  DC3DD_LICENSE = GPL-3.0+
>  DC3DD_LICENSE_FILES = COPYING
> +DC3DD_DEPENDENCIES = host-bison
>  # We are patching Makefile.am, so we need to autoreconf. We also need to
>  # enable autopoint as dc3dd comes with an old gettext infra.
>  DC3DD_AUTORECONF = YES
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
