Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAC8C83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 17:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F312441242;
	Sun,  6 Jul 2025 17:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0U2tC3aLQgC9; Sun,  6 Jul 2025 17:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FDB8409D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FDB8409D1;
	Sun,  6 Jul 2025 17:13:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E00A19C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83FA0608EC
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJ4v93qLKov1 for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 17:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FF7F6089A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FF7F6089A
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FF7F6089A
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:13:44 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id B2CEBE006B3; Sun,  6 Jul 2025 19:13:41 +0200 (CEST)
Date: Sun, 6 Jul 2025 19:13:41 +0200
From: Florian Larysch <fl@n621.de>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, yann.morin@orange.com
Message-ID: <20250706171341.azx6v4b6k524gmsw@n621.de>
References: <20250611162152.32353-1-fl@n621.de>
 <402a15d9-f995-4513-9ec7-c2061bf3f955@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <402a15d9-f995-4513-9ec7-c2061bf3f955@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1751822021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bn0lfzKPIU3ouTRylSMrvLHyTECmWgCxqmq1D6X/ag0=;
 b=OyfnZ/bejfB05WSV1eY46u8o7s7AAIErFFehfs+UI5yYdcfMq5A5nhU0/oknBIrbuIEwwn
 ks0gkt0ARbjyjnhl4CDIwuHJSn8mU7EYbyTFtqWP7my5/KL7sYhHfiwWKY5uExDQJ/7qqA
 N+yvn8k0zg2MLi46LA0xvCK9AkPcDhY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=OyfnZ/be
Subject: Re: [Buildroot] [PATCH 1/1] package/go: make pre-built compiler
 provide target support too
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

thanks for taking a look!

On Sun, Jul 06, 2025 at 06:40:10PM +0200, Romain Naour wrote:
> > When building on a host system which doesn't support a full bootstrap
> > (like aarch64), we can fall back on the pre-built toolchain. However, in
> > that case, those symbols are all false, making the internal state of the
> > build system inconsistent. In particular, this causes none of the
> > environment variables like GOARCH to be set and thus the Go compiler
> > will perform a native build instead of a cross build.
> 
> I don't understand this part. Since BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is
> not set on aarch64 build machine, we can't enable any go packages for the
> target. 

Exactly, that's the problem I'm trying to solve here.

> We can only install host-go-bin (which is useless in this case).

It isn't useless because this is the cross-compiler that enables us to
build packages for the target. Whether we do a full bootstrap via
BR2_PACKAGE_HOST_GO_SRC or get the pre-built binary via
BR2_PACKAGE_HOST_GO_BIN, the result is the same kind of host-go.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
