Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73B2C54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 12:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69BB5827FD;
	Thu,  7 Mar 2024 12:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Id2axAaHnwCN; Thu,  7 Mar 2024 12:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A3DC8280E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A3DC8280E;
	Thu,  7 Mar 2024 12:49:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 481511BF364
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 12:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 352CF404DB
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 12:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aocGuXbUefv9 for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 12:49:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA2FE40428
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA2FE40428
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA2FE40428
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 12:49:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0333F240006;
 Thu,  7 Mar 2024 12:49:16 +0000 (UTC)
Date: Thu, 7 Mar 2024 13:49:16 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240307134916.32738b5e@windsurf>
In-Reply-To: <20240307122806.102726-1-fontaine.fabrice@gmail.com>
References: <20240307122806.102726-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709815757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hus3QLehrvfmfVDRyKr8ljPAjyol8oMgkzZGN+VNbRo=;
 b=RVbQkkCc/0Iazegr4tJVQqk8bxDy9ojbxYi8AT3HAIVUKs7JRneeaZhF46EeuUBzZOvoG7
 B2YH+g0dSSxmdnJgnt14hacumtNA5dMRmV5dNL4KoSSRfX4yY9nrjm2WN+WyjXasBA//tQ
 ToVk9OkpgQHDCKtAdmiE6td/gwt/6bnJaatVzPiSLP60HerVZGBbtlqhk39UPXKF6AQmLJ
 07ohp2JdvfzaupCJJe0zaZxfrad/CbaOIOCur7U9EXfaMzBt+xLERVS0gh7WhUoXJKqr7z
 0WiZ0HmBMgmHnJ4K8dJsy+RMqUg80qx2aVbgIbMI7sP50fXI5z1X8OFXbOA/qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RVbQkkCc
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/Config.in: enable libatomic
 with BR2_BINFMT_FLAT
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Thu,  7 Mar 2024 13:28:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Enable libatomic with BR2_BINFMT_FLAT to avoid the following build
> failure with libopenssl and
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE:
> 
> /home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./libcrypto.a(libcrypto-lib-threads_pthread.o): in function `CRYPTO_atomic_or':
> threads_pthread.c:(.text+0xfa): undefined reference to `__atomic_is_lock_free'
> 
> Indeed, bootlin armv7m is an uclibc toolchain compiled with atomic
> support through libatomic
> 
> This build failure is probably raised since activation of threads in
> static builds by commit ea3e60229bc5647e587685023de475276e28584d
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d25e898f9715bf6a21284807361a57735a7a2e1d
>  - http://autobuild.buildroot.org/results/e37ed5ad6ba41d610bffe9c234f699e203ef5069
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for the patch. Do we know since when there is support for
libatomic for platforms that use the FLAT binary format? Is this
specific to ARM/FLAT, or applicable to all configurations that use the
FLAT binary format?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
