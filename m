Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79E4C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 655EA60DA0;
	Fri, 25 Sep 2026 14:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxuQjncMNk5q; Fri, 25 Sep 2026 14:45:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0FD5C60DEA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347559;
	b=QNIo1fuq2O032Gh836XIUXd2SDlNljOzn8j+wfBGtahaJe6MvGCOvUaoUQ8ovvOiqG/l
	 MxFkD3dCVAl9+tcSuM+jjLINQAyQ3SFKV6szlJmghjyCcRxQ0UMakvoyPbpWiNFDNKCw6
	 /tcgB1xPDhVWQCFxAvmN7LAswZSeBz80KFWszHEklzLZ9dvSHSy25md2HuoyucP1MM7k1
	 K4cxNGhwfcXBwGHiWGU9FjavaQVPaPRJv+OnlxVtWYgrZpB2NZr/2HprulCh66GjO1e5g
	 HJYGjhmk1oTp7SUGVlPhdxAywBkzU8DbReu89TRBl3VMJekQPgCtXKftwRTB/U0W9+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347559;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dpxK0BLGILt3i4v4Z8QJcPA8v6LiJZ62dR4n0k7adBQ=;
	b=VNS8XNmYAFy1gQr6Q4TZ0lxPZman4dcEJtBOeEXJ1v34nS7BYBd5oFeSyHOBgD2xXFd1
	 wjBggx9UlDSXixYFt89uuxbq/bIO1j/lkSFFO0Pyejfs0zo86RZn7VUH0htrNy0sEL4X1
	 B5Hd9eNa9vBWGfFq5yKu7+K9hIi54h0MJAc+R4wHXJjkod3UGVTbPPKPF8tmjmCP0rSjK
	 i0eeUfIEtikhaLpjxxdaMqNl8zMej4oXoUqawaQ41/FFtH5rT5NXnA9AtcT4ZxE9hLNSg
	 U3MZIuxxaIlWhjogDr6XLDLJH15Bc0/I/KDXlAHkWiIV2A0tZlLQsZoOpfjJPlEdmuQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347559;
	bh=dpxK0BLGILt3i4v4Z8QJcPA8v6LiJZ62dR4n0k7adBQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AKMCPprZXak2XoNy/v4vQNi93nSRYLLftsNYAZlFEaNS5IFIGsZAKXW1CQuc/auHX
	 SjLr332RE+yL6roWXZLepNa4XzEQMcBNGhvI2TwE7Sawfh1fzVjfHv/hu1941w4r5p
	 ZC4Osqe8R3l+BF4T51DOZNAImu77cgc+hhV8etJ1bQnfqZhReiqtgbqVC5gDTjDcqL
	 1/JBUl43PS/p263LhTb495KTMYaU7ZAYHXCt2aGAZDEhFxYuytRy10+5HD94cHydSE
	 +I7Vz2Cuv7uwoFBKHC8IFv6hcwRsBa8pLHqZ5h/3cLE76UnmSBN+vmuh05wXd690JX
	 fzm82Q3d0KnIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FD5C60DEA;
	Fri, 25 Sep 2026 14:45:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 711BF332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62D1460DA0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcZP-d0OwZPM for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7F55C60D9B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347555;
 b=E1R5RZckJp3SA0DdEw+8ugcixsyNDPqXmnu+rhnkWa1liZUl3sm4D9buU9CbY5uOnjoM
 UYelgMue80ARgkAXwdgy4aW/62Xz9dcCAm6kFCsib26O2lEJ3wTK5UENNPm7V6xtkP/g4
 A3CFEs16YarNQi9zHCuwT8MPVYEiuA+7tUu/bp1ueT+oZw2i9Nhf4tq0YA1S+8MnjsBsz
 CtyWijxlcIVc+BgOv5EEuYrEoWoTwYYJXcfEVyR+YU+h5O1XAE5m5kNOTeWb/JRI2f81t
 le0bE/lSW3BBTrz5dRcRllaf4C5+qrDolEe/3+agP4LBHJQ/fIsmNKJt/nrx4sGiOnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347555;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=FJrE6juzg3E9QUuX5xTGkCpEnOzDpmR+3psyR22Dsug=;
 b=Okw7M1pkp2ubI404KaT7HzNbzpNSLXsR3VNsmj7QAiAVKJMrfbWuuERWowfVN5TA/kLk
 gu1uvxeM1A1rCb01I6o7ME2UT6IZ3qzdjW1BxGW8ZkyfMy9FweRJVp++D2+sQDPdsLP4L
 dpDmYBxJ9p3PPRWRzEyel8FcVjbL4R9MmQZyB4yY6k018qa25yowK2mRSexQoq2C4BVGR
 eSM6mfBkB0WxPmmKTyElrvHwOPvoauLm/uBYIRZmGyrBiEpE6wWZ2LuYYEXaDHUkFRQO3
 K1RVVwi1qh6UrAeKVsdXWF69y4LDKJFPwMNzBXwAgqqU60CP0pfIjxi2F5be13Ow2NA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cSkQZT+5; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F55C60D9B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:55 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49ccff31419so9286465e9.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347553; x=1790952353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FJrE6juzg3E9QUuX5xTGkCpEnOzDpmR+3psyR22Dsug=;
 b=NkefgH7bS08EYFvBZOChXOTeIhKFYuLAojpno0d5Mru4CtiNZwF1xObCTUDkZu6APQ
 UwOvmW2qa3IbPJwyHnIJuYRdAWAM1zdA/BUaeUkC8dyFRhnksVEXR6sYbQxwBBkEZWZO
 K7tOPGZlJr/WQwR7NWRyZC1WrL7sC+U2kXJDlp7q8JOJqxMSZyCW4XX6zfsxz2b/WR52
 HQURgg0BgaiJbj5Hj0yaI+jqXeq4I8oTeU8uhLQkYxqiM3Sbs5fQIv/VHiSJ002bujru
 x6chjROSdHrPFQNt+TZdgGwzRuF4QzOZ958Awu27VVZKms43hHF0DJ6aQhl5w54nvynC
 PtAQ==
