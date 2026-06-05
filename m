Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EA8CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8329E80638;
	Fri,  5 Jun 2026 12:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mV8KMUccpI-C; Fri,  5 Jun 2026 12:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FE39824E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663773;
	bh=Mg+DTwJDuCKw9tZrKyy2rrDylj0Q0ZIKLD759AzJZtc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lz5LY3G9lejlZMxSQoah3hU1uNpjpKd6a8n9yy+Ym4U/nEN2YWaNc5QgvW2COKs+K
	 iniu56Rk9QIkngP8s/2JqYW2eWRc3+fsNX4JexlDfWpWot8uDVJDCBeZsGZ5P1+roA
	 GhqiM/p5iGxJWWFFFek8ZxRUUPwW0t4jwVafCke8nwV48Uut3lxmsb+6vR+gC5VTcx
	 bIe73kNBqJpmvz47JyXwyhqvMetc1izQWr5lTU05A/3rnAJ+5cowpkGkCUPQnQ7fPs
	 WxEocRSrjmonffJAZR2WiQVCViSRGYZrmbtJkQEVjTHen0De1qttBS9zyY10ze7E7/
	 2Zce/CpIO5sIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FE39824E3;
	Fri,  5 Jun 2026 12:49:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BABD4F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4F9540381
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1ZJ-9H8hrq9 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E14FB4037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E14FB4037E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E14FB4037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-490b09e4cccso14165095e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663766; x=1781268566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mqYk5IV4B4yHi6+l1e7lgcoxturZ/+vHB80pBA72hMU=;
 b=V7zthjzl40/KRILs3CnO/VEIdHdqROUuzaG0CZFOUovpZYnKGqm/8iU6kPG505e4lC
 OBI9KpurK4T2cmw49XPcwhEhqBy0epjcovZSPO9Y9kXGZwKWcElflHzNCDA+J2CQVPe9
 eM+IU5aD8/3sy/zAQvMdGttuc924LtIotuRzwd6bmIlcvFbFBHkxyzGxrBvR7lqZlj7P
 9K/9zAhdfx4Pv9EWQBuzImeWS5DpzdmmKhMI1SjJdQjKXmxNH8buhs5tPRZ7AAoBAUQ/
 qdhhh5vaF2UviqA2f7zcBjxp9w1Xt8fViYaQQCJeknB0C27wszKcI947/o4R1spz66pf
 H/bw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9x+dWfmzlX/ZSqKsmqcAuy30ldA3zryhcb3qcOyQwMS+AMtXVn+zSE79TYjO579nKv47SHly2J9Qk=@buildroot.org
X-Gm-Message-State: AOJu0YzvA1aOp5QtC8p82MVWm1Ns3olzMX5vOLe1cIL6wvPzFE7GtRfP
 Xl9F9yVqEb26S5XEeqVTZ7Ty1YUrimGWBNSlYeDsnI6+Kvd50svQ1/cMVh9TERTQySM=
X-Gm-Gg: Acq92OEK9wzAwMDggx6jM5jtpXEHaqe3mGt/KMUth2IeRdeTFfGq8AdsQrA5Oa+Eqlu
 Xr2HH5kPwZ/bHpW5Z5K74eT1G8O0o+/f45E7/Of2assER6/OD8GthHPZBjYbDMVnmNcFZo0m75g
 5gNwWqodb6P+aA0oIpZhDxbGykUp4yvoJiG7H7feU1zxhw3fziSQmO6YIbRUVSxBTp4mUcrvr0N
 P6pdpoDDG9OwEudXSlEXxIxGFnlgyT9FqH2JlHzFtxjdOCFxkp3/y5Jx0rIuOzxHplYk+r1PQug
 1M58XOHM1LCv9nhrn8vZ+iJh0n+tTsdMc1b8kQv1nj2pQq7HlbZPPma94MhOmLDjgqzx29mdpVs
 Hn3ajrAxnVtvVMAv+uoATwAvsUs8FIjO5T4YLVgLX1ubISWl1gJAI4Od3qJAl+/FUIaHQBEXOmG
 qyTDTi1oecZiHd1QWswwqoZ6jB9g==
