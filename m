Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F29C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 07:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1B24404F1;
	Wed, 19 Jan 2022 07:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Crbw1JLIf9XI; Wed, 19 Jan 2022 07:54:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB04D404B7;
	Wed, 19 Jan 2022 07:54:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 856BD1BF39F
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 07:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80F3941515
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 07:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5T0gem4lOoRP for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 07:54:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5011E41514
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 07:54:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D67E5C0007;
 Wed, 19 Jan 2022 07:54:12 +0000 (UTC)
Date: Wed, 19 Jan 2022 08:54:11 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220119085411.22ee6fb6@windsurf>
In-Reply-To: <20220118222425.164134-1-fontaine.fabrice@gmail.com>
References: <20220118222425.164134-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc: define _REENTRANT for
 OpenRISC when -pthread is passed
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, Will Newton <will.newton@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Tue, 18 Jan 2022 23:24:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Patch added by commit eee96b0f0ad224b3e09a9b98c26d056e18f17fd5 on gcc
> 9.3.0 must also be applied on gcc 10 and 11 to avoid the following build
> failure on numerous packages (babeltrace2, pcsc-lite, tpm2-pkcs11,
> etc.):
> 
> configure:13774: checking whether pthreads work with -pthread
> configure:13868: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/bin/or1k-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2  -std=gnu99 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c   >&5
> conftest.c:27:26: error: #error "_REENTRANT must be defined"
>    27 | #                        error "_REENTRANT must be defined"
>       |                          ^~~~~
> 
> It should be noted that external bootlins will have to be rebuilt.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cb58d4fbaeb08d188c2f8bf05ef1604789fa8766
>  - http://autobuild.buildroot.org/results/7af9d4b68bd46ed260ed66ba2cc3c9c21482e741
>  - http://autobuild.buildroot.org/results/6f926bec146752873f8032b593f0de1cb222ea46
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Wow, this patch still hasn't been accepted in upstream gcc? It's been
submitted a looong time ago I believe.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
