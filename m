Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40219CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBF5285118;
	Sat, 30 May 2026 10:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oFRG3e41qF6; Sat, 30 May 2026 10:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15D7A85288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780135342;
	bh=gV2SIdypI7g1pl55/mmvZGqUcbZGzgY6HM9YguFmSdw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kGIOfzrqnjry4iUJROWFTsh/6qrqB7yZiO/kMQEFPTiS8p7UC9PXnOWDs7Jw9kIE6
	 1iFjG1KQ8m0xUTra3k/m6doWczUQjm+HcZ3qEXdGctaWrj+TAuPXGApnWSZK9I6LdZ
	 K1C3WDRufcRSZTBxpWvlDg6r3oMZtqs/CoE5khyJDYijjWXelb+HDpCvuT7yq5KVi8
	 zW/v1ip118+oQr6egejf5EWGZ3bvtF3Jbie7pXuQljUyYsLM4ez9j6B2UncOFXC0mW
	 sO7KWUjjLAyxQg6YUXp0Niuer0jgYTjqgiUK3Jctd5SjDpOHwrqkNwyubMYiUAk6JU
	 U2gQqCJgtj31Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D7A85288;
	Sat, 30 May 2026 10:02:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A068ED3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F7A26F478
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLK53euvxffL for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:02:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 96F526F37B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96F526F37B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96F526F37B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:02:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7C125C6246B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:02:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 52A716073B;
 Sat, 30 May 2026 10:02:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C5E210888054; 
 Sat, 30 May 2026 12:02:15 +0200 (CEST)
Date: Sat, 30 May 2026 12:02:14 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ahq1EB1nE4rvp4An@windsurf>
References: <20260417060553.10171-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260417060553.10171-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780135335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=maF5mtCdueGUxW9Hn9VUlikDTcOjH08MLABE+Fg3dhY=;
 b=Uouy8K8rBY33o3gOy+01xfZ1YEz5pjDaDJIKRQjMH6H56/bn5/UR7+kdigSrR2VTSgJ812
 NxYuClSTlERu+ucwXAGy45UR9+TJk/mrfAFYlVAGQsPv5k6BeRZ47phEdBGI5/hSI5ULja
 cYkt/GW9Fs7382WEwL/RUiy3mD/D2NUBbRgBaZC4eBM3fk5R7fC1pWRRKiE/3/zMFO5ukZ
 Y6FjcH5BeL/pdJDJwXwz3nrT0W1nTEysKfFXi3fW9CSIs6oxBh/ErD2k1NBJWZTcfS2c3g
 ZdVSOc+qLfYo8k9wkvD6SyDyy21F3+HA1eAO/bPMI973IxYAKiBiBi04Q1oYuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Uouy8K8r
Subject: Re: [Buildroot] [PATCH v2 1/1] package/util-linux: fix LSMT_ROOT
 fallback definition
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

On Fri, Apr 17, 2026 at 11:35:53AM +0530, Shubham Chakraborty wrote:
> The fallback definition for LSMT_ROOT was incorrectly guarded
> with #ifdef instead of #ifndef, making it ineffective on systems
> with older kernel headers that don't define this constant.
> 
> This caused build failures with "LSMT_ROOT undeclared" errors on
> autobuilders using older kernel headers.

This explanation wasn't really complete: my builds with old kernel
headers were building fine. A critical piece of information is that
the issue only happened with musl, because it added the SYS_statmount
definition between musl 1.2.5 and 1.2.6, so since musl 1.2.6,
util-linux believes statmount() is available, uses it, but if you have
old kernel headers that don't provide LSMT_ROOT, the build fails.

> diff --git a/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
> new file mode 100644
> index 0000000000..3d0de62bfd
> --- /dev/null
> +++ b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
> @@ -0,0 +1,27 @@
> +From 72ff3b8998a675900fcb7c18c0e03f1552b13a8b Mon Sep 17 00:00:00 2001
> +From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +Date: Tue, 14 Apr 2026 11:04:08 +0530
> +Subject: [PATCH] include/mount-api-utils.h: fix LSMT_ROOT definition
> +
> +Upstream: Pending

This is not useful in Buildroot. You have to provide an actual link
showing where it was submitted.

So I did submit the patch upstream:

  https://lore.kernel.org/util-linux/20260530094932.2351791-1-thomas.petazzoni@bootlin.com/T/#u

with an improved commit message, included this improved patch in
Buildroot, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
