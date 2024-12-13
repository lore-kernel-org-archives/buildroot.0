Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F753E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 09:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E3BF81369;
	Fri, 13 Dec 2024 09:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8uLfv2kRAsa; Fri, 13 Dec 2024 09:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 170748136D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 170748136D;
	Fri, 13 Dec 2024 09:10:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64E0BECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B736408EC
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-66WFva_qu5 for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 09:10:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65156408E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65156408E9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65156408E9
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:10:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15D59240002;
 Fri, 13 Dec 2024 09:09:59 +0000 (UTC)
Date: Fri, 13 Dec 2024 10:09:57 +0100
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@bootlin.com>
Message-ID: <20241213100957.0b0a2a2f@windsurf>
In-Reply-To: <20241211-add_gdb_hash-v1-1-eb02d192b6c1@bootlin.com>
References: <20241211-add_gdb_hash-v1-1-eb02d192b6c1@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734081000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KII9bpLKHqBJa6dHhasMzGiA9gQYFEy4+nhIRveZFkM=;
 b=gT9fZFZpyHZm6NGKN67syupU38LqeEfcFPagOBK1f5q22rWeszl1i5u1HWK/pTH9hBikwH
 WDFmt0rn7KlFw6j1NKUHF1r5Nu187I87LOjPv57yNG3gfwGnVMJ5fGurC6NF5M5xI8NZwA
 PNRPcM1I9u2FIEWxaXaXTCAeK5DQO/AXResADccH/erfwlJRFeF6ra0m0NdCyKVw5o6Lst
 ovT/LmobIWEYmOVtfTKU3vF7ssmg3dxMxjbrpU7cDLYn0OlUdDyy2PRtKyWt3gaYIHBT+h
 8O7zBVtxKS20id/V/vo+a4iduKrYYxwmxq8YB7nXQytX6SC2vbQF6HueaQdKEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gT9fZFZp
Subject: Re: [Buildroot] [PATCH] package/gdb: add hash of licence files
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

Hello Thomas,

Thanks for the patch! See some comments below.

On Wed, 11 Dec 2024 18:42:50 +0100
Thomas Bonnefille <thomas.bonnefille@bootlin.com> wrote:

> Adds sha512 hash of the license files for GDB.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

This patch triggers some "make check-package" warnings.

WARNING: package/gdb/gdb.hash:10: separation does not match expectation (https://nightly.buildroot.org/#adding-packages-hash)
WARNING: package/gdb/gdb.hash:11: separation does not match expectation (https://nightly.buildroot.org/#adding-packages-hash)
WARNING: package/gdb/gdb.hash:12: separation does not match expectation (https://nightly.buildroot.org/#adding-packages-hash)
WARNING: package/gdb/gdb.hash:13: separation does not match expectation (https://nightly.buildroot.org/#adding-packages-hash)

To help avoid such warnings, I have https://paste.ack.tf/0859f0
in .git/hooks/post-commit.

Also, we normally use sha256 for license files hashes, and in fact even
for locally calculated hashes in general. We only use sha512 when it's
what provided by upstream. I guess sha512 has been used here for the
special ARC version of GDB because sha512 was used for the other gdb
versions who hash is provided by upstream. But I believe for the
license file we should be consistent with what we do in other packages,
and use sha256.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
