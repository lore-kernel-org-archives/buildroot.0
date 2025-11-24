Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86743CFD35A
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 20:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FB683CDC;
	Mon, 24 Nov 2025 20:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCkBvHsyZXOq; Mon, 24 Nov 2025 20:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B5E281C21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B5E281C21;
	Mon, 24 Nov 2025 20:58:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ADF8C359
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB34E408F7
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQG4VS6Yiglg for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 20:58:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A98940835
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A98940835
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A98940835
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:58:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BF971B979AE6; Mon, 24 Nov 2025 21:58:18 +0100 (CET)
Message-ID: <4dc92971-6469-49dd-8848-923f6efe41a8@rnout.be>
Date: Mon, 24 Nov 2025 21:58:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rustam <rustamabd@gmail.com>, buildroot@buildroot.org
References: <CAPzS6u_Lu2jE3PzbmOc1gRzA0uLjxmiR60fwy5eEwRDK92ya2A@mail.gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <CAPzS6u_Lu2jE3PzbmOc1gRzA0uLjxmiR60fwy5eEwRDK92ya2A@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764017899; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=2CUkFVObc1/7MNDdurgoZcPH62hnbHetS3zkIttcpbE=;
 b=cI0I4456KuvDgNJH4G2+wMtaAfVun/lwmi57botqssMxD0+eJb5JhPYip9uiGRqA6UzOtd
 +ZHHCw9x9glWX9rtpsHgEoYPOYwjlFqmUSI7SruWJe/NsKZ2uUuHjtbr1FcEBlE5MvOE2W
 UpXWnrK4TZiCo9UtgV80NcY0uFitWFpq+/mk4/+Fo0gciqpCtwMOq/HIX8VPOkEzZfw2eO
 gxHfa6P6jX3LQ4j765EEI1KYogZ6c/33qwSlJ2uEH+RrwO1OvK1ym+0vIF+qT+uv05sGEj
 52wwtWfC+Q2vZTCs239dl/t1NKwk5KnzEAEMPem4WMkX5YCQsrV28bNp1RlxDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=cI0I4456
Subject: Re: [Buildroot] Kernel headers with an external toolchain
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



On 06/11/2025 13:41, Rustam wrote:
> When using an external toolchain, I get linux kernel headers from the toolchain 
> in the SDK.
> 
> In case of the official ARM toolchain (from https://developer.arm.com/ 
> downloads/-/arm-gnu-toolchain-downloads <https://developer.arm.com/downloads/-/ 
> arm-gnu-toolchain-downloads>), we get 4.20 headers, which causes issues when the 
> actual kernel is 6.12.

  How does this cause issues? The Linux kernel is supposed to be 
backward-compatible, so a userspace built for the 4.20 kernel should still run 
with a 6.12 kernel.

  The inverse does not work: a userspace built for kernel headers 6.12 will 
probably fail to boot on a 4.20 kernel. For this reason, the kernel headers of a 
toolchain are often kept at a somewhat older version.


> BR2_arm=y
> BR2_cortex_a9=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
> 
> Question: how to get the actual kernel headers in combination with an external 
> toolchain?

  You don't - the kernel headers are an integral part of the toolchain 
(concretely, of the libc implementation). If you want to use newer kernel 
headers, you have to rebuild the toolchain.


  Regards,
  Arnout

> 
> I tried BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y, that had no effect.
> 
> I could live with just copying the current headers onto the toolchain, 
> overwriting existing files, but the toolchain is built before the kernel. So how 
> to do it properly?
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
