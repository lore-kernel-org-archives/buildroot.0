Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25953D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 13:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15D57405D9;
	Sun, 28 Dec 2025 13:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNWphyw5luBM; Sun, 28 Dec 2025 13:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61E964041D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766930253;
	bh=poRXFdr7YQfUX78eezQ2cmyWDu/bHYu3/kHgJ3RHLHA=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=bS+FQy2EZIt2mEEWSP0BjkhtQZPfBYR8ha3SJAtn9CSO60eeLzeHqVksFUlWaPs7U
	 VxKYMVinYVf5RYm5GIGJL3FTsvkCcjhVullZ2BiNXV4/veuT9C4d4t8+B5rdseQ/hs
	 qnub8yR1h+MjjGZMWbaQbtdd3LZ9axul/20jFQPrsgS1/L/1xeyvQhdFRxdCXPVUGZ
	 SSzRWh1lOwfqb++2UhmtUfMV3s6bo0OMBmN9tmNJeRVPuMntCMh5fcDyASb0cIRLrQ
	 0FV37y28rH4lMtBKEXNqYuSfRxNPcwjOhfh1qFR9waahChRjSZhpj9vMGHBH1MsvEz
	 NtXb7EpMxCCyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E964041D;
	Sun, 28 Dec 2025 13:57:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98A2B1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81DA1401FD
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkuwuMT_DYiR for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 13:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DF7640186
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DF7640186
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DF7640186
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:57:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9C1FBC1D709;
 Sun, 28 Dec 2025 13:57:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E1F5660725;
 Sun, 28 Dec 2025 13:57:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 822B211978DD2; Sun, 28 Dec 2025 14:57:25 +0100 (CET)
Date: Sun, 28 Dec 2025 14:57:24 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20251228145724.309c6fc3@windsurf>
In-Reply-To: <20251209201851.1023802-1-buildroot@heine.tech>
References: <20251209201851.1023802-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766930246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7JXCn7TCZmXnMxJy6pORRggCWGjJYz1fy/KDls9eC1M=;
 b=QuuxSBerC+s81Efqhyfr7TL0PuExgkxPsKcHmQqpFFulSxV+aGTaNEsAg+c2+K17xxBF+g
 SDzZ1/BB2lXGjY5gVkIbR2trx7hbZACeBOUwnri4Rd+5RR6UAY1sEa2ZDVJ2r+MI/yFRk+
 JyZbKXr1HXbs4k5XZKXq3Hk6JEIDqlcOBVcOD4Rft2GO+QrYcZ/nfhgLGq3rFYqPmkubWF
 pVV0Xv1VQht0Lg5g1eivtha8yfKXv2MGtw2dB8V6lJp6TehirbAb+jBaeNyN54zMEKYLyl
 dltMCKH59IGisDV6IOi8XSzX/5nktQKVBGM7UwgNUK7jDlDbr2Pc3pOIht+Cvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=QuuxSBer
Subject: Re: [Buildroot] [PATCH 1/4] package/collectd: fix build with grpc
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Tue,  9 Dec 2025 21:18:42 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> abseil and hence protobuf/grpc now need C++17.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Could you provide more details on which commit introduced this
regression, and a defconfig that exhibits the build failure?

Indeed, I tried:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_COLLECTD=y
# BR2_PACKAGE_COLLECTD_LOGFILE is not set
# BR2_PACKAGE_COLLECTD_SYSLOG is not set
BR2_PACKAGE_COLLECTD_GRPC=y
# BR2_TARGET_ROOTFS_TAR is not set

And it builds just fine. I believe the fix is correct, but the commit
log doesn't provide enough details, which are needed to understand
whether this fix needs to be backported to one of our stable branches.

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
