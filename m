Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5CBCCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 07:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 790AA406CA;
	Mon, 19 Oct 2026 07:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifftpKQG6VTp; Mon, 19 Oct 2026 07:48:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A97B5406C0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792396106;
	b=rhvw44ni03Wck+iaPk2BEQeAdPWWvFwJCOGMUS21Psb/6AmGQttDIOwuhO8gG5gOrwhc
	 l5dEMW0REB45YpsqV1BGMoWvsz7uTC+9yWChHqnGvltqVMndhAU5RRCmImt4upZLd1x+u
	 XgxgUGmDFRA+oErmdPXXVUI9rNxGwm5hd273OsfcMz4B3tQBXldMgcmC5S9iwIbgiz9WP
	 Ua399AHIwXBO3s336TfpRSDjuGfORxM3kkyFNm3w3m5Gkl9lA2at4qGG7vwjP9HVHw7Z5
	 W8ahFqM2hCUpQY6QOhEgfHKkFKMfnfjRZd5Z0NvgQamTomcXYEJna07Yunn+HISKLvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792396106;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iDLkDweQ7SIZR9eCGHrv17/LWMlYCpMlzo9GoYf/Pko=;
	b=lgE9y7Fx0wkUNLaTjSLWNr9mW04oIkJ6nZkpNoOkIP50Mw/eULTvSMEpWzAo+BT0Wc/S
	 twGaLWRJgAynTY0ZA85LHBkXp2WAHI5Gk9jySm/jc76VntqTg0Er15xtX6sbxris2Gow3
	 DTOQEztgnrgIPqhCmaNTqvfWkuumbsBJCBbXQbJgPwA+l8RyDNGLeOzFPbxswH6RIpy9z
	 jBU0jE35jH4wpp4AaNOxoUwFRGFRPzEGLkOCjB1gCHHWtmBAdBOI+sun+PyyMbrAL/tie
	 gTXN09KR5V5ewOh9xA8QleVRd2jELX9MEddM461eYfLlhlFp6nDZexr5+t+1tHbkW6Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792396106;
	bh=iDLkDweQ7SIZR9eCGHrv17/LWMlYCpMlzo9GoYf/Pko=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZdDptxPOQAz3dSkEvKxiAfOhc3DqPB9Vh8oJEQYtnqGWwBn9oQdanw5Od3r8Js3f
	 86isC9tp9pOCSRMpuKD1e0dO31tPmOfiT/FVZGxfec34Fd4SGzO1l+l3NTzS6lI6ZN
	 e1bhjV5lR09P8TxeS6dnt125xL+bLei+ZbZ4ko2G53knMBZM8+PQxxF/QstOGKz68j
	 TZYCRK5sOOvTA+SnJIfacOwuLoY57Nq8q72Ms+bMsQqosipXDOE/dSRykzp1pZmBoO
	 My0GpzHTG9slyMVDuapekA5iwsa0C52oZIEWXX7OXdVWWVSsTqBRb+X+TSjyfzFPac
	 LUrX1OLR72cgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A97B5406C0;
	Mon, 19 Oct 2026 07:48:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C4992A8
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A081401EB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYxf-YnvjEZQ for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 07:48:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AE7C440062
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792396105;
 b=RsZjDipauXoouDY4+vVZXESv9imogHXyxpz1dRvKXh62h46pcLFO8dAy4Y05uKpgpvyg
 XliMS+MpwwPn0418KG1+5JQAcgOz3VbSp1WhfJulntSoYvOA1qm8X3LgMXZGbYFhJq4wJ
 q202DHAvY8CilM5YVseqq2s7fjS2n7tGiIw3LHa5bwa5y7mSYGPXUElUVt7WKOQRlh4Xw
 JfaLPKesDtSFlYD1gU/xz0BYXzEVHJ1QbFcp/Kp7wtDQVnyFT4n/sgQLkMFFzMHqJag0n
 +2OCMKQnDhwwa4wkXL00AxPhVfs2SD8o6dp5k13bEZVsjPl3Qzi+N9aQJueAMnDGSiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792396105;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=OpYCkO52i4XcngcKsxIIsHc62rL7qiOEQVQfaSsrlnk=;
 b=NzZlwaF2z2nDzBDklX/UdUCrwrrqonatx5KsjwuisqYjvnNN5Ysyoj+YN3Tn9+S3xd/f
 8NbyVqrWWB6H33/ss+p0wDnNJGDQkVGgIa3yGnGhktXoIeiBfOj0jtFbwUqgqrNXR9mbd
 4uWQIl+Q9s1PPeWEZsKdn68+VnsA/HjtSoYQsPYxFtDCC/BHnLZs3URTvJ43OMzRAab1M
 i4XZmJ1um3kxch3YaBizM4RsJHLAecvw77bBKEmNPXIY3Vggus860XaHFlT88ZAAdKOCG
 Ej+01p0YVILPV978twZiUPSSecJrag1UjXR+OgBK2H3bKpFzKEUZ0Un6bSqV98mFpFw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GEwmWvO1; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GEwmWvO1
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE7C440062
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:48:24 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a1e3098ee2so10285935e9.3
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792396102; x=1793000902; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OpYCkO52i4XcngcKsxIIsHc62rL7qiOEQVQfaSsrlnk=;
 b=GEwmWvO1zDRwxlGgeUIp75fCFz7eqtOf7Jwq1o5t5WqThqV3swfaGDWPbIYD3xPhzb
 P1Sv2vsgZHF0gP75uQIlNcbmUQxV5P8VUUbRmEaNkqAYpCY1gIiNw/wk6DR2DComlrDA
 Fy70130aSsnLKXThUJH4ZVePQmq6zgoOb5D839Y0zsDvWy+S5w2jkqEF4aoJvJmUZMjK
 DWe2wL3Hhb0oDXxhs4bGeMqDaBXa15mjaDZSHuak7bOC7uIHMGStlczr1Z25Qw/agkYS
 IkN05RgIynTwgocrMCGftcXwR5s3uKsKkjQYcwLheZXloKD8509ZhcJmvfuK8NmAkR6z
 z8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792396102; x=1793000902;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OpYCkO52i4XcngcKsxIIsHc62rL7qiOEQVQfaSsrlnk=;
 b=Fq+ne5wh233JLPEIaVCys62A7LZq6Susv/t/3v0SU3aRYc4GImyKhz+9fLj8EyVGGd
 u1PzmTpnJm90g70Pu1tv6Q+R/fROKKaSrLd1RIdhRvJQpY5d2F5q3/tS+XiDXAk064JU
 vHybWA0tUoZQHrpjcHm2OfSulTM+Vfg0W1sl3yIjf1j9FY26W/OCl2DD3D01hFiWQzAz
 KDj8CAtTVUbiibr6EO1+1uYTSyNXMkDc7Xkn8f5ed7JqUZx2QJfhii96qf+ttrsTF1YR
 7M6nvPzy33+sWX9nUXXjZSnlgMsWQijbbf5EujUbL6xGYr5nWLjYSL022TGSgnnqSxQS
 PNhw==
