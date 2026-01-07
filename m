Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D44D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 522B440FAF;
	Wed,  7 Jan 2026 17:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKLYHgF50zf1; Wed,  7 Jan 2026 17:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5F9440FA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808331;
	bh=PKTQH05h2Em3435FxaFGxDgMwW/BeuJH6h/lVQlR61w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eBaG4zcVkz8Qi+4Xk5G9HC+Y5BslRZ7p2XGkiSlYKjvxEQQTe7hynTzMZND6qWChj
	 Pix+/qmLN8lnx8mYHBK+cfXsjZ7F8mbe1XkkndHTW+2RpISw2kW1QK7+e32YjlYlGH
	 5oh3Qp3yW1IeJnblZqEViXpYav+Oo0Jg4aJi5ndQzPBNHL/qGW4YclFZFtOS82PuCY
	 jUY0FSmuPUwEfKnRgm0G6jf+WYV+3h7OdHVDpQhhKcd0WebIBM03DAzLPoBw2hK3lJ
	 6BZpagAmN363vk1TkKeU+QS7Wo0F/pl7Ca32wmSJfGuVFX+xXC3TE47sciYDQYlJBb
	 pbpcDetQ9aeYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5F9440FA2;
	Wed,  7 Jan 2026 17:52:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C01725B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E5FD40FA8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73KXoQi5iV8n for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:52:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42F2740FA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42F2740FA3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42F2740FA3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 59ABAB97A596; Wed,  7 Jan 2026 18:52:07 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:52:05 +0100
Message-ID: <20260107175205.228716-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-3-thomas.perale@mind.be>
References: <20251229090719.13291-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808327; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=pv1K5pWFV+ciz2laZ7Y0jId7aOJdmVTSFYnTyRrvnZQ=;
 b=XqSoIzaF5931L5Gz0REQjd3ToO6vU+7eXlncICyap4+vk0hDJStygoveh9/AZXAGsQqod8
 gL00mp+65G96uIQr8j+n00z65G66TArDx0zLRGtj+EMmoKPCI5CxTMR+h8VXPcdJm0qWqv
 XDHuJ6cqsj1PtPtg+NFJgnTq/XdqdnpMWAGOYixczvI86BJJVNkiON3rtf3Ak3kwOAopMb
 tku9TmEYDkoJuO5sxMXwZuQuzq5ai6h9he00lzrqvOZ5LmmYrYJdYLE2o0qn4dFszpVX+X
 s9qzBjTSCn/YO4L8IUpqOwrN+E4oyj9c8dTmDs5ok7aBGRtotK2zgFfRXIFKMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XqSoIzaF
Subject: Re: [Buildroot] [PATCH 03/14] package/tinyxml: add CVE trailer in
 patch
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
>  .../0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch    | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
> index ea0f6476c8..1da5ee913d 100644
> --- a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
> +++ b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
> @@ -8,6 +8,8 @@ by two non-zero bytes. In case of malformed input (0xef should be
>  the start byte of a three byte character) this leads to an infinite
>  loop. (CVE-2021-42260)
>  
> +CVE: CVE-2021-42260
> +Upstream: https://sourceforge.net/p/tinyxml/git/merge-requests/1
>  [Retrieved (and backported) from:
>  https://sourceforge.net/p/tinyxml/git/merge-requests/1]
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
