Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CF3EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C036E61423;
	Fri, 13 Feb 2026 19:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKZXrvcMukDi; Fri, 13 Feb 2026 19:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0680616A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011538;
	bh=bBGV84Z4g5zVq8H0Ugqifp1C6cfBoRWT+ALzvUsajhM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JGSwxDoe1eM9rfwWMrKprT78No9hdSaIu7x2bgsstGxUXFqfvPM52X+eXJFnkmm1E
	 XJP4TiQg9rkJGz1e1HhBlLxxnE1jEXuyocD9IcE6id6UgDKcEfDuHVQZ9dfqkr7G/b
	 l6bam8qAJBQU9my4HnxJb3rQHkFlgva/iEUKmAibm6LVLvgEoe4gxYWWl5IyFrqpU8
	 ETv4VEXAE/SyuTyYCooJC76P191YWn/0B3f4ALMoDwPEVoX5BnKxQbwtB5jmc0I51F
	 YnsHfPeKS8U4g6m68Mwr6iGWuzy6FCBn5WvfewS7bD0Zze2jUcxw9VhQp44Ql2l4rc
	 3JcSqL+1VWh/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0680616A5;
	Fri, 13 Feb 2026 19:38:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BE98283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95E8984741
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiGTET0jVJaL for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73CF38473A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73CF38473A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73CF38473A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:52 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48378136adcso4202855e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011470; x=1771616270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g2e7KHwQMsr92LiWBwAeojpiGShhw8/a/6Y3lIhDWBc=;
 b=BTgY/sous1CokYIysspVeUZkJ9e/TBD3tE7csfSxsDLl9xvw/fwEcdaSBt2B5r3gr8
 gYIY3NhAkz1AOfeVIFvAnv49J0wkhKyP4sLY4FJwabXy6bFxMfhRx+akdNhRJGja+luk
 snmb4RZUozeKv7ZFe1B6RqRl3dz36HKDSdILEzDKc5ci1qrh+TAyidzaTHPq7u1fz/K0
 F/uyJ3g0qpAwrcpNSwRJ01gwrLJfT1wBfv9nX+sE1upHG9/ob6HDHP14mbU55fHg/hPQ
 nTpScvlTZPfYKYNn4ChIRhQe7EQKcWoGpx7jeCQr3HBJjFtsX4exH2FQiDGydXiNdytZ
 CRFA==
X-Gm-Message-State: AOJu0YwNxr3TxaQwZLHfy/18A/vr9BPFKEFY2NWR0Cjcs9ONqfQN49Ch
 j1B8kLxpXpzfMlRz8vIjZbPvCFEON2ioKUTCospQzZj69HhjgpuGfOUe2oCfoaenInU=
X-Gm-Gg: AZuq6aID5T4GOySbF9YlbSFtSlmj1sdKmahHE34n6Ogur5lKY7jGcxwFp0Nwdwlb6V/
 E125gR8OCxDkttrbZ80KbFjaze/+AVea9eDfeMgdB5dkEwh0Yan7UDSrrkBoOykaRttHlOPoXkK
 TbcbPY61cVqraoK+pZOSE+fSAI1P5QQptDwq06XGwe51XSEyascDh1SnM5+gzqP1f2jx0H43m94
 lDvpK8QClZTfloGvYuaPqxfCBJUuaTxTZCQows1UpNtE6+hHYRV83OwczCis+irbuWWixjGe+4X
 MyE2UjWlj0WXEVRXuhpU3WQvRBXzH0fHc+1DFJNUTgJqC20zU/+wWBzrn7UvdeIF+p4irSdeAy0
 l/q/PoyTT2Ra+A3QjiWBr4hIYRSSPZz0RdCkABwvm13bjAQsuaucMN3ju4wqe67zXSKobnf/8QH
 k4/wgBJ7D/YAnwZt4=
X-Received: by 2002:a05:600c:4706:b0:477:a978:3a7b with SMTP id
 5b1f17b1804b1-48379bfd7d0mr6375815e9.22.1771011470378; 
 Fri, 13 Feb 2026 11:37:50 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd0deeasm199039255e9.12.2026.02.13.11.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:49 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:49 +0100
Message-ID: <20260213193749.40790-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082405.46683-3-thomas.perale@mind.be>
References: <20260120082405.46683-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011470; x=1771616270; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2e7KHwQMsr92LiWBwAeojpiGShhw8/a/6Y3lIhDWBc=;
 b=KsG5Ztxl9D+ymAAuLmQi81O5X3/vFqwQa+QqqsqTJABnAToWyrfafNVsqSkzfsGwJK
 tK8YWfPqwkldWP5ykPbP51TdJgJPblbCYc7SzmSvU+j9yxAz+FxLML8WD6uMG2BpkwRX
 O2xgaKUoM9pR9xHP0sDEZZWjQhI30+UUt2fb25gCe06U0XEIbINHBlfAwCrRqF8P+8Ge
 UUoe/vwTCDlORFv38VBA6upuK8LN5fvEcpyfdzRgeH6YkPAHI/IL8YKtIs9cLozQBXhh
 65WX0GFTdChlM6L7wIVD2OA5PMirdNmcM5nXJDyIH2UYj3EZKGvIHY1dDOsUV5xFM4ZN
 4jWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KsG5Ztxl
Subject: Re: [Buildroot] [PATCH 3/6] package/mp4v2: add CPE
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
> The CPE `mp4v2:mp4v2` is valid for the package mp4v2. See the latest
> CVE: CVE-2023-33719 that reference the upstream repository.
> 
> [1] https://nvd.nist.gov//vuln/detail/CVE-2023-33719
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/mp4v2/mp4v2.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
> index ae777cdc75..8d8e184b99 100644
> --- a/package/mp4v2/mp4v2.mk
> +++ b/package/mp4v2/mp4v2.mk
> @@ -12,6 +12,8 @@ MP4V2_INSTALL_STAGING = YES
>  MP4V2_LICENSE = MPL-1.1
>  MP4V2_LICENSE_FILES = COPYING
>  
> +MP4V2_CPE_ID_VENDOR = mp4v2
> +
>  # help2man expects to be able to run utilities on the build machine to
>  # grab --help output which doesn't work when cross compiling, so
>  # disable it
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
