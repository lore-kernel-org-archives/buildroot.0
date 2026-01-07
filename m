Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2487D0D153
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9742B40F75;
	Wed,  7 Jan 2026 17:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0euzjqqplLFp; Wed,  7 Jan 2026 17:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C36A940F76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808319;
	bh=hHXo7NDmk20Yl7juGDr8b5scwm8vH+Yn6p7GZPxu+rQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RNGuZmVp/yxjDYwugSSNDxYcyAobxrxcMtmL4WKGAyrIi/xyV7DhdAbZ6yUoYemH4
	 LkTNzahqQ8mjvTVC+amcTyPg8/3ao11UlsOEUW4Y6XWMSuTqqn9WyuShsuMwrH1Ank
	 6gOevkR+79gZRV4ZEioyum2IUTh30knnrumYext8KfPn/SPmFINtdUX3DRyI2Jl6+k
	 3ZR2D90/KyAoPzchc9LOj74Iia6TLr/uQ/afeaKctkmFalFgljYXQam9MYX8SgMkUq
	 xnGBdUwag0em0pAUbgL97zSskOQCwdqDHQ0DgFN8+o9jwADZ5IHka3n5fRjf2ab75y
	 QHWciFiiI1q+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C36A940F76;
	Wed,  7 Jan 2026 17:51:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39B3B25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20BF78266C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hn7tYbdYAPUB for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A24982662
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A24982662
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A24982662
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2CF4BB97A704; Wed,  7 Jan 2026 18:51:55 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:53 +0100
Message-ID: <20260107175153.228469-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-4-thomas.perale@mind.be>
References: <20251229090719.13291-4-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808315; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=7WE4OnLpyx/LyzHuAlLezU6ojzvbATv0ifwlOr2/vfQ=;
 b=g/IixqiOS1UDU5JrA1VMe+u7uWQd+trEfzqBjgkB/k/OPpuFIavXlV1jHn7VZFR7aodYqF
 UBbRfo9LzcgccAxqwNAxrskwzPdqYkjUe6DTH7e7KOpM87hI8u9WfAztrb2MLk3n6dVl5n
 jystDb7SDnOe3frCMgKNsavaYvscAEOPfADkKkjTQb1lcGh0FJdE5kekIMP8Iz8mPxwD7b
 ZKuqLnaXVCJy7pqlR4bhqopWsit4oUW5etD5fCMrHy8gcjut085aXNMjeur3ZNmrX3v4Y1
 jpK3e08yHxJQyH301JKj7W2e3B16M/ZnAr+sjs4R1s22Tvd5labIzUVLJO7YeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=g/IixqiO
Subject: Re: [Buildroot] [PATCH 04/14] package/opusfile: add CVE trailer in
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
> This patch adds the relevant information to the patch header.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  .../0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
> index 2ef08502ab..8e3be36cdf 100644
> --- a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
> +++ b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
> @@ -15,6 +15,7 @@ Thanks to https://github.com/xiph/opusfile/issues/36 for reporting.
>  Signed-off-by: Timothy B. Terriberry <tterribe@xiph.org>
>  Signed-off-by: Mark Harris <mark.hsj@gmail.com>
>  
> +CVE: CVE-2022-47021
>  [Retrieved from:
>  https://github.com/xiph/opusfile/commit/0a4cd796df5b030cb866f3f4a5e41a4b92caddf5]
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
