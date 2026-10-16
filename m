Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B98CCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDBC240C3A;
	Fri, 16 Oct 2026 15:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1v1XO9LG13-B; Fri, 16 Oct 2026 15:05:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 023DD40C2C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163159;
	b=Y8RA1TioyGHx/WlKomVdxCcOtvxfApoA7ydeukd2vPUhX74mIonUel0CZaJRAcpxO4p8
	 TRBzDZ8Ptz1KVEhxYi2hlVBLkV+G4yJbfjuj8eSHMwtgqmdg9t3pookkBxEHGnekMDo2P
	 LgodqLdH9x5vZGnCGoc7vhMCKqzk8o7olj5UndmMxmr8LUfzPXVXH8YrSiQlzHuQpKVd7
	 lDgsM1YL8bud4pWMzfY2wqsi4zZnFsQOGIk5/YhvzSISl8MR0UizlBuGdTxweWUuY4OA9
	 VhthyegNA4/d/zxJivIPp181MRfFVzKbl8/IKMxIHZHE2zYGtgWkOC20NBtxb1KlUIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=THaIJwNziQz5mcmRHzSMwQiVOnVL1zDzjCiSUqPzCHI=;
	b=i6cq1pEoP4C8rWTeVMEEjYRNX7QUAkzMXvGFZ7HuW1YhB1ssKfr6DvRs4K/k4LovomMK
	 aXU7zdCBCVZ0XqgXYV+0D93MLbcVY0pnOPbs61ad6I6snaDOFt0ViC6rLs551MWgQZ3Io
	 vaTdJ+r5TiPlc1PJMcds2XJGbguZ4qTkhP+I3CATe1LSu6U0LUiCIHV2bxfY99oPAm3k1
	 Mofc+GB6Xy+R73b/RoSCqRNswIRjnaSu9igA3uiyusM/CTn3s+T6t+ga+sAlSe9Qr/CFO
	 X7/3tRdlH68sMBI9dmMeT6Q1XDb5Lvyo2D5epa5ixKPtTyC9VWcJXSWti570uITNzwQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163159;
	bh=THaIJwNziQz5mcmRHzSMwQiVOnVL1zDzjCiSUqPzCHI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M3jfpfjeoS/OTG+TQc2DRpe4uXek1cLvHcCPZGlOP/ecWYSKp68qw+PoaJA6nEjjS
	 aNgp0OsNP/xE7hH8w3/JdOFSY1bkN9Hm+PEeBYmmb3yb8pKqEfzQejPmfELJzlkatF
	 Mhk6hsrCKnPn5rKl2XDKQyfAeJFNskopYHjkkpa3GzeJt8cllnEhqWJye1F4MQk5cV
	 +XGU+Yc5fxo8ktf89/QtZW5XHCml3bFyn84pkBXcfVlpM5JHo5r/0snxUcWAj0nMGM
	 ShLS+vIsxHN9Ba+wC0yZ1GGoFBsYwANVQIWXt4Jizbeny8e9cWwXD3e4yj5ITF4MNE
	 EjRV67I1s9Uzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 023DD40C2C;
	Fri, 16 Oct 2026 15:05:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F414B255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8B3E8174A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtcKgf43cvWj for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 15DC9816E0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163153;
 b=C/gOAAGQSDrClwZXLGYyl2/FdhKPJs3nFyowjS0UGcX4Ueia/aJjw5nrbw4Uf6TwIQwU
 Uuea070n2ql5dem2sYMSFCQDPiCA282pqfh1He6wM9hCnr/MlrB7Fw0l9sZ7eKaOImUa6
 L9n0rD+xXdutBh8Oe3jbgjVVZ1TrsD7artOINRWS4sNpQ5MWE4YxePRQiCH8n9inhOnpm
 ZEJnBIHjtObUohtJH9YYJdHTj7gv20fRKCkw9i+e30x/IEU6G+bGjo5i5tqcafLOaVHlo
 ds2jP22XT1Y7Me/+Pd+++UtNAa4QmtKnIZBCTI5HZKaSN0A1xHTRoZoh4O2GwVtDZmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163153;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=twiPw8nySU0gOGR6XcfPmB13aktGLG9CSgplwKDcRi0=;
 b=r/Dw8abMxiXNAS2MhM9kEMeKxlOevb4V/VltjSvlFTmrnSJUsb+AEipFn/NKVF4EAUXx
 phcRBk75EqdVd20b02xmbnugGS2T+Ycuyq+8bRQvIyh2YjNSRDhKEqoK/cllcj80W3bsb
 Uu+d1UV2rJ3RsdTJW0gnxCx4yB6hB2uJ3VdHh/uRWi3k1d/14FLNcQryLafgnoFcY4Ne8
 TNI21mRnh9L3u3+afKrorgYKP2nf2RfTLBbOn9PtgAFSkUcGR9aaFG8CutUOc4ugkRSQV
 XZapXHjwEe0cjjOPXJL2jFpnSltJRFXBQgp1FpqzGC9zVpfyk6ehb+F0UT4KN5XyXcQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cLedp6n2; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15DC9816E0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a1d75f2f11so204855e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163151; x=1792767951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=twiPw8nySU0gOGR6XcfPmB13aktGLG9CSgplwKDcRi0=;
 b=XHvn2GlEgAW/8KICPnFaqQvB8CVE9+b1OxH4QWrwqnA8aBrBWnUau5DJn8hTB+3C0U
 HwW1z8mxjTxko1/ONhk48w9IQJGPFXadHejDGVgx76l/TRU9Aq4uLX1mCc5HHEd7Bc39
 rvo26KnobI1AVMJWDtMJN+6DNacxdIi5KyVSVbC/g63ELi5nXG4oEkSaGajEA3Q3PG06
 Owqxnpegd9RyXUOzr6UrRWkLHunW8Vq8nPLdJdhR2Pm4gER3HZOkTYcC3ckYb8CV0+P6
 x7L0ZhlQ8xDmdBdmH1sHIYwrt+B3hLmD2eULt1RZD5mSllJzpBsn6rwaa4hbQvtR1OgE
 UcCg==
