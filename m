Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D3ECA0EFD
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 17:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A639B411B8;
	Fri, 30 Aug 2024 17:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wdw8LK6ihJTm; Fri, 30 Aug 2024 17:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F736411C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F736411C3;
	Fri, 30 Aug 2024 17:11:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D087D1BF5A5
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C94F7401D1
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Edj5-aXT0AS3 for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 17:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8FB8D400B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB8D400B1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FB8D400B1
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 17:11:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0593260002;
 Fri, 30 Aug 2024 17:11:33 +0000 (UTC)
Date: Fri, 30 Aug 2024 19:11:33 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20240830191133.61f32008@windsurf>
In-Reply-To: <20240830114319.4353-1-tianyuanhao3@163.com>
References: <20240830114319.4353-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725037894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqJ2z+mr/Ht3axqAZutfkY+rbXYfhfO6pCpH3RRSivw=;
 b=EL+fKyzxtYsuQlX3aY1qgEhqvrYGGp8q8fxQ2ECiWUir3beUSxF6EyCK21q0JxCJxoNVSi
 YJrtaWJDQiQ9Z/Hz4Vc2aFdHxXvL/CMy//ji9VPXUNVhBz1Ba04rWFROOVaa6KVHPE+Js7
 DnqsETcmti8Sg6piERNNu04v4y43cIUpIU6ODN4Yc4cVntc86WkrZgjysZ3ZUR//cwA+6V
 sNFmW9XIPD6j8ol9pAjein3ID9NUb4v6EfedRgiJ7FJNaOBrAGoTgeyHnQNmL2IPCfQYka
 maJx2MsUlUeVz/6baaKh2l2ujcnRwEGs252P5zTyy/U6KCmcCSEWMyCS91NYwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EL+fKyzx
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: install default config
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

Hello,

On Fri, 30 Aug 2024 04:43:19 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> chrony needs a config file to work:
>   Could not open /etc/chrony.conf : No such file or directory
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Thanks for this contribution. Question below.

>  define CHRONY_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
> +	$(INSTALL) -D -m 644 $(@D)/examples/chrony.conf.example2 $(TARGET_DIR)/etc/chrony.conf
>  endef

I'm not super familiar with chrony, but the question is: is there a
sensible "default configuration file" that makes sense for people as a
starting point?

For example, chrony ships with 3 example configuration files, and
you've decided to install example2. Why not example1 or example3?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
