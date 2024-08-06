Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4014FC52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 20:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C2D40233;
	Tue,  6 Aug 2024 20:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lgq8NnIOZBD; Tue,  6 Aug 2024 20:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E3D640253
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E3D640253;
	Tue,  6 Aug 2024 20:28:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 945941BF33D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 824FC60625
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teVCLAPW008H for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 20:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6137A6061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6137A6061E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6137A6061E
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 20:28:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BCFC240005;
 Tue,  6 Aug 2024 20:28:45 +0000 (UTC)
Date: Tue, 6 Aug 2024 22:28:43 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240806222843.58ae10a0@windsurf>
In-Reply-To: <20240205172327.2537523-2-giulio.benetti@benettiengineering.com>
References: <20240205172327.2537523-1-giulio.benetti@benettiengineering.com>
 <20240205172327.2537523-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722976125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11s29KKqQA4yP1YiPTTZhXzUu3PMYRWIeYfXKgn8Y3Y=;
 b=ieNJ1hZs9eJ9d049fEo8h521M2q6fwWCFdjUqJ7om2/JzsTDUXxe1YkoqbxI6Y9fYmFVqb
 t7X3DAorWFmBuu0hc2wjh96dNkBa5+KoBmjM1SCVMD801/Lssvmf8iuwYugbW9icvWgCj7
 12yD+a1N0a0FtsRpmHXKiRZ0gDehLeiLIrWLd8ygTKwADnhiai+a0rs7Qo7S3WZhL976Pr
 9PF9HAD2UpX6PDab7NwciSkNvI0K1iyyW5atlng4qLayC9HtrPOuQ7LP0FdZerPla3XRbn
 eMrnkhSm7Z7+lBXuiuJUawwRKT3WBJppYl3sUV7zjTKeoGVetWhG1bub4XG4aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ieNJ1hZs
Subject: Re: [Buildroot] [PATCH 2/2] package/htop: fix build failure due to
 gcc bug 109809
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Mon,  5 Feb 2024 18:23:27 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> The htop package exhibits gcc bug 109809 when built for the RISCV64
> architecture with optimization enabled, which causes a build failure.
> 
> As done for other packages in Buildroot work around this gcc bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_109809=y.
> 
> Fixes:
> still not happened. It shows up while building under docker-run this
> pending patch-set:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=384841

Unfortunately, this is not very useful, because this patch series is no
longer there. I just did a build like this:

BR2_riscv=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_HTOP=y
# BR2_TARGET_ROOTFS_TAR is not set

it uses gcc 13.x, on RISC-V 64-bit and it builds fine.

So for issues that have not been reported in the autobuilders, what is
good is to provide a defconfig that allows to reproduce the problem, so
that we can reproduce it again in the future.

Could you look into this, and submit a v2 if relevant?

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
