Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5C0D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2C1B40D2E;
	Tue, 13 Jan 2026 19:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvMNpsfHSXoy; Tue, 13 Jan 2026 19:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 884FD40D2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333535;
	bh=svhNDsTLayILxLW8EyJ9WMnPOHZqC5DJrZtugjw9mYE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E8iUYbSYTONyp3yXM99VEZvxysh50r6rwazfz/EaTldlYeIG63IADdzxl7w/7uEPQ
	 I0s7V1YXQHpISWvsFmX9gSxWMSm/dE0dV44tI70JIxQvN2bDpF9MucGEarEIb3lmKo
	 /P5IvH8nSp6wzc2m9NNYcTa3PgbmR5gIkq6rzkHKOGps8OWdUDnUmWc5wdUzZLZnfe
	 CWqynJUegpZhfMg5nGXXgLt5zgJd1Elk7Kizf4IhufTs3E1t0iqGhs7yvpY4HXRCW4
	 7lZ/1YMwQ1ougr797ztiuPb1Cy7ieBoLK0TAJ9cia6PUQymmnr/TMBIfYxW20fKnEb
	 VqQwKAU05pplw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 884FD40D2A;
	Tue, 13 Jan 2026 19:45:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 162BA231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F2C2840F9
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JPO6cCDPcAK for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EF1283C78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF1283C78
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EF1283C78
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 96264B97A885; Tue, 13 Jan 2026 20:45:29 +0100 (CET)
To: Neal Frager <neal.frager@amd.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:27 +0100
Message-ID: <20260113194527.97711-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250905122603.2521801-1-neal.frager@amd.com>
References: <20250905122603.2521801-1-neal.frager@amd.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333529; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=k+xWuQzhL2jNR/mcEOtQh6pjQjYk58FRTxBwC36VJJk=;
 b=lsxNgZq1MDScImqyJyUFsRIMGb758liYY6aZeZIsj2eSpVvmh8dXgSm1LnMfINGhrn6vI8
 7XpNxOG4vwAnTu4w+R3Wd/Q8WYQxMCfUIz8l9plcMVZU01cICbCfRyTQsA4WC5n1dCePfW
 DbZRxd88+c750+LKq/ghpmQ9GxsammoE1Pz3yqHpDo7FQDn7+DR7i/0MRv417PPI+uVKLU
 l0MPL3LOA7PaHwY4xlefcgXy6Fob7NI0aveAgmAL466mR4ct5ST6NdsFeUPnvEydxbr0Xj
 dBLZI5Uu2N41vAx2NgaU4BfUERCRzCEFS4j1luz+06VUEXdBlBmEAKnGqeeSUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=lsxNgZq1
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/arm-trusted-firmware: override
 BL31 environment variable error
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> When building the arm-trusted-firmware, if the host environment has a value
> configured in the BL31 variable such as the following:
> 
> export BL31=/tmp/bl31.elf
> 
> This will cause the build of the bl31.elf to be skipped leading to the
> following build error:
> 
> make[1]: Nothing to be done for 'bl31'.
> And then:
> readelf: Error: './output/build/arm-trusted-firmware-custom/build/versal/release/bl31/bl31.elf': No such file
> 
> To fix this, clear the BL31 variable in the MAKE_OPTS, so that building the
> arm-trusted-firmware will build regardless of the host environment.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> V1->V2:
> - correct file path in commit subject
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index dca16d3960..021ab5c092 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -162,6 +162,7 @@ endif
>  
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL31=
>  endif
>  
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT),y)
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
