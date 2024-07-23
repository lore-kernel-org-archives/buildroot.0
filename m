Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D59EC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 12:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E6BA80A6F;
	Tue, 23 Jul 2024 12:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aT2jERLowZEl; Tue, 23 Jul 2024 12:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FA4C80B62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FA4C80B62;
	Tue, 23 Jul 2024 12:26:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDE881BF83C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAE3240111
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QC2-H62agPo4 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 12:26:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DACA4035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DACA4035D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DACA4035D
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 12:26:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99D84C0008;
 Tue, 23 Jul 2024 12:26:01 +0000 (UTC)
Date: Tue, 23 Jul 2024 14:26:00 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240723142600.6be4c23c@windsurf>
In-Reply-To: <20240723102832.2522307-6-fiona.klute@gmx.de>
References: <20240723102832.2522307-1-fiona.klute@gmx.de>
 <20240723102832.2522307-6-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721737562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztQ3iv+PjKUcJvkQ31a5Hq1aL+i5+jaEiAVxgCmIgNM=;
 b=L+M2l1IB4zAlz41qcagIVkMqj5GkyZC5chrZ+zo9DQmtMzhzI9pdAt1LBmm/wLkAsZOL4z
 HJ195zbQUCMief2r8sU+GIRNMQX0D3+2JkC5UWhU5rCy1SmrW/ErD/eHbGl5/WF+/SNKRQ
 LgRrRXaJd8gtfkNo1OomIqG86SGrY/O92iD7iVyXQf7enWQBS5yvW4HZSglacq27AWo3yY
 70WN/RhXTHCOWB9M0FKrvGx9aJbSfBKA/d6vMwbtuRaPxdNsiZCoPPWBJf6q6dz3hK17+4
 fHPxHCnJxQCDkFmSYITqk37bLuKWIlOrcwQdb1wMw5np3iJ3L9o1LxRNrQS24Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L+M2l1IB
Subject: Re: [Buildroot] [PATCH v2 5/6] support/testing: include init script
 in iptables test
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
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

Thanks for this patch series!

On Tue, 23 Jul 2024 12:28:30 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Check a save/start/stop cycle based on the rules created by direct
> commands in the pre-existing test.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  package/iptables/S35iptables                   |  2 +-
>  support/testing/tests/package/test_iptables.py | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/package/iptables/S35iptables b/package/iptables/S35iptables
> index a67d0886a9..d6ff4a4762 100644
> --- a/package/iptables/S35iptables
> +++ b/package/iptables/S35iptables
> @@ -23,7 +23,7 @@ start() {
> 
>  stop() {
>  	printf 'Stopping %s: ' "$DAEMON"
> -	iptables -F
> +	iptables --flush

I suppose this change was not meant to be in this patch, but probably
in an earlier patch of the series?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
