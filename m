Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318ABC5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9BA6087C;
	Tue, 11 Aug 2026 19:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNu_ihDHDrOI; Tue, 11 Aug 2026 19:17:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12059605E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786475852;
	bh=P7OVHZVRNKWj4/xrJQqadKP/u48/dOhv/BTtmX7zv6o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i058V6QiEvvhqK5/bawKbmX6dvTFQ6gwMF5qizvDBKNpVb39Vt9AR+HtufK5UL/p2
	 Ba+FoaREUeKCK3F4gDuagTEZGbqisemT0rjVAkJqiKdssMYlaOoYjF8NFp3WJASwbF
	 ySC6iGUSquJgAhKjbqfkrR+J4ZWJBglH6zk7WNxyPP0KeFke3L4a9UJe15QUUksJTb
	 yyHhHEDzrezL96UcZ7ucYLKUHa0Dt34/4kQmX4942cQHb5ekKxs6Q1GrJKFHFh3JQj
	 AYo5z/GHk7jk6Gw1jFK3VxynGflPYVMvj4LnEW8hRzOUvDxn90i8eB/iLWrS5vaQRp
	 g6GMK0Q/4a4jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12059605E3;
	Tue, 11 Aug 2026 19:17:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B35562E0
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A55D840557
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGY-WTVKcGWx for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 19:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9D3F94054B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3F94054B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D3F94054B
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:17:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A8CA8780368;
 Tue, 11 Aug 2026 21:17:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Aug 2026 21:17:26 +0200
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 21:17:26 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260810212918.460215-1-thomas.petazzoni@bootlin.com>
References: <20260810212918.460215-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <40e3182d70d60b476742b3ad34ad9cd3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786475847;
 bh=OxVKWQJEdLe4mNpZoPiguHlzA6B35gMif3DVIoy5eEg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qkhnEWD65uqElJKEMNL0PdjG7N8YNZBzRazd7P/sjamXg+CtznTr2HFTrebD3zHOI
 uv3Es4Kcz7yhXz+tC8XerAE9jGMIuwxNpmRs6fleU6NgnoWLaTB+V7zWTZvfgsw0it
 0vHGDRo8Kf+8HOPYqQfjJKm62PPAlAsbvIdIhSd0AVO94v4Qam5pdI0yXbu5uEl+Q8
 sEyx0Ldn1/Vimxmn8u9tEk8dmZ4EtacUZZ4tAqEbnroahnGU4n784aXjw0vHq40hGz
 Y3MqzDum0NzLfb0rkfTNNLiS4ocUS/tXrtxQTbkyX3RZCbSNCbWHDw+Wd1GkVHVDiS
 cwtBk/ylgDnww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qkhnEWD6
Subject: Re: [Buildroot] [PATCH] boot/grub2: properly handle autoreconf for
 target package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/08/2026 23:29, Thomas Petazzoni via buildroot wrote:
> In commit e427f85e29f7027319a5cd1ce1024d80ef4a29ea ("boot/grub2: fix
> build issue since 2.14 version bump") we added some patches that
> require regenerating the configure script. Consequently, we added
> GRUB2_AUTORECONF = YES and HOST_GRUB2_AUTORECONF = YES.
> 
> Except that grub2 is special. While the host package is indeed using
> host-autotols-package, the target package is using generic-package,
> making GRUB2_AUTORECONF = YES basically a no-op.
> 
> Except that since we're patching configure.ac, the build realize at
> build time that configure is older than configure.ac, regenerates it
> at that time, and re-runs the configure script without the right
> environment variables causing build failures.
> 
> We fix that by doing the autoreconf step "manually" for the target
> grub2 package.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/11802ca1762e046328df324d33a1ad813fcd92e8/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
