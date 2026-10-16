Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEE0CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2207840B1A;
	Fri, 16 Oct 2026 15:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0_KKd7Ad52a; Fri, 16 Oct 2026 15:04:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 35FEC40B0C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163071;
	b=GbfsX93ZznI3SD37a3cFTxDiDvum8IRj+99KZcDAbxORLibWvDPKgEI9//7pBBo8nCIC
	 NN92bGBAuzhhb1duyJARECeI+yEwOETYwsyxHaUKejewZmW2Ugega/+srXIuGHXk+5cls
	 Qgo9uJCrwl3xGYAx5xKsetpNIjoU6N5HR0SKE3sD8Q9Ti43Qr8L615zoKDEBMRw/3Nd4L
	 Svo++ni1Fy6hha2AbeL5zxf4V9CZ7p2FAjURcvPhy5qjFmfvbGnHu3tc16C29zKcA27XS
	 ALrNNt9k3Yr60GWtZzkQo3g5xcguUYiIIumWnaD8ICv5ns3Be4fo35E7460E6zFbHNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163071;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xDe1DmxBIfCO8teaW00c2ZjxTRa8eynNlXHNBY6JE60=;
	b=Olzf1B0BQmi9SukGgC7DykNLlWoLjCYE35CWLNYPzBXFmRPQXs3HzbRe7m6NT2sxKS/8
	 5u/x1jh0uSuKC46Zj914wf5P6q3ruWsN4Y7GPQS//fuFi4u7TxVFQoiLmlYJ3HXqUF8CI
	 vrLlHgsMpJz64obMq+ArgZQrQTycvGoC8G0kcCWbGKK37CODFDwrStiSUHbVzePrkP1Ez
	 7XNuVtCAyusJDk1n99qaZ9eNPG50BPpj6RWpoB/bYMIy85q50ut3elZNsfHuJEHGIbS7f
	 P4Bvs1HqAAvVLr3e7HnfjoN11MoIUqg60nfmrAMRmsbB4AqjXD98z76DCvA1PfqPIWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163071;
	bh=xDe1DmxBIfCO8teaW00c2ZjxTRa8eynNlXHNBY6JE60=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IFX5caf2qBdUmwULjbybe3eAdB8gFYWWhIjguIQAs2CUK+66uq5/3r0rrsw/NDUcZ
	 kPb0NdMnsa9Zu1VjE6+NBKueQ2371Feo0e2C6RXpJseMrddn+et8BMjCCrZowO++aL
	 cskMt/KYEO0eb5evw2sl6u405rkKMwjOF7VSMtHd+oWu+V9OEEoR+93VfyaWDjTvMv
	 +x3CL8Vs4LAzi2tIVJCAMTbNgQwu8m0m/64cRrJmbfNcO2M/LdA9go7o4VdZTZMzuv
	 m1fAdXJ0tLNXMdTlCbSl/bUD7/BSdfXQeO9yPMwe9VLzgNLnpIC5s7cFP0tOx3XxlB
	 4pu+39b8WA6Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35FEC40B0C;
	Fri, 16 Oct 2026 15:04:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AD027AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C07E60671
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IU7gbi5vo-aI for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F3988606CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163068;
 b=NPlPwkjghRww8guWuq6oBMVeHHx4htzxsjEdXWC3BpE8tyPDqgoFWlqA5bZm26SrrDRK
 9T3x73quWll9W8npUYRnZG7GYtSOxOIwrzcnxtA5uem9cNmU991y6QGu0NhOF5vLS8Z9D
 UoRfplKL+UNkHSp/sBVh5ueavYg1TTcIx08Trbkd4rCrxd2wq3uCFNSWn1LUO3dpscRWW
 cq4PKH59uOxSPMZsX996Fv1hFiSxk53iZzhTvh/3HsXo62sLmeTaTreotajLer71AmqJi
 hRGpQ/FO123XfZX8Kg4O5kWYPu1bOa/NQs/56MO4rzf1q44+H+TfuNUje38Q5muBM9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163068;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=4Ryw6Gr7PNFWmhMKvTFHY5wWJO74p7/euSq9Y8TOSME=;
 b=EmDLyIRvcSOl59rxWurF1AhKJqaagucULkfCjIqMpUvdR1ZsrAVeKY2mXEZpHJkSeqRf
 iqsZlFduyrcUQZfbxU8xBP+0VQOxbk+Ne6wfk/8PsttPGmkCrobjQkHeC7c4CTG2iGyuH
 VO1eW4u9f7fGN/CBNaP6YBfxuWjOnFZ4odQtr5/qSiZvcm7EztVXX1pPJaY0XEkYDS+N+
 sFX3PFkmuz3Ifx8vVhZv28Z/v1aizFHbats2KWLyYAHHxBI/I9ZSHtaWW+iTkfKqv1Uir
 V1VwLpZAoCCWq7hyJndW0wM/ymCO3w2KoI6IWQqP6LwpeN9YVWmdNgroNZeuiEaTKgg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iD6dt8BI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3988606CB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48df4f540ebso1204395f8f.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163066; x=1792767866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4Ryw6Gr7PNFWmhMKvTFHY5wWJO74p7/euSq9Y8TOSME=;
 b=eqKVkWfxkEYczBO1TubqBfvjZTxMSw9zDtV1X+YpXb4UhDdNlTIlS2x3Tu6UI3hRs4
 iqUZU6nB3l+0yjFafNaiPRNgnLuVBjPhqqmQplZH9scW6XKS4IM5Km7l+tWt6IhvhUYT
 08SP0j+6dwdif0lEh301TcvT0vH2dkNSUOYI0rlbjT1HMbMTz+JjeoIbNG71PVxWX2DA
 jrIIyVOe/qP1aW0qDU6llIM0L74zzjFBYHLw1YkjSUvPKc2DStHhQLTPIqjbn5SBbtWr
 TLqAUh63xBhEyUj49VmLlFYLnU4Z8OvYILXQyIFoKDvpu3Zcyu9flWF6svCsVfESsFxO
 w7Sw==
