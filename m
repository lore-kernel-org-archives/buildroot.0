Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5EECF31B9
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06BCB80C02;
	Wed,  2 Oct 2024 20:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvrJiMhPbgkf; Wed,  2 Oct 2024 20:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E3CD80596
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E3CD80596;
	Wed,  2 Oct 2024 20:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 150771BF47D
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10E1140480
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bID0aWgXUJEG for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3A1140190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3A1140190
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3A1140190
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:51:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0737DFF805;
 Wed,  2 Oct 2024 20:51:21 +0000 (UTC)
Date: Wed, 2 Oct 2024 22:51:21 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20241002225121.1fb337f2@windsurf>
In-Reply-To: <20240929142900.1201830-1-ju.o@free.fr>
References: <20240929142900.1201830-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727902282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYK+5XwCgr2QJgeFx/li2V/kucV1ZU/Z2aMDw1BTgXs=;
 b=WTMWdlBkkOA6lFjV1ReCoURlSx1i6R6aI6Of/J3sKMEypiTl0ARUCMPthp1OyFMlzBBL6B
 ZCLid/iaZwd+KPPpiQ0sRbTxuTTEK0q+He9CWBx/fA0buGn/1P7ZD9zn2s+vMHrbven3ip
 NYYG2tBD9nPVJ2NdushpYGn38YX08yvVFINUb00C1apKWaxYbc7sqVPSIfgp5+dsn9uQze
 mQr56NsU4yUjSkm76xrD+WKte/n633HcTPRWubAXFaABFYLiIJiQH9180mSnWld1Su+piG
 Ha2/srl4wIYYmuYZyAdi79k6yNJtHbSyCdXAFhBUzTdEujQvTDvCP1nPN9vBdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WTMWdlBk
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: enable on RISC-V 64-bit
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 29 Sep 2024 16:29:00 +0200
Julien Olivain <ju.o@free.fr> wrote:

> fwts RISC-V 64bit support was introduced in version 20.07.00, see [1].
> 
> This commit adds this architecture in _ARCH_SUPPORTS.
> 
> [1] https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes/20.07.00
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch runtime tested with commands:

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