X-Received: by 2002:a05:600c:1387:b0:48a:75b9:b0bc with SMTP id
 5b1f17b1804b1-490c2619945mr53419805e9.29.1780663765861; 
 Fri, 05 Jun 2026 05:49:25 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2d37edbsm50518175e9.2.2026.06.05.05.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:25 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:24 +0200
Message-ID: <20260605124924.271196-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <af42-dxArYlXGip6@waldemar-brodkorb.de>
References: <af42-dxArYlXGip6@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663766; x=1781268566; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mqYk5IV4B4yHi6+l1e7lgcoxturZ/+vHB80pBA72hMU=;
 b=SW4kWMytm2xrfZxLG6aaEo5WbeEbMCnmxReEKKuMUQLUoCCW6pArFxGU1puPhxiC5i
 35UL/Zs75fcfJvWRZE9i+zsyOQr6HgkUkG11QCtw0S3EQuxycmwo5VPOfD1dd4Xh/xxM
 8m/YpTNNsPxbKQFpP3BfNuaG5RX0I97GGCe87jNTyv9jaKheszAeQPSWaYDe7/b+cPGT
 O5x09I3AATDvrMBfYroXuiOnXi50N+k+lmWtOXEI1alNWgnEhOKOiiJhP+1qS4KFiM65
 dgJGNzfoOBfK1uZW0tjgwGcNOkjHrohKmb5AeTbkR+CUuvYnZuLujI4ZLA9V7V06ZCsx
 0BMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SW4kWMyt
Subject: Re: [Buildroot] [PATCH] package/readline: fix a segfault in
 connmanctl
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
> Reported via IRC in #buildroot connmanctl segfaults randomly
> on startup and keyboard input is not echoed back.
> 
> Could be reproduced with Raspberry PI4 (32 Bit) defconfig and glibc
> based userland.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2026.02.x. Thanks

> ---
>  ...ch-2-fix-crash-if-the-calling-applic.patch | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 package/readline/0002-Readline-8.3-patch-2-fix-crash-if-the-calling-applic.patch
> 
> diff --git a/package/readline/0002-Readline-8.3-patch-2-fix-crash-if-the-calling-applic.patch b/package/readline/0002-Readline-8.3-patch-2-fix-crash-if-the-calling-applic.patch
> new file mode 100644
> index 0000000000..50df37fd4a
> --- /dev/null
> +++ b/package/readline/0002-Readline-8.3-patch-2-fix-crash-if-the-calling-applic.patch
> @@ -0,0 +1,22 @@
> +From 9a3a2388e376eb2b43a2fe3dd8c5ce6e62ee3cc0 Mon Sep 17 00:00:00 2001
> +From: Chet Ramey <chet.ramey@case.edu>
> +Date: Wed, 10 Dec 2025 11:34:13 -0500
> +Subject: [PATCH] Readline-8.3 patch 2: fix crash if the calling application
> + sets rl_prompt to NULL without setting a new value
> +
> +Upstream: https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/?id=9a3a2388e376eb2b43a2fe3dd8c5ce6e62ee3cc0
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +
> +diff --git a/display.c b/display.c
> +index 9aa8c7b..edb525d 100644
> +--- a/display.c
> ++++ b/display.c
> +@@ -783,7 +783,7 @@ _rl_optimize_redisplay (void)
> + 
> + /* Useful shorthand used by rl_redisplay, update_line, rl_move_cursor_relative */
> + #define INVIS_FIRST()	(local_prompt_invis_chars[0])
> +-#define WRAP_OFFSET(line, offset)  ((line <= prompt_last_screen_line) ? local_prompt_invis_chars[line] : 0)
> ++#define WRAP_OFFSET(line, offset)  ((line <= prompt_last_screen_line && local_prompt_invis_chars) ? local_prompt_invis_chars[line] : 0)
> + 
> + #define W_OFFSET(line, offset) ((line) == 0 ? offset : 0)
> + #define VIS_LLEN(l)	((l) > _rl_vis_botlin ? 0 : (vis_lbreaks[l+1] - vis_lbreaks[l]))
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
