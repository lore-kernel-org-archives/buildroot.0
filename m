Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3BDFCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E57946144A;
	Fri,  6 Mar 2026 19:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gxrvNqjLbXm; Fri,  6 Mar 2026 19:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28A9F614C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826831;
	bh=H1ZAjEihhAf9G4ZudeLraDN6IxSmCuqcJjPhoO01o2s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mBgHSlzOyni50ho3L8zZsjAXREtJohQsr/iJ/tLn1aTsf1P7/mRoTFZItaDLHNnVM
	 Uy5c+AzJ9ShvArAFS6pHr+fLTfiBFYh4d7nDlUbYz0WqRGbJdttG38duKD1XOUoNmn
	 WenCW7TBYv35oqbaafsvF4EcThLMc1NI9b8jNQWjo5c5OtZzJY7IHxcRnHUM9+QINM
	 tEsIw5K26Hi3UqXS7t1u0yZebRfr4+dMjBybxjhF4yM20MtD92J5CNZLTzOaDwzbFj
	 meDW76XMrSDQD0N9pcrOhAA6RI0qN3sFq7D36kQ/JbmVDF5VgUipT+MOJDDuvBzHk8
	 YpC4/T4H9evNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A9F614C5;
	Fri,  6 Mar 2026 19:53:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5BE2223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C0C83D8C
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtvihNoUo_AW for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82B7383D99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82B7383D99
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82B7383D99
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:48 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-483bd7354efso125734525e9.2
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826826; x=1773431626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mh0btMbcjTyQKbOzcVMbNC6ZMFzFZsesiqqHmUD0E20=;
 b=w+/T0LZS5E0Ih3CzrzIsL/bcuHaTEGVA6owKoyJhm28sFvg9nxShAr4yC3Ekjex/Db
 8ZmrhZX/rbL1m0QEvBlub1N+S9FwLn9V/gsfcX+of9QflRVCrgmY74xHnIJKSJsVzXwN
 xFqAf73B7FzWpT9wFEAewmRXqmY96HweUZuFhyeykRcS4abx0MdItOrryqhx/JcP/GuJ
 cGI8yMhNvzbQoVjRDj4lYZ4o22cCuIPoXaz8DxjMr/b7tikVVlJJRQZMpv+JazGsC2t3
 Q3u5Nwe64cLus6qxjDVjyCvRSqHj8FxWKpGiMvR3ptfg9UYav0OQFbrftR8sXEwtVNsE
 oXgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0uDPmf4nh1VtwT0xeMxnkNXz5u0qwjHItxh+yo+BwsYD0u1NFyzmaxQ8tc1+yENYHqSlO3b5P5us=@buildroot.org
X-Gm-Message-State: AOJu0YytC19CYNtKe7HbT1scqvm+DIE/Xf7MDJoL8oN1s93G8qsEZr2P
 f4q4Yr7Lm8vvCDW+wlh70tj98UNFuhX1Ds8Jb/k5CeJgrptjY9+NCCYnky0R5A2/IbNqNMufcPd
 9Cm1i
X-Gm-Gg: ATEYQzyGbjOUy/gVo2IuB/KkZZmTW2FHaekIiHhYSjORQnyyHtYZe2pQRUQ17pDCgsF
 lbr7NpiDL7zpiIipKlH/ifVjs61WXalS337YL+Ft8rDwf/RVxthQio1P6cakJIv6f4QJZNOvCzA
 6VUyPW+OemFqZ7SpK/CFJzVCc9yGf0mqIpD1BNddh3KsgMH1wLYQN6yGu5+akPuAyglSVnTtRLf
 ECISleVTejspxHJ8EnEBOs2E/qgwtcvCxdSCErjWy7XMp16yGtIFPGPc5M/c/pLAaZBalsy59XB
 I0Kri6etV7kdsX9u/NprvWVPBcmmtLaiRxkGOP3lLqyCWFRdRd4NK1EtBzcyAWWnygcKgoCNewp
 Vsc3sb4pV6mlj+tI7WH5CrWtHymiLw2cKyjS5ebdGFjd9lq2bY39/Q/1iM/CG6+4yfLi6/HpIpz
 2AhjbB/ymOi/QS6FE=