X-Gm-Message-State: AFq9FYJHHLphuKGUDeCLKDl97GuTMymiLdX4/U2aRzvwyjIu4FPWm217
 V8ThrntlNYtQnBzorGVWzpdfSxpqvB1mizvQHoGDOdiDUZhvORXi/r2+ADEO+WQL7u3p1HgFfdG
 KZWO1eZI=
X-Gm-Gg: AYBFou3qO3T5TxdRJzfkpdw5orhrlGB4gdd/vNZebBGhJMTum2T/gJX9VFw4Lz38C1y
 FVV2pKMBZkSVxN2WD0JzLgiBZOKxZnM5oy0eiDnHta2RhWtFZ9V2rgKVdtfm2xsAq31dO4WFWU+
 x8Bj5pwmkFwgUHiph41eHJ783n4KccWDqmNMV2enCoIWlbmmEfMeiBmpNCbh/sEZ8e3Cm1kjjlI
 UJ5TrRMgNG1k6+Gj5dryGdaUPD5FXL+r5jGebAy0iP5sfGBAHMmOca1m9gGZmI6E6Rfza6GUimd
 ofysQQ7Tc/4YYMHbhxUzmL3Atnj8T68jmieeUk1LwGGZ6MNVXQUmeouFwhJTTkPdF9h8AtmXQV3
 4H5dMSA8LvUHKSuYbr4W+Aj4WyCJQ1OpXppDvWKvARJkwk4KMB3azgFI0ng7KI4W2M6/Lh9xsxg
 BWhDkBejInfyvy/gSz9uozpxfcARQJ0bgklDCXZ+dkp1BGSJzhukLSFY0cNACAPmMXIcaaC49ni
 rLtea7/eTkK+Wk3217F+f4GV/GUN/6dHXw0RnRXiA==
X-Received: by 2002:a05:6000:502:b0:48c:7f60:9ed0 with SMTP id
 ffacd0b85a97d-48dbaceb3ffmr35774787f8f.35.1792163065908; 
 Fri, 16 Oct 2026 08:04:25 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd510ba3sm5527437f8f.56.2026.10.16.08.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:24 -0700 (PDT)
To: buildroot@buildroot.org,
	Michael Nosthoff <buildroot@heine.tech>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:21 +0200
Message-ID: <20261016150424.68376-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002075640.2350126-3-buildroot@heine.tech>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/4] package/sqlitecpp: disable
 stack_protection
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
> SQLiteCpp has an internal setting for stack protection which
> defaults to "on".
> Since Buildroot passes this options itself this is not needed.
> 
> Fixes:
> br-test-pkg/bootlin-x86-i686-musl
> https://gitlab.com/heinemml/buildroot/-/jobs/16865965418
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/sqlitecpp/sqlitecpp.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
> index 95ddc953cb..418860fc6d 100644
> --- a/package/sqlitecpp/sqlitecpp.mk
> +++ b/package/sqlitecpp/sqlitecpp.mk
> @@ -14,6 +14,7 @@ SQLITECPP_INSTALL_STAGING = YES
>  SQLITECPP_CONF_OPTS = \
>  	-DSQLITECPP_INTERNAL_SQLITE=OFF \
>  	-DSQLITECPP_RUN_CPPLINT=OFF \
> -	-DSQLITECPP_RUN_CPPCHECK=OFF
> +	-DSQLITECPP_RUN_CPPCHECK=OFF \
> +	-DSQLITECPP_USE_STACK_PROTECTION=OFF
>  
>  $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
