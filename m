Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64551CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B54740C1B;
	Sat, 30 May 2026 12:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MQbEC9SHcZ5; Sat, 30 May 2026 12:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F09440B62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145778;
	bh=0JMzJKGDVh5WsQ+A7U2lX/hkZSHxKZ5NXwgQ1owHgaA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=RODVes/sTsKDZKyXriYiTzTXm5ywW9uIVJT3pHtrsOLOuQg1Mi1O9dzQL0yQS6tFg
	 scNwUethWkmt3fjqQbpayBCauMB+uOh+JRmFyyfjbxCaR7RFzC0rTjBrLP5gnhLIDX
	 8B7LLs8l9vlLG1VtPQMRVbumKlW04vgLPcay2rbszFlwfXEtnVqQoJU5AsM5UVq+mR
	 X/u5xCtVsaaz1NOehJlOnUVBvw2waXJbBGfYDIFmI9zTFZ+zll9w54aDk+SbgKFyT4
	 HBnmJOLCiNLHU6yL1EJbsQ6uaVw7vkTM/6BHFz4WSZspxWMKF+cAvvbTM0cLgZojYN
	 qZ1+f49/6yG3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F09440B62;
	Sat, 30 May 2026 12:56:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA9CA37F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC07840810
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqvSRtF1LDrn for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B86874080A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B86874080A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B86874080A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6C50B97C716; Sat, 30 May 2026 11:49:03 +0200 (CEST)
Message-ID: <8f138111-dfd6-4a64-b7f6-67b03b362f73@rnout.be>
Date: Sat, 30 May 2026 11:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <af42-dxArYlXGip6@waldemar-brodkorb.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <af42-dxArYlXGip6@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780134543; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=bZHxY9y1VSsCAy4VUKMsTUBuPSmJNbF5dHtW2x/ELVY=;
 b=YnVKIYa5/7kBosqby02elQZuX5LMjL2ajBgIxi+ssPulTpi/M96yCKKviA6FuxvVv9RJIM
 JFdnvs0wJ03zSWEW8n4qPQ2C9fHEDIrWjbKh/xDBg4PC1uImJZhKo7WSzkt72WyTjRClFs
 NQeBH6EkD+8uGQD95/9pHMiqOYd6QDDkLQpvB+Y9dmuftDycNoqSnEyVlbO9BXqad4dmkb
 fA0jwgk9O09tE6DIWbTNIRf0gJoyBNBiG3x55P6wRHIt3avAzfmzVhyWx1FJcYB5T0IGG8
 LKCou56xftJdmalFChHEPjjoNSGjHixl8KSgn7zzUK31JdXYXsrI9TPi17OnHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=YnVKIYa5
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/05/2026 21:18, Waldemar Brodkorb wrote:
> Reported via IRC in #buildroot connmanctl segfaults randomly
> on startup and keyboard input is not echoed back.
> 
> Could be reproduced with Raspberry PI4 (32 Bit) defconfig and glibc
> based userland.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ch-2-fix-crash-if-the-calling-applic.patch | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
>   create mode 100644 package/readline/0002-Readline-8.3-patch-2-fix-crash-if-the-calling-applic.patch
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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
