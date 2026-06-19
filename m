Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D6BCD98F2
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 22:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F9D6F9D5;
	Fri, 19 Jun 2026 22:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wsrjxsnYIQt; Fri, 19 Jun 2026 22:51:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DAE26F9D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781909464;
	bh=RjP5YXuCAxzEZGo5IlB4gU+qSrpJuAqw6S/CmGxMybU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XejxXtDKiKhojyiPQxK4lTG+8usc65XzEHY4BdCsl3ipO9wNVdW0hH4sXYGG9YiCK
	 I1IIA+pCNtlEI8TmgnrFIJG0RI/iRlmIkkJJ/vNwdvPgc9QcUOium2B3jJ1t14+L/9
	 4Iug6LsmS1AaSsnW1toBvf59baPnFBjK5SUfLnbGHtcxWJVqALG0RBS0gS7UhVvxmI
	 RAoHb9OU23380QSSSKgRGL/sqNPRdGTGnere1rqBr2HjPnywBPfj9naLq3h4EleRQD
	 sGQDWZWYf2g7vcZLYSJhqK6ZSdih6Nc/CZ7vx5qgPYy5ZthXwMjupd/HrJw26zXOzw
	 9lAdUtzg1jugA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DAE26F9D7;
	Fri, 19 Jun 2026 22:51:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F0EC367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 22:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20E996F9D7
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 22:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id By6y4Gm-5BqH for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 22:51:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 706396F9D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 706396F9D5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 706396F9D5
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 22:51:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbEf-1wSDTN3wYN-00CrAI; Sat, 20
 Jun 2026 00:50:59 +0200
Message-ID: <d05752fb-4d14-42c9-a5fc-61faf45c3eb4@gmx.de>
Date: Sat, 20 Jun 2026 00:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260619185700.3353234-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260619185700.3353234-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:2Ldr8qOY23bPFTqMmaO+7Xx6cNGAODaa+0SmF850OlIdNkFmPqf
 +/p85PiaB36WMKCOUKX3otKt99Y6Rmc/YZRmN7mvbgUSLwI1vq++r0kgHMMQ8Swn3qL1tEL
 4Qw1rPaA5O7jMiNerJqw+s/eIUhng3mWXDwe4sIo4osmKXSITOpxDKLdxaBOuIX/owwWOPb
 m2A8ES0L8tplu7Vsvs5ZQ==
UI-OutboundReport: notjunk:1;M01:P0:ul4i8rQU6dY=;zy609F8Wwf3BcKFYvk5wExKIuk0
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781909459; x=1782514259; i=fiona.klute@gmx.de;
 bh=YRxgh9u0FOdbHRxPyFHupBJBQc5FzXGItLhM/lR7xuQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=f/yf2YovxyIpWJQ9XvASJIm12E7DABWfBwG0xazxMHgiYup9bRbzsXfm4kHAPP3D
 OJSr2sIqcaAJHbHkJYSostn7Cm8cQlkBAmhVxCyAjJd+4pfl/gyMeii9brD7PjYmf
 YXmuIOkmfsvep3mrT/7JKHmxTuv+1awIKmDL/NemPACHWOMaQsJPNQfLN0m8ef9Jx
 AcoJrxihoRS1aENT6wsyfvdtxVFsPqO1d/w3U0LDxK7jkuJvYChmUjRm/kbDtCoM0
 uyPzwEM0IdIbktL6D+1LqUAcbRdyI+xmUmpeU4ABWoKPB2teN/xqrT0IWKjcE12q9
 BMOiwKI1GfNyC8hgDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=f/yf2Yov
Subject: Re: [Buildroot] [PATCH 1/1] package/tmux: security bump to version
 3.6b
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 19.06.26 um 20:57 schrieb Bernd Kuhls:
> https://raw.githubusercontent.com/tmux/tmux/3.6b/CHANGES
> https://github.com/tmux/tmux/issues/5109
> 
> Fixes CVE-2026-11623: https://seclists.org/oss-sec/2026/q2/934
> 
> Switched to tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/c15a0ae45c2f5c1817dbc4695794841cc3a00ed6
> 
>   package/tmux/tmux.hash | 3 ++-
>   package/tmux/tmux.mk   | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
> index 867fbd6c55..34419940f3 100644
> --- a/package/tmux/tmux.hash
> +++ b/package/tmux/tmux.hash
> @@ -1,3 +1,4 @@
> +# From https://github.com/tmux/tmux/releases/tag/3.6b
> +sha256  390759d25fdba016887ec982b808927e637070fd7d03a8021f8ef3102b9ae3c7  tmux-3.6b.tar.gz
>   # Locally computed:
> -sha256  b6d8d9c76585db8ef5fa00d4931902fa4b8cbe8166f528f44fc403961a3f3759  tmux-3.6a.tar.gz
>   sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
> diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
> index 1f98cad706..b435c62a8c 100644
> --- a/package/tmux/tmux.mk
> +++ b/package/tmux/tmux.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TMUX_VERSION = 3.6a
> +TMUX_VERSION = 3.6b
>   TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
>   TMUX_LICENSE = ISC
>   TMUX_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
