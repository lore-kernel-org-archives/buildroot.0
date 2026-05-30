Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834F3CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A2142385;
	Sat, 30 May 2026 20:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kM7lOFdWMm1; Sat, 30 May 2026 20:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3133441FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780172849;
	bh=E5DaednnFMlmVWrbXL1nFUasiEMUWbnHsM0haLrOpwM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D4z8zkgBO6zgKerAmDatfYAAXGE4/noFhBQn2uVnQBE9bPQHwxF4fDJ9nGxDmtbBZ
	 bMuDDyjI+Yz1gc47XeS/PPxwpCFJm203Kcx2uqtRfdZ13d/VOzO7v+oGBFvHGnncue
	 L+eNosTxOtrKeCbP0S39HfOI5jDIgeNnJywC3X0BT6uvdU8eyaKh2qzbdMwvsm+2+Q
	 JfDa/52rhccNoSHdMe7lbtsr0dcOTsInzW+vZ6+2JDeqqBeqhq4JOF048CraDeF6C2
	 wkoPoNBOFPS2Ib2+AcVnwhpKwKXExklzgfMTWoGzdx1W/qQ0+grjx3xnIRU804UtF+
	 cQNOXHGfzTZGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3133441FAA;
	Sat, 30 May 2026 20:27:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05EC2F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E00486F5D5
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r--XgbHvoS54 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D63C6F5BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D63C6F5BC
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D63C6F5BC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:27:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 46A9B4E42D9B;
 Sat, 30 May 2026 20:27:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECD576073B;
 Sat, 30 May 2026 20:27:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DA41410888CC7; 
 Sat, 30 May 2026 22:27:23 +0200 (CEST)
Date: Sat, 30 May 2026 22:27:22 +0200
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ahtGoRIM5kk-JfTi@windsurf>
References: <20250331-fix_liburing_arch-v1-1-296318973123@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250331-fix_liburing_arch-v1-1-296318973123@rivosinc.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780172844; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=7T7y1YZpUl20iQYvsCP6X2FhHIfu+G1HuBJIQlmGxuc=;
 b=pURcNWgyzYySZPmzAE8ogysI9RygYHXTVrLm8melgneRnfDYtpZ2Xtxvmzb0r8AMgl/bVn
 DSyZBOXjYPeW7umvs9ZRTL/7/lCYIVyyOMAU4Z6RNyY2vrzJbFjPegHDAlXQStYanj/IKl
 UxDH79Q7q15Use7Vf39qedR79oS5mO203u1qtPOGlu6CYZnNxxPOparG7VzEbTuSZJ7wZ7
 RCaIHc6htsbSU1m4l2DH0re4Q0Pof+aAOyGH5PULATHdBSg1euX95VcFXRHfOtsDZ9tTfM
 HrtnTMtR64x8JYeX3mMK9mjLveX5YJf4D8FV9WfU/e+N/VKsRiPJ0Qv8ZefBiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=pURcNWgy
Subject: Re: [Buildroot] [PATCH] package/liburing: Configure liburing with
 --use-libc
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

Hello Charlie,

On Mon, Mar 31, 2025 at 06:13:16PM -0700, Charlie Jenkins wrote:
> liburing requires libc when building for any architecture that doesn't
> have built-in syscall support (that is currently any architecture other
> than x86 and aarch64). Configure liburing with --use-libc to allow these
> other architectures to compile.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: 70e3b5a800f8 ("package/liburing: bump to version 2.5")

Sorry for the super long delay in getting back to you. However, it
seems like the issue doesn't exist anymore. First the nolibc mode
exists for RISC-V 64-bit now, and enabling libc seems to be done
automatically on other architectures. I can happily build liburing on
say PowerPC 64 for example. Also our autobuilders are not reporting
any issues.

Building on RISC-V 64-bit, which has nolibc support shows:

nolibc                             yes

during the configure step.

Building for PowerPC 64 build:

nolibc                             no

So I believe your patch is no longer needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
