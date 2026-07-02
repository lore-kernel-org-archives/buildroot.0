Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32063C43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 18:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD118419E1;
	Thu,  2 Jul 2026 18:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id noQHbI73c9f1; Thu,  2 Jul 2026 18:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B4D1419DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783017179;
	bh=2gGUvWqldmAEkdzogEYqi1TWkQ9UAUCC4QGvQbKlihc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HMuL1T96SiKxVyZHVT4jH3wPYvzCdoW+Qd1lU2fHTl2Denl4r0OuQQE+xLuh8gNUT
	 Rp2TYGLUP1UW8RujXigP0aI4LWydI0vLVGaEx4aJfkaWhXTW0lHW21R+m3ZH3MyBRJ
	 3qzQJg0YYtFodbDwXOK015cglfh/ZVjr8ZSPd6e0du/19BtrPLbKa3YCvq3n8CtKs9
	 oKA3+uOH32k/3fO9nrJW9DA/D0NXoFa+2OOHH76n0IhUEq0k5VTVgKeOuaLaluN7iY
	 FEvY7WZkEkdoSB4Q2Qhc6Ch0hUOG/Z5OWcNDrnKwJdgaz4wt6QbejdIPyrJ53Ffinw
	 ZNrJu2Nb06frg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B4D1419DD;
	Thu,  2 Jul 2026 18:32:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89251316
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B13360FBB
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hDMhY8yuhCK for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 18:32:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C7C3608F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C7C3608F8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C7C3608F8
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:32:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MryT9-1xQlrE02qL-00gDbp; Thu, 02
 Jul 2026 20:32:53 +0200
Message-ID: <96fc4e73-7418-4849-bee9-29e11c379b38@gmx.de>
Date: Thu, 2 Jul 2026 20:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dowan Gullient <dowan.gullient@smile.fr>, buildroot@buildroot.org
Cc: romain.naour@smile.fr
References: <20260702080558.303727-1-dowan.gullient@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260702080558.303727-1-dowan.gullient@smile.fr>
X-Provags-ID: V03:K1:5RlWIDAvMN6omInXVU99jGN4G6ckY3zSapatuznU1AG6uAsOCpD
 qqLne2CWJiIe9auKMtTCAyjMmnXbfR5zKkAYKxfC65NyAtN3i/yL/b7Cshn4j5OcqvTeH9c
 KoZTqZvWzDUwUXqZKh1Px3pJp8TgFPr6M1aUjFlQbCXKvasLOT/LN2zLmW7QHVCfqYxcqoj
 MbWOiJWib48PulVa1SECA==
UI-OutboundReport: notjunk:1;M01:P0:APdNDHpfqMQ=;H2c0qwk76/9ZAnWGmAexA0EMKD5
 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
 FNFz6ZTAOr2cMEVbtI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783017173; x=1783621973; i=fiona.klute@gmx.de;
 bh=Whs4hhFMxpDW1KzsJ4BJEVXBaf3bhWEDOeqDh3/lOSI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=F2ZPbkxkGbaNadfS+yMuzIBWe45GgHx0h9CpTnbZ+ipi8wizUdiKbnRFCdDa/tcW
 0lFT2t+OmHA5FkelVCEpLpTrsBNfizgG+84CSR7sNTr3hxO8MHbGKmUoPLvvrxXGB
 YGI4DshFWxPHCLR3Y291ZRO9gHXDjG78jKwJ14Dn1nvFpiCeI0yq/hSm+rb6a9iFp
 a57k6BrJk2XfylEv9K9BSkyLlqKnV27HIuCRJMR+C9/drxg94E5ASDa4ReI0ZF65O
 6voaFwV8liALnBFQ6K5u8AsKZEAkyfirP1j9xvmSw853ysBwhJCi5faSrUnmf4UlM
 YrXKyvWyjh4fp8x0OA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=F2ZPbkxk
Subject: Re: [Buildroot] [PATCH v2] package/apr: fix build failure with
 autoconf 2.73
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 02.07.26 um 10:05 schrieb Dowan Gullient via buildroot:
> Since the bump of autoconf to version 2.73 in commit a6e8c07a330a,
> the TestApache test fails on CI runners (and in autobuilders [2]) with
> our current docker image (GCC 12.2.0) :
> 
>      gcc: error: unrecognized command-line option '-std=gnu23'; did you mean '-std=gnu2x'?
>      make[3]: *** [Makefile:136: tools/gen_test_char] Error 1
> 
> Autoconf 2.73 introduced checks for the C23 standard [1]. During the
> configuration step, it tests the target compiler. If the target compiler
> supports it (e.g., GCC 14+), autoconf caches `ac_cv_prog_cc_c23=yes`
> and appends `-std=gnu23` to the compiler flags.
> 
> Later in the process, APR uses the `AX_PROG_CC_FOR_BUILD` macro to
> configure the host compiler in order to build the `gen_test_char`
> utility. However, APR's `ax_prog_cc_for_build.m4` macro uses a
> pushdef/popdef mechanism that only isolates older C standards.
> It fails to isolate the newly introduced `ac_cv_prog_cc_c23` variable
> because the ax_prog_cc_for_build.m4 file was not updated to handle it.
> 
> As a result, the host compiler evaluation reads the target's cached
> variables, assumes the host compiler also supports C23 (which it may not),
> and attempts to use `-std=gnu23`. If the host compiler
> (e.g., GCC 12 on GitLab CI) is older, the build crashes.
> 
> To fix this without heavily patching APR's m4 macros, we explicitly
> disable the C23 standard detection for the host compiler in APR_CONF_ENV
> when GCC<14. Since APR is a mature project that does not require C23
> features, preventing its use here is a safe and robust workaround.
> 
> Doing so will not disable C23 for the target build if the target compiler
> is GCC 14+; it will only prevent the host compiler from using it when
> building APR's tools; according to the build logs, ac_cv_prog_cc_c23
> will be set to "no" for the target compiler if it does not support C23,
> and will be set to "-std=gnu23" if it does.
> 
> It's important to note that this error could also occur with other
> packages that use autotools-package if "AUTORECONF" is set to "yes".
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/15112315884
> 
> [1] https://gcc.gnu.org/cgit/gcc/commit/?id=fad61bf73b3158157a136bf4d9373fc3d9afe319
> [2] https://autobuild.buildroot.org/results/d7d/d7d2703e42034d9c11de89b2b3b6cf401f677aa3
> 
> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>

Applied to master, thank you!

> ---
>   package/apr/apr.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/apr/apr.mk b/package/apr/apr.mk
> index 1c7553a501..e8cf0f309e 100644
> --- a/package/apr/apr.mk
> +++ b/package/apr/apr.mk
> @@ -34,6 +34,7 @@ APR_CONF_ENV = \
>   	ac_cv_mmap__dev_zero=yes \
>   	ac_cv_func_setpgrp_void=yes \
>   	apr_cv_process_shared_works=yes \
> +	ac_cv_prog_cc_c23=$(if $(BR2_HOST_GCC_AT_LEAST_14),yes,no) \
>   	apr_cv_mutex_robust_shared=no \
>   	apr_cv_tcp_nodelay_with_cork=yes \
>   	ac_cv_sizeof_struct_iovec=8 \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
