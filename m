Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07851C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4CD941D6D;
	Fri, 16 May 2025 10:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWYZggytMnRO; Fri, 16 May 2025 10:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFB5B4056C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFB5B4056C;
	Fri, 16 May 2025 10:58:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED7411AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEDD483C91
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eh-j22Q3nkNy for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B8E883C94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B8E883C94
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B8E883C94
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:58:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 53B6B1C0FC0; Fri, 16 May 2025 12:58:30 +0200 (CEST)
Message-ID: <b884d363-ff45-4f94-a4b9-678b978a126d@rnout.be>
Date: Fri, 16 May 2025 12:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250508175530.90432-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250508175530.90432-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393110; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/8lXsssaxX2lTLixHSWm6uvLrTrncMHrsh/7n5igfGM=;
 b=pX3EAAgPRXUo79GWyFJplGvhRfazJJLf0GM5n77G2HvrimlLLFSuMoE0PRwEph5DlfUnrF
 0eRKKEU1HR3Oi2B4TP6gSj+xcWDit8TV7vaQAPnZaW0TxUN2xp5z0zOZixRUUQxkTzTAg8
 3tLz5tuolnrBvpUsAqcRpAQ434y23eUmtgEnoUSlIzc4kLlEg9OGk+f6EX2pylO0Lys09G
 R5esJmQJSYgcuTMO+dqFHjEnKWdk/z/7rkCNvu0IHPSWpP0KlGtz81hRX2LvpQ302Aq3K0
 XMP0BzbLwoq8tsUnuruaxdMAPXNCKN0q2SPM5qYS9nXXMe2/aP1hCqW/A05Bgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pX3EAAgP
Subject: Re: [Buildroot] [PATCH] package/gdb: add patch to fix GCC 15.x
 build issue with ARC-specific gdb
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



On 08/05/2025 19:55, Thomas Petazzoni via buildroot wrote:
> This commit adds the same patch that was already added to GDB 14.x,
> 15.x and 16.x to fix a GCC 15.x build issue.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...ne-tcap.h-Update-definitions-for-C23.patch | 52 +++++++++++++++++++
>   1 file changed, 52 insertions(+)
>   create mode 100644 package/gdb/arc-2023.09-release/0001-readline-tcap.h-Update-definitions-for-C23.patch
> 
> diff --git a/package/gdb/arc-2023.09-release/0001-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/arc-2023.09-release/0001-readline-tcap.h-Update-definitions-for-C23.patch
> new file mode 100644
> index 0000000000..33c0ee95fc
> --- /dev/null
> +++ b/package/gdb/arc-2023.09-release/0001-readline-tcap.h-Update-definitions-for-C23.patch
> @@ -0,0 +1,52 @@
> +From 93f772832b96e0c48223c452324e9736d7de051e Mon Sep 17 00:00:00 2001
> +From: Chris Packham <judge.packham@gmail.com>
> +Date: Wed, 30 Apr 2025 16:49:44 +1200
> +Subject: [PATCH] readline/tcap.h: Update definitions for C23
> +
> +C23 changes how function definitions like int `int tputs ()` are
> +interpreted. In older standards this meant that the function arguments
> +are unknown. In C23 this is interpreted as `int tputs (void)` so now
> +when we compile with GCC15 (which defaults to -std=gnu23) we get an
> +error such as
> +
> +  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
> +
> +Add the function arguments for tgetent(), tgetflag(), tgetnum(),
> +tgetstr(), tputs() and tgoto().
> +
> +Signed-off-by: Chris Packham <judge.packham@gmail.com>
> +Approved-By: Tom Tromey <tom@tromey.com>
> +Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + readline/readline/tcap.h | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
> +index 859e6eed5aa..9e2ed124e49 100644
> +--- a/readline/readline/tcap.h
> ++++ b/readline/readline/tcap.h
> +@@ -46,14 +46,14 @@ extern char *UP, *BC;
> +
> + extern short ospeed;
> +
> +-extern int tgetent ();
> +-extern int tgetflag ();
> +-extern int tgetnum ();
> +-extern char *tgetstr ();
> ++extern int tgetent (char *bp, const char *name);
> ++extern int tgetflag (char *id);
> ++extern int tgetnum (char *id);
> ++extern char *tgetstr (char *id, char **area);
> +
> +-extern int tputs ();
> ++extern int tputs (const char *str, int affcnt, int (*putc)(int));
> +
> +-extern char *tgoto ();
> ++extern char *tgoto (const char *cap, int col, int row);
> +
> + #endif /* HAVE_TERMCAP_H */
> +
> +--
> +2.49.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