X-Received: by 2002:a05:600c:500d:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-4852695b9f7mr58755475e9.16.1772826826351; 
 Fri, 06 Mar 2026 11:53:46 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48527681a3esm126770045e9.4.2026.03.06.11.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:46 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:45 +0100
Message-ID: <20260306195345.8838-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260222175404.1945211-1-bernd@kuhls.net>
References: <20260222175404.1945211-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826826; x=1773431626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mh0btMbcjTyQKbOzcVMbNC6ZMFzFZsesiqqHmUD0E20=;
 b=BwlwI71LyLYmYmIyOWJ42AWL6hbyCqKxHgZBQDI28nNvT3No/DIyrdOY6kFrpPh/x5
 XIClWBuP9uBi1wqP4zhSSg0CciNNm8ARtkykdTvbDKw4i/wJ+Y9+Lb/dZmy4ftOaRpco
 yzxLqdnygvBmxTkhlk+vIDyTRahj4rv/n8KA8S3bdHcgJ72SgHTYtIriE1ZxqYCTURvY
 95XhLBff91ct8qw7NfUGm6ugd4nMCVx6kKPLsiH61aRhKUuOzUwh22/JGHJ5rYKaX/O5
 FJKDeizeI5tvaWX8FULa08kAkIbR8voWoK8YGZWrJzS6iSWJf6gqsdvR2mjnk9tPzk6D
 /A3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BwlwI71L
Subject: Re: [Buildroot] [PATCH 1/1] package/snort: Fix build with gcc-15.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes:
> https://autobuild.buildroot.net/results/3b9/3b92d275a32721bd2cbb10e15c392054dfd42c63/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/snort/0009-gcc-15-fix.patch | 36 +++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/snort/0009-gcc-15-fix.patch
> 
> diff --git a/package/snort/0009-gcc-15-fix.patch b/package/snort/0009-gcc-15-fix.patch
> new file mode 100644
> index 0000000000..227ad5ffc5
> --- /dev/null
> +++ b/package/snort/0009-gcc-15-fix.patch
> @@ -0,0 +1,36 @@
> +Fix build with gcc-15.x
> +
> +Adapted from: https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_2_8_snort/112466576
> +
> +Upstream-Status: Backport [resolved in snort3 https://github.com/snort3/snort3/commit/c3cc27355ac302bd24ee3e9d613166898ec2be64]
> +
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +
> +Downloaded from
> +https://gitweb.gentoo.org/repo/gentoo.git/tree/net-analyzer/snort/files/snort-2.9.20-gcc-15-fix.patch?id=410cb3ac09ab3d55e96876634c4d58005d9ead89
> +
> +Upstream: https://github.com/snort3/snort3/commit/c3cc27355ac302bd24ee3e9d613166898ec2be64
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +
> +--- a/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
> ++++ b/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
> +@@ -160,7 +160,7 @@ static void DCE2_ReloadSwapFree(void *);
> + static void DCE2_AddPortsToPaf(struct _SnortConfig *, DCE2_Config *, tSfPolicyId);
> + static void DCE2_ScAddPortsToPaf(struct _SnortConfig *, void *);
> + static uint32_t max(uint32_t a, uint32_t b);
> +-static uint32_t DCE2_GetReloadSafeMemcap();
> ++static uint32_t DCE2_GetReloadSafeMemcap(tSfPolicyUserContextId pConfig);
> + 
> + static bool dce2_file_cache_is_enabled = false;
> + static bool dce2_file_cache_was_enabled = false;
> +--- a/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
> ++++ b/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
> +@@ -80,6 +80,6 @@ fd_status_t File_Decomp_Init_PDF( fd_session_p_t SessionPtr );
> + 
> + fd_status_t File_Decomp_End_PDF( fd_session_p_t SessionPtr );
> + 
> +-fd_status_t File_Decomp_PDF();
> ++fd_status_t File_Decomp_PDF( fd_session_p_t SessionPtr );
> + 
> + #endif /* FILE_DECOMP_PDF_H */
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
