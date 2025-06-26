Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550FBC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CA8841931;
	Thu, 26 Jun 2025 19:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NgNMJU-GZZz; Thu, 26 Jun 2025 19:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4039141923
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4039141923;
	Thu, 26 Jun 2025 19:28:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D3CD10A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73E1840314
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tXwg9AtDEiG for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:28:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07A5040075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07A5040075
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07A5040075
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:28:52 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso9620585e9.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750966131; x=1751570931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VC1qLIw3bWi4/Wniz7eowqMgziwtAPvc9V7dAiLPg3M=;
 b=hGDF58nbMh+y1h+tED/opl2M5Nt5UpDmnXJ+g9SNFXLBenhOhVs3lj9kTiDLocKnzM
 UVwrWQaje0a9pVBLHVUmuH8CKdkBuscfSHfAG1/nh13JqNJyr8COow7DLH8EPi71BU1O
 ppAOjZ/x44XMyKOTssBcLbaBVdwdpcC5bOBIBZYVgXe6LF2XAl2fQbWRs9zzqjrUwM2v
 edc+0VgWmtvcMCkLYdj9U90HbUvR7mztI4FYdeyOdtkhTK7XKQYMW75ndwwei2SVajlw
 i7ppJ5r5pCwZkMnDvgGz3k8ANeyE0tNEiMrjjLnJgYogs7fmOcuGP333pNzRumswhDSy
 jy6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYqExX8w7k3B7/Mcj9RvrUYD92vfUagEuPXRAtUupaRwyqPDR4EXZkx7UsVZiA+A0BuO+ymhq0sco=@buildroot.org
X-Gm-Message-State: AOJu0YyD6gqTrf49sf6fcn50k2oWxtmZxHC5LmPeFYmeRYK1oyc70yn7
 2M5hBVtcCjCSIqlL1KAaOS4UhhI1/yv0brxaK6hS3z4TmIijLVBHu4Ps/WPvpgEX/Fk=
X-Gm-Gg: ASbGncuE0B/rFIWRBPorwjpdLG6PZ3O9idsLNidhqmWnNhbiuOsNYVwRYHFY+hZNZQD
 hjDRHhonrjRaBBiIApStg3JLWT4t4cyEJlD9g1Dj0jVEcson5MsftgZRoie7Ncto6spwZiNyAio
 OIovtN9NuEfbo04RhxhNyvwABeNKR3j7uhYA7/KyljW+xj2wvs1U4OVmFZLZ8qX/PwhUXM+2q/n
 WIvf5W3aqKjZjLTME/VBYBxawvHG5kZeUAqMCkF1TKLz0kN+r9U3NIK9X12fkYixeDwWZXFGP4q
 raIAvjSirS8L6S6agW2FtepOLLEPVuBoj+397OzeiwTlqzoywUKNjLAM5rpBFBrnf/Le7fg7L8A
 x4bzu73TGVOMRzjWCNd9Rhzi+6Y7KBbr2
X-Google-Smtp-Source: AGHT+IF8mibs2q9BHgyh22C5rNmi2iMTvLoYWTIs9KbH2soEjG7UfgHgffKWrmigR/mG/fZ0dMW62w==
X-Received: by 2002:a05:600c:4706:b0:453:8bc7:5e53 with SMTP id
 5b1f17b1804b1-4538edf9e08mr7268425e9.0.1750966130636; 
 Thu, 26 Jun 2025 12:28:50 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538233c1easm57954125e9.3.2025.06.26.12.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:28:50 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:28:41 +0200
Message-ID: <20250626192841.11691-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618184751.755758-1-bernd@kuhls.net>
References: <20250618184751.755758-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750966131; x=1751570931; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VC1qLIw3bWi4/Wniz7eowqMgziwtAPvc9V7dAiLPg3M=;
 b=I/ta1NkRHY/IdtwoAAJq1xTKIOrANaBClxWOTZLfpVa6Fo91PZDhPzZTojwM7jXOKz
 N2IFS+oJNdbtKg9BSrP5B3zFX0WWnRLhwvxAduWPwkE3fwJFNhjJNfFf0Vgkz4HpKjMd
 B19dupbRYac0RgAMG4M8VLFPutFF6w/cc8bdtIAc7cGwKLA1QOAba46v6A2qHhBB7R3k
 XLqOOaozruiA1IIcm5DrzKkPHwn5exqsIItzVo7LZxDh3IxjTX6hRqt22syYTIwOxXXZ
 19UEmXjF9MpJeutNVZRvfAMSp+BEg0udadVzbxmf9Im/g7Th0E8fnHXyn4STFw7cdBJ3
 +B8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I/ta1NkR
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 1.0.9
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
> Fixes CVE-2025-20260:
> "The code flaw was present prior to version 1.0.0, but a change in
>  version 1.0.0 that enables larger allocations based on untrusted data
>  made it possible to trigger this bug."
> https://blog.clamav.net/2025/06/clamav-143-and-109-security-patch.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/clamav/clamav.hash | 2 +-
>  package/clamav/clamav.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
> index b5b10d3a13..5989682671 100644
> --- a/package/clamav/clamav.hash
> +++ b/package/clamav/clamav.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  4783f2ab3fc323a887c117c672dc0b4e7ace72d76f8c06e990bd49c3ef58f10a  clamav-1.0.8.tar.gz
> +sha256  5d3a20633bd589f612a71905a4fb50c1ee857cfbe6c72644368cac0030a1eeb4  clamav-1.0.9.tar.gz
>  sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
>  sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
>  sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> index 42be9be41c..0a88cc1b9f 100644
> --- a/package/clamav/clamav.mk
> +++ b/package/clamav/clamav.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CLAMAV_VERSION = 1.0.8
> +CLAMAV_VERSION = 1.0.9
>  CLAMAV_SITE = https://www.clamav.net/downloads/production
>  CLAMAV_LICENSE = GPL-2.0
>  CLAMAV_LICENSE_FILES = \
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
