Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62203CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A315817A0;
	Fri, 16 Oct 2026 15:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9SbKTs1PdFP; Fri, 16 Oct 2026 15:06:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5DC418179C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163189;
	b=fu+36br04++LzK0IJkbIPTGAkJBNRWfPocxUnVFjWECDBV2nLY5uCCSW0GJvQ9+gjcf5
	 xwMpXmGkPMY5jRzdQiR1cd3MGOkANTTz3aK+X0YSvdmTSrM4Erj/APjsa9lbV3oGooEqh
	 kYvedYOSBGGxFvz2RMUAn169SIPP2I0vSQnsbRyeE/r0Nk5eEuROvX4y+Q7F2ioffZ9hJ
	 vNu+qnLyQ0t0ZFtzY/2lAT1LjJ9ThsPdXNrNUcNwF2MYT1I7WaTd7cLoh480/PiHeDLgr
	 1/ZKtl4yCZmI2sEgsTqGMSQj9/KWtzFbG8FQrisCq7tybXw68I5hkZWzMBa7WszfyeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/TB76jxDDqu7Qp8TqZkOL6Gd/hdcNsuSgg4Gh+fw7OE=;
	b=pnxHBNoyKU+m3qKO3RdDc/UEhfwUdAvgsASbEiyi3TtrdRhxYYW0Pd0nL+V0NGFwf2FT
	 u/j9hDmfqu3ELho5N3ZE/Ujutu6gL36s+8R7Fi4XGyUWaV0/qWfvjKQ/eOdi+3BTP3Rby
	 R9tTucwThmEukvB0JlYxpwCFG6akjTyoEzEfE+P60VNJNi6kDsFpjRgq4b4Aa/C2C9ty/
	 LJCUIHNIy/5noAm+h6yZ6tD9xGnoQSl1aid/4N0dFPQA+rJmuWcdyISQliM4Y+O8ccLu/
	 GJyfoUwY1/msOI8v1lQBs36KE82MlTPxbSznfuB0BgybAaVOP0knJAXDB1HJHCxvREw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163189;
	bh=/TB76jxDDqu7Qp8TqZkOL6Gd/hdcNsuSgg4Gh+fw7OE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gmAaYGTjZX2lIEN8F70BMKuPiV2Iv7qMyxLcqM9OnJPfZYAF5E7d/M0z0A9LmxKB6
	 8v/FzCgimYxmtxwTTkcvJLkZ7adiFvRzbXAfDTQAWmNFGnEjBHUoh1oL0J7VMjbbfu
	 iYU7HefHaWHoFgFYiVzk4GVIVI29OUIbElRU//7oeWmDiQYiVzB6XDO18ucFrCaUrx
	 er4mLWZajlroRqtSWvrdMLr0mKrvOmOxZscn9XEg2DEgo6aRz4JblMrsR3LyQ8FX/l
	 Y16quZY+i37GWNSqybhsNckLWpVCPmoVbPBBN02WB5qyOVQPjTrb0sEbHwx16H01Lz
	 oRf6gj8Ow8Tlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC418179C;
	Fri, 16 Oct 2026 15:06:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6625255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B66BD606CB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hr26Duv_U4I7 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C823C60671
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163187;
 b=nc3Lz5wjZ3Crz4A8cPb4hWXMwaB0GD+MgpkrBG5BR20lfqPkitvNqq3aU0ZUowXcxHHr
 p9FwcxI6kHOGAdbYZM3kibQp1sEHwacyQjL0R25iL1aIWE7G8m3bcGu0aFxuC0GM4esd7
 Q0oCTTegjhpJaTX/cPGc9rt4uaqztDyoBZIjvp1xPtwNFbjCzh6XHYoU/fDRVtdfNSixI
 Pdk4dVTb4AdyzuXYy/xXbiuzvGHRsNHqtWFcQSgcSg7OThuoRUlXyw3tHQ2IQQ6eummyU
 bv4Zy/xkcjrMak7H5uIOw0jYBFPctRhhR63bus5EpBj7yRJytECjfCQktCNQvFM8VOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163187;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=RILW0qEeuB8yUg+9I7uSJLIIPTsb68ecXl0qybfyhnI=;
 b=Dtu3v5EKWVF+aQxYnsaSs5u70wjP2ehobmEz9+DGOU9a609Rzyn/A023Fi3GPqa/NXYA
 oiEgwOliPTAcIxShsgju1DYJyd6nZwDsdlDRwXv57HE3G8k5IlukwA8Uu17FPR26N662j
 95Pyo2bu6Fw52yoN26Kk1Cad6n1gDAG5UIkPxge/F+qJBuq12NeNvAWaZleqRscrViaoX
 MIRTSI6nfuggwhiBno96zGbarLwoWzL0OKtzrjStLUixkHE2TOCXST0vduy576lay3c9S
 dylc7K6Qb57zCWrmre/WoKu2fV8ZzoynXPeLJXm/QKK87XrauKqvxpgpl9iEuduqUjA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SD2uCToq; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C823C60671
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:26 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso339645e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163185; x=1792767985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RILW0qEeuB8yUg+9I7uSJLIIPTsb68ecXl0qybfyhnI=;
 b=W8asV7ycXHkkSWzdRhgA91RjwDYJ/P+TE+2YNqvkTMdi8aBst7KlPB7NeQJTG98ZBA
 Gc6yzAZi0CzSHAkukbz9PjMV0F01naj5UtO7MEqvjpG49ZT5HS1Zi71YIz+rX9bU4sPb
 C+Cl+eaTeH3FcOR4OIHi9frIKp3rQElSgOb+seTgbzqjYRN2sYAL1QWZpooEvareVgUc
 1QEsdf8gMzgEJtsLRx2N8WhX+cLh+wfkfkBKsjBPA4XPJyMKdTKhZUYRUqDSVkG3oYeH
 er/rX637u71WUve06eRB7Q34oe05Ftywj2c4dt5bkPNaR/L85rrs3mehzFM1GdyAJz1b
 NRYA==
