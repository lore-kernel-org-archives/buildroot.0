Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6DED5B145
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D657380DD9;
	Mon, 28 Oct 2024 20:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NNkGPuCQITa; Mon, 28 Oct 2024 20:09:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE66080DAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE66080DAA;
	Mon, 28 Oct 2024 20:09:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C49B8112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B37484057E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2Sk7Zc8tKMb for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:09:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61876402EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61876402EB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61876402EB
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:09:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ADDD240003;
 Mon, 28 Oct 2024 20:09:40 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:09:38 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Carlo Caione <carlo.caione@gmail.com>
Message-ID: <20241028210938.29559f13@windsurf>
In-Reply-To: <a4eb330bb35e5986f04b8356a4434406@free.fr>
References: <20241025180523.118939-1-ju.o@free.fr>
 <20241028164327.3e494f48@windsurf>
 <a4eb330bb35e5986f04b8356a4434406@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730146180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VlhdODtUJsmRK6rfcJpar0noUwI1435PlvRDddXzbY4=;
 b=UaT3HS6qHK3R6gXXqIEPz91954CN1zVLpZsz2nr9Mdf7Fc8Gf4JondAPsS0yWI/TC5ej7D
 gtD0ahcXK1raNT12Y4N09TNiFB8L+WNvhfkAUGxVihHoKm3s/uANAosvTnd0QrCFOhWHrQ
 7DiO7kpfiJO38KNCcp9pk2mBhu6VMSZAjAvIEJxXnOQc82MndbUsZxVnFpKk7F367+hHNr
 SSHhJW+1l2/G3A3W1ZSeOS1dxJByuijBNzSJSSwM8EMOnEf9C9H/vdA40DINzu8gz0r/cl
 1/bPPtCI1thbOnyjVGVQXUPo92uf3qv651TTpSrItqvPdmgUKmMRLyoiVzCgJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UaT3HS6q
Subject: Re: [Buildroot] [PATCH 1/1] package/jailhouse: fix build when
 python helper scripts are enabled
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

Hello,

On Mon, 28 Oct 2024 20:22:09 +0100
Julien Olivain <ju.o@free.fr> wrote:

> I agree, the Python error message is somewhat cryptic ;) The hint is
> "sysconfig.py". A more detailed explanation of the situation would be:
> 
> """
> Jailhouse Python scripts are using setuptools with host-python3 which
> reads its sysconfig data from the target-python3. See:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L33
> 
> If the target python3 is not installed, this get expanded as an empty
> string, leading to this "ValueError: Empty module name" error.
> 
> Pure Python packages which are using the python-package infrastructure
> usually get this dependency automatically from:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L295
> 
> Here, the jailhouse package rather uses the generic-package
> infrastructure, then installs the Python scripts (if enabled) with
> dedicated macros. This is why the target python3 is needed.
> """
> 
> Do you want me to send a v2 adding that to the commit log?

Yes, would be nice, thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
