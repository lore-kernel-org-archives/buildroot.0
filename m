Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4C9D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 220CD40E64;
	Wed,  7 Jan 2026 17:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wR-NghjBGzMD; Wed,  7 Jan 2026 17:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31AB840E58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808259;
	bh=/MpUZGH6Kz1lLHKBciVdkg+cW7zYK03NbieY75Pmpfs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XDyFlzVlyx0typZ0eybYYDLUcSMkpyn5QiWHmSoPinTvBGUR7jxVG+QsmX1EWOY3+
	 bM9bmgdr94AUpRIUMXl8FNRueHyNktnpWA3fa/jlFCnjiPXV2fm3mftK7hqEaMFVIa
	 QsjgbVD+feEgtqiMgvuficQIS8Cmkb96dnO96a5nGye3iQ9GAOsc61AsI0DVqJK96B
	 /yqZRxNGNVr+EsBPNasHDcQgBZ/t327MA/MPj9/sOk4Y3LEZx144eavdQ2dGYheUvC
	 HS98WLIgMiGK019Ip+DB3McmFJwLLXen8rS25LoeOcwxoEBe8etwyVuIStAJRH9Qnk
	 yXrdjNlcJ7Q7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31AB840E58;
	Wed,  7 Jan 2026 17:50:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B1229ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45A3B808BD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoI25GUfERGz for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D1A180885
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D1A180885
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D1A180885
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 59393B97A192; Wed,  7 Jan 2026 18:50:54 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:53 +0100
Message-ID: <20260107175053.227064-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223194653.3036119-2-giulio.benetti@benettiengineering.com>
References: <20251223194653.3036119-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808254; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=atGQgoiiy/vEGjJd1ChHak3nGppfJTNvvzA5f4+EYYw=;
 b=Ti9yk7zgfDBmVgpIA5j78s5ssIVMezZtBsF5loBx0e7SXL2ILgQgmpo64RUO8mZeO/qskJ
 r96kMRsTUzedwUZdnNQmIIZ7M/aZnZVc4zZxLW3Viti7xyOYNCVX/fWYVWPg0wjCrFPbZw
 YAJKiU3Cp8NctqoL4NCXo/16//hox2jnD6w12wU+nJXDKTVlMneAHVHq3kXOO0nRqK0FEt
 m/tHmPguYq5/d3sl+Yj1MjbNVgjeNfeAVQk65shqAxi/y1ABLyVSDs4Fi72D1N898nDLs2
 B2HF7666aYlz0jXWBadBMTYgcJT/17fU5PSyhbHu7otb7aE/ouD3IEp0FeKN5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Ti9yk7zg
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to package
 dash
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
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ac7813fc35..f289f81229 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1292,6 +1292,7 @@ F:	configs/rockpro64_defconfig
>  F:	package/at/
>  F:	package/binutils/
>  F:	package/cryptsetup/
> +F:	package/dash/
>  F:	package/dotnet-runtime-prebuilt/
>  F:	package/dotnet6-runtime/
>  F:	package/erlang-jiffy/
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
