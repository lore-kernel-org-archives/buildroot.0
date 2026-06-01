Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BA3CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A071660685;
	Mon,  1 Jun 2026 19:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWutRAOBMJnE; Mon,  1 Jun 2026 19:10:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C94C060689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780341047;
	bh=+qnwXMC0Rd1rTiq4f00FRp1CYauXJsQKz9qTjfL7oao=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=mU+L4BIX1Ma+rKWcpb4lrN8Tc54a2r6GXme0Hvu7yruKQ5e3NZyDOJyorcMBIWPx/
	 v6LGPwLi4Xi1VwkjQxCBP3uKZHG7b5TINdGA8tcFUTn6tWHH9L1YWl7Bw0/5HNFvwX
	 6JsStpqvf2+WrF1pI+JH4YaE2WmfuRSorpeId2Jv+dv164+BleTSMsg8prNXw2AW2w
	 5v1BmLkULiqKoJ3rjCBZAxnHDoE0RHLSJS5DII49Zq+aFo9ned2HIpdrmew/STw+OY
	 7D+wWcMTaDxX88f9T06s9KtYz6CaG2qBOxozhv7lRUUNNlKyvpa6p8v12NAMG8kE9N
	 JMger9YfsonOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C94C060689;
	Mon,  1 Jun 2026 19:10:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C66F5D3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC786400F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEkX7y7jUXGs for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:10:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 032AE400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 032AE400D6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 032AE400D6
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:10:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4EEA8B97C776; Mon,  1 Jun 2026 21:10:42 +0200 (CEST)
Message-ID: <04cb620e-25a7-48bc-9e87-c6b00f74cc21@rnout.be>
Date: Mon, 1 Jun 2026 21:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260601094157.118235-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260601094157.118235-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780341043; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=5CbibAS3CibdAneQQsyXzQcVUvQBK3N2RnnkD7RM8EY=;
 b=DuU7R672sS+ZxXy2XsABY92C2zLWWyH7YgTRQ+GftxhRjS88iqZL0nreWeUjT3d1UZJ2qL
 +Od/F7u1jRJDxAHePPRI7NlAlaDJrxC9euRKWZMWQN2rVXL6slDZlYFBrRjyxcfS8woRre
 6Yw20MiiU0zm0DJMlD3vKt4OKt2CJKYD8biYLKi/+Khk+6cX5H5fjtle5RIKl7Qga/LR90
 C/1aIve0Pg+HIw3pBwtOdL4SPxRfIwp4iPl7Llmi9j7k8+igPHb0UBDebHyP22n1846SUJ
 Y54noghG/FjizsP8ILaxsnlxzO6dvw2n4JqG298xPGSjEiOJ4JRVBLQamvyT4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DuU7R672
Subject: Re: [Buildroot] [PATCH 1/1] utils/generate-cyclonedx: fix hash_file
 location
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



On 01/06/2026 11:41, Thomas Perale via buildroot wrote:
> The 'show-info' output always the location relative to the Buildroot
> root directory.
> When running 'generate-cyclonedx' outside of the Buildroot root
> directory the hash file locations are not correct. Only using the
> 'hash_file' variable coming from 'show-info' doesn't guarantee the
> script to succeed.
> 
> Use the 'brpath' variable to correctly reference the absolute path.
> 
> Fixes: 1791b79422 utils/generate-cyclonedx: add hashes from .hash files to externalReferences
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to master, thanks.

  Perhaps test_generate_cyclonedx can be updated to check out-of-tree calls?

  Regards,
  Arnout

> ---
>   utils/generate-cyclonedx | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 11edc05d80..bade018cd4 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -302,7 +302,7 @@ def cyclonedx_source_hashes(comp, source):
>   
>       hashes = []
>       for hash_file in comp.get("hashes", []):
> -        with Path(hash_file).open() as f:
> +        with (brpath / hash_file).open() as f:
>               for line in f:
>                   line = line.strip()
>                   if not line.startswith("#") and line.endswith(f" {source}"):

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