X-Gm-Message-State: AFuF++ntdQT/nyAKc21R/a3aL1QFUyIEMLYxptAyhzHuZU7ulmMLZx1g
 WD8CfPALUyXEIihTjfW7i65N4IrsnHrzLHYLaghb2W+8BLoV2lF8iu6idBWmfep74H2+utLoY7u
 cfudoBlTDQw==
X-Gm-Gg: AYBFou04xWkgts1PDu0h3qGSuoNJErrDTBOzi+zCQl+po0OznHkQ3++Rtx1HGMOQHHT
 GAfLa/sHt7V44+UgxXxjNvnckBXxGNHE+Ts4M0hNfK4ctZE7vO+HE9m4a/o9gOu/AQrg0k37JnO
 IWl+GpcVD03sXMlpyllJu1DPtCJqnmSH0frAccVpJBoeBlhSuP8hEO07LFu7jSmKOaUPvXu4Vbm
 tHLXR4/gXZJSFwl4B1JxDArk1vJhfCA5sadbfbowQJr6RFEuBBvWhomSiJRlybxbDrsjwFxtu3I
 K8tFM7uDsXt6h/IrFWuyzGR56euf3XCQfSRaheGrm9pOlnOe/aJejqO+lqsxYzn1C3b8VRZYRYx
 wBOD32uA+De5Hkb1dPgI1VASRHnI+X7HLfxfGyFC6OOZQjInS2Gy9kDpsGG6rd4xxafoJjs1p7M
 huoizGlVHUZsMO9C7tfTcglVDE+He+Df6VHdMT13h8+bmISK7vEbmbYQK2p2anoECoj4jp0fjYf
 6N6Wqwo2x9jhc4vgcGaMmHFRD0oOqym4o3WE+qtdA==
X-Received: by 2002:a05:600c:a012:b0:49d:1fa8:b266 with SMTP id
 5b1f17b1804b1-49fe7bba7abmr105230605e9.26.1790347553387; 
 Fri, 25 Sep 2026 07:45:53 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a34a76fsm7868177f8f.7.2026.09.25.07.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:53 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:50 +0200
Message-ID: <20260925144552.4098398-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915221110.2037230-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/gnuradio: fix dependencies of
 BR2_PACKAGE_GNURADIO_PYTHON
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
> BR2_PACKAGE_GNURADIO_PYTHON selects BR2_PACKAGE_PYTHON_NUMPY, so it
> should inherit its dependencies, but BR2_TOOLCHAIN_GCC_AT_LEAST_9 was
> forgotten in commit 8b3993178d0ffae312d7dd0df70d30d1d3d88873, when
> python-numpy got this gcc >= 9 dependency added.
> 
> Note that the existing BR2_HOST_GCC_AT_LEAST_9 dependency is correct:
> it is there because gnuradio needs host-python-numpy at build time.
> 
> Fixes: 8b3993178d0ffae312d7dd0df70d30d1d3d88873 ("package/python-numpy: needs gcc >= 9")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/gnuradio/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index 98d87aed56..e87275de4d 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -80,6 +80,7 @@ config BR2_PACKAGE_GNURADIO_PYTHON
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
>  	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
>  	select BR2_PACKAGE_BOOST_PYTHON
>  	select BR2_PACKAGE_PYTHON_NUMPY # runtime
>  	select BR2_PACKAGE_PYTHON_PYBIND
> @@ -87,8 +88,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
>  	help
>  	  Enable python component
>  
> -comment "python support needs a glibc or musl toolchain w/ host gcc >= 9"
> -	depends on !BR2_HOST_GCC_AT_LEAST_9 || \
> +comment "python support needs a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_HOST_GCC_AT_LEAST_9 || \
>  		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
>  
>  config BR2_PACKAGE_GNURADIO_SOAPY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
