Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EAEC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898BF80E31;
	Thu,  7 Aug 2025 18:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hPwDn87sr04; Thu,  7 Aug 2025 18:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7318880E6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7318880E6B;
	Thu,  7 Aug 2025 18:24:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0809710A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BE8440540
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkhNV7o_mmPh for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E37D4056E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E37D4056E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E37D4056E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-459e210bd2dso8384585e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591065; x=1755195865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AaFy0ajc6Mfft8N4Vsr1vyF95L5d8V1QKxnImWn/4TE=;
 b=R4kayObyhX1Fw8pa2c1bNZvEFZjw8Iabqd0/gYFOHsh4ZEu5CLPdDcT70jDqVuUFTb
 qKh+9qqg0aaB34QqgzGhcNk+MfvbyoMtNxK5ZHHduR4K7ea4Xsu38vFDO6lxUofhQzGX
 l8DoD/AmCpKSzpfrtuLMaTTRxuEMHO52nAhjKWV/jteuA/FfbmsCaYeGbyalrX9o5BQL
 2AUB1eW+GSNxKcTleMPWlAAqGJfv+HbP5aPT/kmwx44bmc+pf5Epwu8ZoNTYMtClIfJ/
 8r0Xn7g7k1jlOwQHkNtIctNMKVsb9FnyyIq5mGyuOoalwqtGGBemlH+iHKR+8HDnqSuS
 +p3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYuuL+6sp/OOm0agH8L8B9iJhXUrWJ3nV68Emym128p84bSpRz3pK96iepV+3D8//yGsOKCkZUQjc=@buildroot.org
X-Gm-Message-State: AOJu0YwWgV0bF8LtvOCkIcJwzyE0FsXWMglSJsAJjtzILiIMVRctdlSn
 wZTToMcjMmIOTWeu4CbJ/FgC1CFL0E5czE71SBmOIA0MVp4vgYHs+T14aVH59d7gekI=
X-Gm-Gg: ASbGncu45yMu7wZ9cNKXm4Aajc1R5UBjRE+1SYeq+t0/3h+6jJl7HR3c/qty7SivfZs
 URdFZNcM5lVAbXTR4+ZhE25OEWaMcudWN7NI5UilyB9aYINS8wD66ZecGcrG9970axWuKvXMl05
 NnG15i1aGfMpg9hSPfH+bDWReXNFHAX52WQlN5SE+Ktp6WT7tkPcjJkgZODZP7YUV2g7UeCaoo0
 B6j3HQlpzgm/p0GKOhNxCT9jV8CguWrVVhlo4dXBZTD2k1hZOENgAvRq4F8AeeOYVaxsJRT0pkB
 4hzoxHXLwckaDSROkGLvmkQ2IvrjVfqj0CKlYwT8vdtuq6mO94BZ8B0uTUWUKW9DbXN6d4cqAWd
 pBIytaSm7KnOJig==
X-Google-Smtp-Source: AGHT+IE4yo3gbpMWXkwZpEwmZfqAcITqV6UO2f3uAo+AHa8b6/+nR8C/TCBkmzd9nE6yIBT/o3rz2A==
X-Received: by 2002:a05:600c:8887:b0:456:15be:d113 with SMTP id
 5b1f17b1804b1-459ede6bfb1mr39073365e9.1.1754591065217; 
 Thu, 07 Aug 2025 11:24:25 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abf33sm27724005f8f.7.2025.08.07.11.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:24 -0700 (PDT)
To: yegorslists@googlemail.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:24 +0200
Message-ID: <20250807182424.725287-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725094802.3695163-1-yegorslists@googlemail.com>
References: <20250725094802.3695163-1-yegorslists@googlemail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591065; x=1755195865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AaFy0ajc6Mfft8N4Vsr1vyF95L5d8V1QKxnImWn/4TE=;
 b=H67KOc00mG8Xd99Cqm1rCs1mHHW7BSC+uUZEFUR0Ru+jV7O39zmgRnkX7pUoyfFSfQ
 NUwlo/aBkDpmMw7b2GCdjiyuFox8ozfwTnHIpnncZQHxuwvzcvAnYNSd4VMsiG9mu4yY
 Kpir468d0/17kbBrcSnqDMPy9r4e9VfegUFce7CTqo7JT+ZI1gCx4HtAW2uRcqK+OfI2
 gtYkFHN6Ushall462ouZsUeLbSY7H5yYnoDVlTb+y7DS+BZjM3Zf/S3sHIn3t3Lnlq/v
 5jyrkNdZjUqob1k+SkkpCMazpxtlavDAGjgVIddciR9W6fwSBFCUQc+lFYDDDrmZH/MD
 kEpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H67KOc00
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Yegor Yefremov for
 package/libxmlrpc
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
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 32ed4acdc5..12a41597af 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3532,6 +3532,7 @@ F:	package/libsocketcan/
>  F:	package/libubox/
>  F:	package/libuci/
>  F:	package/libxmlb/
> +F:	package/libxmlrpc/
>  F:	package/linux-firmware/
>  F:	package/linux-serial-test/
>  F:	package/lpac/
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
