Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D104C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 14:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02C4260591;
	Sat, 22 Jan 2022 14:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugmNf6Fo1YBd; Sat, 22 Jan 2022 14:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 265666076A;
	Sat, 22 Jan 2022 14:36:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B44A21BF390
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B129C83DFC
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcOZFKYqswPF for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 14:36:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63E2B83DF8
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:36:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 40771E0005;
 Sat, 22 Jan 2022 14:36:31 +0000 (UTC)
Date: Sat, 22 Jan 2022 15:36:30 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220122153630.68f6ccc3@windsurf>
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
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

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
> ---
>  ...TRANT-for-OpenRISC-when-pthread-is-p.patch | 31 +++++++++++++++++++
>  ...TRANT-for-OpenRISC-when-pthread-is-p.patch | 31 +++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 package/gcc/10.3.0/0005-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
>  create mode 100644 package/gcc/11.2.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch

Both patches applied. The Bootlin toolchains are being rebuilt. I'll
send an update when the toolchains are ready.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
