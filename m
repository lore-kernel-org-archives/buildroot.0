Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8026BC3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC45408BD;
	Fri, 12 Jul 2024 13:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OunWMxYnhYGX; Fri, 12 Jul 2024 13:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C108F417E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C108F417E2;
	Fri, 12 Jul 2024 13:01:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9966A1BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86278402C7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t04_ps-kB9mb for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:01:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1FB0140240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB0140240
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FB0140240
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:01:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CE50FF804;
 Fri, 12 Jul 2024 13:01:53 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:01:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240712150152.1258ebc9@windsurf>
In-Reply-To: <20240211220223.2819553-1-fontaine.fabrice@gmail.com>
References: <20240211220223.2819553-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720789313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JiwHMV8KVpbN/97TsP/ARiBdFT2rp1G4T+WLcV9UlKQ=;
 b=Li+QFJEBfXujDY14vQZ+RQ4KIZ9/9wGgMNv/u1dtjh+9lJHBWmMH4hPJ9M532+A329/IbI
 PVEZQ2Mesczm2ax08n30gcHtsK5Im6h3rgBUWcSsnH1wnqD05QhdwQ8hJA/CHFEEPJjEPQ
 0Tg2ZFe0ghFoWiY8OWJyvSFcyyRUNG/nbC1Fe4kSd4CPFoTYt/6s3/5RIYLJL1vZN7gUsv
 VDcPNqDHUM/VESrhG0bszqmT/80oAzDDni3CzubHEbjW03dGYr6pXzufYli0p4WBLtCrPW
 tdFLPwzfnirnz+VmKh2AAa+axq2k+70LNSjePA5FddUkmCawBInZVJcclrS96A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Li+QFJEB
Subject: Re: [Buildroot] [PATCH 1/1] package/jack2: fix build with python
 3.12
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Feb 2024 23:02:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with python 3.12 (which removed imp
> module):
> 
> Traceback (most recent call last):
>   File "/home/autobuild/autobuild/instance-7/output-1/build/jack2-1.9.22/./waf", line 166, in <module>
>     from waflib import Scripting
>   File "/home/autobuild/autobuild/instance-7/output-1/build/jack2-1.9.22/waflib/Scripting.py", line 10, in <module>
>     from waflib import Utils, Configure, Logs, Options, ConfigSet, Context, Errors, Build, Node
>   File "/home/autobuild/autobuild/instance-7/output-1/build/jack2-1.9.22/waflib/Configure.py", line 16, in <module>
>     from waflib import ConfigSet, Utils, Options, Logs, Context, Build, Errors
>   File "/home/autobuild/autobuild/instance-7/output-1/build/jack2-1.9.22/waflib/Options.py", line 14, in <module>
>     from waflib import Logs, Utils, Context, Errors
>   File "/home/autobuild/autobuild/instance-7/output-1/build/jack2-1.9.22/waflib/Context.py", line 9, in <module>
>     import os, re, imp, sys
> ModuleNotFoundError: No module named 'imp'
> 
> Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14
>  - http://autobuild.buildroot.org/results/1bfe34e10ffdab80647ac01863165e93bcc9b0d8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/jack2/0001-Update-to-waf-2-0-26.patch | 3480 +++++++++++++++++
>  1 file changed, 3480 insertions(+)
>  create mode 100644 package/jack2/0001-Update-to-waf-2-0-26.patch

Since the patch has been  merged upstream, I changed the reference in
the Upstream: tag to point to the final commit in the upstream github
repo. Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
