Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45851D6B6DF
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12CBF80BF5;
	Thu, 31 Oct 2024 12:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4UEF7_GO7xp; Thu, 31 Oct 2024 12:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2970580C65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2970580C65;
	Thu, 31 Oct 2024 12:48:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61AF3494E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5085760720
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNb83xqTx0Yj for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:48:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F6686065D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F6686065D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F6686065D
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:48:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4331360003;
 Thu, 31 Oct 2024 12:48:24 +0000 (UTC)
Date: Thu, 31 Oct 2024 13:48:23 +0100
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
Message-ID: <20241031134823.590f06d7@windsurf>
In-Reply-To: <20241030230130.2523437-1-romain.naour@smile.fr>
References: <20241030230130.2523437-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730378904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7MYw0ifuyEFVC8qBjalsemMLEWgVHinLscE8FPmtxU=;
 b=E9eeaimArbSb3j2Av5h5GNur0XwFGXlwrkX3sVySaC6MeGZEmQ4BzzW46URjTkp1C6c5qr
 t1dV4hAy1OVgDdzkStr/43cbx6gEFxijuyxEPPFSAaU8zV3KFDu4kLl/4Q8zQgmQWo4heh
 G9AccP0T2czal+X1S6Zv670amMpzPWuqmutDZjKLqVOO48bkjUGWFPSztjyb8aVolLAgSe
 TZWbk2BXf1Z2lVthCacwPU4dr2mA3kYcw/lz3rphA23oh6o6b170a1m3MJUb8LajiYUi6S
 45DK6tD0fNIfx8pGYp0MjN+qpeULg53MbWSxAIZ69c8EAsGMNkRN9ToPkVCYTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E9eeaimA
Subject: Re: [Buildroot] [PATCH] support/testing: TestPythonPy3SciPy: needs
 a toolchain with Fortran support
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

On Thu, 31 Oct 2024 00:01:30 +0100
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> Switch to the Bootlin bleeding-edge toolchain since stable toolchain no
> longer provide Fortran support since 2024.05-1 release [1].
> 
> The Fortran support is now optional in toolchain-builder tool and
> only enabled for bleeding-edge toolchains [2].
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/d3ad58dce9cafccb22d782e56677e060d5eb5a52#428f572a75eed97c0a70da290028c0efb4224a79_545_536
> [2] https://gitlab.com/buildroot.org/toolchains-builder/-/commit/a178b246259d92e23679b777fa3d6c166cc424d5
> 
> Fixes: (partially)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992675
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> We are back to the first build issue...
>   meson.build:203:49: ERROR: Could not get pkg-config variable and no default provided for <PkgConfigDependency lapack: True None>
> ---
>  support/testing/tests/package/test_python_scipy.py | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Applied to master, thanks. Of course, we need to understand why the
Bootlin stable toolchains lost Fortran support, but that's another
story :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
