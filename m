Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C2BC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC6C60E0B;
	Fri, 18 Sep 2026 13:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8W2OFjNNDi9p; Fri, 18 Sep 2026 13:08:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0397B60D76
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736894;
	b=L25cIUrrCeWJbEdK9xQNaizXkRE81iZOhLCCTCXUB3tzBxTkzNt4tMfLfnEfigD2xnRp
	 btudVemc2V0O3u6Xwk51Z6k5UNzlCyDADwgk3f7ze6mklbY95nGv7CjM9Iz0h1u2V+PsE
	 SDDsKe5yoVCilFJcV/kXhe4K0QJibDSX4fkrpCsteHQhD7pTWUTYIAY09FTUsEKnOggLd
	 w4xuQUV/lGi4E0Rqazr6J2bVYlxDFY9Y9Cnno1w5mQjIsVeJtZJpf8oK4UpnrRsnzAR9E
	 9ASzayh2fnmz93Ik3dsXnnMdnvwujZ1OX6wKpGOj+HOwIdCq7OTPXy615jws0MJQ2JA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Qnp9oIyiPo+tL+ozg99qenhqVwO/ub6dov2rt91Sgzw=;
	b=hErgkGNbNlPxw9KEWfK+PhL20SI8D76X4KVer1XQdPmbyey1k1B74sv6+0Qtjg6D4rjS
	 KDMB1GHoRNm0tqCaXd5yWPk8jfTEr7RAonn/NwYqKhJIhe8A735nva0iO07ISsGr82cMT
	 7Nrs3cySSDtC2TaiqC4/OcqWMmjI8AJchddb9qn/zBQw7gL7LgIXczHjmc723UZMKq2Qo
	 FNh+n3bwj+zgfKhzhdc5AnAGPEWrPqhxRxHsyd9OuI682i3EsggmPNSgMzTXk/Mcz11Tn
	 +4GQrN8VB5pl8CFFnS8zyyi3WDbr8YEej7Ptvmy1dHSHfAEvfWH4fM7mo0yHRy4G59w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736894;
	bh=Qnp9oIyiPo+tL+ozg99qenhqVwO/ub6dov2rt91Sgzw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bRj4/kwWRd0lZ/IiD5aQyWHQcZgLY+/fsHpUEfVya2NMe2myJHcT+m/ig3+SRumwJ
	 TEvOUOEWFV0aRRETafT6/hc3CXATJ+aczSsU8Nkn98BNAw3i5UnkTBYln4uUsN3HGC
	 Fw4SoNqkToUOVADQ6oTCbdpBMdjDSuwTXvey36/eBvEkOhO41RAxdv5zXxueNaGZII
	 ChzLb8JddXSKswpqJrYl5idoyBOr22pueU9iRw0O6G3VVqix+H57ogjnHDUsxO4E+v
	 ZiZQkZHWXt7BaEBIu9+BrOB6toXXnkCZcNV+5gD6BwHQetkWFpnplTXtrV5vn3tidW
	 XLGpAw1zJtyhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0397B60D76;
	Fri, 18 Sep 2026 13:08:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1211224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A31CA400B4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8A_grYU91eRy for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:08:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7D61F40524
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736891;
 b=V8oF65TjBQrm6gX5NB2d5z6wvvu3SV0Es5FWHyDxdrJeNzgOeqS078PoWsXRwRId/kp7
 bHKjgw+72dJpHbozmKe0oyJ6ryLLKPCCoW4WQFpQd9HKClH5HgqkXSCdkl6tfJH8jid0U
 iBqMGBR/dpLihtkyUXp3bA9REGmPvvuED7/F18l+FZnuPNO1BbMv07gNLwc02uE3Lov8M
 13SyNR4AOGQIs6Pp2pR+fbfj/X+983ykQPyoW8MkCD5GSGh3Hwfy3UR9u5yhhtIqOb9G4
 B3SayxgbK9Q/AYVwjP2VshDCbBSbIuyAAi44sm924LRnQpcjtbmkrHqGao1sKAulSLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736891;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=mU98nvZWhYOawXCEgfYNRoqjiQcKpF95wZ/fob7AUWY=;
 b=jrB7A1ebD9AtSwUbB2fDHoIB/vesYNDjaDG/eyT4au0u+3iv0I4U5KjUavRwfV7PcBOH
 FT3O7vyfcv11x7o3E9BLhbbvtgFXFRXnV7AVt7P475TxBYYuoKGBvFegXMdvkkpbm2R4j
 STrKG2EeA8PzM/ZWr3TPoFPtT5aKTVQQitmpEdHnYHPfTpUjMxb/SPsx7zYZbT0hy5RhT
 H906HjxKCm21e+F8DtTMp5W5NBQkjem5VXKavMLISJFNMDQdEE/6rkfZU7019EhPgIJro
 ou6p+if4zdYWqr5v/8Broa00m8jzR/v0twVnGNFMqHCawBVkmlqb1Pgvx1MaFqtNunQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bLaUdHN4; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D61F40524
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:11 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f633cd80so359108f8f.2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736889; x=1790341689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mU98nvZWhYOawXCEgfYNRoqjiQcKpF95wZ/fob7AUWY=;
 b=rjqwNo1kxuq+Ah2eZBBmbDzrUDRiYH6uk+0g6oxto71lkbp/coUG6DaWnIh7HUyT/Y
 asuMsC/C1OqY/IBqoPJyIeXkGwuC9PUoRbPQnKniMFrGK/zI63cbbCNlTxk8Vi+bDTbo
 e1DtHwai46zdUVJ1GsEKVR9JQyahHqdsa3T4AER4xSZtqh/NM4B+sLXTyNKTqWyWq8d2
 dwriW2/PCrGUzjJbQLmJQ4QE6xhO1SbZW0ImYaLkNt96LySQSdOGhvq6k+K/6s0qGWrd
 4RhwKO2IevXe97CE9LuESu4kDJ+lZ9nUGK3k7r5r0fy0FlHDVOy6phJXBe928AcTs3Oh
 Uw/Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBy41hrTKxeARQRQyU8LZMz+/l1ZNgN9Bl+oGMHin2dJ5hJ2nDtJYNRm8cIqFG+PfekCOeZSlvSbpek=@buildroot.org
