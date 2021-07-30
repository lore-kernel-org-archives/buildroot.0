Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7B5C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:37:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5841360F94
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5841360F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 270754027A;
	Fri, 30 Jul 2021 21:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Vqcn198NZdq; Fri, 30 Jul 2021 21:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 861C24026A;
	Fri, 30 Jul 2021 21:37:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1846C1BF488
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C5EC60ADF
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27eKk4fL_VDE for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 21:36:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 080EE606E8
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 21:36:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AD8ADFF803;
 Fri, 30 Jul 2021 21:36:20 +0000 (UTC)
Date: Fri, 30 Jul 2021 23:36:18 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210730233618.1977c5c7@windsurf>
In-Reply-To: <20210730125611.4052704-1-fontaine.fabrice@gmail.com>
References: <20210730125611.4052704-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fail2ban: fix CVE-2021-32749
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Fri, 30 Jul 2021 14:56:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> fail2ban is a daemon to ban hosts that cause multiple authentication
> errors. In versions 0.9.7 and prior, 0.10.0 through 0.10.6, and 0.11.0
> through 0.11.2, there is a vulnerability that leads to possible remote
> code execution in the mailing action mail-whois. Command `mail` from
> mailutils package used in mail actions like `mail-whois` can execute
> command if unescaped sequences (`\n~`) are available in "foreign" input
> (for instance in whois output). To exploit the vulnerability, an
> attacker would need to insert malicious characters into the response
> sent by the whois server, either via a MITM attack or by taking over a
> whois server. The issue is patched in versions 0.10.7 and 0.11.3. As a
> workaround, one may avoid the usage of action `mail-whois` or patch the
> vulnerability manually.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-vulnerability-unset-escape-variable.patch | 158 ++++++++++++++++++
>  package/fail2ban/fail2ban.mk                  |   3 +
>  2 files changed, 161 insertions(+)
>  create mode 100644 package/fail2ban/0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch

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
