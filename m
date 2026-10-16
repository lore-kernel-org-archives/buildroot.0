Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93968CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B6C440A27;
	Fri, 16 Oct 2026 15:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwmMzEv-UZmu; Fri, 16 Oct 2026 15:01:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 674F240A1D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162898;
	b=Ft0HXgZkjla76wuofE8nt5m27fL18sddVHMADLXKYwH1FiY1GdiAcqqPfoN5Lyg+o0S2
	 dABgXX+C5ZWFR+b2pcYUewgxAsqXO+ss7ob3ui5P+QZft5Y7i662/STQfdP9/hO+nfdc7
	 DXzOkPx7FXNkzE7H7K6uWax6O/6ark74/UBCqaZcNSyrfxuKTzp2oW/tgogI649iiOv4a
	 Id5pYObS4ocOKNwdcP2Z67/J5CPpBRbx3H5V7z/ruAfyxlc7hUsaSIjRtrbKsoyDZg5W/
	 woyFPfDkbEz19jIT8GZzNLYeH/d82pjLH+VyC/IZA3mR2f5allZeO8t7fc2Et4gpaxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162898;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2X2pTYoDKLOeoF1JPsTaSEaDUmW+QyxpnxluaD59Wp0=;
	b=CJP/ZiKKLyFMvxhisPJEuMmFDMZC35XNrgvfADsaJt5jXTYzD4bccNr0LBPLb1GllgDF
	 SGssRxET6A164GeZg8W8efnAOr+NA7IZ+Aj0PnxxZbpp0IZOUU3odGIvonW/1h0mRET4Y
	 JrZM3aIetHmmgHrC9B97KsWFUzseVZFU/mooJ/o993A6Y6MtUIw+d1L69E1GRTpSvBsEo
	 8a+ioMklofr/CLkfcreKXtOkWDn9gzp15/ZoyBTaPM7M68P2aTla0NKh4gRwCCJWdxn9E
	 +fiR0Qz7CfteiMBAwscpxac5hFUU6g3WWdh5IeWli588WbMXibFNfKi6J7kQjpowtFQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162898;
	bh=2X2pTYoDKLOeoF1JPsTaSEaDUmW+QyxpnxluaD59Wp0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xq/3JC+V9Ex96l1Yl+PK3kozontGdXmKFyyFN3JqLwOwZTtMyM4OQepCmrpQgDpsa
	 oJQCyr9fSX09aN4LcEOO0moM1uTu/zqwKtQ5RIFEDW8sxF4E8wg09Lr7yzL8b2i92R
	 h3zz/a1U35CN8F2bFxKUe/KHsUhwnli3iZ/tm3CW0OwV4MkiuoTJ9OR+phlh/cyHM9
	 JrFIVpBxrC0UOtxsr6wgjzjcgo+m+NRxGu2j3gkOfYLokJ7B4H8ZEhVf8Yfi1shrH6
	 PTk34/waqbOpcVMURZ3EwhkRS1K8FkLBRQXefyEp9cllmfio91WDkHFU97nSiYwn5r
	 +/ueUmZ1flw2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 674F240A1D;
	Fri, 16 Oct 2026 15:01:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEA70255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C469740A16
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOcas8yi6c0L for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D5A5040A0C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162896;
 b=lb8YHHsozf42cRUeZU0Z2TnB8lV6RJ+zp+RgOWlpxBdYA928ANG0Nrh+6iZgr8rx3TCL
 zWCNkzKJMknD4BBGgP0UOdQlo8b4xoR2PdwKm9tJNfGB6/TMMtra1eQAtLg7fkbbuIIpd
 VS5e+9dC4vY+f7k1Uy9AKsbz5OrefLLCuk9HheAc2EocZKYM94Fg9ticqFF1bl9m8sLTj
 tQ3RIlywn8auyBhFU8gTuUTcWDpTesTqNOpwczMNM+3qv4JxY7GGh2XP83sxj6Xc+Xw2L
 JYYPaDodhgzXphlNGFoaOsq1CctmkQFZqibbVTf8v50MqnIWL7859gxOkRTYLywmwHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162896;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3zI5Gm9kuhZk8x2xsjXhcnzwIg5T/CSdapWrgKtctpY=;
 b=BG5o16aI15R4vTxlHj59LHG2PkdCCCHj9HIfM7ZrXjgXgGY0Ym++sp+EnOTyOjPzxIZG
 j2XAqQeGUWHGqG6wA+Ekey6bhMzqLFc8nldAWHV4wKsTQs73tTv8ib3+SuTKVqwzdRA+Y
 lYubDb6BwEtP+iTSO56JcVAouTxNi76/QGCN+l7/dZui7QpD1A3R/tUVKM7txE43F7HlA
 sqRmdTInamRWw/ebyxaVNpj3qRGnVd7uHc4iVg/GD0WTc6D4xR6+s4aqPLv7AfgrSPz1k
 aRNJ0se+bOrG1vZCng1IdHUslFTi7OoAwuDg+x4ifMT9FRq1DWMrS2j3xA5mL2pHa+g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UqA5P72k; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5A5040A0C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48b042c0728so1601515f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162893; x=1792767693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3zI5Gm9kuhZk8x2xsjXhcnzwIg5T/CSdapWrgKtctpY=;
 b=wWfeLeWgcBb/uR+RBS+acuS2dDioge6dHjp+qZQqICo004+h/3yjSCLpGRLMrHtble
 17Aq2OjKTJqOmivO/cGNWgtpm5kL6rEq4nRwWYU4oKntho23DqCfXFFqu7bs68m+EMUK
 AIr+A/DZI70kq6xfArxLNIaeJNPKeQPgpEABCoGtMH1iDHW1/f3h8f0kE7uCsVStGQHR
 XbFKSE0R1px+jOjnPdOHBPX0DTwg5PVyv9yl8AuXN4cI1oy/c+8Md7JULYe+hsURiDEv
 uihnBXVZlxYrYqWAr1LNMztf11ng2tnRjSLLWa/9DT6X9ia+TvUaqUIKkJKtejrAeOq4
 Tg8Q==
