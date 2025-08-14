Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F10ECA0EE9
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E097F80ED1;
	Thu, 14 Aug 2025 20:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_yr0ax2hRhK; Thu, 14 Aug 2025 20:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE4E80ED3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CE4E80ED3;
	Thu, 14 Aug 2025 20:32:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F70E93E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1074D4048F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rK3e0kiyjprh for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8A984046C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8A984046C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8A984046C
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45a1b00e4a1so8935125e9.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203532; x=1755808332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNOQezpujGhv2I/17o8yo2MwVQaconPB2B/E8+jppdA=;
 b=Uex7MCodZnx8QVAWJp+Zb7ArkfXc3kbVk+fGtv6+klb7ACJHpFCP63vlwRnl7d9Dfg
 T7HQBk23pVft3oqoU+xu0Q2TuAdAY6XWyTu/dSZ+8jDWeHTLWG3FYS/wwtqsHf/dbFIg
 L1KH4nG5AJlcR3AcehdnLWYNlbHLZr4K0z3WiUBKws2zkuCsoNsBJ42NXlzYGuCjqQKb
 5uZLGtd9/HUT0gbVVkzFZJJT+8/gh/PJi39osJ46D2Oxbewasni4b8I58S/OMyT3NPcY
 4VJNCr2xovh5o7G2cAk9iacq1HlAAhLnoJh6xMTv0ZMyo48W10nCGipxkfAVwmqPUwMs
 y0Qw==
X-Gm-Message-State: AOJu0YxNrNXiRS0ObgWtFMh9MfGqfy0NfFo4iHjJgVcjeYMDwzfgr04v
 9RC+Hv5zDOgFN6tQCJF5S+MQ+77OCvUDB+IAzV8j/7HzNGKXVZU03lm+6AAdxa/Lx6UFu8VbAXx
 j9CSlGIo=
X-Gm-Gg: ASbGncuMbcnSKstNlZGBsMo1y5yIYzJZ/sc6YhrZ4d3YOx6L1T9phzN7Z6WuAa+UXdL
 /Z2u9e7sxSoml93p8CyIj+Y0J6yYRaJJHXeUQjYtV6rnQ+8QUn3Qly9Q/4AWTgz6rDbh71IXKHD
 0jnrZkQOzUTTHy5941CYWG3smTUFGvzUSGC4iwbR69jy0cFPnBkuLqLWzYzXFJYfjRQf+aIGWpS
 umIQqJz/G+iB/OBXqgCQUqLfTs2npLU7FsnaZCwbuUycUV9/uMoxqtSlduyVW+GJzldhZq+HW8D
 LXtB7KnYiBBDJtc2N5sYPkeh3SYaCmg73CNK3Phgoglgt31RCPVCo9rsOTOeMZOStKspaFGTRvJ
 AnS0VIKwJYX3VPs7LQkCv6QNa
X-Google-Smtp-Source: AGHT+IGJz14e638kdv0yxwFII+q+Fl1GjvajjtqL+rDC7priAzrJQpUCdjijL1USYDhV2wBncFrTkw==
X-Received: by 2002:a05:600c:458d:b0:459:a1c7:99ad with SMTP id
 5b1f17b1804b1-45a20c111e0mr2091735e9.22.1755203531919; 
 Thu, 14 Aug 2025 13:32:11 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4a2187sm53681429f8f.70.2025.08.14.13.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:11 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:11 +0200
Message-ID: <20250814203211.2816648-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807205439.1104044-1-thomas.perale@mind.be>
References: <20250807205439.1104044-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203532; x=1755808332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNOQezpujGhv2I/17o8yo2MwVQaconPB2B/E8+jppdA=;
 b=ZII434xgppX0N4p+Juf9umPMfSYxGRYj0Wkm7w8U7QNkOTTf7LP+COBYUjrYpraTbg
 dv7ZiBibLfN/mEzz4rkOmVpIoTuk7W6TBucwqbxsf5xsMdRLdffAEOUxtSOMj/S/DXnJ
 C98LRHjcqf70ObnvJ1Vuxvy35QsSO4O30u0at/Pk7798yQ9zZ3uaasxhHrjMx7aKp2xL
 /WZgyRVyJGElaOtwyI79l5JW9cGy3Hu18VPiO7yOSUX1mBDuBrSbDwoJS4o3BbPNVuuH
 8JfOBgBQK+BatOklfe2pQCoUwtdze37nKvERrTIQs1JE7VMbh7O1Y6hHpndDCtGuKdu1
 lTog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZII434xg
Subject: Re: [Buildroot] [PATCH] package/libhtp: security bump to v0.5.51
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
> For more information on the release, see:
>  - https://github.com/OISF/libhtp/releases/tag/0.5.51
>  - https://github.com/OISF/libhtp/releases/tag/0.5.50
>  - https://github.com/OISF/libhtp/compare/0.5.49...0.5.51
> 
> This fixes the following vulnerability:
> 
> - CVE-2025-53537
> 
>     LibHTP is a security-aware parser for the HTTP protocol and its
>     related bits and pieces. In versions 0.5.50 and below, there is a
>     traffic-induced memory leak that can starve the process of memory,
>     leading to loss of visibility. To workaround this issue, set
>     `suricata.yaml app-layer.protocols.http.libhtp.default-config.lzma-
>     enabled` to false. This issue is fixed in version 0.5.51.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-53537
>   - https://github.com/OISF/libhtp/security/advisories/GHSA-v3qq-h8mh-vph7
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/libhtp/libhtp.hash | 2 +-
>  package/libhtp/libhtp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
> index 2e93586f7a..11105f8586 100644
> --- a/package/libhtp/libhtp.hash
> +++ b/package/libhtp/libhtp.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  214395f8b42011154e133dfb4e94d15e4e3e3e12535e744a4c1eec8687d12c18  libhtp-0.5.49.tar.gz
> +sha256  699475c2e512d5af05312e808f1f759a5d3c4cb154e73d82eaa6906ceacfaeb4  libhtp-0.5.51.tar.gz
>  sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
> diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
> index bb6559bc92..a986a79f1d 100644
> --- a/package/libhtp/libhtp.mk
> +++ b/package/libhtp/libhtp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHTP_VERSION = 0.5.49
> +LIBHTP_VERSION = 0.5.51
>  LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
>  LIBHTP_LICENSE = BSD-3-Clause
>  LIBHTP_LICENSE_FILES = LICENSE
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
