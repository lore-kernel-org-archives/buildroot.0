Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AF1D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D99E825FE;
	Wed,  7 Jan 2026 17:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nqIKF7gRs35; Wed,  7 Jan 2026 17:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4630825DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808315;
	bh=KMzEu3D8r3lE72vNu23lott0HWf9SPWaSptx8doGU3Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nDQ+a+ExEoidOn1lilJnLbwzk9hvUqpHQ2COK4hn0envfae7Q3QAZ1T22zzFuzi8V
	 LRxPKoNi45FVJNvEXzx3ApG0XCgxFrGuPQCCoOlM11E0IKQbZeOa/AfwQJC8yVB9bs
	 aXPHvHRm34P8ODQSx35J38db7/taFaLbe3XcJyBSFUSPSohlIJWKN7m702sfDCHic1
	 QexDVvu5fz2VnHCx9LcQufD6lYeiUKe4H7LSxtfPF8pYPl4GPpExKsRG3x7s2TGelj
	 lzw4HVU8YOmFMnkK2MBJt4cbd0SPYnmsPq1jDcpuaHxdgZrVXvg/uIxcxuwKW+2Eyd
	 7wGgRVeGVGTzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4630825DF;
	Wed,  7 Jan 2026 17:51:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D195625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3F9C40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtxI-olWbtnF for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B62E640128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B62E640128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B62E640128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB6CEB97A704; Wed,  7 Jan 2026 18:51:50 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:49 +0100
Message-ID: <20260107175149.228377-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-10-thomas.perale@mind.be>
References: <20251229090719.13291-10-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808310; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=V6b2TdiEagGQfqc7IBTWSUV0bneblvVwnLMH6V8QIsE=;
 b=nMlScUdJT2MhiOQW3u1NU94O4fDqdNalbzOpvGkqN8igocwAqUeipwgGlzb1+qQTlPzLOQ
 cGs2PtBk9sdSQ+QqUZHBdu5f493FxPKCsiYlBQhZNPnS0tlCw9DMXFsGj96IkzpgE0iS/v
 SnQl/nIObYWVjR2GaVYY0/3DGYpYnk9ZLsWQm/6x98pBwS4XaT8CQLLU8DcBEr1fASvjMC
 y8Qr/hq8w3gf2QzBU6xbSSbHqAq41pGlaTarXPyMTYjRwG3KDxLm5thcCn7/8esditGeVG
 OhXgKJNKoFeDYG77KxikSEcy5EfQ7GwxnmMNMBkkoqQa4DtZx2kEXbIduTIIhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nMlScUdJ
Subject: Re: [Buildroot] [PATCH 10/14] package/libtomcrypt: add CVE trailer
 in patch
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
>  package/libtomcrypt/0001-fix-CVE-2019-17362.patch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libtomcrypt/0001-fix-CVE-2019-17362.patch b/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
> index 91e2145853..adf5020049 100644
> --- a/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
> +++ b/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
> @@ -6,6 +6,7 @@ Subject: [PATCH] Fixes #507
>  Fix a vulnerability in der_decode_utf8_string as specified here:
>  https://github.com/libtom/libtomcrypt/issues/507
>  
> +CVE: CVE-2019-17362
>  [for import into Buildroot]
>  Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  
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
