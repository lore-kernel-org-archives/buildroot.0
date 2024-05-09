Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21E1C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A07CF61315;
	Thu,  9 May 2024 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQxmYIk1zBNg; Thu,  9 May 2024 21:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98ED56133F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98ED56133F;
	Thu,  9 May 2024 21:10:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B64941BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEB79408F0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xEDlsW0FCzd for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:09:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C3C640556
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C3C640556
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C3C640556
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:09:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26F3140003;
 Thu,  9 May 2024 21:09:55 +0000 (UTC)
Date: Thu, 9 May 2024 23:09:53 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240509230953.25eadfe5@windsurf>
In-Reply-To: <20240404194723.1346001-1-fontaine.fabrice@gmail.com>
References: <20240404194723.1346001-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715288995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLxBnPYjS0lufkVF24cRh5yEC+ajigki+lAaoYBC5iY=;
 b=NzXCvUCaoCESJ4pwV0KNDn0WfqV0LRdPIdSA64KX3hCthMrmI+PfIF8Z4IQ3J1ihUK0A9k
 iRURAXikRQpcvIpqhkCI7ax8njCP33gWDJHiUtDEDMcAlJq/RT3se0tB0+Do6Na/JoSbPZ
 NwhaggtRqr6FpsUiCvBTkpMUyn7ipIldjlGHUMrgBeF7Hi74jkdgGxT2HkgsH+Ktgpcgcj
 bv69zVhdttMtg9W5nfCGGSyWV4fY3xI/aj+0nuVsuYN+cfPdg8Kb0/UxU71s4N3Tj7Gztp
 KsTrBYBJ2aYeZ/8QjO9XXBcRq166qlIkl2+z9Y271itnVKoX1kRQ5ExwSwq8Qw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NzXCvUCa
Subject: Re: [Buildroot] [PATCH 1/1] package/privoxy: fix build with root
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  4 Apr 2024 21:47:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set GROUP_T when installing configuration files as root to avoid the
> following build failure raised since commit
> b6816034ebddd522a8fef9daa454c28fa1230dd6:
> 
> /usr/bin/install: missing destination file operand after '/home/buildroot/instance-0/output-1/target/etc'
> 
> Fixes: b6816034ebddd522a8fef9daa454c28fa1230dd6
>  - http://autobuild.buildroot.org/results/eb4ccf248c9c5048e9b71058bb0311b1e0763883
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0002-GNUMakefile.in-fix-root-install.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/privoxy/0002-GNUMakefile.in-fix-root-install.patch

Applied to master, thanks. Perhaps you can ping the upstream
maintainer, because he ignored your patch it seems :-/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
