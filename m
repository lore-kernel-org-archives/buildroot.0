Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631E7EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2879061617;
	Fri, 13 Feb 2026 19:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_U0uWurVPEX; Fri, 13 Feb 2026 19:37:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB4C615FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011477;
	bh=PSNSkbcs/nz5V/z2eJUuM3V6hia9AJtIt8jVjeCIWiM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RNBJ/JgJdJQH3q+Nqn3y6yic9cg/7ew4PZBMds2OHZ8nDKf6BZGX0UZkzjl3fdD1V
	 h4BRFmjnij/+slKEDyJ5yK8nUwGof+LFBEGAeUbYpN8NFqcW/5neX1f3UUthhX1Zw0
	 XAdVZUKucsTpsgw4TnBTofGte7hukBgZjhBbc2UpPcvXwMTn+kZU0h/gFy8K2oJ+I3
	 JauXg0evzBBb1xglhPjG0xAnJMN94dGACYzYwAjnvDN8Wd4jC3uZvCimGNVN+8J2hP
	 aATem/+1Ya/EpGGr/TGCiS3wLE68milJ2NkTvJR5FYi7skv5kKHEfvgpUcBQ2sNF+A
	 FXXyKnL1PJNiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB4C615FE;
	Fri, 13 Feb 2026 19:37:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23590EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 030AB615B8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Gnyn8ykVWOk for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FCD4613A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FCD4613A3
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FCD4613A3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:17 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso10011145e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011435; x=1771616235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lRouoq638GI1O7h/a4qhU+gmm5lto7xE/VX8DzQ6pbo=;
 b=f0nfBtdurX/SkLIVNfFbzSLl/J51+q3ZrBNv4SHwmPuLekph/Af/+RHE6IDi69GNJA
 U9r7yiy49P7oXGqOGPSXkW+Rcqs48MhdZvItdsBSym3OeF7qCf76QaKMhCETmHLqcuxq
 9CIUHV3apnHQe933KYpenAJn9Ze4cHbswqafx5ZOC1kDdD2NgfvFCy7PiNd2lBm/a+d6
 ZIh1A1v/eSuL4Vs3HseoeC0SuHhsn+jvbLUswm1CiC/CS2T8O1fs57xwPsWXFZyEPtNB
 pI7sbrRLhIoTjbJaJmHkzEEtOzF7GqVQeod9VKMppq7PjmyXmx+7+hjBBtPOqYzIYJOV
 6X6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHN97HtAeLhfKdwdU56bFi6PjdmxP4qSAJ1UpUCed9UD1xPmPH40OemWnv5GHw6yWS3x4YThcH7kk=@buildroot.org
X-Gm-Message-State: AOJu0YwBlrxPlCNuLiK1Q/lFcUE+HzMDN/MbAxpA2biwP6UZDBhWmWvM
 C1SZdCc5budUWM0CaPt6TNUTWAPX2h8ghWt44dM9pRTaXsGBGmiF8+YROPgaB+9RGYo=
X-Gm-Gg: AZuq6aLfaPSKTnaII9dzNb4DmdvHcuiIFy1q3fXuqPje0uySVPlZCisd4tPo4CqTc4S
 SvDdcAsQp+xNRzfULwQ82LgOzsR15wyMayBU39mozAfj1nW3IJ6uFj9ZwD1To4CcN6vtZmPBT8/
 F2KVqQQ7SnuZjWlIYDaW9FJiE1e+88oYBKmpfvEooJlfMEzyEEoX/eZNhMu7hmx7lSIK5qBVO4q
 kq2zjQtWVLDUQusCL79PqFeXXpXUMBir5LJK2XqVH0tAluHFfaTOM0//ApDQgHHfo1QdkK2cNrd
 FX20u33SL5Yc70Q09sDHuEV+x9kAgwmLOMRPbQ0ZV5/1ooWyEUMaGI5VHyiGkNCSg3mJqtEdaj7
 5xry7Ep/+9FZUur43EcCMeFUfvYiSi0ByZiMTu8xHCYUMMY8+9woP5W3sgBadImyXZwg7p7hMqE
 z65EYJ51KWDR8Kn3E=
X-Received: by 2002:a05:600c:4fd1:b0:483:6a8d:b2f9 with SMTP id
 5b1f17b1804b1-48373a16361mr55847605e9.5.1771011435387; 
 Fri, 13 Feb 2026 11:37:15 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d46sm8535526f8f.32.2026.02.13.11.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:15 -0800 (PST)
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:14 +0100
Message-ID: <20260213193714.38871-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250515083640.49630-1-kadambini.nema@gmail.com>
References: <20250515083640.49630-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011435; x=1771616235; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lRouoq638GI1O7h/a4qhU+gmm5lto7xE/VX8DzQ6pbo=;
 b=aZkNccqmjkOHAbeZD91mDga2qRkP4Js87n9fWpL26mbGNhwO9tbmrrHpgcG78IFrTJ
 Qhfh5a82h7p0ANvCMGSGWvlhBFkePtbvqUkXc/S8AQqAOdKE8/5UXPjf4PI0x0l7joGE
 0Qo+g1JiJ/zPZfQGxMnwuQ4fIcCdEfM6LbA6Eh5yMwjcXzvo1qxRG6Vs5uDGspS36jGc
 DSPDnZF09mSBUAh90SqZ/Ye1tXfHJA+Y07NS7hGIg5lENU75pydCXnXnW8BlwWv7poXk
 MGmlVe67jK/fQFSZoemAnVojtZZLprugZRp+YUaxytAaOQHsTBYJzddud6G9A+B23QAV
 Qg0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aZkNccqm
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: add
 -N/--needs-update option
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
> This commit adds the -N/--needs-update option, disabled by default,
> to list only packages with newer upstream versions. All other packages
> will be excluded from the HTML or JSON output.
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  support/scripts/pkg-stats | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 46b12cd992..c22a8e724f 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -1280,12 +1280,22 @@ def parse_args():
>                          default=[])
>      parser.add_argument('-v', '--verbose', dest='verbose', action='store_true',
>                          help='Increase verbosity')
> +    parser.add_argument('-N', '--needs-update', dest='needs_update', action='store_true',
> +                        help='Only include packages with newer versions available')
>      args = parser.parse_args()
>      if not args.html and not args.json:
>          parser.error('at least one of --html or --json (or both) is required')
>      return args
>  
>  
> +def is_newer_version_available(pkg):
> +    return not (
> +        pkg.latest_version['status'] in (RM_API_STATUS_ERROR, RM_API_STATUS_NOT_FOUND) or
> +        pkg.latest_version['version'] is None or
> +        pkg.latest_version['version'] == pkg.current_version
> +    )
> +
> +
>  def __main__():
>      global cvecheck
>  
> @@ -1341,6 +1351,8 @@ def __main__():
>      if "cve" not in args.disable and args.nvd_path:
>          print("Checking packages CVEs")
>          check_package_cves(args.nvd_path, packages)
> +    if args.needs_update:
> +        packages = [pkg for pkg in packages if is_newer_version_available(pkg)]
>      print("Calculate stats")
>      stats = calculate_stats(packages)
>      if args.html:
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
