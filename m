Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE62FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7E7084EE6;
	Fri, 24 Apr 2026 16:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbXZB3mjm_Ot; Fri, 24 Apr 2026 16:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4987084EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048064;
	bh=khaVz5Fss21vtA72D/g2qe2WSysE+PRdIZhfJj3gAlY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n8qwcBzWsVrHkp7YibpDxA8UYm0P32UnRTx8eQiXrSEkmlh2pii5bHa7RvT04Xyt4
	 jDUdSZZ0+4blLVIejgtOoabBQ066iZdqkXBN4PBDBs0ap7Tliqr2l8rEuxdyyPk53C
	 HeT0juQuIvn0YEV53mtkiwqlPf7n3R/4MoyyYKvyudZACLyNPVdaFEVOdDTOalXseH
	 JZc8eqaZgIOyuzXcDbJggDgbu7T3pioLgwCykcTuxqzseXOPCWiOrjbSEEFVBKaSq1
	 2tAZysmoh6pRbwUGrpAe4rmnLyXPWk1Ho+od4FxwUwy7FbaTv59JR3MEGu0D0nWXwR
	 fbS0mevIz8zBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4987084EE5;
	Fri, 24 Apr 2026 16:27:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12048194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0EAE61C33
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqKTyqE56n3z for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CEE6861C2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE6861C2A
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEE6861C2A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:32 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so45775835e9.0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048051; x=1777652851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yGrNYKOdufHUJ+XUHwf6ebPOh9LEcHoe3mDlDWomGqg=;
 b=kigagyUVDeAmhQwy9JnTei9lKPkPmJz/Ch2eMLKMfx1zqSOhG3mRvrUBUBJBkxB3fT
 HgCFYJXRNUsk13YrMAT6BbBsrUJRbTjflU/H/wpRHso7ROP4e724nAMrIpdy3s+aS+0r
 lg1oCA0WMHuCpQqCtHN0njcVeea9llCdJQEOYT+8jP11icYgMV1c6/h5Axm8D1pFH7Bw
 0+PP7lYF9gtBO3JCRXFT+jrwIvxLcYe4MZW9zC5R7pC8MXPy7eYtgntKSWxRBto4RY4P
 VAxswfaTfvz51OEzs1Jl3s54kbsBSobf/hDoupjdShJIi+JMG3Qof+fDK/PLVLVIWf42
 GKpg==
X-Forwarded-Encrypted: i=1;
 AFNElJ82bTIVYmpSwkLjQarTBxzo7MqMV8gL++iY3nekwJ2X+sUOz/JVJBIMjcySE53q3MZ/psdLzWeYl8I=@buildroot.org
X-Gm-Message-State: AOJu0YzHti8SE7Wtd+L+Vd5Hddre2xIc9Pu5Yg9kCl/uphI6QTorVaqP
 DcS36MDgoNVAfPb9SswVTDVMrA1Qc6Zdn1Khm2fTKjYsEe+mfk2Du9wFExbSIjDwoYM=
X-Gm-Gg: AeBDieuxaEVukOftGV9eK24eEe5QLnfUDUEUSGw3AwxbyrEns2KC/hG2aap+m7fPAAl
 PGskSV9uluZS6l8aoGuk0ZfiyMSSYR3AeSSGHv9M9yxcK6QVLkx+dnoHNH1HLOZlU6Oy5jMebbQ
 0iGd1bBJdPjqfLw6nBNcG+4uJjdbXC8zrJUoyt+BZhMkpOI3V8WAv2YPhj21PIEyfx8lKp5ac9i
 mDtyhytCo/9IeNMOh9InMy3E5ESiEAl2tUwGi8zWccXDCbm++NhwHgfhym0PwFklnmhPVpqG0lQ
 Y6eev1lic2bYethqe0dTtLmfjS/K/UYZllo0XfiZ20HRgbfo/+FqzeFseMX1iIaUqqQWK6KpvS2
 nu3LEWlF1x93DJ2P9Tmxtkf+rj+MI+lN76CoDmaq7BK3rnvfYqjcJ0N33L3es8qLp2gnC0KuW7Y
 o2C/TgonYroXaIMLSma3fN2W5kK7fXMaa54NdG
X-Received: by 2002:a05:600c:6296:b0:488:c40b:c8a4 with SMTP id
 5b1f17b1804b1-488fb73d764mr441625315e9.1.1777048050682; 
 Fri, 24 Apr 2026 09:27:30 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c01cfsm626653745e9.10.2026.04.24.09.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:30 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:30 +0200
