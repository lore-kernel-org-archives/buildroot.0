Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC44D5B15C
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 17:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 025C7406E7;
	Sat, 13 Dec 2025 17:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TiP8bLGLRi5; Sat, 13 Dec 2025 17:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62E734060A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765646779;
	bh=QvAQdYYgfrGNMVMtidOmOxUc/HKwaA1RbALb1QXxSgE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EGRXdd6zaq0w+8qxZuIA7sL4ij43Sc1p1o/dpOgA+pRXkFSTa8ss9mPSUFZl6gXma
	 HO+oRRFMysmoMk2OhYoakDRAOfseZrXpyT/0AHkLpveOXGsTsLEHMRiugt1Awjoj3z
	 lrmzgXHpMX0gx2GX6384VrAEIbv9HfD6817TB9NIHdT1Xh2JRxuUjJhiwlR9LzApkq
	 V5zklnStwF4iCQtvIGYDBCxA97Cq76TCBZgR620LLUj1Krp0x5RBVhZCsvgsLKDgx6
	 xQDBwxWo2uhQbXWFYoTfcuFAm/cQwDQxEWxUxHDc/ZoaU/0mZQW6IWVjQMPibkqi7h
	 JOoBwA1u0R0CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62E734060A;
	Sat, 13 Dec 2025 17:26:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CECDB2C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5A57811D9
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLqDOhfkA8ux for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 17:26:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE89E811F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE89E811F8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE89E811F8
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:26:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DD40E4E41BC3
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:26:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B4ED76070C;
 Sat, 13 Dec 2025 17:26:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1363F103C8DE5; Sat, 13 Dec 2025 18:26:10 +0100 (CET)
Date: Sat, 13 Dec 2025 18:26:10 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20251213182610.18c6f28d@windsurf>
In-Reply-To: <20251213151730.821513-1-giulio.benetti@benettiengineering.com>
References: <20251213151730.821513-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765646771; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7Zg/izgjhJOlmxvV4LtYgrvRni3FsrHo7rpMz1uaftk=;
 b=BXT7UyhF51RVoi1kMw02e+8HhUh+Uun9ROlovlpa8Yiu4C2910j8A/Zguisxv6XSdEUcHB
 NVTbExwVJYC/JTZI3Vtxt02vZu/gy/hvfMObNlqb7ANU0lDeHlWGl0tFOP9iXKRAVDMynD
 wWgS7QNOFDVttAMCdKM6AgLfooem3fKVghT1KcMfK1uphNeY9cxW4VrLMHE+6dsf6MMRtg
 FcfOwhKWH7R10GOWCs1RC/zyK25y1MV1ZTbRdlUHbWJgUng1BZI56lv9XQHd2/lWGzizVU
 b/eEGAzC/lbXveofVMqoCXtOgwVnQ7tdRp6ZygRFvqaIqBK8nbK3Ic02/MGXnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=BXT7UyhF
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libtirpc: introduce
 BR2_PACKAGE_LIBTIRPC_DB
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

Hello Giulio,

On Sat, 13 Dec 2025 16:17:29 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Package libtirpc expose rpcdb so make it selectable.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * add patch to series
> ---
>  package/libtirpc/Config.in   | 6 ++++++
>  package/libtirpc/libtirpc.mk | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> index 31f1636ef5..e1ac9a4e7b 100644
> --- a/package/libtirpc/Config.in
> +++ b/package/libtirpc/Config.in
> @@ -16,6 +16,12 @@ config BR2_PACKAGE_LIBTIRPC_GSS
>  	help
>  	  Enable GSSAPI support
>  
> +config BR2_PACKAGE_LIBTIRPC_DB

Perhaps: BR2_PACKAGE_LIBTIRPC_RPCDB

> +	bool "db"

	bool "rpcdb"

> +	depends on BR2_PACKAGE_LIBTIRPC

Put the option inside a

if BR2_PACKAGE_LIBTIRPC

...

endif

block instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
