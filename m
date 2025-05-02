Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FF1C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342AA4078B;
	Fri,  2 May 2025 11:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5EbYvoRvr9a; Fri,  2 May 2025 11:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A7D041605
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A7D041605;
	Fri,  2 May 2025 11:03:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B2E3EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D3034094B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59h46bALEXo4 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:03:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD18840B30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD18840B30
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD18840B30
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:03:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D50D21C00E6; Fri,  2 May 2025 13:03:03 +0200 (CEST)
Message-ID: <0d022d23-a678-47da-aa0c-01491fa4acfc@rnout.be>
Date: Fri, 2 May 2025 13:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charlie Jenkins <charlie@rivosinc.com>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250430-uprev_pixman_46-v1-0-c1608b4d4bd7@rivosinc.com>
 <20250430-uprev_pixman_46-v1-1-c1608b4d4bd7@rivosinc.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250430-uprev_pixman_46-v1-1-c1608b4d4bd7@rivosinc.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183784; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wkP7SgQ8WU51XP0ZxMhMjvEEw+LfI0qgzE0SFzZGFoQ=;
 b=LSj6O29TR2PAmFgm8nYnZvt2bVmWelJeu5ZpopeMMNkfuAeMSxZ4a8vFDKtpdW/aUraH8N
 RpvzJhPVMvDA5MZCi2/rZiBR1OliMhIdxVb5vKwpG/ub5n2UzS5OP8LFVKtpPvgzPSajFm
 m9YloSI65M0VT9YGUnKeeWH0s9r41yTWeANFzRa8Kc6T8wUjh190Rq/Lbi+qqqRFTLEePw
 dxWfGB1l85DpjdGDzjCOJGVQQdHmCQ3yvMFB8TynS6axsDzP1qgwG/rnhs92XvwaeOTDO4
 d2zl+nyPaR8Sx4nzIm3YudzTjFRcbLaLLnQo8VRh+LxwjXBHMKv0gp/3dw7kvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=LSj6O29T
Subject: Re: [Buildroot] [PATCH 1/2] package/pixman: Don't require vector
 when BR2_RISCV_ISA_RVV
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/04/2025 21:10, Charlie Jenkins wrote:
> If -Drvv=enabled is set but the toolchain doesn't have kernel headers
> with vector support, pixman will fail with the error:
> 
> "RISC-V Vector Support unavailable, but required"
> 
> When BR2_RISCV_ISA_RVV is set, let pixman decide if it wants to use
> vector instead.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: 386e6bb47994 ("package/pixman: only compile with riscv vector support when selected")

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/pixman/pixman.mk | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index 76e72d6d96161f9458cad71a8437e46b3fdf4d95..78ab20da5915f2b7b9d5710b46b5ca8011e32240 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -74,9 +74,7 @@ else
>   PIXMAN_CONF_OPTS += -Da64-neon=disabled
>   endif
>   
> -ifeq ($(BR2_RISCV_ISA_RVV),y)
> -PIXMAN_CONF_OPTS += -Drvv=enabled
> -else
> +ifneq ($(BR2_RISCV_ISA_RVV),y)
>   PIXMAN_CONF_OPTS += -Drvv=disabled
>   endif
>   
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
