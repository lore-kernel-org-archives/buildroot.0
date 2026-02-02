Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CECDE7DEF1
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D37CA822CE;
	Mon,  2 Feb 2026 14:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cg1YJUQAeiUt; Mon,  2 Feb 2026 14:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E636181701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770043555;
	bh=qpXk/S6EpVl/78WOQJaOBr5gGKXcbXDH1B/WGyRhYTA=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lxMo4J55S5zA99kfpxglYdddAE42UmIIqhGAiYsbMqmMMtYlhab2bVfab7fhhkjzK
	 TVMyUk+yMcR+dQbhG2kCHmUczvoaDt/3kOsQ5weiaDzU2b4PCUMb3lhccU0dLJVNVN
	 skb3sEjBSQgTJ6iXuFekXtr0N9TBeeEvHC1oma0wt4n8mbnzbL7B5dZ44EmktfMIAb
	 oleqhyQk3JixslWYpSUj+Wh+qLdXUgrQA5Y67I6Knlcvzw/u1KXrcyAJPHJL+W0764
	 GADhXKoE+vzwtnFGvGMOiuwKQiqVerJZ/8KxJiiIeyHMlBu58YPEjndBr/shN3OzT9
	 msvE+v8H5DKIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E636181701;
	Mon,  2 Feb 2026 14:45:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE4E61E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B27840B5B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcfzd17MixkC for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:45:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9F0840834
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9F0840834
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9F0840834
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:45:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48069a4876aso2304045e9.1
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 06:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770043551; x=1770648351;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7N01icHwWJg9HmLuk8FHM7n+Okb5IfhVg6Zc3wvAjWA=;
 b=m2moMxZyuJCUfvoKMec4HkBsqZn1PCOhZBwGY+NLeAqT8Wv5pZB+9HEehoDgBzbtqX
 ElDSp1sVPHByOQi0GXoIawjDHWnsSMwGWlnnIiF46Q5Z4Oe6gkftH6cYopUuMu0rkrtB
 2/OacurAweZ6FruO3qygmazsCYT7YQ2xuXUo02p7zhG5ofHyZC6R+ojmcXmFpW13abbf
 rdQg+qwbqfYqmDX2WhC3pYYRGHdbzzaYVy76lK9ePBie9nEES23rOohyMHSUJqVuA0Ep
 rW1Ix0+9ezpRztEj9y0SWFfEX9uew53S+Kh5BElcpyuqGhNef82HkB4kb3Tg4lKpisVW
 u4UA==
X-Gm-Message-State: AOJu0YzojB7RuPT1yCmEM6LKy+5hb+sBfLMqlQ3BbVqXh4/nV9fz7wuR
 C8u5zFtzgOVsbVMX2R0UFvx4jgpABFMxN4yU5kaWSvMrITzm/2WQg+1F
X-Gm-Gg: AZuq6aJ1HTswylXO0bnAhboQOlqLv63Ojo8iV1hkWXfZ97CJchByzlPQOTR2i+QXvrT
 5DvkZu6eiUDSQLms25zWh41nXhljBucY5Ntrad9JsyG18U/A8j1OevTHfhaVt2ri3s1NBUcEUPm
 pzXWdqZuKboOZz4fOukULiCvvxFVyhEKtzReA1ruBaa8CRcWDuiHIUV/SkyNOTKwvLg58mmfIDz
 GmJOLUtWK8Nw+axaY1yjti0biIKFx8+QdfT/TYXoqpIL6R+HiwU3VZJzn5UFcZgt0SodGlWd88o
 lkr66EX0957Yz0q5SgohSbya/urCbnTbPw3E8J4BQ3oadYHdfOQeil0fsdCFm2LMXHCAST3FVZG
 llXnx1+haki3EUz4GyBhEFNj6ZAK+R7p3uxD6FeCdo4xmD0dV/5Ec7iSCqENcPBUXk7w0hQCe/I
 Z/9Rs=
X-Received: by 2002:a05:600c:4591:b0:477:a16e:fec5 with SMTP id
 5b1f17b1804b1-482db2152d5mr91135265e9.0.1770043550485; 
 Mon, 02 Feb 2026 06:45:50 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:74c4:3a65:f9a9:6c29])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482da8eb486sm115750065e9.2.2026.02.02.06.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 06:45:49 -0800 (PST)
Date: Mon, 2 Feb 2026 16:45:47 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 Vincent Jardin <vjardin@free.fr>
Message-ID: <20260202144547.iqnh6hecskxirfzc@skbuf>
References: <20250830173313.164981-1-olteanv@gmail.com>
 <20250830173313.164981-1-olteanv@gmail.com>
 <20260202114253.283868-4-maxime@leroys.fr>
 <20260202114253.283868-4-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202114253.283868-4-maxime@leroys.fr>
 <20260202114253.283868-4-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770043551; x=1770648351; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7N01icHwWJg9HmLuk8FHM7n+Okb5IfhVg6Zc3wvAjWA=;
 b=HB7mHHR/aekxAkAUnp6N5i5gq85RFPVAzAKzbLaDBQqauNrpdKCSICo1yycBLgyyC7
 CzmVJtoUKAn0KbSGBaryjMsTInQPA5NTRZeaQUz42c+M1cAlyo2KCghgDroLHt9zc/5B
 MRvcCjeiq9gCzwk1Ku6bOt+UKaC3AQt8HqChpJ9CTK0A0c/m/JQPx8zvWR7k0HJYQI3u
 hJiaDnBxGCN83CYw5PMSbP6lC5lK7rvKneVXKh9J7L5K4UPE25lahpsssMqj/2SKB+ba
 Pi0YlQwcBOUHB4sZ4z6LKzHrT/LypNxxC0FZLTUKtqODql4yJDGDy30stwBoHtKp2rbe
 Feyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HB7mHHR/
Subject: Re: [Buildroot] [PATCH v5 3/3] board/lx2160ardb: new platform
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Feb 02, 2026 at 12:42:53PM +0100, Maxime Leroy wrote:
> From: Vladimir Oltean <olteanv@gmail.com>
> 
> Add Buildroot support for the NXP LX2160A-RDB (reference design board).
> This is configured here to boot from the SD card. To my surprise, NXP
> RCWs for LX2160A rev2 silicon don't have a pre-existing example for SD
> boot, so until one is available, include the RCW through board files.
> 
> The boot uses U-Boot's bootstd framework with extlinux.conf. The DPAA2
> Management Complex firmware is loaded from the filesystem during U-Boot
> board init. EFI boot support is disabled since we use extlinux.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Vincent Jardin <vjardin@free.fr>
> Tested-by: Maxime Leroy <maxime@leroys.fr>
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> ---

Sorry that I didn't have time to respond to Thomas' feedback and
continue submitting this. Thanks for picking it up.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Tested-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
