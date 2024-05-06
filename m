Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DF0C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D35F3829BB;
	Mon,  6 May 2024 20:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sp7x7uK1dBEi; Mon,  6 May 2024 20:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7BE082A4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7BE082A4E;
	Mon,  6 May 2024 20:14:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9E451BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6FFD82A4E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1fHPUmWkWvQ for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:14:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE3D4829BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE3D4829BB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE3D4829BB
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:14:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0879F1C0003;
 Mon,  6 May 2024 20:14:50 +0000 (UTC)
Date: Mon, 6 May 2024 22:14:50 +0200
To: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Message-ID: <20240506221450.5fafb5bc@windsurf>
In-Reply-To: <20240506121919.118af862@booty>
References: <20240430203401.74587-1-jesseevg@gmail.com>
 <20240506121919.118af862@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715026491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XshhRqoJwEnx9b0eGl1+Za1vOEcFiKHHshxmJeotH4=;
 b=caTl5IGv5GnyHXINWbjU+Ixhqe9Uwr0TiES4Vz0Q/XdA4ZjooiKYLTdn92BZfUxlOxArBE
 1nINdq+y8O4QFuA/yIgORrzHGxJDrI8Fkzz8c7A5DV4rpWVjTpKn42DWwxjqX2RefGBMn5
 0YbH/YU05S9zj8gtkE435pleKz+o2M3OjqtqZch8uBUdd3U1K62jMU28/NjjdweUl8+45I
 j3jSWnNwe7UpG+MXFOss2EceU014UFPYiCOisw1W9aamQxSlRFRYWqkcxiOj5Dye56d9jq
 YC1TW1TZXlu/qflyBWR89VEix2tsXR+q0sdoK6QBL4b7uJqL3W4TZyeS8t6pKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=caTl5IGv
Subject: Re: [Buildroot] [PATCH 1/1] package/agentpp: bump to version 4.6.1
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 6 May 2024 12:19:19 +0200
Luca Ceresoli via buildroot <buildroot@buildroot.org> wrote:

> Hello Jesse,
> 
> On Tue, 30 Apr 2024 22:34:01 +0200
> Jesse Van Gavere <jesseevg@gmail.com> wrote:
> 
> > This version integrates the patch to fix building without v3 so remove
> > that patch, there is however  another failure when linking the library,
> > debugprintf is used which was removed in snmp++, so patch that.
> > This patch has been sent to agentpp.  
> 
> Sure about this? snmp++ 3.5.1 does not seem to have any changes related
> to debugprintf compared to 3.5.0. Also, testing with both of your
> patches (this and the snmppp 3.5.1 bump), agentpp builds fine without
> the added patch.

Also, we would prefer the added patch to be formatted using "git
format-patch".

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
