Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D942C3DA4D
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 13:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B916A82106;
	Sat, 13 Jul 2024 13:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RCS8di3Zw8b; Sat, 13 Jul 2024 13:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA25483F62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA25483F62;
	Sat, 13 Jul 2024 13:02:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 641461BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D23183F62
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X25epGEGEh_8 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 13:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFCF382106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFCF382106
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFCF382106
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:02:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD1D51C0006;
 Sat, 13 Jul 2024 13:02:21 +0000 (UTC)
Date: Sat, 13 Jul 2024 15:02:20 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240713150220.214cb40c@windsurf>
In-Reply-To: <20240212175251.721803-1-fontaine.fabrice@gmail.com>
References: <20240212175251.721803-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720875742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wc4iD1UVr9f1abK71xroygbDJTMlBBP8g7JbzXXAnxw=;
 b=kJB04hGAQkcvyyS2HEudQVOdwnCc9d4cEJydPTehPkmm9EjFhjcafwX8riKneBGZgG8aAL
 BnMCL+4HWYXJQK4dEyL2Z/TptRuEP1120kSfd0RL+13MM6S0sfaDoEwJdEGHxy9AhpkG1U
 tGfwb/58CxyxmjpCMMDsDAANFMhMI+d4sNrHJV1QoO6muHd/VYaWT9m2Eeg65HzPUuzVtI
 rDwJRcFsvLU2RCzTuH0yPiQU+k+KUlsmVG1+LkWl77ZTgdRR+9ogh2c81pL44dUKblAlJA
 Fn8KtRbjDsDlMq1q6GyUvLNWfu6QyjsHkQrlM/kuUOVnmtIVFmQ9JHTI17NXDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kJB04hGA
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/cracklib: python needs autoreconf
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
Cc: Stefan =?UTF-8?B?U8O4cmVuc2Vu?= <stefan.sorensen@spectralink.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Feb 2024 18:52:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set CRACKLIB_AUTORECONF when building python to regenerate py-compile
> and avoid the following build failure with python 3.12 (which removed
> imp module) raised since commit
> 36e635d2d5c0166476858aa239ccbe78e8f2af14:
> 
> Traceback (most recent call last):
>   File "<string>", line 2, in <module>
> ModuleNotFoundError: No module named 'imp'
> make[3]: *** [Makefile:485: install-pythonPYTHON] Error 1
> 
> Indeed, after autoreconf, py-compile will contain:
> 
> if test "$python_major" -le 2; then
>   import_lib=imp
>   import_test="hasattr(imp, 'get_tag')"
>   import_call=imp.cache_from_source
>   import_arg2=', False' # needed in one call and not the other
> else
>   import_lib=importlib
>   import_test="hasattr(sys.implementation, 'cache_tag')"
>   import_call=importlib.util.cache_from_source
>   import_arg2=
> fi
> 
> $PYTHON -c "
> import sys, os, py_compile, $import_lib
> 
> instead of:
> 
> import sys, os, py_compile, imp
> 
> Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14
>  - http://autobuild.buildroot.org/results/aec4c19fdf8087c76c1d5f472e855e0f84fcf7fd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Give more details in commit message

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
