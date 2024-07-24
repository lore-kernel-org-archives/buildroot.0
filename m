Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D01FC3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 16:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3734401C2;
	Wed, 24 Jul 2024 16:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVeW9cS9jasZ; Wed, 24 Jul 2024 16:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A7E5402F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A7E5402F2;
	Wed, 24 Jul 2024 16:33:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBF8C1BF29C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B917B40686
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKF6YvX3p6CQ for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 16:33:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A497400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A497400B8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A497400B8
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 16:33:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7B3260003;
 Wed, 24 Jul 2024 16:33:55 +0000 (UTC)
Date: Wed, 24 Jul 2024 18:33:54 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240724183354.71cb212b@windsurf>
In-Reply-To: <20240723215041.771843-1-fontaine.fabrice@gmail.com>
References: <20240723215041.771843-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721838835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d6H62xu19FrU7mdQlzdRxv7W51UnOknS1GieL3UyMos=;
 b=SHAKq/Dbp5cU5mwIpGtpqBkqhnpa1PQnz/gy4WdgRmTC6TktaRzVti6H0g6B4YJD3dam9L
 fhqFe0SVixhwW2FanPkxeXlu7VbFySBuFDJLCcf30LXo6vRwtmaxHatEx/DBycoYpXEF+N
 33UYCMPVpTipyft+rPCNHOdJftTb/fYDfWM32Vi1bM7CqOZbnYbspQr/PC+v1pi6XwOZk5
 B7NIL7WNlyKZ9ELQoH4Gipx68b2g3GIDkitlVQvJgHUnnM+zG52OTQOQSkdMYdwall7h7I
 drJSAepRgcmr9OvVfL1TJrz/vH4V9Bp7ALAhAy6M3+qAc4FJ7ZEzHnbFX+/Hew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SHAKq/Db
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: fix musl static build
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

On Tue, 23 Jul 2024 23:50:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> For an unknown reason, runnning autoreconf is needed to avoid the
> following static build failure on musl which is raised because LDFLAGS
> (which contains -static) is not passed:
> 
> /home/autobuild/autobuild/instance-16/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/13.3.0/../../../../armeb-buildroot-linux-musleabi/bin/ld: /home/autobuild/autobuild/instance-16/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/13.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_idiv0':
> /home/autobuild/autobuild/instance-16/output-1/build/host-gcc-final-13.3.0/build/armeb-buildroot-linux-musleabi/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499:(.text+0x8): undefined reference to `raise'
> 
> This build failure is raised by autobuilders since bump to version 5.6.2
> in commit d1d77eb274761d1f2d24ee4b55a374e917c67a8e but it can also be
> reproduced on version 5.4.7 (but not on 5.4.6). There is probably an
> issue with these two official autotools tarballs which have been
> released the same day (on May 29 2024).
> 
> Fixes: 40240ac30afc4c6af765794f38e6815162ca61fa
>  - http://autobuild.buildroot.org/results/344813b202644a23c166920aa7e861ebf408536b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xz/xz.mk | 2 ++
>  1 file changed, 2 insertions(+)

Thanks for the investigation. However, I'd like to have a little bit
better understanding than "unknown reason". Could you compare the
build/link command lines used by xz without/with the AUTORECONF = YES,
to see what's different?

What puzzles me is that the build failures are related to libgcc.a
missing some symbols. So do we have a xz issue here, or do we have an
actual host-gcc-final issue that somehow gets worked-around by doing
XZ_AUTORECONF = YES ? That is what worries me about merging this fix
without a slightly better understanding of what's going on.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
