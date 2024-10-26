Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29A9D10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CD3E41061;
	Sat, 26 Oct 2024 16:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wk_imnJjuULy; Sat, 26 Oct 2024 16:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29EE04109F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29EE04109F;
	Sat, 26 Oct 2024 16:18:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3619E5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25138820C4
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vOf42R2oVSn for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:18:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE2CE820C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE2CE820C7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE2CE820C7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:18:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B03020002;
 Sat, 26 Oct 2024 16:18:09 +0000 (UTC)
Date: Sat, 26 Oct 2024 18:18:08 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Marek Belisko
 <marek.belisko@open-nandra.com>, Julien Olivain <ju.o@free.fr>, "Fiona
 Klute \(WIWA\)" <fiona.klute@gmx.de>
Message-ID: <20241026181808.4cae0be9@windsurf>
In-Reply-To: <20240916151206.947484-14-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
 <20240916151206.947484-14-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729959489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAsmjIpMi3o/QzrzVb7LoAIewIGM84NSvgxpo53vZl4=;
 b=nCnc2VuiOB4SkFJNXSy4srhSamALXSJsSaTBmOIpSrcGdc5VO5tRi/+E+luP0t00RDHOew
 o2NUYdplhop9w7CPvxv3swqqsNnLsmux01Wcqj9FsIgwJ9KIwl80M5qI36Fbah20NEc5TC
 rgfCjR9ybCRm1OWHyLmg5W7Hydv02eB9WZYuqB1Ki75tr8bssYelJy637rHcCWxh6BvrJf
 1A8vacAdEdJij4bbOKsXEKKTEdsGukwGS+jkuuINmmw1n52hVEyusCwhfw5+FWkTxo1oGb
 9uDYK45J0giuVcL375kG2eGpRGdyeBIorZzwALDpseKRFtlp0NgEkug4q/9nhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nCnc2Vui
Subject: Re: [Buildroot] [PATCH 13/13] package/audit: bump version to 4.0.2
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

Hello Adam,

Cc Julien for runtime test, Cc Fiona for init script.

On Mon, 16 Sep 2024 17:12:06 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> In addition, audit 4.x now provides two service files:
>  - audit-rules.service
>  - auditd.service, which depends on audit-rules.service
> 
> audit-rules.service is a one-shot service that runs augenrules --load.
> To keep audit compatible with sysvinit-based systems, create a new file,
> S02augenrules, and move S02auditd to S03auditd. This change keeps the basic
> format of the systemd provided service files for ease of maintance.

I don't follow you here. What do you mean by "keep audit compatible
with sysvinit-based systems" ?

Are you saying that to keep consistency/symmetry with the systemd unit
files, you introduce two separate init scripts, one for augenrules
--load, and one for starting the daemon itself?

> Other changes:
>  - The --without-python option is no longer present.
>  - There is no longer a --enable/--disable-systemd option.
>  - audit.rules are no longer autogenerated on startup. As such, the RedHat
>    rpm .spec logic is copied, and $(@D)/rules/10-base-config.rules is copied
>    to $(TARGET_DIR)/etc/audit/rules.d/audit.rules as part of the
>    POST_INSTALL_TARGET_HOOKS. If /etc/audit/rules.d/audit.rules does not exit

                                                                           ^^^ exists ?

>    on the target, auditd fails to run. This change is also a bonus for
>    read-only systems and the audit.rules file is guaranteed to be on the system.

                       ^^^ as ?

> Tested with qemu_x86_64_defconfig and running checking if audit is running
> properly.

Would be nice to have an audit test case in support/testing :-)

> diff --git a/package/audit/S02augenrules b/package/audit/S02augenrules
> new file mode 100644
> index 0000000000..70342a231c
> --- /dev/null
> +++ b/package/audit/S02augenrules
> @@ -0,0 +1,31 @@
> +#!/bin/sh
> +#
> +# audi       This starts and stops auditd

audi?

This scripts doesn't starts auditd.

> +#
> +# description: This starts the Linux Auditing System Daemon,
> +#              which collects security related events in a dedicated
> +#              audit log. If this daemon is turned off, audit events
> +#              will be sent to syslog.

Nope, this is not what this script does.

> +#
> +
> +DAEMON="augenrules"
> +
> +start(){
> +	printf "Starting %s: " "${DAEMON}"

We're not really starting a daemon here.

> +	# Run audit daemon executable

Nope, this is not what is happening.

> +	if /usr/sbin/"${DAEMON}" --load > /dev/null 2>&1; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +}

This init script is kind of special, as it doesn't really start a
service, but does a one-shot action. Could you Cc: the next iteration
to Fiona so that she can review the proposal? Or maybe Fiona can even
review this first iteration.


> +	mkdir -p $(TARGET_DIR)/etc/audit/rules.d

This mkdir -p is useless if you add -D to the following $(INSTALL)
command.

> +	$(INSTALL) -m 0640 $(@D)/rules/10-base-config.rules \
> +		$(TARGET_DIR)/etc/audit/rules.d/audit.rules
> +endef
> +AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_RULES

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
