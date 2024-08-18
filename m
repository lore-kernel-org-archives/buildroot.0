Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9391AC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 09:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BEEE80F0A;
	Sun, 18 Aug 2024 09:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AQZI233LbRK; Sun, 18 Aug 2024 09:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15EC080F0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15EC080F0B;
	Sun, 18 Aug 2024 09:23:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F28671BF479
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E92336065C
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BAIdLjugLqr for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 09:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5F9860653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5F9860653
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5F9860653
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:23:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1BE4D13F81D;
 Sun, 18 Aug 2024 11:23:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Aug 2024 11:23:04 +0200
Date: Sun, 18 Aug 2024 11:23:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZsG9eKK5aBo4DSjF@landeda>
References: <ZsCjPIEVSPj9R2Eo@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsCjPIEVSPj9R2Eo@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723972987;
 bh=Kct+EBBaRlpmdD4AfV8LXwqrZ6u/jmLjgtNl5hKo3eI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ttOGTkwlTtup1TrZkfA2sCBNfXPlMfc6J70nt1UB5UXsAY2M41LapBV96aDX6xZOW
 6GsZwskm7Pjji+2UghrLORa5XQZVmZBPRkTRdxGFLf1/C8Gglkx+iLargeAjSUJ2ql
 89Ou1AKGuBlKBLYIdyHAIwigx9SOXxKXYfSmuIc7N/SuwmHcVi+fvVyg9qT6ezpOZM
 FsWrITvlb6VaGJ+CvCbMzdR7dAisTPpzoIOAYvHNGHt2uW4FiqoSzcovuY2gjERo2+
 QyMn97lf0wUDbrMD11DXrE68/8pVw+tKfZR5M+lTsQTrhYUdae+ePI6OrBegxGD3nX
 NVm94K+CW3bMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ttOGTkwl
Subject: Re: [Buildroot] [PATCH] package/avahi: fix python install issue
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, All,

On 2024-08-17 15:18 +0200, Waldemar Brodkorb spake thusly:
> Since the update of Python to 3.12.4 in commit
> 76cd14167f5eb3ffe22e131ddbbecf9bc61f2ef1 avahi fails to install
> python subcomponents. The reason is that the obsolete imp
> python modul is used. Add a patch to remove the imp dependency.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/2bf/2bf391b93362204917a560705bc402585334ab3c
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.

But see below

> ---
>  .../0002-remove-imp-from-py-compile.patch     | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/avahi/0002-remove-imp-from-py-compile.patch
> 
> diff --git a/package/avahi/0002-remove-imp-from-py-compile.patch b/package/avahi/0002-remove-imp-from-py-compile.patch
> new file mode 100644
> index 0000000000..37534a3f7a
> --- /dev/null
> +++ b/package/avahi/0002-remove-imp-from-py-compile.patch
> @@ -0,0 +1,50 @@
> +Remove optional imp python module dependency.
> +
> +Upstream already removed py-compile entirely in their git repository,
> +so the patch is not appropiate for upstream.

This is really weird: the git tree removed the py-comple in 2005, and it
is not present in the v0.8 tag, but then the release tarball, that we
use, does carry that file.

Could you see with upstream how they end up with py-compile in the
released archive, while it is not in git?

There is a risk that that file gets added somehow by the autotools
packagng process, so it will eventually be present in the next release
as well, and we'd have to carry that patch forever and ever...

Regards,
Yann E. MORIN.

> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +Upstream: not appropiate
> +
> +diff -Nur avahi-0.8.orig/py-compile avahi-0.8/py-compile
> +--- avahi-0.8.orig/py-compile	2020-02-18 07:58:21.192417644 +0100
> ++++ avahi-0.8/py-compile	2024-08-17 15:03:07.328733849 +0200
> +@@ -116,7 +116,7 @@
> + fi
> + 
> + $PYTHON -c "
> +-import sys, os, py_compile, imp
> ++import sys, os, py_compile
> + 
> + files = '''$files'''
> + 
> +@@ -129,15 +129,12 @@
> + 	    continue
> +     sys.stdout.write(file)
> +     sys.stdout.flush()
> +-    if hasattr(imp, 'get_tag'):
> +-        py_compile.compile(filepath, imp.cache_from_source(filepath), path)
> +-    else:
> +-        py_compile.compile(filepath, filepath + 'c', path)
> ++    py_compile.compile(filepath, filepath + 'c', path)
> + sys.stdout.write('\n')" || exit $?
> + 
> + # this will fail for python < 1.5, but that doesn't matter ...
> + $PYTHON -O -c "
> +-import sys, os, py_compile, imp
> ++import sys, os, py_compile
> + 
> + # pypy does not use .pyo optimization
> + if hasattr(sys, 'pypy_translation_info'):
> +@@ -153,10 +150,7 @@
> + 	    continue
> +     sys.stdout.write(file)
> +     sys.stdout.flush()
> +-    if hasattr(imp, 'get_tag'):
> +-        py_compile.compile(filepath, imp.cache_from_source(filepath, False), path)
> +-    else:
> +-        py_compile.compile(filepath, filepath + 'o', path)
> ++    py_compile.compile(filepath, filepath + 'o', path)
> + sys.stdout.write('\n')" 2>/dev/null || :
> + 
> + # Local Variables:
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
