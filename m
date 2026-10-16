Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A40CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1866C81545;
	Fri, 16 Oct 2026 15:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoJVbqtwd7nE; Fri, 16 Oct 2026 15:01:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 25F6881514
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162905;
	b=arq86WgBongbZuEaMHgncPUdQcGrk3N+cyihw5DpYO4Azt49dF446P9HE94czkHGYzR9
	 T1Csm8qBJ9S2+pZs+WupJWg4OBkU4ivEEnZOPoCAlsoJSfbyyvYTwg7H6E7TM08wOC9As
	 wMgRkKhwH/AaS/oljMf9BHSY7wVmkt8ifQv0CUhpSBNkxjYRfbopx73j7uI7mfK5f0e0o
	 6jRndNarT9C0YKjhSbvhuLSBOHVa9w/39E2accHS4qNEiKP/KV81sboa85WG+cG9m3TEf
	 8aaKj9pY7Hh+SSgrXyiFWaqt9T94zUMeNYCQIV/1nIqd0esXnSJzPqyTyMDdCYuXitQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MPbht0A5bA4jQ5AKaJDHi1pdt05ZCoHEJqL15x4tN3s=;
	b=bvIIK63PtOX52EIjP3E29z++00UEOKpXsEp2ZRB1rREwW3p22SoqZK13j8exLgvmBU0W
	 mtUby26s70gyJbrAD/ScH6siTTYQrV/Gl9Uhv/dE8SX4e+vyBBSsyKw48PP03mIZQ+VSQ
	 njhUQfwDZqBk9R3Ug/m2zEEDYIH6/M6oRYEWivxgrHyeIbXegveaIQG8lnRsM/OUDaUEw
	 GE+i4X/KUL3xTPndDl+kD0M7WrJPSqYYZArx6+oYp9+SY5TGbF7u7i3l+ffwdwneuGyxV
	 OOpAGmAGOSUWNHC7SeupfeMNHyqYB+mL/4R0m0xbAt9LeuBrV5sTPuJmFejjcNvsD3g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162905;
	bh=MPbht0A5bA4jQ5AKaJDHi1pdt05ZCoHEJqL15x4tN3s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ByBUNBQ8JYbCoaUuCoqExD6kThIAxlUhfmxPkVb5frzLUz5aC3vlrl9CpTZAtVnpE
	 HelBnaoP1oztE90yNEUfsrQCLSFM/xeMtFMBhqp1YXZHexZTRxHcMLAXHRbRjsmxCM
	 P9YeqWNk7w6tqpMdXOvIfcrXmQzzIjlP9L+VjvvXpWsbDSnRWqwbL5xsWfRDHRA1GU
	 C29XM82yFyQquw0fcvhXDe2GMd+msJNymzAqhzX6Hco/DYfFnr/bIqpHALIv34yzOt
	 NkYlA9cKyffsmPMIgEiadIh7Iue22xXrkhlpYyNlmpeibymV4xC7rZEP2rbTU04M9V
	 hXpeLUKN4XxQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F6881514;
	Fri, 16 Oct 2026 15:01:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFD147AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5FA240042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxiYRRqT9vb6 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7A5B94016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162902;
 b=iXQAH/BHJF25jpeukq749IpV17snh6yvABr/Z2FjrSCC33xfcv9t0siybGUCHv0N2UUH
 s65O7VNJ6Wck5ZBDU91LGgL3GCpX7wtkq7Z/YoumoWPl+GMgXUftZxbTegzrs2j4NabwD
 aYo2e8kD+g+pvIl9pEG24UNb3D1KSVqUrF5eVsRefKj212DtLUcuxvkHqLHIfDLcWYUPr
 pfVqThy7vzXB/J8DDvzXzezr5n8TMc0l3esxZSunXui9yQvT/nDLXd0fBhyqyg2npHpqw
 bzWoZ8Mmj/DSb5vRvZrby4PoyRU6fGAlPoas5KxiUmoHITcvEJrTwU8QG1iPCM3Szpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162902;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nkToQQqrDpd+2Z6Xp8KR1as6Ed0Xzqxi9Dta1w0XzNM=;
 b=N7QhKhrkA5w46sTCOdqN4wfkC7ZRSKIHugk3eMOap4gC5qPDl8skYUJpZ1qw3fBLKAkL
 DqfMzhLgpmiCR+xHeO/xmAqTaI3xEMsgwUgXwxvyCKQLfgW2CXgEVlQO0uIAQzzzgwh1X
 rYDc6QVwT8R8+gadVAK4uLNAylReDRrTldWSrhwywLQ8daDxsMoh2k0JfoWEmJ74mB63N
 Vj30ufxxj31b6QmOtmDnpOP6ds11iY+yVeCKMztFSB0sBYbUJpEnUpr3bTcuyvTVSEUWX
 PRKtcOYwdkTfdP8plAcj9QMEhKpkp7QckGTzeVebVLKrxNNj4AUNwlK/NBAAv8zRKkw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bJ00tVPs; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A5B94016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:42 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so1626441f8f.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162900; x=1792767700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nkToQQqrDpd+2Z6Xp8KR1as6Ed0Xzqxi9Dta1w0XzNM=;
 b=RXh1gkVG+Zry/MkXh7I/n9AHYlF0s4bdTyZYS/ZGCuWcHx9h8h5BuSrBhNtm++/YCv
 8pA5EUn5VdAEsoyPPVFg0NxWbad1KQ6MsWvyALrvW1IBhaEs5rWpTqMKlfWOZw8dZqRY
 vrTpbuZis10qnPDXJV0qQSFY+iUJTXYTz05kGVpb8Zw/oCtg93GU/M7Zj7Bq62m2rl5d
 lKRc77f2IWmc/n2F8qTj0AP5MPmw73wwKzWZQ14Gs08TTQomcuc4cWRvzXsxFaQh7Vvh
 22/8yVgjoFbePWebGrlL8Ki8n6gzl7A4DEV4fCxgzsaM8CpJ8aQGV1jVwG/f1P+zKX/E
 FSfg==
