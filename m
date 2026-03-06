Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB888FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBCE141F8E;
	Fri,  6 Mar 2026 19:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVIsKgQD1j5p; Fri,  6 Mar 2026 19:53:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F5442157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826817;
	bh=kG8cHlAQIYmfOwc2Kfia2OZuKMn5a64RscNSjFj23II=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R2goS+uALueXLOKE9tsV4KpC+fCgZQTqYhcmMdmuO59qNJ8elIqY7ev3LZZKL6hI+
	 g/yabsPHaYynz9f8NEwg/Fv9HXuOVbs9i1hpzmwKN/5PFEePe4Sc3CtSx6MpFNCS2e
	 xzBnE124/+CFBgJgiN3XBXiDo9zpEatr5OWiCuPDebLUeld6fx+95oTMXKpb+Pu3Vj
	 SPqjWdgU8UE2fLNsqENRKsdBvrgiz7Rxalmn7R/51JgG/a67Eb6aibA7ct0Wpp9D/I
	 C/nw6h7/GyjBZXQzO3zPGHqD5L0OdY7RuPIDz3wEil9T+LeK4iSWz5NTSl2RO8Di6C
	 InoMe77/vcPXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6F5442157;
	Fri,  6 Mar 2026 19:53:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D220E223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3FFB40343
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPGCj6yLmd6V for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC27340455
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC27340455
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC27340455
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:24 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439c9bdc1eeso3288965f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826803; x=1773431603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MW4Lgys8pP1sPbYs92wMrEmPKe6+3BwS3sotgzSHODE=;
 b=ouPqn/xhSf2dqJwEfHx/JCTIaw4auqc174Ttzcaco0SkLLDv+3UxLThdJZMeec0xu5
 ly0AW1O3Bn9kS5w08LH1Vko4ETETCD0+E1IrkLQspGsFGHJs8p9oFDMcOT14qajXACQP
 naw64lNsz6lQnbTu0CwefoDPUJdpDq/XKvLfxMBXMQ6AuAJX83pcYLorcjJ0G2q4D+2a
 Z2u805bGcMKqsZEEeE6q2/PKqS3pYUbPSBdgg9cdnidkwpJWOYGKVFN3M0o3Ol1vlkbS
 h4L/EB1HB4k5gzP5pEqTOzYpa3Jv1E12ker3+p/mKC87W+22FTccjMOvfR42QCAwBCmP
 zQug==
X-Gm-Message-State: AOJu0Yw5BskW7fSdaS3RWVuKxKP9L+aAuCfDvELBspfEKrWIc+bb5OrU
 MSHqelOzi5zW8D6VsLzgGt7w4L7VLhBItjH3A3V8dhv8yHlclABiOYkVJ3nF/jE41bc=
X-Gm-Gg: ATEYQzzNkKb0v2Xv4/MiFsIHEslLnXDo8l1w5vJP05t4/OZZHKh/bkQineZsS907eEW
 OcyItprMdK+XKhXHomGnIFS87Wnqj84YMbugF1Le728iRegM9CoG/xJj+neQs+/gZNwAnsn2zI0
 MDLEruKTavA2Bcs9uJ6Vsz7ebs1NGPU5ZHbsSJj/E2fb0Gu7F4VevnItuo5L9KDY9GsEHAWJ4I4
 2Rb0Dmqp17cYa5HV5CMRH9Bt4wo5Um5VhvwuGdTNMVe1WKOVunPUMWEwAnL2RyNSacZUItfqgD5
 00EI/JFB5MVdN879Zg9ZmqTZwv9i77/OUPTOYW2iYbNmMqsoE8fxDwQC+HGAhDzkCRXoARL7Pe4
 stiASLQjgIuUuxTidWv3+rp+mL0DFcP6Owess76M2cf+zEpOrNRsfvoOsl4EbvEnBQehZLm1eGP
 2I301jOxo/ThQ8yHcb9HX3imRsTA==
X-Received: by 2002:a05:6000:40de:b0:439:b79d:b99f with SMTP id
 ffacd0b85a97d-439da86f6c3mr5661568f8f.40.1772826802778; 
 Fri, 06 Mar 2026 11:53:22 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2ba5bsm5487438f8f.22.2026.03.06.11.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:22 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:21 +0100
Message-ID: <20260306195321.8332-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303101254.192225-1-thomas.perale@mind.be>
References: <20260303101254.192225-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826803; x=1773431603; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MW4Lgys8pP1sPbYs92wMrEmPKe6+3BwS3sotgzSHODE=;
 b=NaRMtmdYnHjd0WYchdfMHva95BpnMjDa3QNXkded0OgqJYml30Akjb8s9SQuP7pwFh
 2o3e7fzIjD4VutmIeCegMQ4hC9a8y46M5CHA8+hMxTeV+RlGTa5zuVNhgtcW0gKpX281
 GoDUn4mMpdg94zHAZdnfptyKkeqqUZ2veidwZYYyHq4mJtRtkai2REOjC9mimMq4KV+e
 wCd1tYhMCaKQVsc7svfaXpTItZA/tpjm8d7z+i7EjCZdFtqU0QsO5LfU6F1wFW8JqkrV
 bjNZ969G2RyIvLNaUd1JELDpVV23HUtrJfNU7ZtonvSCaIKY5fpojBgaVLygBpKPK8b2
 jJug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NaRMtmdY
Subject: Re: [Buildroot] [PATCH 1/4] package/freerdp: bump to v2.11.8
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
> 
> - https://github.com/FreeRDP/FreeRDP/commit/9b678b6d5a40ce01607d8c3b1b1416437c8416c4
> - https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.8
> - https://github.com/FreeRDP/FreeRDP/compare/2.11.7...2.11.8
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/freerdp/freerdp.hash | 2 +-
>  package/freerdp/freerdp.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
> index 83b83db121..5ae222e2ec 100644
> --- a/package/freerdp/freerdp.hash
> +++ b/package/freerdp/freerdp.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  f7cc2bf43b9778e9079cd229ea8e37fc1843eb1c11a8e4e003034af71858ce6a  freerdp-2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0-git4.tar.gz
> +sha256  8a7c953ece217aa4fa22c4a21ab2bc4c9093fc79aa67d3e1273c140d140203f7  freerdp-2.11.8-git4.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index eb17c80e4f..6929c73683 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -# Latest, and probably last, commit on the stable-2.0 branch
> -FREERDP_VERSION = 2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0
> +# Latest, and probably last, release on the stable-2.0 branch
> +FREERDP_VERSION = 2.11.8
>  FREERDP_SITE = https://github.com/FreeRDP/FreeRDP
>  FREERDP_SITE_METHOD = git
>  FREERDP_DEPENDENCIES = libglib2 openssl zlib
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