X-Gm-Message-State: AFq9FYI6LbIuYdhBegIDyxXBXDgH2Kw6xOiyKEUWzAP0NreETjl3ltB/
 WYwiH8z3E7maDouHtbC5KSuBOryl6/jaQLG6bKlBt0WUcZWAISenhw6Qmt739ERJ
X-Gm-Gg: AYBFou0vn+b1T7MfSTuE149qQ1DzDFxxrXws+PFH5XP9Gahfvh/glRLhrqrstwst3V5
 2jVRWKhjlAwmjjbT4/4LGACuifyDDw0qjvhITMQt538QtLdIvjxBoGwVZJ3nU+b/HtsnVm7nshD
 Fe4QnFjFlQ/a7luwLNAREkIz3VFeczHbR/OI+FPDUbUPu3vL65dMHD0FVxudupTYirU8O6T8HMY
 6EtaMUXKwdbKXU7msbApywa2rZgV5vBZQ1NS1qnrpByhBXPpQdXxCnXdRsWpcNX9KgLtsmk4nTh
 nbhTPll0UVq9a9pLblvxIJ7FpLrCoq1w0GnPZPI93T0M30uRcpiTSgmOzV42iJRRiBRMUYbIgBq
 sQBZnxsmLqXYugHXRqTY+V1PmwFsMuivWMuI8y94QQ93b1Dntv0io0D4uxh7qw0aaPGG5exCa/i
 UdS8XqzXPxPuGyswq5gjpmy1Oh8y6HJ5oXz3R5yDYD0oOCCgUom8vmeRoMJVjyR/UaG3fPLu255
 728UfYaOPFb14z2gEaQDaSsLlrgtBHOSbbk3lKh5rbOtUzt0M5WxZJG5WFDt9Fj0NY0D9iqeR0d
 j98GTBM4LXEe
X-Received: by 2002:a05:600c:4ed1:b0:4a0:2500:2cd0 with SMTP id
 5b1f17b1804b1-4a1d760381fmr145714665e9.18.1792396102015; 
 Mon, 19 Oct 2026 00:48:22 -0700 (PDT)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cf04ffe9sm181094135e9.0.2026.10.19.00.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 00:48:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:48:20 +0200
From: =?iso-8859-1?B?TOlv?= DENIEUL <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>, Vladimir Oltean <olteanv@gmail.com>,
 Vincent Jardin <vjardin@free.fr>
Message-ID: <8df847c25b2d0b181922e99411f64e7fa5f6e4a4.1792395346.git.ldenieul@iliad-free.fr>
References: <cover.1792395346.git.ldenieul@iliad-free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1792395346.git.ldenieul@iliad-free.fr>
Subject: [Buildroot] [PATCH v7 2/3] package/qoriq-restool: bump to
 lf-6.12.34-2.1.0
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

From: Maxime Leroy <maxime@leroys.fr>

Align with other NXP Layerscape components using the same tag.
No code changes, just switching from commit hash to official release tag.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 package/qoriq-restool/qoriq-restool.hash | 2 +-
 package/qoriq-restool/qoriq-restool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-restool/qoriq-restool.hash b/package/qoriq-restool/qoriq-restool.hash
index 72a34473f2..77c6442269 100644
--- a/package/qoriq-restool/qoriq-restool.hash
+++ b/package/qoriq-restool/qoriq-restool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2879f14c9dd810e92d4c51c7f1a3e6705a5a585c2445e507f63e39872ac6237d  qoriq-restool-lf-6.12.20-2.0.0-3-gb44748e.tar.gz
+sha256  5a17fad0645d943efcae215b2d99f93406f605000cd4f0d5d9df627bc6f4e631  qoriq-restool-lf-6.12.34-2.1.0.tar.gz
 sha256  ddc794a75f11c3bd01015f16b9776064a894015e7a1603541283ccbc2e1c3a40  LICENSE
diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
index 79e87ef1dd..3d16531def 100644
--- a/package/qoriq-restool/qoriq-restool.mk
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RESTOOL_VERSION = lf-6.12.20-2.0.0-3-gb44748e
+QORIQ_RESTOOL_VERSION = lf-6.12.34-2.1.0
 QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
 QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0+
 QORIQ_RESTOOL_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
