Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D856EC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD0D280EA0;
	Thu,  7 Aug 2025 18:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHdwrWO0agPn; Thu,  7 Aug 2025 18:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEDEE80E8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEDEE80E8E;
	Thu,  7 Aug 2025 18:24:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62B9B4C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45C2880DB0
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSmI0kc-MqMu for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 070FD80D5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070FD80D5C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 070FD80D5C
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-459e7ea3ebeso5742885e9.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591067; x=1755195867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/gYFLdF0ZzPfEDziIdOgLI+f8nM+bMExS4HiyOoI5Qk=;
 b=u6y+63erSmm+TNGUHMsY79rIfRIQa+Tij8VcVhLB1PD+Hg2JDoqXbVopJmqlB/D3Hg
 bEwF/qiriLNzAs9HkDSUHmR5Gctm5eUfUr+lv6aLrCddXCuJqCQMd2PNUoxfdyzNMmpU
 gEdrEWl/ii/vG599ab/O7VK0BkvWjQRKFYSiSkVHZX06yz7QXhulvarEc4BhPK6vzpGr
 NTkB0tpzOrV1AA+pdqI/PU9e8jqa0k5w5OCJ+5FQwzph0IQjCe7LyNYAr88HmY+FkA53
 Xj+C8vvsP7axDcIgwk+3HGzc1c6EkJETK4rle/MZaZc1bnXvfYDSYmUV+mD9rSv2nL98
 pZ6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZLN/S0w+YAcVGZHgTS1e/pIqWHyq/cGx92vpUTx0lDcgF6wQgdu2kKw4138U9cUrYJLekZAr9jVU=@buildroot.org
X-Gm-Message-State: AOJu0YxA/7+GNOSHtuKng7dX3a+cDw8KRApVNQnrobSbPSt7kWY3IwkU
 WWhya44r4wcvg1cnTpeMLXxo1dzLdOZARYZBDzX2NhHz3BkThVUEFbzKukycRyt0sbk=
X-Gm-Gg: ASbGncv8jMdXCgdfIGc/J0SyhX8vEYaueSCJPUfbeiIpiPVHHisRl2ajmpXX+DhFGjp
 OJeEV6xrRfiDtyaroJcNYckNMyAb6AafgSVWCVC3JhANQLp0vv2lTFfHFYkhorcXQn74uhdG+80
 +mzJlCnxDVhg9KMZlN4UcQ3zDWHXLLppeX5g42XD3tiz4j7bmsGP+bGf3HLJ1+57wklkwWlsdbO
 gQap1qm8wsUKPQOZHonKldG674baB7fueBmCeJl3yBrwuvuk8M8UdatkUPoPrskFM3890prNA/N
 XBizpvYmHNwiQr8diuWo8i1ufGfDlZYuiiL9x+2YPD57uW/Wy/Hi09DDxzXgY8w+xch9P8aV/G5
 VBE9xlXfMJ3x2/Q==
X-Google-Smtp-Source: AGHT+IH4IoA23d0LQ6F5H4PewpnRK505RPzGsu8sFEgtBRnd427rZThBLDHeFNYZcpNDcZYm9ugoNA==
X-Received: by 2002:a05:600c:198a:b0:43d:563:6fef with SMTP id
 5b1f17b1804b1-459e70ec7e9mr65859415e9.21.1754591067069; 
 Thu, 07 Aug 2025 11:24:27 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8ff860acbsm1348435f8f.51.2025.08.07.11.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:26 -0700 (PDT)
To: Florian Larysch <fl@n621.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:26 +0200
Message-ID: <20250807182426.725399-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725204540.11530-2-fl@n621.de>
References: <20250725204540.11530-2-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591067; x=1755195867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/gYFLdF0ZzPfEDziIdOgLI+f8nM+bMExS4HiyOoI5Qk=;
 b=FZO+iLLu4yX8vJ4kBqg/BkfK3Z3n5B/2IUmNoBE9fQ2mo2njljiQEFXZccob2rnjK2
 A/Upt4doN+nD+R7gCMWlyF/eZ/CorgmLGdSOJt0zml9E57dfuclz1yKIYo9UWmnqgJEy
 Ayj0Pb2323SvpCuBYWp5hW79c9ijZt8ZQRae1wgtFdK0F2E173ZuUFTtBvQqAydjoRZU
 kfveL1HQ3ftPRO5Jd0pLEs7mXVdZJOASS8Xus7ufQ8a9wyeivKXhpGZCXfUssOaP+2Ju
 r7v1c3E3FmJ5GEZOtaI3dQ+HiB1gP41oBwLxFZInM3nREZbqozjVq0DCU+CcsA3iR8Px
 ASEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FZO+iLLu
Subject: Re: [Buildroot] [PATCH 1/1] package/chartjs: fix license path
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
> Commit a954d39a58 ("package/chartjs: bump to version 3.9.1") updated the
> package version and the license file hash, but also changed the path to
> the license file in the hash file. However, the path to the license file
> hasn't changed, causing an error during "make legal-info". Revert the
> path change.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/chartjs/chartjs.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
> index 3f8da92715..0f97d0a4a2 100644
> --- a/package/chartjs/chartjs.hash
> +++ b/package/chartjs/chartjs.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
>  sha256  111e0751796f087a51e94dfed910ccfb1278fd30e584a6e48514dba9ae7e72c6  chart.js-3.9.1.tgz
> -sha256  5a0877ad6d818529be4f33009d0942cdf7e2ed7656156f4aba7308459a546030  package/LICENSE.md
> +sha256  5a0877ad6d818529be4f33009d0942cdf7e2ed7656156f4aba7308459a546030  LICENSE.md
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