X-Gm-Message-State: AFuF++mE4VzmFXeLHwgREo00d7wDajDNAAHutZ+BOHe2HDWvlUz8etW9
 DmN3GMHroRtSlAyz72PYcw4QdytpdXWmUst0MOpPzGPqIicbGEr5IFUO9vsJDD5yp4M=
X-Gm-Gg: AYBFou1YUqvsbGew/Zq/q/vx8m7N6YNeuq0OtF8dK/j2MmfNAPLkDzdVegCq/SyM69B
 UPN68cCDazUkIO/HPDMrfBbWn6rghsGN5jAUZlOdcevr9l/QH23ugnCtNGFeTnhF/iHB4aHRIZE
 RRoCFg+dq0+fK7B3iVIUi6hCJwEJyRS47vK1cnHCZbRqFELK6B6KAselKrUVZZg2ku7pDR6Z/j1
 aYMWKSUg7z+xRSds3A69yq1nNk9pst3TQl8bzV/QvUjM+gCGKh+muE5OGqD9BYTx2sM8Q0iw59C
 DOLHVkRbsay3xjnzWhZGyhBEe/5Ik4G0qbzlMcgi9c4cIrx9EWyutIkRn1HWG7J51eZ+6JzF1pM
 ZmovcFY2Npp8riPEAIhMthkt9o5BZ0TX5uVjCtZDMiSRoa1yO6Y1Zl2MW8MIvCMJ8VNrGllLdQk
 omPrjx+AlX6in3r7TmeZATwqdoXf5HxdPdsDqCCTWNwsead3rJiizSHHTvRs9Wb/ws
X-Received: by 2002:a05:6000:3103:b0:486:f908:14c with SMTP id
 ffacd0b85a97d-4871e3778cbmr2855475f8f.47.1789736889072; 
 Fri, 18 Sep 2026 06:08:09 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4872008f34dsm4139122f8f.36.2026.09.18.06.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:08:08 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:07 +0200
Message-ID: <20260918130807.161349-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905062316.383690-2-bernd@kuhls.net>
References: <20260905062316.383690-2-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/i2pd: needs chacha support in
 libopenssl
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
> /home/thomas/autobuild/instance-2/output-1/build/i2pd-2.59.0/libi2pd/Crypto.cpp:661:49:
>  error: 'EVP_chacha20_poly1305' was not declared in this scope; did you
>  mean 'SN_chacha20_poly1305'?
> 
> The code was added upstream in 2018:
> https://github.com/PurpleI2P/i2pd/commit/58c92b8405f5da687734c1b0d6f7ec63dbb2d3b0
> 
> The build error could be reproduced with i2pd version 2.22.0 added to
> buildroot with commit 1035e80aaa7492fec12cbc2fc5faa9bf32ef1cf3 so a
> backport to LTS branches should be considered.
> 
> Fixes:
> https://autobuild.buildroot.net/results/bd8/bd8616f04df2e1b9e18d1e16921979a852bd566f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> Series passed Gitlab pipelines:
> https://gitlab.com/bkuhls/buildroot/-/commits/22dfb2cf28943aeaf56911d53553585d6047adb8
> 
>  package/i2pd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
> index fc2f3b9367..563f165574 100644
> --- a/package/i2pd/Config.in
> +++ b/package/i2pd/Config.in
> @@ -12,6 +12,7 @@ config BR2_PACKAGE_I2PD
>  	select BR2_PACKAGE_BOOST_FILESYSTEM
>  	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  i2pd (I2P Daemon) is a full-featured C++ implementation of I2P
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