X-Gm-Message-State: AFq9FYK10rJHitZ1yGS8b9tCQyXWCpZVLkwOegiun7J+zC7k8h4Xpowp
 uvVU7qlWc2pAbmQxTI/LM8NVjkEH19dv3H+8g1N6siL77RJ8nq+rvwOEN5F0K8Mx/yC2v0hJIWd
 Mctj2ZSs=
X-Gm-Gg: AYBFou3sJXFfmHCSz/ADcaqGFCTHhcLs3Hk8NsjgRsxZTPgWEEymU4RUGvbDdvRVPnL
 M+PsFaRN2W0Xfavp9bU0M46VFfkY8D+PQOyWS2B0pgpxqVqTxyZBypfFPP9Vpmzu41WuQa0/Dei
 GepUmAtMqRC0hnZLZSybV9KJHRdziBNLb+kkQAYCphKSwXqN8SEBJ9WC61sSitIbLxAaJcoYH9/
 ucXgH+0t0Qi738pXXSfv9JE6TdZA5hemD3vdjwP3yXGj7jYM52PiZvpm+rZ3NYs6SwDeu6zxajs
 aCWW5BUOeJ21PVT9Sk+eN4VgswjXjKEv/EwVlUG047DY8Xd/NkO9v4Vd06lbY391gyLp8fJFlRT
 Wm8W9raitRUzRqhnYQ6SpI3D8cDlyV86n6UBXOqv27zlXWG8wNCX0ei2XjibM59mnEnnqW6cp04
 j8vSVB1NobaROjDcUdj0shaYF03QFG44ikrmj4RiGwdfuIkFO3B5DTUKrDpSiX/yFFicVRIc30B
 n8nhPOY3+7+VCSH4lpSnvF2K5DoDYBQulWbmSNpUw==
X-Received: by 2002:a05:600c:4e03:b0:49c:fa20:cbfc with SMTP id
 5b1f17b1804b1-4a1d75ffbdamr1947605e9.19.1792162893344; 
 Fri, 16 Oct 2026 08:01:33 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd500e75sm5483974f8f.42.2026.10.16.08.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:31 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:28 +0200
Message-ID: <20261016150130.60090-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260405185608.1357633-1-fiona.klute@gmx.de>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 1/1] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The BR2_EXTERNAL environment variable is passed into the container,
> and each path listed in it mounted. This allows using external trees
> when running a build using utils/docker-run. Testing the existence of
> the variable instead of a non-empty value allows passing an empty
> BR2_EXTERNAL variable to disable currently set external trees.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes v4 -> v5:
> * Avoid Bashism in "does BR2_EXTERNAL variable exist" check, suggested
>   by Yann E. Morin.
> * Make relative paths in BR2_EXTERNAL absolute for container bind
>   mounts.
> 
> Changes v3 -> v4:
> * Split BR2_EXTERNAL on spaces OR colons
> * Revert changes to mountpoints processing loop
> 
> Changes v2 -> v3:
> * Use read to make the loop that creates mount options more robust,
>   removing pre-exisiting shellcheck override. Suggested by Brandon
>   Maier.
> 
> Changes v1 -> v2:
> * Correctly handle spaces in external tree paths
> 
>  utils/docker-run | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 27c169db72..37f6c12c0d 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -97,6 +97,17 @@ if [ "${BR2_DL_DIR}" ]; then
>      docker_opts+=( --env BR2_DL_DIR )
>  fi
>  
> +# Testing the existence of the variable instead of a non-empty value
> +# allows passing an empty BR2_EXTERNAL variable to disable currently
> +# set external trees.
> +if [ "${BR2_EXTERNAL+set}" ]; then
> +    docker_opts+=( --env BR2_EXTERNAL )
> +    for br2_ext in ${BR2_EXTERNAL//:/ }; do
> +        # bind volume source paths must be absolute
> +        mountpoints+=( "$(realpath "$br2_ext")" )
> +    done
> +fi
> +
>  # shellcheck disable=SC2013 # can't use while-read because of the assignment
>  for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>      docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
