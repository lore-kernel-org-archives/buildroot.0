Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696C9C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 394C9608EB;
	Sun, 14 Jul 2024 15:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLqZCNmp0Vc3; Sun, 14 Jul 2024 15:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0094060877
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0094060877;
	Sun, 14 Jul 2024 15:08:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B244F1BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC1C74032E
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eghuitXwAnQO for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:08:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D53540096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D53540096
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D53540096
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:08:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64EFA20002;
 Sun, 14 Jul 2024 15:08:54 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:08:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240714170852.5e4e718c@windsurf>
In-Reply-To: <20240713195813.560673-1-fontaine.fabrice@gmail.com>
References: <20240713195813.560673-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uERA+zUjMrluNESCfi081DRz38zTTZrSi0gbW8yqGHc=;
 b=J9RrPayh3Ei5TYxeSPtdzM/+ACfYsxQdz0uTMlDpeMxpwgbztalFvwJ1DE+ijkAbhMChvi
 IHzFJSHWdQp3HMk+jklc3igK56vSZbnj7g+FPdQaV9Ja9Ebt80eUju1ItWhaQ+PSE4+Z/x
 77XjjSTj9PByHcGNaIyJNcBGB6l8Rb4ZGauDPxdcLrxFxtKYu66FSz4HpPDlQl6rZK7CXh
 hy1J68LcmPlCKG8OdfhVRoQz9ytYlHcMXoRoRHwwJyTIvL7liqHaS+FxzxhBHpe4YUEBCc
 FSMuz3HeYPVMIwHvdepJZDY9vAipTqHiGtg4/sopzUfGqIE+X18jNvJtjQmIPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J9RrPayh
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenmpt: add
 LIBOPENMPT_CPE_ID_VENDOR
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 21:58:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:openmpt:libopenmpt is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/05979DC5-95A8-40BD-9102-402B69F5AFAA
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libopenmpt/libopenmpt.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