X-Gm-Message-State: AFq9FYJ0cjXn+ChPJ+NcvcCnHGP/qEngx5C3sYgQrs2Z3RS4vgAPaiW/
 XZyVVx/u1DTLWlEfEuQC0tEieeMJrwvsgVqekNLLtTyU+Mc8pNYsRBc/KwCWt2y4NBcqbtWU0s8
 TfqhQZNU=
X-Gm-Gg: AYBFou1ppl4cB74sA8GEo83ytoR6j3aUGdD74bqxkelnJgg2agNyjQcC55lr3lvvOTV
 iMwZjh0rw/ceg36sWJHcjzFJbrTaUPnLPTRw3tnd9hxpAYGCvmrhkl7CT8byV2Fh9zMpBBBohbb
 6r3QJe9el/SskyU9nanevfvgDo8tzePYoFo7C+q0O5pXzw7Vp8t73R2AL+s25EgrIt1NwoAajqq
 XCAF4+Xpo27iAOFvDwnPiw6DA7VwTiJv2b+pXs/HF2MErBZ2NnFO+K+SNYZyFkGVXKQ2LvxvkQL
 RH3eSXCz/2toDZnw9OjA8ugQwtQfZCbeHlqeVG8Bq5+hPWjJcZcrs++pr7lPfWSW9zO+ULb52x4
 kmh5EcfL+qZ4gy94M0CHw57qgs+kUJKItN1lNJufewzd7bPSrq4/jDmIatFRAl2cG5WqaofdTDn
 qUNSorBJOGiXP4wlvKSdsiEHCAmT+XQVU3X7XSHAjy18QgfYVj50qVK4RO0kbeD6lLA92JSv1ho
 ZAAqHeK4JnEqox66I8rx+QgObBdF48iZ96qjFpIWBE=
X-Received: by 2002:a05:600c:81c8:b0:4a1:9661:14b5 with SMTP id
 5b1f17b1804b1-4a1d7616576mr1421375e9.29.1792163184772; 
 Fri, 16 Oct 2026 08:06:24 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd503862sm5632731f8f.46.2026.10.16.08.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:24 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:06:20 +0200
Message-ID: <20261016150623.76887-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011094214.682647-3-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/3] utils/generate-cyclonedx: add
 comment to explain spec_version
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
> The commit [1] introduced the `cdx_spec_version` variable.
> The reason for that variable is not immediately clear. Only the license
> schema can use patch revision while the spec version should always
> exclude the patch revision.
> 
> This commit adds a comment clarifying this.
> 
> [1] 504bb61bc6 utils/generate-cyclonedx: support custom schema version
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/generate-cyclonedx | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 9d3baa23f1..1fbf020a3d 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -562,6 +562,10 @@ def main():
>      filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
>                                 if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
>  
> +    # Only keep the first two numbers of the 'cdx-version' argument.
> +    # While the patch revision (e.g. 1.6.2) can be used for the license list,
> +    # only the first two numbers (e.g. 1.6) are valid in the schema and the
> +    # 'specVersion'.
>      cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
>      cyclonedx_dict = {
>          "bomFormat": "CycloneDX",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
