Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0EAC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 17:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD55D40C1D;
	Wed, 14 Aug 2024 17:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzUV7h3zTyq8; Wed, 14 Aug 2024 17:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 807D040AF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 807D040AF0;
	Wed, 14 Aug 2024 17:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 889A81BF5F6
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 17:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83B9781089
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 17:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbMBR5-xJZVx for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 17:57:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C42880FAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C42880FAA
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C42880FAA
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 17:57:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6014960004;
 Wed, 14 Aug 2024 17:57:18 +0000 (UTC)
Date: Wed, 14 Aug 2024 19:57:17 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240814195717.43707f3f@windsurf>
In-Reply-To: <ZrysgCNIRtUzTjbG@waldemar-brodkorb.de>
References: <ZrysgCNIRtUzTjbG@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723658238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TTtug+Ljt7T6vg4AH/KQEtbjWPOhAfW5TtIwlKRrLLU=;
 b=f02MWXxj3kcCbnn1F8PyXEnvRQTBKufAoy7SJaA2YqZtlSzPANZPOmzCIRe7mBcIYW9zG8
 2TIJPn4gFwfIJCf/KFZkPoRKCKPZitgrE1tV7YlhlPbqOc0Oy3DUYC1ZJuAmmJSeCjCy8r
 eEmiEMQL7i/JzZHfoa4Pbqa0/QcYItsB3t4FR+QGTZqDvCA0VD1ldLeapQVgW8UAOd1PSZ
 nS898YQMcxAG4x9XgGT7vl55x6/H31n6o1mZfEajrvw1cOj84NjSc/T8v2Y/92XcaYEt93
 2Fsu2/74r8LYgTok54oNvMn8lX7C8l/QHsAeQSh1yZr3HNduk6T476qdBUSq/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f02MWXxj
Subject: Re: [Buildroot] [PATCH] package/libpcap: fix m68k-cf compile issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Wed, 14 Aug 2024 15:09:20 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Compilation with -Os triggers this assembler problem.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/db5/db58215fb3c7f30b6c0f0764a84271010346edfb
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

[...]

> diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
> index a4523f2218..257ec77e08 100644
> --- a/package/libpcap/libpcap.mk
> +++ b/package/libpcap/libpcap.mk
> @@ -57,5 +57,11 @@ ifeq ($(BR2_microblaze)$(BR2_sparc)$(BR2_sparc64),y)
>  LIBPCAP_CFLAGS += -fPIC
>  endif
>  
> +# Enable default optimizations to not run into "Error: value -602 out of range"
> +# assembler issues. -Os triggers the issue.
> +ifeq ($(BR2_m68k_cf),y)
> +LIBPCAP_CFLAGS += -O2
> +endif

Thanks for the patch, but this is not how we handle gcc or binutils
bugs. Instead, we report the bug upstream, and once the bug is
reported, we add a BR2_TOOLCHAIN_HAS_GCC_BUG_12345 or
BR2_TOOLCHAIN_HAS_BINUTILS_BUG_12345 (depending on which component is
affected), this option is enabled on a per-architecture basis, and
sometimes per-gcc version basis, and then the workaround in the package
is made conditional on this option. This allows us to track to which
GCC/binutils bug a workaround is related, and from to time check if the
issue has been fixed in newer versions of gcc/binutils.

See toolchain/Config.in for a lot of examples. Giulio in Cc can also
help with this, he is our resident expert in BR2_TOOLCHAIN_HAS_xyz_BUG
workarounds :-)

Your bug seems somewhat similar to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028,
for which we already have BR2_TOOLCHAIN_HAS_GCC_BUG_104028 in
Buildroot. Not sure it is exactly the same bug.

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
