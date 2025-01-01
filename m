Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941A4E7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 20:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4272180D52;
	Wed,  1 Jan 2025 20:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpU-e62_G0L7; Wed,  1 Jan 2025 20:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51E8F80CF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51E8F80CF0;
	Wed,  1 Jan 2025 20:22:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60112F27
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EE1680C8C
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xe5wlo2TtRNW for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 20:22:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2942980C44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2942980C44
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2942980C44
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:22:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D18DBC0004;
 Wed,  1 Jan 2025 20:22:39 +0000 (UTC)
Date: Wed, 1 Jan 2025 21:22:39 +0100
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20250101212239.6db59b40@windsurf>
In-Reply-To: <20241231171249.0bf50c4c@windsurf>
References: <20241231171249.0bf50c4c@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735762960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHfriRiQCM7OmsOZ4efDl88gwbrBFBMEK+D9FOAEglI=;
 b=aWT5ry+nmBQrB11nzbgyB4aOihjvekqvhA1uClbh9WjHgyNkwC/0X0w17p9PzE1bNuqKsf
 vdqf4kfKhguQYrkyhfOEZxbandYKYzZ7hDEQMUU5afy4p4bLfix/Xj6OttrbQeXRsnN+Wo
 JWR7c2kxdrlOAcFXU+F+HTZhOCn6dGnitcErV7eO1DPhTx4T0pbCc3vTXysSazs+rFgYhM
 rJJXXeQiV9hsBrZTe70sgGF+ro80Q/oSIAou8xCrb5vwiFNPJdxDjWZk99omHHxoV5HsDs
 zC6JDZ7tuA2kCkYU7O6tDYG4pmKpO7mBMzLCNV9vBSJzX3TQM8pXd30ucMgEjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aWT5ry+n
Subject: Re: [Buildroot] Analysis of host-libxcrypt build failures
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

On Tue, 31 Dec 2024 17:12:49 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The obvious thing to fix is to get the perl executable to have a proper
> RPATH of course.

I have sent a patch doing just this:

  https://patchwork.ozlabs.org/project/buildroot/patch/20250101202112.1845113-1-thomas.petazzoni@bootlin.com/

> However, this means in the scenario above that perl will be
> built/linked against the system libcrypt.so, and then after
> host-libxcrypt is built/installed, host/bin/perl will from this point
> on run with libcrypt.so in host/lib, which isn't really ideal. Should
> we make host-libxcrypt a mandatory dependency of host-perl? How do we
> detect this situation in other packages? Should check-host-rpath have
> instead a allow-list of libraries (libc, libm) for which we accept to
> use the system-provided ones, and for everything else (including
> libcrypt), we expect HOST_DIR/lib to provide them?
> 
> For the record, we have host-libxcrypt because host-systemd was failing
> to build on systems that have a recent glibc installed, but don't have
> libxcrypt installed system-wide.

I wanted to test building host-perl on a system with libxcrypt
installed, but I wasn't able to easily find a Docker container of a
distro that doesn't have libxcrypt installed by default.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
