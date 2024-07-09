Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1262DC3DA42
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 19:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD23640453;
	Tue,  9 Jul 2024 19:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eByK3x-ZeYz6; Tue,  9 Jul 2024 19:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 894C240EDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 894C240EDF;
	Tue,  9 Jul 2024 19:45:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDA021BF5DE
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA64F40EDF
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mV98bO0kDYh9 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 19:45:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B30040453
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B30040453
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B30040453
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 19:45:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 266B560008;
 Tue,  9 Jul 2024 19:45:20 +0000 (UTC)
Date: Tue, 9 Jul 2024 21:45:19 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240709214519.2c8c5968@windsurf>
In-Reply-To: <20240709101841.1145134-4-fiona.klute@gmx.de>
References: <20240709101841.1145134-1-fiona.klute@gmx.de>
 <20240709101841.1145134-4-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720554320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ralmWjeWeOSIhyJoHdCKx4FLAvXJzfA/Yq+/n9/hSI=;
 b=mih+glztyKFoHXix3V9wqUzRV2W7iU6tFWrRxL0OiG42fSZOj4wNpP+XVOOXf0Svjb2iiS
 nh1230BJpilk5ALNl0sF57pPAyuvxmJjM7KRI1QRrnYqXBpiNJiD12l3P0PdZK8NYOq0iB
 +UpNm7QiY0dWPIe10ShOqGe4jEEv/DMR4eduKzhOeAXohSYHganInbm4t0hDtbaM06e2pN
 BSO1klbYINMDDG1qP0FPolI/LFCV11J30toIlrDeCe9k8uQK7GYivO+3zNlmT6HpbhnAWq
 OXtd8gjUdRFM795af7gO6nPcPtmOsdIEjat20hX2g5GZHWPnSPB7Bmi2YfqGSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mih+glzt
Subject: Re: [Buildroot] [PATCH v3 3/4] package/fail2ban: bump version to
 1.1.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Tue,  9 Jul 2024 12:18:40 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Fail2ban 1.1.0 brings Python 3.12 compatibility, and removes support
> for 2.x. This means 2to3 handling can be dropped.
> 
> Unfortunately fail2ban 1.1.0 still relies on asynchat and asyncore,
> which have been removed from the Python standard library in
> 3.12. Depend on the compatibility package python-pyasynchat (which
> pulls in python-pyasyncore) and remove copies bundled in upstream
> code.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Changes v2 -> v3:
> * Add "# runtime" comment for pyasynchat dependency, drop
>   FAIL2BAN_DEPENDENCIES in fail2ban.mk

Unfortunately, this updated package fails to build for me:

/bin/sed -i -e '/^socket/c\socket = /run/fail2ban.sock' /home/thomas/projets/buildroot/output/target/etc/fail2ban/fail2ban.conf
/bin/sed: can't read /home/thomas/projets/buildroot/output/target/etc/fail2ban/fail2ban.conf: No such file or directory
make: *** [package/pkg-generic.mk:378: /home/thomas/projets/buildroot/output/build/fail2ban-1.1.0/.stamp_target_installed] Error 2

The /etc/fail2ban/fail2ban.conf file is apparently no longer installed.
Did you try the fail2ban build from a fully clean build?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