X-Gm-Message-State: AFq9FYJynWJ2QB5c3s6YdAZrTfdLjcji1VB4praWwBplJWn45QGE+AV7
 lbNYmNCC13kgy6j5urKNAViFwXOdm0SSFlMrYyRfenLrVRtfqQNZR/L1hCEx6Gw1oi30wKsRROT
 iUubzFKs=
X-Gm-Gg: AYBFou1aYxSXRBbrp1b0qRUcNXZaHvgrVnyJhsZLPCJ7+yXHVPF/x2NB3WKpGJ1kJ2V
 0ppK74/JJznr2q8xLWEer5t8UdkG4le2q0fF2OMWGisk5CuSmPZFdA5plo0/x3r8KnRHeW4L6mo
 GBlyt3E+xf+0IHuH9QBum6n9SeBMOXSqyl1D/AW5xE6tS/rBxOihP87lFt49xqLsGzVetgDy7C3
 mO98WwMeCKw7xA69fgDSWZtAxY4btUa2CvOC1tSlgFsJkXeCIi/w/sxSJxzrJpkq8P53sq2x/R2
 LoS402RQo3kDpcOrWWNQp2AjwJVO1W+YbLh42Ia5sDUrF0zimLSu0FMFyRJNT3mEA2rfXzcmqiF
 K1Qq/M5FeSnFeCjKM06EY4UiReYPqvZn8aaF/TWPbElENwz08SlSMArMCTl/iPhIVKTApKwGlso
 fUjOQKQV1zw9z9rqu0LRjIiD1/bxrFP67eu1s8d1yea9iFWY+TuFH+s6bUKvJvU4zRlZGvERKdl
 m3oMd0vUC2aIjNx9i+hD5/ttNUueVfY2hx09pNt1Q==
X-Received: by 2002:a05:600c:1389:b0:4a1:d2e5:aa35 with SMTP id
 5b1f17b1804b1-4a1d76057d6mr1540005e9.19.1792163150365; 
 Fri, 16 Oct 2026 08:05:50 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ab8bb2sm50940125e9.1.2026.10.16.08.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:49 -0700 (PDT)
To: buildroot@buildroot.org,
	Joachim Wiberg <troglobit@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:46 +0200
Message-ID: <20261016150549.75131-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008085901.2692162-4-troglobit@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] DEVELOPERS: adopt firewalld
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
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 32ac338dc8..c703e50b14 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1668,6 +1668,7 @@ F:	configs/qemu_loongarch64_virt_efi_defconfig
>  N:	Joachim Wiberg <troglobit@gmail.com>
>  F:	configs/globalscale_espressobin_defconfig
>  F:	board/globalscale/espressobin/
> +F:	package/firewalld/
>  F:	package/inadyn/
>  F:	package/libconfuse/
>  F:	package/libite/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
