Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01B9CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E2380DBD;
	Thu, 14 Aug 2025 20:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4D5YwDXsF4Kj; Thu, 14 Aug 2025 20:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64D3C80E88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64D3C80E88;
	Thu, 14 Aug 2025 20:32:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58989228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47C0C60775
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1koR_gleUKQ for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F442607CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F442607CE
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F442607CE
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45a1b001f55so6612795e9.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203534; x=1755808334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DpEkj31sniUwXKkgn2RGkSQ4t9W9XRWLI+VoO5pV2Qc=;
 b=f9HGVDYofaqDivLgzTh/BPoenxIkbwPWQ4OVPpP9Up0GDd3dEBcuI6T3oRRuXd5FD/
 sk2HP7qVvKjcGkmjJuftx3GAaBLgY9vTFELGehBIDLNQGmzphobBK1h70y5/RK9XLs3e
 jSOHk9fCSd2iRE4ZdJ1J6k36UnTnVQW/dhl3CpKbeCc9NtiSg+rVN+yI0tG5M03IPTZ+
 IV+8me3Iz8IGAwB76XcV5Au7zCUqsWRfTcYTgjgi9MZYwcvP+u7p4dEJlMjF+ck7uDmu
 D/Iek0xeD4SCLWTbaYWWSv8xdO97buUHrjWwxpIcKhEPJml50Ul35BGIadQJCyS8gkXg
 1ECQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4rigjlr4XA4KDBv7QLBxCJ2tRgMUHEPC4/8N/XiqvDlRhe7au/8+rKIVXBG3YIhWZSq6GnWQ/s18=@buildroot.org
X-Gm-Message-State: AOJu0YzOJbSL6o7UqUI1U+PO6BY5cKpDVLT26pXtKbrGGwvM+ntzmLV7
 hGP2Mpke2796yHkdoqORHjNqOSVulTEE4i6vXfdzKalCxKZx6ciXtDt2Y5WHvMcc/IY=
X-Gm-Gg: ASbGnctHFgW96zyMMa9LD3xc3XrknHZ9DM2HsNPidxg66BunZ1QsUdhQHayoQ3osNY5
 5qLll8411rWObORvDyjIjipAgFuxmmROhhReUaM5ukquATHOp8sWgqDP+YRBEdKET7KIrbrB7E/
 tUcY2RyFJl+Hodq1NhwnaPsE1dCddGXM/QDsE0EZatM/1mQoxRLtuLcsHrAdIvlH+xR7Pa3GJWM
 fCdrqHhjlU4BJf0R8nwu2UfitSFxn7VaNWoW17uYpC09kVBm9rTgN7/rMZY00zr3plPpmoBYha0
 pA0HjHaiBHvdZeCNIqA+PSewCxljz7QHQNqllHH8CDaCA9wz64gCU8JwTi1XyAJp0xQ6QP/M28o
 pt2ffWx/Om4gneQ==
X-Google-Smtp-Source: AGHT+IG5FjcJIWlvQ8/LOuKjeqsMf4kfc3cA+QaK1/hZmQgyK/Y5AEGVosZo5hu4ofLMd1WX8pp/6A==
X-Received: by 2002:a05:600c:5249:b0:459:ea5d:418b with SMTP id
 5b1f17b1804b1-45a1b60d239mr38377215e9.9.1755203534173; 
 Thu, 14 Aug 2025 13:32:14 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c70b2c2sm35783385e9.26.2025.08.14.13.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:13 -0700 (PDT)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:12 +0200
Message-ID: <20250814203212.2816757-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807062327.1637333-2-fabien.lehoussel@smile.fr>
References: <20250807062327.1637333-2-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203534; x=1755808334; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DpEkj31sniUwXKkgn2RGkSQ4t9W9XRWLI+VoO5pV2Qc=;
 b=E8ADTw8BfqEV8cRDQKL0WExOUwLB9SEUiG9yC58O3BRVHvOTXG2IIQvgyVIqr37/WB
 R6HVEGC/iqXq2hOe9gR/8u6Kx5ELroeSxtleJX8aBXTp0uqTDBRwHxE52G2+e5E6/oB9
 aAvnhJ6dXEAqk07vFeeQ06ebKzelfb8WJ/GWT7L13s78KMA8yZNOMxteY6w8Vcp2Bqzt
 +kdlkPS97+IH0zPnRE0T+AY83esgFrHZBNo+pCDZgYaHLzHLSs5N+AVfyyuxTmxFfDDO
 mUXWtl1ZabvP+VyysrQxpGGDVnSzBFWOqctJSzIrYccXijw9mSU2p8UpSXUX+PIX2I+E
 r/3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E8ADTw8B
Subject: Re: [Buildroot] [PATCH 2/5] utils/generate-cyclonedx: sort
 dependencies
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
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  utils/generate-cyclonedx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 3ff318f11a..7fa369d7c7 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -203,7 +203,7 @@ def cyclonedx_dependency(ref, depends):
>      """
>      return {
>          "ref": ref,
> -        "dependsOn": depends,
> +        "dependsOn": sorted(depends),
>      }
>  
>  
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
