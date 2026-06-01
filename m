Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5706BCD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 286744094B;
	Mon,  1 Jun 2026 19:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9QkklgVI4RB; Mon,  1 Jun 2026 19:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8976640836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780341215;
	bh=U37QCNypbUhQK1l+9XBguL290aC98Xe0SuAbELfycKQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jxxB1WqQICdIy6vCmAORw/hSYJ7Sp11Ao28G0ceVc6mTzLt+7Y83hBAVjE+dRsnIN
	 qZp/zAex6Qh9Zc80ss8WeFYOc074qBtVzNo775o9YfGqPzG1UkeQLObsaq3wsbNKt2
	 S0eLp35Wp98m0Fe2515nO/KOP/9rkPKlqmJQF7LcPlG11pV7qFgVeRJN2WV8i9HHDD
	 wSGkIn2c+hu97jWyeuL01qsVZM0szDFj98Ph2O1K9W9DEFcO/HkTUIZGbbtf/jx+jK
	 gl2eE35hTYujH1tOc3jkdsLaa7/DCxRDtF9kni1+qPLFY1sitr7mWvrTR8g+KhQv82
	 8irbgwYoW11ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8976640836;
	Mon,  1 Jun 2026 19:13:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52BE3F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43E7340836
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gflua1taOB8B for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:13:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46709402E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46709402E7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46709402E7
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:13:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8EC47B97C776; Mon,  1 Jun 2026 21:13:29 +0200 (CEST)
Message-ID: <23119774-00ff-478f-bf96-16a86b563c11@rnout.be>
Date: Mon, 1 Jun 2026 21:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20260531174514.1681226-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260531174514.1681226-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780341209; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=+niBqtRSiDaVyArX5uv+BJuOWBP20VrktaLiOZ3lN+g=;
 b=MWQPtNY/DND+8DflgQgh/mVQisG7ppCHZNBS8fgtxBQHat54+q/jUfJd14/MvrAefMXbVk
 h6uBcPXNAAtEM4hGhkKoL/BL3sK7xTEFbZHpmzznvj9hSWiqq0ZeLYrktYddPBTAiET+3M
 QAMCzym22QiAtL8xhMUsYRFmxo1OOrEIMJbFqyt2SnIFSy8BheUn2ahtw5NcBR624EJtlZ
 dT7+/wETz8k74ZbS+YsYmlU95DGImY7AAsoyPPHM/ZNhYVQy3KoQdqffBBnuudp2/YiMG5
 PZEeCOP4xUHa6egaFi87ywLBgAROBU5BQm6/0zHK0nrLnAqSM7TGFGT7rXVEvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MWQPtNY/
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: update upstream URL of
 patch 0001
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



On 31/05/2026 19:45, Bernd Kuhls wrote:
> Buildroot commit 49a4dc97456b9b777c25acb0cc3d1fdaacf9859d added a patch
> from the master branch which was now cherry-picked to the 2.43 branch.
> Update the upstream URL accordingly.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch b/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
> index 5b7172df44..ae832a6035 100644
> --- a/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
> +++ b/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
> @@ -12,7 +12,7 @@ years ago, the rest last November).
>   
>   Reviewed-by: Florian Weimer <fweimer@redhat.com>
>   
> -Upstream: https://sourceware.org/git/?p=glibc.git;a=commit;h=243bdfec8f7cd4a85a8ce6e4e9a5a5accd3ce1aa
> +Upstream: https://sourceware.org/git/?p=glibc.git;a=commit;h=18b97b03b7442d8ba0860e43145f8724c9e77b17
>   
>   Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>   ---

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
