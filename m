Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8215ACA0EC0
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A9680F75;
	Thu,  7 Aug 2025 18:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2g7Uni77Fxu; Thu,  7 Aug 2025 18:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD3780F5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FD3780F5B;
	Thu,  7 Aug 2025 18:25:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 328AB4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14272405D7
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpO25o32HRmr for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A094C4058A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A094C4058A
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A094C4058A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4589b3e3820so14090675e9.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591091; x=1755195891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=66tj0DjTlR+Xz92Js/n4aJ3k3wa10cxdNlgas/n7YdM=;
 b=HWhERKpmMvunpGqUeWTIA3di3WkKMPRvVzLdXLvltyuSChPQwAgy6FUWBE7dA5RrUi
 0eYUkOmyvkcSRmPL30n5diVam1RqxUdSbF2FsHgpg+xlPlaIk5TIvS3/EU0UAyOlR/G+
 t78+cGn/bedNrdyGzNsv0M3UZHJpR7/E/n8TCYvjDSySB8XGe4uhsXcv5IIOWwSfhAeR
 BJxUwqAnbeemGM0eJvMVaxPbEQ4FtBWGYGMPYGgaLUeMyjhHCatGwtEqMLDDrZvW0F/Y
 6HWlCsm5w68NBV23A78X5dPnOONnOlGpfeQdLnvs85NDAUseHMBP0HhmnbFItc4oIjFA
 5sxA==
X-Gm-Message-State: AOJu0YwHggh9j9LmvHgdXScybPm4Fyv6RolaucGf4AFc2b7V7cRMj8X7
 seUMXttpROA8CjKfh5lwuUV2Kw/fqgvb07t0pQ3UpYF8UEwKJX7DcUGb+obWQX1hbCY=
X-Gm-Gg: ASbGncsd0iYy6AVNhaV4/bRiCA938aqjxbE+4nn3ZK/ofjz3DrVhbk9Mel5GqpNy3CS
 mw2k2pEwR1x05EcdXg7iNmbBsVLpur+SsTpYfQg8y7ZmYI3s2T9iBs+ooxTikUUVoIGV8bbzGVr
 4VNGxqgYItDcyvnoJXNyS3JCdXaFaOpPUnBZDnX8/yqvLT/x63WB3NmHzPgb3E9sQ+9d/4Q1M1M
 SpmnjKNnOco3dkZ3yMhWE57Z/F9v3NSrPOoW+Ymu/MQwplqVkHhDDUMX/05B7uec1eQxGQxm8n/
 dS/kajlIkRpqShR4DLwWHMzyxDYHHQM6Rg7pp3EJ4d212sRQUrXgx6hQ/qv7A/Iyb0HHWdZ94K3
 Cshjgrdt0sxuDZw==
X-Google-Smtp-Source: AGHT+IFLIMll6gZh2e6XuraSNY6et6m4gnUoz6bT6EPf2c1qxZUJpAqYG2gq5E/vj4otGChbvf4R8Q==
X-Received: by 2002:a05:600c:3d97:b0:459:e200:67e0 with SMTP id
 5b1f17b1804b1-459f480823dmr4999185e9.10.1754591090675; 
 Thu, 07 Aug 2025 11:24:50 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0b2d2fasm17287832f8f.50.2025.08.07.11.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:50 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:50 +0200
Message-ID: <20250807182450.726527-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803133846.2762327-1-thomas.perale@mind.be>
References: <20250803133846.2762327-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591091; x=1755195891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=66tj0DjTlR+Xz92Js/n4aJ3k3wa10cxdNlgas/n7YdM=;
 b=Z3P0300IwM5I/1JTOSdQWwEmvG9a909WdIey59KSaviqFGXGtH9gX2DQ/r3GfV2hEj
 /uYe0hzUWpENiFgtkk3DAoobawb86KnK8IYm38YO9hKVwkz3JYFWPrV/w4kmM5XT4Tqq
 Y+dFgye2jvcdt4n8QxoRaeGnLwXvKsp2/PAn6M0D/9XFtxwYKldJD6bcRxWjBudPj0YP
 QfJ3+U/y1B+5Lt2gbnyBuo2oMwUdsKj8y26u7kkIga0jBkOf7MGTDrC0N/+I4N6NOgbO
 5JkcPLzVD5jcaqTVGsLjxblAU4hx43QBNxaHPcRWYUFlRaZozribEQ+ofPqxEPW1zYQV
 3Ejg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z3P0300I
Subject: Re: [Buildroot] [PATCH] package/sqlite: ignore CVE-2025-3277
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
> The CVE-2025-3277 as been marked as a duplicate of CVE-2025-29087 by the
> debian security tracker [1].
> 
> The CVE-2025-29087 has already been fixed in commit [2] so this patch
> adds CVE-2025-3277 to the ignored CVEs.
> 
> [1] https://security-tracker.debian.org/tracker/CVE-2025-3277
> [2] 835b5659ea package/sqlite: add patch to fix CVE-2025-29087
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/sqlite/sqlite.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index 037b89918a..4f4bc9d3af 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -14,7 +14,7 @@ SQLITE_CPE_ID_VENDOR = sqlite
>  SQLITE_INSTALL_STAGING = YES
>  
>  # 0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch
> -SQLITE_IGNORE_CVES = CVE-2025-29087
> +SQLITE_IGNORE_CVES = CVE-2025-29087 CVE-2025-3277
>  
>  ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
>  SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
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
