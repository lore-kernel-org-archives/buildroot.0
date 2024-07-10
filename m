Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE56C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EF9560766;
	Wed, 10 Jul 2024 21:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxQR8stdcRGC; Wed, 10 Jul 2024 21:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E6860890
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E6860890;
	Wed, 10 Jul 2024 21:46:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 965641BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C98B40249
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcIg9037wBqX for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4655C40126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4655C40126
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4655C40126
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:46:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 726D21BF203;
 Wed, 10 Jul 2024 21:46:08 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:46:08 +0200
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Message-ID: <20240710234608.4189d546@windsurf>
In-Reply-To: <20240618130403.3387346-2-mika.westerberg@linux.intel.com>
References: <20240618130403.3387346-1-mika.westerberg@linux.intel.com>
 <20240618130403.3387346-2-mika.westerberg@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720647969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajstSiDGYbn0N+94sNo9j0IIQnM4jCyZjxB48bjTENQ=;
 b=gqRCP3mxn+ZLlAgjcR6Hp9wMu/7hrNYp3F2KVauJzKPVOjHB/hV6F77LeeCBXTL9piyry8
 RQKhhVNtWOEtAgEcZ4+TfCR4nPCKMYxGmA2uR9CFieaj8OXGvxwOrzQDhZORfAaus7HDL0
 7q8SQUa49xdjmutdgZxi0bNt7JcsrHBqlZ4mEv1c911alIwKqh0PkPBYGWKFih6m8GbafO
 H7GX5/i8tOgxWglgH9gwZUFQIb9HohpehiZWDkbedjNUvHPcKgySMcQ11kQou26RSY9gZv
 S7MsNBGnwNtwZ+F90r8dg7X6e8ex89DtO9qMvo9MAQ6yEA2CV2covIj9AS2QpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gqRCP3mx
Subject: Re: [Buildroot] [PATCH 2/3] package/tbtools: Install bash
 completion files and scripts
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

On Tue, 18 Jun 2024 16:04:02 +0300
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> +define TBTOOLS_INSTALL_SCRIPTS
> +	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr install-scripts
> +endef
> +TBTOOLS_POST_INSTALL_TARGET_HOOKS += TBTOOLS_INSTALL_SCRIPTS

PREFIX has a somewhat non-conventional semantic in tbtools Makefile,
but fair enough it does the job, so patch applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
