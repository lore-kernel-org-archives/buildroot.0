Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0755BC369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B65496067C;
	Sat, 19 Apr 2025 21:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwk-aGXJ2Sld; Sat, 19 Apr 2025 21:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1B74606B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B74606B6;
	Sat, 19 Apr 2025 21:33:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44EEC22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35A9840689
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sO3-aNmxjDFC for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:33:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D6DB404F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D6DB404F4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D6DB404F4
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:33:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DF5C4397D;
 Sat, 19 Apr 2025 21:33:41 +0000 (UTC)
Date: Sat, 19 Apr 2025 23:33:40 +0200
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20250419233340.06021dab@windsurf>
In-Reply-To: <20250409-fix_linux_tools_parallel-v1-1-14135d77acf1@rivosinc.com>
References: <20250409-fix_linux_tools_parallel-v1-1-14135d77acf1@rivosinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeiuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohephigrnhhnr
 dhmohhrihhnrdduleelkeesfhhrvggvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745098421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Sg/FaHwOwX+Bgdj2jBaSU5Afkya0M2U9MR0Iu1p0w0=;
 b=cYP+p9rolWJ7g0yhdhDRTX0wpgllgjJtVk1iL3mV+2zxSZjUQAXlSBhvqfHTN5bhvA/tqk
 CWGeuRxv4FCY957egnM6ABIK9l8F/ydvomQ+AWhA1xnxI6WCZDJbJeY/txN2agD25uiPG8
 T3759Wkzpj18yGnSLZdjum+QgEE8Z9/sTsjb3lgl+eZE9GvlYJAOnjY+B5miwW8KMVr0l5
 kUCchJIvHD1CA008flaX3LDkQC0Nt+v/YKi8GwKUVEd0DluoGA/QYLKAGsum5zgoGXvMBS
 Ar4ADkTOT97lIgymygJxQypPiJTEUW8mY/rbm6U35Y4jDKX19xrTgnWWJB5T4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cYP+p9ro
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Fix parallel
 compilation
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I'm adding Yann in Cc, as he wrote a good chunk of the linux-tools
stuff.

On Wed, 09 Apr 2025 01:51:00 -0700
Charlie Jenkins <charlie@rivosinc.com> wrote:

> linux-tools opportunistically set linux as only a patch dependency. This
> unfortunately introduces a race condition in the shared linux scripts
> when using PER_PACKAGE_DIRECTORIES and using top level parallelism.  The
> race manifests as the error "/bin/sh: 1: scripts/basic/fixdep:
> Permission denied". This happens when the linux package and the
> linux-tools package are being compiled in parallel. During the setup,
> each of these tools ends up compiling scripts/basic/fixdep. When the
> timing is correct, one of these packages will try to use fixdep while
> the other is compiling it, resulting in fixdep being briefly not
> available.
> 
> To fix this, set linux as a hard dependency instead of a patch
> dependency.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> While the timing of this seems like it should very rarely be triggered,
> on my build server I hit this issue nearly 100% of the time.
> ---
>  package/linux-tools/linux-tools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
> index 81b1fbc17605d6f003558d113143b64b5af6714d..a5d4a66f761fc44b156a92edaaf21774529f52d5 100644
> --- a/package/linux-tools/linux-tools.mk
> +++ b/package/linux-tools/linux-tools.mk
> @@ -20,7 +20,7 @@
>  include $(sort $(wildcard package/linux-tools/*.mk.in))
>  
>  # We only need the kernel to be extracted, not actually built

This comment then needs to be updated. Maybe it can be kept, but
extended with why we're using a normal dependency, despite the fact
that we only need the kernel to be extracted.

> -LINUX_TOOLS_PATCH_DEPENDENCIES = linux
> +LINUX_TOOLS_DEPENDENCIES = linux

But otherwise, unless I'm missing something, it looks like a reasonably
solution to the problem.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
