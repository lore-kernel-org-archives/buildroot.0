Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF28C021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 15:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28E3C40707;
	Thu, 20 Feb 2025 15:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3AZlYiupjhZ; Thu, 20 Feb 2025 15:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24A7540E21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24A7540E21;
	Thu, 20 Feb 2025 15:33:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6337DD92
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 15:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45FE040E21
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 15:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3sexaTm17vx for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 15:33:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28C7140707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C7140707
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28C7140707
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 15:33:42 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2b8e26063e4so471555fac.3
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 07:33:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740065621; x=1740670421;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZBgw2ktvlWdxQUdDmyMS1SzVaa6Htxg+1tBPdlKQ3yw=;
 b=pIONRmUOiEwE9iBZU4SF3FZVTSsUnTO7Vb8KLAVw57+Fsy7b41Xn9PvxCMAHW+hsVQ
 hl0hSw93g7LPWCsJ0nzm++GBT1kvkhWNhXs9kF59zmYyNu7TLTP+rmqsbPQbhsquzULg
 JFARRZEI+VKPeWZ/xS5iz1E7qiFUADxbvi0u20d+nhCDBgxG4Km3rflHBEq5lWon0fd+
 6t+E9b9s4fGYtIoD4chDbVg2dDuKHfCq93SNUnqf1o3T65pyaLWCNFglVA5QSeWMhCU4
 9sZJpQOAmfTdxjnUihSlZk2ujum+dHKdMIDFSriwWOTyF7jvI3bcWWqFZrcIbiPKcOjy
 q2VQ==
X-Gm-Message-State: AOJu0Yzmecr9xJFc++NERCzL+6ETJS+YLLpLiqLgdu67gDbUBWyzTaRd
 3vioTUaoh5E2oUe3EkswlDzP/ju7dC5zTSylX2kuR4gqs2Ogk3d0qUJAu6h7H+cDQX9zYmco4yF
 1MOy27tOyGTgygNhmvhHM3dDM3tZcq2WV
X-Gm-Gg: ASbGnctjQRu3u8mSbGKEJd/YnC8SjiqNlgs9bZZ1cXDlW1+AwLKc2K2AN5lHGkcPgZJ
 aWdDsejfo/r71Lc3lVH1ujgXJN+Xod6uhOXj9N0T32WNh7GzWYOEoJtnZ95+pmpaHqHbhqsyXiz
 w=
X-Google-Smtp-Source: AGHT+IF4GzDfAjfYwjT1aYPZYUWJXkYzW2Hm+etOC34H4Cw5XK3k1/eZV3SHf0BSvRwgim7aQ4o8bK1EpuQ73UKLUGU=
X-Received: by 2002:a05:6870:f78d:b0:2b7:ecaf:59d4 with SMTP id
 586e51a60fabf-2bc99dc503fmr14798221fac.38.1740065620705; Thu, 20 Feb 2025
 07:33:40 -0800 (PST)
MIME-Version: 1.0
From: Matthew Weber <matt@thewebers.ws>
Date: Thu, 20 Feb 2025 09:33:29 -0600
X-Gm-Features: AWEUYZk-ASXpvjw_9hyR7YfpxjFmju2pyhuaZ1ypF4gBdcj_tWOizQlSKwp8XBU
Message-ID: <CAFt09wM4D_jo0u4KtO41h+XZzC3KKBXiohKzvUHPpNo_du3wgA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thewebers-ws.20230601.gappssmtp.com; s=20230601; t=1740065621; x=1740670421;
 darn=buildroot.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZBgw2ktvlWdxQUdDmyMS1SzVaa6Htxg+1tBPdlKQ3yw=;
 b=dx8vnpvPyPruw1hurpkv9GMeFfinGY+AcrdzYf8/z0gzqkfwv6EOe4TV3SHHCLJ5pF
 U/0BTSoT4ZGobJU4QCZYfsTE+4TY4lSFzLSb8HQgTSguJjb+Kk69PS7mvsBJNuAtvZn1
 1jApI8ZhOZfWY5iPbHrcvH2XYkMHME8gEysEamOj/WKslGZIdOJl2yFdYB4LnhSeffvL
 RQGgswO+m1GBXSAT0mRrlZG+E5TxJQH/KGPVKF4Y3GnhrspYfFiTCJwG+dPa7J+6cPTy
 MVEvgyimB/6cgX5rniLAkTaj4rHk5PfSSJ11DLgciQfgk7KW+NHopewR6volvlqku8j/
 hooA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=thewebers.ws
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=thewebers-ws.20230601.gappssmtp.com
 header.i=@thewebers-ws.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=dx8vnpvP
Subject: [Buildroot] Support for Linux kernel Rust
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I've been looking at more recent kernels and was wondering if there
have been any attempts to build the Linux Kernel with Rust enabled.
Known issues, toolchain type limitations (buildroot only or
prebuilts), etc.

Best Regards,
Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
