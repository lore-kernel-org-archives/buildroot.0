Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D248FF5136
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 19:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E0F660E0F;
	Tue,  7 Apr 2026 19:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QwFEnw_STD5; Tue,  7 Apr 2026 19:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BF9460E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775591866;
	bh=exxC6/lDPgXpXutygAXDXf0+Ycks4dJNIp534iApPGM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jHgbWC/5ZeKTR3tlKxO4wKHRigmqDqSHCA4MfJT2HqE+k7wSTtqSIQL5v+ejSVsyM
	 XosFTtcXSn5fdtu39ak0A5jIPl0Bs88vmckMl3UgSQhUZ6NJolKPPpPx035Tq4WXLg
	 WiN62DyOQTamNfKD41sWEZcoW55RPZEISUWub1VMNGLNAMshz508bobYy+o2UZu3PT
	 TI5l0Jqs/bw7v5AGGtLvNtrfyTpOdDMkCFpY1kGJ/Fn65s9atWwT0LNBbdjhY8SHb+
	 OUdelo3PbZW3aIZG0G2WTPOW0b74LFNrI+BaO4LzLfYf+ARuiqZ7DeBeSiLtHuiCew
	 IjP+WNx/2TW4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BF9460E0E;
	Tue,  7 Apr 2026 19:57:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BD84237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39E0240DBF
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZY0-U4mAppie for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 19:57:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24D9940DBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D9940DBA
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24D9940DBA
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:57:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A4434B97BCFF; Tue,  7 Apr 2026 21:57:41 +0200 (CEST)
Message-ID: <bb48e5e5-30d6-4568-81ca-f9fc1bff6a55@rnout.be>
Date: Tue, 7 Apr 2026 21:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260307180711.1025866-1-ju.o@free.fr>
 <20260307180711.1025866-2-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260307180711.1025866-2-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1775591862; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=PXP/GN53UZFaLrWr51dCuU9HtogVhpFaEanJMZ6rVAg=;
 b=ixIRQC02XvL4FhsnHKW7OQ1t/hQ06GZ49dJ/Yfe9LjxHjGTB4rA9lEjWThv6uP+IMFnIY/
 HjjUM15axI1kJmDUxZoMpivLEAVRCmQ+cqM1KCuGp4D5c1BSWx29I3qeZm9nZRNERnUIhf
 oigM+YzAjPor37T6+7xoeUzQkduhGEOwbozTA76eOr9RLhLuxk7CQhtEYtQHkVD2neinDL
 Jd9pO6p4qwfl6H7Hw0C0Ir7uu1SJZAFDBzQWqjSMcVwGH8P8EQUXYr6+BiEn/Rp6/C7/uV
 p0u2JTE9V7cjPTBzeCeBAAplaqvADL1uT1WYAqwXCLdgX10VxaVq620Dji5wuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=ixIRQC02
Subject: Re: [Buildroot] [PATCH RFC v2 2/5] Makefile: export
 BR2_HIDE_SECONDARY_TARGET_OPTIONS
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



On 07/03/2026 19:07, Julien Olivain wrote:
> This patch is needed with the current kconfig version in Buildroot.
> If kconfig get updated with the series proposed in:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=490997
> the current patch might not be needed.
> 
> Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2: no change.
> ---
>   Makefile | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index f51155b0ed..092e84b32a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -251,6 +251,13 @@ export LANG = C
>   export LC_ALL = C
>   endif
>   
> +# we set a default value here to avoid a Kconfig warning about unset
> +# environment varilable. This option is passed as an environment
> +# variable to be controlled by autobuilders. The purpose is to test
> +# less frequently some uncommon configurations which tend to generate
> +# more build failures.
> +export BR2_HIDE_SECONDARY_TARGET_OPTIONS ?= n
> +
>   # To put more focus on warnings, be less verbose as default
>   # Use 'make V=1' to see the full commands
>   ifeq ("$(origin V)", "command line")

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
