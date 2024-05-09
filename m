Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE3CC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A60960709;
	Thu,  9 May 2024 14:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kO7djj0aQMCw; Thu,  9 May 2024 14:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36EDE60F9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36EDE60F9B;
	Thu,  9 May 2024 14:01:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF32B1BF3EE
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8A054052F
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Z8I_l7-rzAa for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:01:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0747D402E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0747D402E4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0747D402E4
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:01:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0862C0003;
 Thu,  9 May 2024 14:01:38 +0000 (UTC)
Date: Thu, 9 May 2024 16:01:37 +0200
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20240509160137.24345525@windsurf>
In-Reply-To: <20240507162936.18729-1-vfazio@gmail.com>
References: <20240428024210.11950-1-vfazio@gmail.com>
 <20240507162936.18729-1-vfazio@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715263299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DkTWVYgIj90f0t33HP7dk9ZZq2b/HMpEW9B0WVbvAU0=;
 b=dGmx6lpobK4KHDYAF/GCq1NEFYfYGhfbbSU8XbLp8w18PaPfMKTtqtIYoa+scvSDNSxaLp
 zjq36uSuJyl6RdU98U7sGh5ZOb2djrmshYl7QXZolzdr+btcw+FJsBK2LlFwDLLQxvOu8m
 X5fzJWT3zivcty6uOI3Iqf9Yq+4kVWIL9fNsnLRnRfZ1+6LsSjj2FkDMm+bTxU62dKrrGv
 06isOb5kA4IlvgM3WK2oxqVJW5h+oD2GGIWP9EL8BKE92DxOdU+YHlxM0clpQK8+quo9Zg
 CgD1hMmyPGfPfjOTjLIxkIrQW3yQFdQBCHLFX7CdG2ZffOuUiR9ZZ/nzZsMOmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dGmx6lpo
Subject: Re: [Buildroot] [PATCH 1/2] packge/pkg-python: drop custom
 environment variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 May 2024 11:29:35 -0500
Vincent Fazio <vfazio@gmail.com> wrote:

> Many moons ago, in the dark ages of Python, cross compiles were largely
> unsupported. In these before-times, a patchset used by PtxDist [0] [1]
> was adapted to help make cross compiles work.
> 
> The patchset did a number of things but mainly:
>  1) used a build-machine compatible python interpreter for certain
>     stages of the target Python build process
>  2) made adjustments to certain files to make decisions based on values
>     set in environment variables instead of the path of the executing
>     Python interpreter.
> 
> Since the path of the interpreter that was build machine compatible was
> outside of the target build directory, the code that made assumptions
> about the location of headers and library paths being relative to the
> interpreter path needed to be adjusted, hence them being driven via
> environment variables.
> 
> The patchset worked by replacing the executable path to be the sysroot
> which included the python headers and libraries.
> 
> A number of issues regarding cross compilation [2] [3] [4] have since
> been closed since the introduction of this patchset and cross builds
> became much better supported starting in Python v3.3.1.
> 
> New logic primarily uses the _PYTHON_PROJECT_BASE env variable [5] [6].
> 
> When set properly, this drives a few things:
>   * flags a cross compile environment
>   * sysconfig.is_python_build = True which triggers:
>     * altered paths for finding the Makefile and config.h
>     * altered sysconfig.get_config_var("srcdir")
> 
> When migrating to Python 3.4, PtxDist reworked their patchset to use
> the standard environment variables for their cross compiles [7].
> 
> The distutils module was a primary consumer of the custom variables from
> the previous patchset, however, that module is deprecated and packages
> cannot target it as of 09de823c.
> 
> Package builds and unit tests seem to work without using these variables
> being set, implying they can likely be dropped. Packages that still use
> distutils should be updated to reflect its removal in 3.12.
> 
> Once these custom variables are removed, the following Python3 patches
> which leverage them can be dropped:
>   0004-Adjust-library-header-paths-for-cross-compilation
>   0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros
> 
> [0]: https://gitlab.vahanus.net/ptxdist/ptxdist/-/commit/eef994411c20653cde95b35266000e3a8754e3b3
> [1]: https://gitlab.vahanus.net/ptxdist/ptxdist/-/commit/6c79cb5ac373b1cccf531e8be3ed1b9722ed1622
> [2]: https://github.com/python/cpython/issues/48004
> [3]: https://github.com/python/cpython/issues/58538
> [4]: https://github.com/python/cpython/issues/59689
> [5]: https://github.com/python/cpython/commit/7e6c2e2cc49fa109662d3f04f4c3553596d31937
> [6]: https://github.com/python/cpython/commit/9731330d6f4d63d6d57c8e99c8d11ef1def42858
> [7]: https://gitlab.vahanus.net/ptxdist/ptxdist/-/commit/638a024500c214c1d8283bce8cec864fb95deacf
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  package/pkg-python.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

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