X-Gm-Message-State: AFq9FYI15MIsbRe+pPgfReWvcn8P2aaufJ0WzEdKIjge5Y+2h031yOf9
 lW3wQEFp0nKx2bV47yfJ38/X2ANHngaOZEzFGbq08hrvCKUBYhDw0QjoSG3sjNloCLik8nnWdpQ
 oTz/ZOrI=
X-Gm-Gg: AYBFou3F97ezTrjET1uTDh8KS3MAu2S/8wGDUStVAt2UNfcWJ/8t2kh9mpXi8EIufH7
 TMc70us/Lj/MmU2bIhTfk9jglvAf+gGo55BTsH1oIuaeL02MSpwig2QciZhZLcF3x5f/Gfaf5jJ
 8kLM0tDqGwqSdH+AEj31yCpMnXQLap51vVjGhkHjn2QDiDcQ5x4V+duMAx1MaDvDdFJzKtkn9fN
 PNiwkN0K5KzXIPpVGfGg/zz7YzckiYZZUyzcOd9FowKgHL+BM28tH+e28GUgTo3dsS2nradsBmA
 fQ+80MR6qAtUtbjaIt0O+a636srcpCiU8UKP1MEYBIZDFLq3YXTPrrLoo9/nXYp3wNZ2trqLCgp
 NeB3pkHDNzGhzewi16gqgHsgFCf61ztYVlP0Sct8U3Pmqlk9p3AGhOjcHBHND0dqpxcQ7uSj4RY
 YnESvRawHQLHlTqtO6iOz9dthJgL837QFgwdREHBfIlk8VIq8rOXAm4W7AwfkVme8k2L7R2CVgd
 DOwpVRDiTQk8TXKfIs3xRo7H2kMkDoSvqCNNxGJew==
