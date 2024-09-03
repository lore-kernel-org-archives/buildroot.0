Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0E6CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1803404C8;
	Tue,  3 Sep 2024 18:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8j8toX-I-t85; Tue,  3 Sep 2024 18:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9158140A02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9158140A02;
	Tue,  3 Sep 2024 18:52:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6D681BF319
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3BC740200
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1_BFRbQH0HB for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:52:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43130401FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43130401FC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43130401FC
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:52:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97336FF802;
 Tue,  3 Sep 2024 18:52:17 +0000 (UTC)
Date: Tue, 3 Sep 2024 20:52:16 +0200
To: Michael Trimarchi <michael@amarulasolutions.com>
Message-ID: <20240903205216.09ea5f17@windsurf>
In-Reply-To: <20240903085745.2594893-2-michael@amarulasolutions.com>
References: <20240903085745.2594893-1-michael@amarulasolutions.com>
 <20240903085745.2594893-2-michael@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725389537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oJhoV3FrsirbpKyhZhG6QHKn732NL1yutv3o0QTZwa4=;
 b=p1y5B/k1C4wDzXRNKJs1q2qdcL1e8CYug4WhiPPkdSQGosZ4Ff3mXyZ3HihflwSqBlZHWc
 lidwCpKHefGqSPl6Lik2C3plOJDhKB1B+VLri8aJfKgCnO/58KjIRBJtP0/Eby3CYfGMi3
 NqkQj2A9a8yGFDNoPzHj7wlAqrs9wmHiUB3zSPv3wqTGn/cJ9vBenR4TvouemEicaiICQt
 kt41NAh3CPSFzjewZc53NmuUBQ+M9sc8nEuPj0h+r+YSqegM++ZfN4nT3FjhZmfgqHc+3v
 Y+YEq2VIdQ2qW/C4T0JH0N5l5C/98u2RPQHDCYXbVI762U96UIQHngyLWijARQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p1y5B/k1
Subject: Re: [Buildroot] [PATCH V2 2/2] scripts/cve: Restart the clone if
 the pull generate an exception
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  3 Sep 2024 10:57:45 +0200
Michael Trimarchi <michael@amarulasolutions.com> wrote:

> diff --git a/support/scripts/cve.py b/support/scripts/cve.py
> index dcb3a63925..6cd9aab963 100755
> --- a/support/scripts/cve.py
> +++ b/support/scripts/cve.py
> @@ -21,6 +21,7 @@ import datetime
>  import os
>  import distutils.version
>  import json
> +import shutil
>  import subprocess
>  import sys
>  import operator
> @@ -69,15 +70,21 @@ class CVE:
>  
>      @staticmethod
>      def download_nvd(nvd_git_dir):
> +        done = False
>          print(f"Updating from {NVD_BASE_URL}")
>          if os.path.exists(nvd_git_dir):
> -            subprocess.check_call(
> -                ["git", "pull", "--depth", "1"],
> -                cwd=nvd_git_dir,
> -                stdout=subprocess.DEVNULL,
> -                stderr=subprocess.DEVNULL,
> -            )
> -        else:
> +            try:
> +                subprocess.check_call(
> +                    ["git", "pull", "--depth", "1"],
> +                    cwd=nvd_git_dir,
> +                    stdout=subprocess.DEVNULL,
> +                    stderr=subprocess.DEVNULL,
> +                )
> +                done = True
> +            except:
> +                shutil.rmtree(nvd_git_dir)

The thing I'm worried about is that you can also get a failure of "git
pull" for example due to a network timeout or something like that,
which doesn't need a full git clone, but just a "try again" later...
and now we're going to wipe out the entire local clone, and try to
clone everything again. Is that a good idea?

Also, perhaps we need to show an error message if the "git pull"
failed, and saying we're falling back to a full clone, or something?

> +        if (not done):

	   if not done:


is sufficient, we are not writing C code here :-)

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
