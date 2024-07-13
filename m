Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA73C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 05:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A596088C;
	Sat, 13 Jul 2024 05:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IaLtrWoIgue; Sat, 13 Jul 2024 05:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAB976064E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAB976064E;
	Sat, 13 Jul 2024 05:27:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 292271BF847
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15B1A40175
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJB6oe2F5ywG for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 05:27:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A14D5400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A14D5400F5
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A14D5400F5
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:27:51 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso3237733a12.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720848469; x=1721453269;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55XBXQiHe5NXCLgjFpil3waJOr4ZqRcXwmV52/4qSD0=;
 b=tHaDwu+motcuOMPTS0P9Bo05IEc1G1usou4R+kJcg3B2cS1vhCOhULHmDFlH8aElNF
 0oonfY57785q94rPpmp6Hggl+lgmhNjFjiQDlxz+5S8bsBK6vMYsMjOlm7JifJ0+AZFK
 6Az67O/SclSVAsr9jo9cUAdNsdoH2TVF7I+FuXQcXLzNXrkAcd43c+xMgQu0KW3kXEu7
 5j90WT1z7OCEXqoBNACRTRvhSnt7MqQ6y8x65HpaFTkqkNdmvg/tL7kDh0lLm7zYfwJz
 Lr5H8XgkKmPP3vGFmZm/jhsU0LpH365S2bphuy+8ZOtBOpi7la/G5+HP2KxwM4+npOEm
 i2vQ==
X-Gm-Message-State: AOJu0YzfpyTLaBamgrE5GBgaeq3+b5A/AgJerKNLvtoWy+u4tkZfWSd4
 Ef82DbVtrB63JPb04lIUIf1zKEQMpy3Nq/i45F9fWUpuOtejNAc3
X-Google-Smtp-Source: AGHT+IH3GpP8pA5cCFKX/imUmSo5Z6xL5aDYtyfVlw5HFR/XYoJ5zVL/zr9zq+TdYsnLNthwHH/QEg==
X-Received: by 2002:a05:6402:28af:b0:58b:9e7c:bcbf with SMTP id
 4fb4d7f45d1cf-594bcab046fmr7421045a12.36.1720848469014; 
 Fri, 12 Jul 2024 22:27:49 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b26f6221bsm268529a12.92.2024.07.12.22.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 22:27:48 -0700 (PDT)
Date: Sat, 13 Jul 2024 07:27:46 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240713052746.GA409522@pevik>
References: <20240712184241.256166-1-petr.vorel@gmail.com>
 <20240712224440.1118f3ed@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240712224440.1118f3ed@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720848469; x=1721453269; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55XBXQiHe5NXCLgjFpil3waJOr4ZqRcXwmV52/4qSD0=;
 b=DfGxwVqa8/X1mz6xQUx3S9WExsgV4/AP1tYjB3H3nlgWyXxnI6F3+lHx4FOOLte/C4
 RQHPcfF4HP/rql+XioUD9BcJqQe5CV0NR1ZF/2NYglEqSk/zEMUuYMo9tvYB5wp6dy9n
 4CyVEBRbqhUQlIftWCIj3fNQlTsg5NjHXRDv2yoQcYRw9gXmcu4rRlBjPD/N6KmR7e/p
 XFv453l7MF9pKlp4LDEM4r3XinPbinRWGLgw/bV4xF44dvxDZUtMfxp7jO7Ji+xr4M3x
 qbxVp14sjicLpxv1KMVZZdffrWWk077TXR8uQwH8CaGA7bf9oNkwqpLF1OCUzBTrmDOo
 oduw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DfGxwVqa
Subject: Re: [Buildroot] [PATCH 1/1] package/ima-evm-utils: bump version to
 1.6
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> On Fri, 12 Jul 2024 20:42:41 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > Upstream moved git repository.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

> Thanks for the update, one important comment below.

> > -IMA_EVM_UTILS_VERSION = 1.5
> > -IMA_EVM_UTILS_SITE = https://github.com/mimizohar/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
> > +IMA_EVM_UTILS_VERSION = 1.6
> > +IMA_EVM_UTILS_SITE = https://github.com/linux-integrity/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
> >  IMA_EVM_UTILS_LICENSE = GPL-2.0
> > -IMA_EVM_UTILS_LICENSE_FILES = COPYING
> > +IMA_EVM_UTILS_LICENSE_FILES = LICENSES.txt

> This change should have called for a review of what changed... and
> there has actually been some change. If you look at the LICENSES.txt
> file, it clarifies the licensing, and our statement GPL-2.0 is no
> longer correct. It should now be:

> +IMA_EVM_UTILS_LICENSE = LGPL-2.0+ (libimaevm), GPL-2.0+ (evmctl)

> I fixed that up and applied to master. Thanks!

I'm sorry, thanks for fixing this!

BTW I wonder if it should be:

IMA_EVM_UTILS_LICENSE = LGPL-2.0+ with OpenSSL exception (libimaevm), GPL-2.0+ (evmctl) with OpenSSL exception

The specified the exception before moving to SPDX. Now it does not have it, but
I suppose they fix it once ask for project specific SPDX OpenSSL exception.
Or, maybe it can wait till the next release when they specify it (or till it
appears in their git repository.

Kind regards,
Petr

> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