X-Received: by 2002:a05:6000:e83:b0:48a:f073:336b with SMTP id
 ffacd0b85a97d-48dba9c7bbfmr34135043f8f.23.1792162900244; 
 Fri, 16 Oct 2026 08:01:40 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd471a72sm6236305f8f.4.2026.10.16.08.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:39 -0700 (PDT)
To: buildroot@buildroot.org,
	Cherniaev Andrei <dungeonlords789@naver.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:37 +0200
Message-ID: <20261016150138.60146-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611130409.2841176-1-dungeonlords789@naver.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: fix description
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
> 1) usually user should not try to find OVMF.fd somewhere manually
> 2) board/qemu/x86_64-efi/readme.txt is trying to be duplicate of board/pc/readme.txt. We should not duplicate info
> 
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  board/pc/readme.txt              | 10 +++++-----
>  board/qemu/x86_64-efi/readme.txt | 17 +++--------------
>  boot/edk2/Config.in              |  4 +++-
>  3 files changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/board/pc/readme.txt b/board/pc/readme.txt
> index 18b1e3dcf0..31ca5357e9 100644
> --- a/board/pc/readme.txt
> +++ b/board/pc/readme.txt
> @@ -63,12 +63,12 @@ Run the emulation with:
>  
>  qemu-system-x86_64 \
>  	-M pc \
> -	-bios </path/to/OVMF_CODE.fd> \
> +	-bios output/images/OVMF.fd \
>  	-drive file=output/images/disk.img,if=virtio,format=raw \
>  	-net nic,model=virtio \
>  	-net user
>  
> -Note that </path/to/OVMF.fd> needs to point to a valid x86_64 UEFI
> -firmware image for qemu. It may be provided by your distribution as a
> -edk2 or OVMF package, in path such as
> -/usr/share/edk2/ovmf/OVMF_CODE.fd .
> +Note that OVMF.fd needs to be a valid x86_64 UEFI firmware image for qemu. The 
> +easiest way is to generate it during the Buildroot build by set 
> +BR2_TARGET_EDK2. Alternatively it may be provided by your distribution as a 
> +edk2 or OVMF package, in path such as /usr/share/edk2/ovmf/OVMF_CODE.fd .
> diff --git a/board/qemu/x86_64-efi/readme.txt b/board/qemu/x86_64-efi/readme.txt
> index 7f69be065f..036239819a 100644
> --- a/board/qemu/x86_64-efi/readme.txt
> +++ b/board/qemu/x86_64-efi/readme.txt
> @@ -12,17 +12,6 @@ Build
>  Emulation
>  =========
>  
> -Run the emulation with:
> -
> -    qemu-system-x86_64 \
> -        -M pc \
> -        -m 1024 \
> -        -serial stdio \
> -        -bios output/images/OVMF.fd \
> -        -drive file=output/images/disk.img,format=raw \
> -        -netdev user,id=net0 \
> -        -device virtio-net-pci,netdev=net0 # qemu_x86_64_efi_defconfig
> -
> -Optionally add -smp N to emulate a SMP system with N CPUs.
> -
> -The login prompt will appear in the graphical window.
> +    output/images/start-qemu.sh
> +or
> +    output/images/start-qemu.sh --serial-only --use-system-qemu
> diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
> index 2620c79076..7d170fde3b 100644
> --- a/boot/edk2/Config.in
> +++ b/boot/edk2/Config.in
> @@ -14,7 +14,9 @@ config BR2_TARGET_EDK2
>  	help
>  	  EDK II is a modern, feature-rich, cross-platform firmware
>  	  development environment for the UEFI and PI specifications.
> -
> +	  Select this to build EDK II (and OVMF) to be able to boot
> +	  Buildroot in QEMU (UEFI mode).
> +	  
>  	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
>  
>  if BR2_TARGET_EDK2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
