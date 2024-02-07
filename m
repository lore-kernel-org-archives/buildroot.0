Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DE1C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 07:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F5A61371;
	Wed,  7 Feb 2024 07:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MnoPMUVUIDI; Wed,  7 Feb 2024 07:12:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F7DA61376
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F7DA61376;
	Wed,  7 Feb 2024 07:12:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E55D61BF836
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D20DD61371
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BhYytZ8xyvhH for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 07:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E2A161376
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E2A161376
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E2A161376
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 07:12:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0BAA240004;
 Wed,  7 Feb 2024 07:12:07 +0000 (UTC)
Date: Wed, 7 Feb 2024 08:12:07 +0100
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20240207081207.27f3ca68@windsurf>
In-Reply-To: <20240110204909.795AC85DB2@busybox.osuosl.org>
References: <20240110204909.795AC85DB2@busybox.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707289928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LsTPW2htV5jYQnCFJp8IwI14VzI61GUlTSI6I5monlQ=;
 b=UQLRRlxGglbO8C0X7CnFhT9FeQF5q1AvO7SRX2e7SEFkZPA6308H5PzRlmy9A1GncEfYw4
 FwYiX8u8kX+P1b56b2I2CGVoUqp6KmttRlFW+h8Eb8RxS0YHDcq23EshmqAu0jluwE/f+G
 CdUtx4kIyS5KguuVH4m4uFdhrREPEaedMmlG1fVuwhJuosUs2I+3BRE03V8GMyHv39pGr6
 g3XxGaF1fAwI1c0xk7rXMUX/eDym73mruvz6K+lQhymGZGDDcL3hlifgbsYAybdFnMEKvL
 eqSxRts79FBhZPbbH27lIqgryL48bYQdRAm0bSbbAwtOvxQ+fzBSkNUBtgx12g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UQLRRlxG
Subject: Re: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 libopenssl needs perl Math::BigInt on s390
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

It looks like this patch isn't sufficient (or there is some other
issue?) because the issue pops up in the autobuilders:

  http://autobuild.buildroot.net/results/dfd/dfdb7c1892f7ee7889496d28957a7a61b19571aa/build-end.log

Could you have a look?

Thomas

On Wed, 10 Jan 2024 21:22:57 +0100
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=7ea38660e01a87ab70c02e38c78a49202e8e5c21
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> libopenssl needs perl Math::BigInt for s390x asm to avoid the following
> build failure since commit a5cacb63082b9e58194c4b9f8b2af2c3e38ff15c:
> 
> Can't locate bigint.pm in @INC (you may need to install the bigint module) (@INC contains: /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../.. /home/buildroot/autobuild/instance-0/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../../perlasm/s390x.pm line 16.
> BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../../perlasm/s390x.pm line 16.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/986cb07d368c7214ffbc9d60c378e7ac00797f00
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/dependencies/dependencies.sh | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 6e7d067ccd..3d83cb3285 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -282,6 +282,10 @@ required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-auto
>  required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
>  required_perl_modules="$required_perl_modules IPC::Cmd" # Used by (host-)libopenssl
>  
> +if grep -q ^BR2_PACKAGE_LIBOPENSSL=y $BR2_CONFIG && grep -q ^BR2_s390x=y $BR2_CONFIG ; then
> +    required_perl_modules="$required_perl_modules Math::BigInt"
> +fi
> +
>  if grep -q ^BR2_PACKAGE_MOSH=y $BR2_CONFIG ; then
>      required_perl_modules="$required_perl_modules diagnostics"
>  fi
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
