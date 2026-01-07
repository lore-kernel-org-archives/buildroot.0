Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF37D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FD2382664;
	Wed,  7 Jan 2026 17:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EC-_OKj395nn; Wed,  7 Jan 2026 17:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE8898266A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808323;
	bh=l7hjs+SqqrQm5YptoL0vn3pPXsgxOkYBRzIor6xmJS4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xb/r8OIEJruho6PuV9hEYKbsA+X/zDlANaWaFBXjDeIH+ECFNFa9XZp+VLss0RaYa
	 RYeGWn/Q1vOoThQyRph6gwQudpaS6w2lr37tx15IyUlxWrbxEReapHUNrfh1cyzZHU
	 7xCXvbpYjiw1NgHQEBv8mbpdVHHQ50Q7RdT+2RYbTPQGQ/SDl0MLJ6NrZntClmtpit
	 upmpQ48GdstJFg9c+ZoW/vAQaHOedXXvu+i+7JCNrFkGPfvSTxKos2602ty1TvfmOx
	 TTeVLNtBWwnyqLFfo648SzfN0YSAwXJ2hlpWm9EXF0+U1Qe+sPTCxwCNaCNF1V076P
	 xj3JFNhmfkcyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE8898266A;
	Wed,  7 Jan 2026 17:52:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF6BB25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD47C82664
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvUka7sw-6gi for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:52:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C63C8261C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C63C8261C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C63C8261C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BFEE7B97A704; Wed,  7 Jan 2026 18:51:59 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:58 +0100
Message-ID: <20260107175158.228564-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-11-thomas.perale@mind.be>
References: <20251229090719.13291-11-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808319; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=+OhVAj1LzGmskMptQfcrfPumCcYvJDp981Pj4E/wDqs=;
 b=JDflb9hXKps4/OW7zVhEQk+/Iet6Js4wUtzkQHmISMTCboziTAosrMCQR/yyfOA2Gm77FI
 NhMSuQWq9SBaRgv6SZXajVJ2NfeNF0YaHQP6cLHBth3RUwk+Fh0gyXAfbVPNu+kKSyA65P
 Eyq8gGy7upgS6r/wPOEUZyvUzvXniTHQsKxADhKvz5OiU2TLEHJFXWvx78IDEHOXEk/DMu
 t6b+lKL7tSzpJdkW/nFv0VATilpuLnobJgJoGWT+dabMVcO4q3ghz4bFvoZjEUMqtryOlQ
 h6Q4yCpjwsGHD3qpdAcvDEyASkB+uheuceV7bmYOduZ+VI8AkaH8eXYqOTk3ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=JDflb9hX
Subject: Re: [Buildroot] [PATCH 11/14] package/sdl: add CVE trailer in patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patch header.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
> index 68e66bd5a2..3624c5341f 100644
> --- a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
> +++ b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
> @@ -3,6 +3,7 @@ From: Ozkan Sezer <sezeroz@gmail.com>
>  Date: Sat, 18 Jun 2022 14:55:00 +0300
>  Subject: [PATCH] SDL_x11yuv.c: fix possible use-after-free
>  
> +CVE: CVE-2022-34568
>  Fixes: https://github.com/libsdl-org/SDL-1.2/issues/863
>  Upstream: d7e00208738a0bc6af302723fe64908ac35b777b
>  Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
