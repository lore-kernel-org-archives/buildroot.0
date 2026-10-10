Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957FFCA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F97409B3;
	Sat, 10 Oct 2026 09:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jT_6GRMT1uWa; Sat, 10 Oct 2026 09:23:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 77BA540968
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624205;
	b=kEjAVdhyQ6lTvnYkp22P+EZ5g+4lOCSqxhb11L2G3lML2eeuDtcBowoFq7xCoqZh0OnJ
	 OZJPJPmalWSIvjwGjSvY1MYevDCyvIx85TaJ1lkg6uWN/2i0y0iQVamHIfPUamImPfalO
	 G2wwr8S/cKnc++KXJ/7pp2wd4kevKqX7pIwg/aR/dY2Rf0uPiBiu8tzzDN4rOE5bESlEY
	 dUWRLTgnaGQPZnBqJZpq2c6z7b1OHX5aLiuuK24RCSA9khVxTb69sd+wg1yjhlnOdLtNB
	 U9ALPflCqJfI5bdr3MH6k/zGHvK6lAA7mFpMlbgttvGfvNTGxUSBidyzYcGaeWY6bxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dR/UcChxftEopZ8U7p/E42maFTB0XCxRJ3pOwFR/334=;
	b=pZPL2RmQg00mZzcp6OgqnoITbCCiJ5B8ZCY5JDDBtD0eMiMPZXqzLy9QEo9v1vSkEmXK
	 ACVNb5eN1mIdomtp0tU78FH7pff3WzOgkeXQ2/Xu8O/lbYFDVQCnxY3KMXSz/tK7+W9Zb
	 ms+9VCBku31+UhRoOIqIGk5Ffl7Afkb47Fkd6PfUiK1kmz7B5OK083I6ZAoLI/aPtwT2q
	 VXYXCTp1ov7uqfkK2dYaCdzy1KiNX7T+ImvC7hZMzVdenDONlDbz8TmDw03e/MHSkXnBz
	 TvfS6iZSZ+uW46Tx7jm+iAztyukie/VisWkJWmACGtl9cXK8acO2Cs752OmenScB/Ew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624205;
	bh=dR/UcChxftEopZ8U7p/E42maFTB0XCxRJ3pOwFR/334=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GfwyjPMygbU7GfnJpVEoE2BoXUiq4P0kXbaG8YJb9NeNFZvi1VpRw/TJ4hNM98+1Z
	 ZlhMYIGhEjWEDdlnLgzvRrhLAtpd/a1msze8JVqtM/YXhPICUfnU351eThYx21ja8r
	 +2Lq9MPWeemImTmz7fu+p9faLHPPIxhJSIa/gNEQh2DSPKR9yvgVV75AX5t1tX430V
	 Nx2FCFT0xZ0P66k2Y1sC/ELISRtsf8iWZzlziQE9/VqaCIm5BYvzBV4KCaASa9XS3v
	 7Cdrcf3a+aQMIpvD5L2mfDII7W2iUwBU6svkV436ZZNEqvgklLQil2P4nBoqw7cdEw
	 w0KPCGlTJPBvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77BA540968;
	Sat, 10 Oct 2026 09:23:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DFD8356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7445F400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0yx9p1b4WW7 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 69DE040004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624200;
 b=q+IMP9IkGA0xbJh9DeYqrebG4y1hbtaIJRh17UNe2gBQY8sBRD0JnPppH6CSng7p4xZM
 Uh1KFHbMLBG1E5Gx/UHRrvU6uBgUclwSs50WkWCtOKGuEuUDh2i2MRaSLHUJjiLpfzOkK
 qAgmPBW8aDQZOu2BVfTukYc399YtCrTchFF5dqLNp1vI14J4AY2W/p6GnlUsVcHDe8s6N
 7e4Bi8nSBjaVENkq/vYbFEl6tRUHwndvFuCCUybE5e6YMtcVdNuOBM4iLIcayfMCDbsbi
 Z0GrSmFTQwLvdPf9bRdzUlg2mSjBAjWsGptM5n4Ou0yvxkynszWepnn5lhyPIyX+mxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624200;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=8TE4LH872xJ9LIkXRind5sez9AtWoZxBTMZ9te+VdvY=;
 b=jxbgg+yaxBSxcyK6WJ3sYsOdbLwJK2m53eXHaRn2y4XhvZaQQx5ygZUFH5D/CHWp8XGh
 9Q2eQhfamfYJ526veto2mFEYj/YIr/8yph8cKaYUiQPncyXalfqkGsPyip2jV//S5PFLJ
 bXGmgh0ouInJttOYRYInXNLgwRFyfvqKCfhTYAF6FGTBhylb1iE9J3pSYgy5MoX/H8POj
 b/v5g0ndEhskylbuz3rCUOBX3P6L7OrQgsu5glRh1oCK0AkARLg0uxTJfGWX+d6br5wpb
 PD1c0/CSGJ2dkiJIXFvIZ+QOundCeWWj7VXvezdnVxXCR/gHrZxYPlg/vMtFspXXooA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="hkl/55rI"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69DE040004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso6991475e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624198; x=1792228998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8TE4LH872xJ9LIkXRind5sez9AtWoZxBTMZ9te+VdvY=;
 b=MmPTvrUZZDRaKVQtCix6qn2r2jJhIXd/vCg+mEN/KD4SMTLP+KYgI7ttGS/y4IJWuX
 fNmKzI3Mfg+TsEwiLDGLst3evpRlSI00+V3LWoou/l3Fe6Ex2NYN7Feq64OqKdDUgGyw
 zfuv0jmPFzCMjDBBsFYiMnoyrIESOf7FEzeRHJ9xYFW4wzLE+HqmSBCqHUz7ResP9K/V
 HyU/TNFqVroB1oaIyTkJgKZvb0LrQBHZqWKLdwVcEsTHQIR6x7rl0bJPaJC8HRN91Zq/
 qKYVbfbkggFROZGCNkWf188tFuAjCu3bd0Cy73+OQ55ETa1ijZ6qh4jy9axBVTkwwI9o
 Cdiw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz44afS9wBkNxdEyJ4Z4ScnQkYoRVJTY1awPd1/iC2GTJeSeKmOYojQdenLiw85cnRVdZCAYw/aPn0=@buildroot.org
