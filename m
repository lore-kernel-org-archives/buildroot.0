Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C842D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E2040F6B;
	Wed,  7 Jan 2026 17:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQr_3BcZRUBx; Wed,  7 Jan 2026 17:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5FF840F5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808316;
	bh=qUaWxkupe59MZlidbyBNhuH6PRvZw11BbKt+rjzEUFE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DP29dckFYRKd8FtcJBHCdttXSOQeMyy+Ej+I52P3ItpMSWxDc1eql7vB/02hxISkU
	 NlKsbDoH9WTtGgX9pWYaPTeZg7qTBKuMCg3eXHJJ8QiViPEWi7j79LX4E4U/wZu34w
	 bV3mvwP0QJ8hFMNDGJrd9MflfG0We82D5t/5Vzp1VNYS8UrRc+oxFKJZqpZvqy/eyo
	 VdqrMrhw2Xd9RejzEkBNd79/E7eQ7ac4aFYayC9dO4ucIEo3J0uA50BgSCAtO+fZyX
	 6K4nEjKTIC4xxgLorvmO4K9kWs8Wbn4HSD+WGEIxS0ervMKmFFkFsDDRNdCxUgwj1+
	 SD6EsuisL444g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5FF840F5C;
	Wed,  7 Jan 2026 17:51:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD9B39ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93E7A402E9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8CgiSkfgD5J for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C78740128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C78740128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C78740128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B014BB97A70C; Wed,  7 Jan 2026 18:51:52 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:51 +0100
Message-ID: <20260107175151.228424-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-5-thomas.perale@mind.be>
References: <20251229090719.13291-5-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808312; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=TK/SxGQ05rKUM/pH/tRlHkDlthNWVxCX9fVJWWiho1g=;
 b=FgoFCc5XqzE2QVKzkSSYyT7D6V8WFduHf2oYjJv/q2J47AO56Cr78AWCiIpwFbS02UZnsA
 kNXdh205zfmqQ3/SwEC3MXwr0810vrf5Ci4dKIi54eBVASO9CGumKw3CiXCU/yc6zp0asE
 4Q9xZLj1T8L5LQD1Xeeu3AIDVb9GlWaBQIc3xOGxkqciyaqnK+SG47Q9uktH6utCupFuUq
 u7bXPTh8VW/XNJtG1auOwxEngQ47SxTo9Roi0T8I+awzjsXw/5M0Cg6wy7B/K2PcRUBuLp
 FPB0Nb6Za2jBr80aU18XvpC3/65fVAnq3M3cGIzcqDZ7hTNqeWGQ7UG0DyXmRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FgoFCc5X
Subject: Re: [Buildroot] [PATCH 05/14] package/lua-http: add CVE trailer in
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
>  ...01-http-h1_stream-handle-EOF-when-body_read_type-length.patch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
> index fdbf5243f5..7672ff3794 100644
> --- a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
> +++ b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
> @@ -8,6 +8,7 @@ then return `EPIPE`.
>  This fixes a potential infinite draining loop when trying to trying to
>  `:shutdown()` a stream.
>  
> +CVE: CVE-2023-4540
>  Upstream: https://github.com/daurnimator/lua-http/commit/ddab2835c583d45dec62680ca8d3cbde55e0bae6
>  Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  ---
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
