Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E987C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D33FE60AC8;
	Thu, 25 Jul 2024 15:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAqSF59hc9ky; Thu, 25 Jul 2024 15:41:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7769560ACE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7769560ACE;
	Thu, 25 Jul 2024 15:41:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03F251BF357
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 200C860AB7
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gf_Ze4N51cj4 for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:41:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4E2E60A9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4E2E60A9A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4E2E60A9A
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:41:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD9ACE0009;
 Thu, 25 Jul 2024 15:41:49 +0000 (UTC)
Date: Thu, 25 Jul 2024 17:41:48 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240725174148.33be7bc7@windsurf>
In-Reply-To: <20240725113943.1761962-1-fontaine.fabrice@gmail.com>
References: <20240725113943.1761962-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721922109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0VFjCyzv2YQrIoN0aSJmUzdult1YzkAW4biLPaXjiY=;
 b=JVa30tRF44hzmVNo5F5+wAO+pyuC0n1UCVkVzAxkkn9yjb4zBD7pO8KqKZFWGmZvhATGNM
 fWE89p5gdXYf/KkxTn22YxLWnMrsaTPT4abQy3pCeMZ2Z3+zWi12FgHRGZhPHHdlsgTTBI
 wNycI5w2EBwJ4tmDEWtiJOsisYYBwA55qc5fkGhtKSZNYKL0eAFkyAWcoLoEMxT385IWsf
 EFNjo07+kjyXqwMpnctUh3bJ4UmgYS+7aDltznAPsnzxj3hyIqaHsP8zDDpTaKDqs+JW2O
 dS4m9Wn04/tCNwbOwyu+e5B6DyXtWKTKkRe86fBKiHnWkSUagsiXylElmlCq4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JVa30tRF
Subject: Re: [Buildroot] [PATCH 1/1] package/libressl: fix mips64el build
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

On Thu, 25 Jul 2024 13:39:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable assembly with mips64el to avoid the following build failure
> raised since bump to version 3.8.2 in commit
> 21eca49ed5110872407b76ab9337d2877c4cda24:
> 
> /home/autobuild/autobuild/instance-21/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-gnu/13.2.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: ../../crypto/libcrypto.so.52.0.0: undefined reference to `bn_mul_words'
> 
> Fixes: 21eca49ed5110872407b76ab9337d2877c4cda24
>  - http://autobuild.buildroot.org/results/09b86c95ea1054d5f54d4ef4a041eb105c3f4aa9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Could you track down a bit more precisely what is going on, i.e which
upstream commit broke this? I don't immediately see something relevant.
6501696dd7669b3d20d69beffc508c46f0a807da was already in v3.7.3 that we
were using prior to the bump in
21eca49ed5110872407b76ab9337d2877c4cda24.

Do you have some evidence that only BR2_mips64el is impacted, and not
BR2_mips64 (i.e big endian MIPS64) ?

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