Message-ID: <20260424162730.162441-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260421162617.2830354-1-titouan.christophe@mind.be>
References: <20260421162617.2830354-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048051; x=1777652851; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yGrNYKOdufHUJ+XUHwf6ebPOh9LEcHoe3mDlDWomGqg=;
 b=MjR0R2y3NsE7r15XKT79VN8VG9quFcFQEIglwh6ejpeZ7vGcDNKYM4wKzV9jLwdWoo
 NzR0yzCTiCetSUyHG24EH7Xl9osAxdaIlsSakylzL3vaKp+D0bPfu0xnj+bgBRXQCqlF
 YeLn3LiTYIZoLLWwBOv0bnytLcLdST04p1M4pH2GVkHRbkoyo5q2FwfBAG2GTj2S32qy
 cHSC0vzljLh9PkkZzBpeHP5W4trrW8MRoXJo4WZ4ablfg9OxopE0RCucMMVT9zJuM9lB
 /RLTEdD8Kk/NcDgrg0xNcK1fciZiEyOb7hMZDiENkMRK8zeW2hf2AhW2PjXHvnGnoB3t
 VClw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MjR0R2y3
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/dash: add patch for
 CVE-2026-31323
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
> The vulnerability description is not disclosed yet.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/dash/0002-fix-CVE-2026-31323.patch | 42 ++++++++++++++++++++++
>  package/dash/dash.mk                       |  3 ++
>  2 files changed, 45 insertions(+)
>  create mode 100644 package/dash/0002-fix-CVE-2026-31323.patch
> 
> diff --git a/package/dash/0002-fix-CVE-2026-31323.patch b/package/dash/0002-fix-CVE-2026-31323.patch
> new file mode 100644
> index 0000000000..5c92119db5
> --- /dev/null
> +++ b/package/dash/0002-fix-CVE-2026-31323.patch
> @@ -0,0 +1,42 @@
> +From 0034bfe185d3d875cebace8cb3ca5c9dabf9e0f3 Mon Sep 17 00:00:00 2001
> +From: Muchen Hou <996029583@qq.com>
> +Date: Mon, 13 Apr 2026 10:28:29 +0800
> +Subject: arith: Fix CVE-2026-31323 INTMAX_MIN / -1 overflow
> +
> +Division and remainder currently guard against division by zero, but not
> +against the signed overflow case INTMAX_MIN / -1. On affected systems
> +this can trigger SIGFPE during arithmetic expansion.
> +
> +Add an explicit guard before evaluating division or remainder.
> +
> +Signed-off-by: Muchen Hou <996029583@qq.com>
> +
> +Merge the overflow check with the zero division check.
> +
> +Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> +
> +CVE: CVE-2026-31323
> +Upstream: https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?h=601bc50bfc2858ab7a9ec327fe4e33a9c4877759&id=0034bfe185d3d875cebace8cb3ca5c9dabf9e0f3
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + src/arith_yacc.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/arith_yacc.c b/src/arith_yacc.c
> +index 1a087c3..b978ef0 100644
> +--- a/src/arith_yacc.c
> ++++ b/src/arith_yacc.c
> +@@ -98,8 +98,8 @@ static intmax_t do_binop(int op, intmax_t a, intmax_t b)
> + 	default:
> + 	case ARITH_REM:
> + 	case ARITH_DIV:
> +-		if (!b)
> +-			yyerror("division by zero");
> ++		if (!b || (a == INTMAX_MIN && b == -1))
> ++			yyerror("division error");
> + 		return op == ARITH_REM ? a % b : a / b;
> + 	case ARITH_MUL:
> + 		return a * b;
> +-- 
> +cgit 1.3-korg
> +
> diff --git a/package/dash/dash.mk b/package/dash/dash.mk
> index 0993cb99a6..a5455d8ea9 100644
> --- a/package/dash/dash.mk
> +++ b/package/dash/dash.mk
> @@ -13,6 +13,9 @@ DASH_AUTORECONF = YES
>  
>  DASH_CPE_ID_VENDOR = dash
>  
> +# 0002-fix-CVE-2026-31323.patch
> +DASH_IGNORE_CVES += CVE-2026-31323
> +
>  # dash does not build in parallel
>  DASH_MAKE = $(MAKE1)
>  
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
