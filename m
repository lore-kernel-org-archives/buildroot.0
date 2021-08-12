Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42667C4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:49:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB62360F57
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB62360F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C7FD606AE;
	Thu, 12 Aug 2021 21:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9wMMtKUK9Fq; Thu, 12 Aug 2021 21:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED51606D3;
	Thu, 12 Aug 2021 21:49:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55EC91BF354
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 459F540149
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sr_uZ3CUptIc for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:49:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5988D4010E
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:49:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2304DE0002;
 Thu, 12 Aug 2021 21:49:25 +0000 (UTC)
Date: Thu, 12 Aug 2021 23:49:24 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210812234924.10724a06@windsurf>
In-Reply-To: <20210809212959.2716816-1-fontaine.fabrice@gmail.com>
References: <20210809212959.2716816-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tools: fix build with gcc
 4.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Mon,  9 Aug 2021 23:29:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 4.8 raised since bump to
> version 4.3.2 in commit	91aa6efa8588bf7617cc4a640eb55052b524ceb7:
> 
> lib/tpm2_eventlog_yaml.c: In function 'yaml_uefi_var_unicodename':
> lib/tpm2_eventlog_yaml.c:130:5: error: 'for' loop initial declarations are only allowed in C99 mode
>      for(size_t i = 0; i < data->UnicodeNameLength; ++i, tmp += ret) {
>      ^
> lib/tpm2_eventlog_yaml.c:130:5: note: use option -std=c99 or -std=gnu99 to compile your code
> lib/tpm2_eventlog_yaml.c: In function 'yaml_specid_algs':
> lib/tpm2_eventlog_yaml.c:335:5: error: 'for' loop initial declarations are only allowed in C99 mode
>      for (size_t i = 0; i < count; ++i, ++alg) {
>      ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/018c75cfbb34006c0bca52dcc255ad6f9cc43b77
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-configure-make-build-gnu99.patch     | 30 +++++++++++++++++++
>  package/tpm2-tools/tpm2-tools.mk              |  2 ++
>  2 files changed, 32 insertions(+)
>  create mode 100644 package/tpm2-tools/0001-configure-make-build-gnu99.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
