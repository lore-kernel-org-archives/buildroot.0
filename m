Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32611C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1395813E9;
	Fri,  2 May 2025 11:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wziUlAljx6ZX; Fri,  2 May 2025 11:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3804681407
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3804681407;
	Fri,  2 May 2025 11:02:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54FBCEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B208410AE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szzEGTDQskZw for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6422B40EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6422B40EC5
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6422B40EC5
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:02:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E24A1C00E6; Fri,  2 May 2025 13:02:28 +0200 (CEST)
Message-ID: <ea831c61-0804-41c5-8010-ae7fa119b5ae@rnout.be>
Date: Fri, 2 May 2025 13:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250421203110.896967-1-petr.vorel@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250421203110.896967-1-petr.vorel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1OAgxRVD7Rg9Ch31UZuKhx5D8HjysyMnUqb7Sxv9QzA=;
 b=MsAqwtxhx6/bxbkMxkawdREBHfdFGQmggIOqbhqBrqBPEvPqZZBfm2yMtAZe74IisC5GRQ
 Mwx/xv36Qe2GRJUP97Z2TSPlic6lIKeEA0z3963UbUrmpIAqyaymNttBjKfXk/BDYgDOd7
 jsSKCTa3ljdzYL8uMFtOG8yufvOXOAdq2lb3t6W3DEE3VAGJPYbjnIBnUo3/V72hrjz/74
 sXIe5Cm2NpILamPuhQeG/4RzPgVXb7y0ERBQKe5FHZ5JhaLbNDZgL4JWpVU4PaOSBogdEF
 DpMYWePqR5XYybXNVlNq1Ye3BzWEm5uUXoEPw6PIVq4SOE+GMmiUJB2bMm4nhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MsAqwtxh
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/iproute2: bump to version 6.14.0
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



On 21/04/2025 22:31, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

  Applied both to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Changes v1->v2:
> * Fixed commit message (I'm sorry for the noise).
> 
> Build tested:
> 
>                      bootlin-armv5-uclibc [1/6]: OK
>                       bootlin-armv7-glibc [2/6]: OK
>                     bootlin-armv7m-uclibc [3/6]: SKIPPED
>                       bootlin-x86-64-musl [4/6]: OK
>                        br-arm-full-static [5/6]: OK
>                               arm-aarch64 [6/6]: OK
> 
> 
>   package/iproute2/iproute2.hash | 2 +-
>   package/iproute2/iproute2.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
> index fad4debeab..d64ff918c6 100644
> --- a/package/iproute2/iproute2.hash
> +++ b/package/iproute2/iproute2.hash
> @@ -1,3 +1,3 @@
>   # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> -sha256  a43aa43338d882b44d01e549f3f105a92ae9feea32a82fae45a88e7a49302819  iproute2-6.13.0.tar.xz
> +sha256  a6d23588150096591c3d00fc27a324a82ee71d7a1a9eea78df5df17ad9b8461f  iproute2-6.14.0.tar.xz
>   sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
> diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> index 016b235469..3faa2235b8 100644
> --- a/package/iproute2/iproute2.mk
> +++ b/package/iproute2/iproute2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IPROUTE2_VERSION = 6.13.0
> +IPROUTE2_VERSION = 6.14.0
>   IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
>   IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
>   IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
