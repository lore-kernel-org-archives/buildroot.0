Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D372D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D55F140F67;
	Wed,  7 Jan 2026 17:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MCLNWkt7wGj; Wed,  7 Jan 2026 17:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9834540F5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808313;
	bh=vJpPNZGntqJUANFa0ExwaA3sPK0VBY+t1XN/N5alM3k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UU42iKJUFN4/sS3/VYOsQFgrVBTpVL6Xy36gpk8WzrcgKb7sD+wHeulVBk+Fi2OyE
	 WLKVG07Q69xEbv16VLdZPbGEjATHaFJipR8/UhJPAkHpqiaYtY8PG3m/+Qb25JLhmW
	 iiralaI1mhmxV4yPpS4ffur0oEleme3W7KVDO4xGSDesi71d18wx6Bn/1vXPgPyxqO
	 HgSFkPXLIulHhYAcD6AyVPnhzuaW+Hykx56iVexEDB1lVue8AAKgXUL6kqYAyy1oIr
	 QddT9buaTISgJrHEkPfnCM4Q5L2LcNlub+CPJWwWvhd07V7UwXeU0IXK2plYRiEiVh
	 ywR/AfB8T2wQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9834540F5C;
	Wed,  7 Jan 2026 17:51:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB54D9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A09BF40128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aU-nojNmOvdQ for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C9E640160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C9E640160
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C9E640160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 88B7CB97A70C; Wed,  7 Jan 2026 18:51:48 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:47 +0100
Message-ID: <20260107175147.228330-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-9-thomas.perale@mind.be>
References: <20251229090719.13291-9-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808308; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=wlv7AwsnWzt0WqMHuXcDvC6iNRpNSdAdagVq+kobFYQ=;
 b=GMPDK9ZVnzrkWj3w2/VGrcYtXvZmIKgzpstmkQWgwVUi6Urr1q/UbxEpP6zlBAP7ouVF1f
 lcB7RXdzdshqOrqZ0XAO2v2H8qjkCdUH6+43UpMmtJr8ocmfRQ55u2S0TDo8sKurE+57eT
 f6AK8wDvYl40RKT2ky2qfc8beaoBLJ7YRo7cHJ+JiPaNnbfg+457enZhTlrieDzgq1t5m/
 dY/PFP+cJZd+uV9NPc7iDDH9ziY1k/RWpPUgupiUbzYQqXjSdp+3ta6GxDriSlNZNSKVZo
 4RuooMbdMNSyP8gQaD7XdlHWEdAfYTZvqAmC83TpGr49QiGD0/Xz516/hTmUGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GMPDK9ZV
Subject: Re: [Buildroot] [PATCH 09/14] package/libconfuse: add CVE trailer
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
> This patch adds the relevant information to the patch header
> and adds the `Upstream` trailer.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  .../0001-Fix-163-unterminated-username-used-with-getpwnam.patch | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
> index 9ff3f5ec1c..4c2aa114aa 100644
> --- a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
> +++ b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
> @@ -5,6 +5,8 @@ Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
>  
>  Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
>  
> +CVE: CVE-2022-40320
> +Upstream: https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b
>  [Retrieved (and backported) from:
>  https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
