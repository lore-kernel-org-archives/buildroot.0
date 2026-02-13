Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324C9EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0439E422B7;
	Fri, 13 Feb 2026 19:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5RscAfN6rb9f; Fri, 13 Feb 2026 19:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F06406AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011623;
	bh=yhEzcex3oSsEbBE4y229G8tfwe97+ub5D7vI0U923+8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VCELr1kfylcVnTacVicdwDGVfOIIfhnb6z0FPf1Nnz4owa4kYFfNWRQxvSMl8Ue54
	 VbeA3aRtr5F7sIlHVw8ZLNsrpKoi1pMnD83PdEl1+z6fu6EWHFYfa4EFs8w6XU+n2z
	 nExjHwX75vcUwPnOjp6Rpy9powzsdHOz8ylgzbqRgmWxl+pwQSNpXf7di/v8eUpLJE
	 RBWVRB/t6hI/tWanXen2g6exzumlOUlunooagKOTamKGUaNmBSaRwufhLpMXYGzxkj
	 YaaZh06DXxorJOdw1yofuYMVyWYyOHBlDwSkE7hRUqen4/EdCvO2/3Jca9Sz6f9N9o
	 is0CrgJr0oxFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F06406AF;
	Fri, 13 Feb 2026 19:40:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82C38EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 740DE412C6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7FO8Iw7-tZh for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 640F640407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 640F640407
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 640F640407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:49 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4376c0bffc1so967299f8f.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011467; x=1771616267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BUa9is6tzrQKJBf9ogJ8IOROtLMzH+H4Xpfx7Mq0Ubw=;
 b=MAsoTlwcNDL/AQseabEGdKl+SZiTFkqeFI6iQqRGw3vcVfHlxDE0pR10Y9QHT5t3Ds
 oLdGRX4LPFzFHn7HsewDwCWjQh2lRZBewNH2rgdF2vBbqXXp7PESmlnhromtsFBqFbok
 fBt5t3xsXE8K9i9mkmpJ+Wnm93T5peXBLD21Crw+/2a9TPx8Ugs54V+fQs52v4s5kzqZ
 TVgZOzTHx2ozWg6AhgJqXiJYjA5joJ/I9rZXuoBi+E419x6HRFrlOt4p/tgaIPUkfIb4
 0+idnDFClVBWCqjDso0HZZAZw3uoBjlB3o6rr1M13nC63fzf7Xdhmzbst+LZTUkGiVtj
 i8Sw==
X-Gm-Message-State: AOJu0YzyeUo0JPF2s0/uCiNCUv+C5H5Ok+JQeWn1wNuCoieQ6IN/dKZz
 wj2ASDeTmgp7huDRS3WceK8D7SuT01Gh+0YsYVbs9jYFXbhN2vfklDFWvgoi+ACuYNg=
X-Gm-Gg: AZuq6aL6F6s8YTBU3alqRgMN/tNkDVtfFpmzXTRNl3iTugXNaX8xy4a64JOJ1/UIISj
 wR+z8l+XYKge3sDuquIC0z0R6EGdUl8pIcTGRNiw2H6HOkCgAFS2c1PWCwkpxsRbg1PG1jUyRCD
 ld2bycWKGPFaas2NEDLMpkhR3SSmq8qROOLN5m4BOIuVXuteh106SrlsZtTG5SLsfitj+d9q5EI
 7FGu2KEI8v+68/kItd1nDtoNpNEFiBtFQ4cOEwq/DXNDoM41YDk8oP1BttczBbGLnICBn1pwe93
 XBZAKqzaucZjK8xMTPI7f1ewKDmMyQrMmHZX3uSJISCBTk/eWWSvBvJZWDyLAoKw9Ge+vxcicE5
 g6wmiEfHGCCW+KNyBuAe45KjH9iH9zuwoe0bJbXBa67seuMNcgMU9WA0YLhX08iWv4sR6k6HnUm
 2gdd2C02leMfCfNhw=
X-Received: by 2002:a05:600c:3b93:b0:480:1e9e:f9c with SMTP id
 5b1f17b1804b1-48373a02c73mr60686855e9.10.1771011467444; 
 Fri, 13 Feb 2026 11:37:47 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a5ca56sm36515865e9.3.2026.02.13.11.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:47 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:46 +0100
Message-ID: <20260213193746.40626-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082405.46683-4-thomas.perale@mind.be>
References: <20260120082405.46683-4-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011467; x=1771616267; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUa9is6tzrQKJBf9ogJ8IOROtLMzH+H4Xpfx7Mq0Ubw=;
 b=efXLon3I6WYuI15cmMO5FEfQadi/mDzP7qgZ4WI+7/VOVUw7+mdoFMB3uHlB3NCtJN
 7MfpfK7w49A4tz84+6ghvACep0ERsUfJ8nFHwbpnV41ti9VpN9okkgeD76+FSK0gtRFA
 smrCgRfxe6McTgZyU59YyMokAo1C9OXhiTZK0T4cWfP/AxunAyplwU2zG21lsrCQrjud
 jLbNsShOcwatY+5/OnH5KZ0DHnM8lhZ8NbC0AP3iZ2XcEilIqZkeaibt7ChC4TPg6WQC
 ion9al4DTKaYsxZLW2m06fM/9Pj6inCKU0UMTgsdOk9Ys4F7EyJRTv0K0UzqMLZrDkwu
 s/Fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=efXLon3I
Subject: Re: [Buildroot] [PATCH 4/6] package/easy-rsa: add CPE
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
> The CPE `openvpn:easy-rsa` is valid for the EasyRsa package. The last
> CVE is CVE-2024-13454 [1] that is reference in the upstream bug tracker
> [2].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-13454
> [2] https://github.com/OpenVPN/easy-rsa/issues/1122
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/easy-rsa/easy-rsa.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
> index 7266943f5b..2d70dfd05f 100644
> --- a/package/easy-rsa/easy-rsa.mk
> +++ b/package/easy-rsa/easy-rsa.mk
> @@ -10,6 +10,8 @@ EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RS
>  EASY_RSA_LICENSE = GPL-2.0
>  EASY_RSA_LICENSE_FILES = COPYING.md gpl-2.0.txt
>  
> +EASY_RSA_CPE_ID_VENDOR = openvpn
> +
>  # shell script, so no build step
>  
>  define EASY_RSA_INSTALL_TARGET_CMDS
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
