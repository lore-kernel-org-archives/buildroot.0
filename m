Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC33FC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BE8280853;
	Tue, 23 Jul 2024 20:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u32stL_Q8vFj; Tue, 23 Jul 2024 20:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCF3580838
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCF3580838;
	Tue, 23 Jul 2024 20:20:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D50F1BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A45540250
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZxstU_-ECe1 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:20:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6CE524025E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CE524025E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CE524025E
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:20:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AC0240005;
 Tue, 23 Jul 2024 20:20:10 +0000 (UTC)
Date: Tue, 23 Jul 2024 22:20:09 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723222009.28870eae@windsurf>
In-Reply-To: <20240723185553.4619-1-fontaine.fabrice@gmail.com>
References: <20240723185553.4619-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721766010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkR5RxOQP4FRVFwemyoGHfCwYtPE8P9wWIKvuojpYi0=;
 b=EtjU5kgIkpjGwsUxyuSbOMAkO8xSekFjOJXRKbr2R9W3SChLXRtVzIYECkzd9pXjJnao3M
 ogMfYX6N61hEpmIMOng3+1r9obVzCsNNRf0o01amm4KM6PUaSMDj7gIlHPLVqugPunlhB/
 KPW80bc0COEpYodseS70ZoNOBTc0kEmD8SaJN+pMKRHxIDeJuh4T4VVV/EVpNYWDXACjTX
 J79u3GPs5pZ9NIdek50KZVEMio2ZQ7EEaxyk9qxmlKxkF+DAcshr/iOMd//m5APv5FnTNK
 u00O7o1o+Ujs5Ekn2rRqboCHaPnVu+GWVOFoy7CzAqNXQHs66X4t1fYJuFFXvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EtjU5kgI
Subject: Re: [Buildroot] [PATCH 1/1] package/libdex: fix build without SSP
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 20:55:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without stack-protector raised since the
> addition of the package in commit
> 70319b47f646f74f407ed3355baf5b581a10518a:
> 
> /home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/libdex-1.a.p/dex-async-pair.c.o: in function `dex_async_pair_ready_callback':
> dex-async-pair.c:(.text+0x118): undefined reference to `__stack_chk_guard'
> 
> Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
>  - http://autobuild.buildroot.org/results/f53768f654a9eddd95b583a366cd7386d9ddb285
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-add-stack-protector-option.patch     | 45 +++++++++++++++++++
>  package/libdex/libdex.mk                      |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 package/libdex/0001-add-stack-protector-option.patch

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