X-Gm-Message-State: AFq9FYJ1OoYwa7Y23pJRVpZQAYc22yqNgWnVXAEwNMxUmsIFM52rT44u
 dJZkezh+YuO85diaQxk9+nvMO8vN3km/WFZ6aMB4Gup6GwxG0juS6riFHq5If6BeDiKQlND/7XZ
 p0k07X2s=
X-Gm-Gg: AYBFou0Wz6SQRHo5hXL0bIcR/PlOqlBnrd85ZSEv8Er5fVJXr3kta4qpKE1uTkyxg9h
 fzk7nxKkPkfFj6sXIbjZ4V5ABbjGfFC2cAEYrPdpIWbsheBHzAXn77UJD83D74lgMn5PqYRBEsZ
 KpSVieCiHT6YtJ6j5VNE6AsFcbEzvbFTsxJPAeUAR6FBIz3ee48FBEGbCGwyj/RA9ZUoZ/JBsjv
 iMX/yQAhSdyvk1U75YR7JudAL0eGuO6cuaViiuq5h0Mtjs5L2jlFRcEKLUx6AP6Wn+lgYrKBDN8
 gspHMW5zdH4hueGTnshs1rZGuBGbyRf5lSIyyQGj46e7mYpqTCQj6bLP8O+sNWWWnEe+X9P/pqD
 idFcZMEhuBt+aaf9j0YQoGjuUquxQR0l2/4vx3ynJtfjHskAj1rm9RuCLJqEb8+Uv0iwZzNlZTs
 34anOscZ5Cfpu3Dm3bDunQLxzNlxvCpav3iA6eC+RtUTVg/Or6ut2jfEZU77OKhEWUBgdT3SECy
 26cRonbx0jGPrU28OQXcvN+EE1qh/MaSpkl3pK53EYS2E9MeMEWrdlQ
X-Received: by 2002:a05:600c:3b0a:b0:4a1:8963:b865 with SMTP id
 5b1f17b1804b1-4a18e447e9emr86847535e9.1.1791624196936; 
 Sat, 10 Oct 2026 02:23:16 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19471edd5sm72139565e9.11.2026.10.10.02.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:16 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:14 +0200
Message-ID: <20261010092314.139393-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928182454.2165278-1-fiona.klute@gmx.de>
References: <20260928182454.2165278-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bubblewrap: fix build failure
 if kernel uses localversion
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
> Bubblewrap expects the value of the assume_kernel option, if set, to
> be exactly three numbers separated by dots, nothing else [1]. If that
> requirement is not met configuring the build fails.
> 
> Buildroot sets assume_kernel to $(LINUX_VERSION_PROBED) since the
> version bump to 0.12.0). However, the expansion of
> LINUX_VERSION_PROBED may contain additional suffixes, e.g. if
> CONFIG_LOCALVERSION is set, or localversion* files are present (like
> in CIP kernels). So filter the version string to ignore any suffixes.
> 
> [1] https://github.com/containers/bubblewrap/blob/v0.13.0/meson.build#L94-L104
> 
> Fixes: 4cb6193d2eca39b1bd79ff4867c842f507f692b8
> Fixes: https://autobuild.buildroot.org/results/e7513e4730000e46b13bb9cf25955ebd3ec5fb71/
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/bubblewrap/bubblewrap.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
> index dcc3c23d7c..a58d7fd143 100644
> --- a/package/bubblewrap/bubblewrap.mk
> +++ b/package/bubblewrap/bubblewrap.mk
> @@ -18,7 +18,7 @@ define BUBBLEWRAP_LINUX_CONFIG_FIXUPS
>  endef
>  
>  BUBBLEWRAP_CONF_OPTS = \
> -	-Dassume_kernel=$(LINUX_VERSION_PROBED) \
> +	-Dassume_kernel=$(shell echo $(LINUX_VERSION_PROBED) | grep -o '^[0-9]\+\.[0-9]\+\.[0-9]\+') \
>  	-Dzsh_completion=disabled \
>  	-Dman=disabled \
>  	-Dpython=$(HOST_DIR)/bin/python \
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
