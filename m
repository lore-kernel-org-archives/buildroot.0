Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4320C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 20:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A33E40B6B;
	Thu, 22 Aug 2024 20:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3p-aJ1cauOqH; Thu, 22 Aug 2024 20:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3082F40C23
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3082F40C23;
	Thu, 22 Aug 2024 20:33:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 931161BF59F
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FB2640C23
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDLjNR02xQJU for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 20:33:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D72840B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D72840B6B
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D72840B6B
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:33:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5343617fdddso1097426e87.0
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724358780; x=1724963580;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dAIhGCHXfsMn0aweE+lcDp7eghi3F5EYQkGlfTFlKW0=;
 b=PQlUqs9KL1y/Bwdh9t7cJwmi6LP5vfHyuODi0CjHMbHdV6fliHFpC8VlIdgV/xPFiV
 HEfsSss66akKrgi/+hVc3eL3YkklxGgD98J13QM5hKta51kzOPX2oQGU+zWUHX4AwGg4
 L1XsbbLp0uLqF3h1C4k5Vpzn/j1KLE2R93Ocw5baMUTYuGudmlyc0Vydadgze6cs/7Hw
 Ria3M27TLraDAHQBAk4YtiArTOWN2vSwAkf6MZKR+TVfQcbkCfIQ6e9XUKFG8pptC06E
 KhjeMa1lVQMiMfqinOYUsxnWBSKZlFcAtD+FRgrjg4WSP8ecpt2gZqkP21jLuQndVfYk
 dG4g==
X-Gm-Message-State: AOJu0YwvEYak2w+8EmJTqQE1XenyN+vk+JittnTh56Op2x0HP+BxsBRi
 4hpIyi8xdMOYRiSFR4CZBb5TB5+jChNHqfSBPoMxdX68lA7SIerN
X-Google-Smtp-Source: AGHT+IHOb35OEYHLpSwPFbLXwjf7msbCzheRkpM5mqzdvGBWBkt0O+3PFPbLP0wQE0TDiLvsDemPPg==
X-Received: by 2002:a05:6512:3f12:b0:52c:e17c:cd7b with SMTP id
 2adb3069b0e04-53438846fd8mr118630e87.22.1724358779390; 
 Thu, 22 Aug 2024 13:32:59 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f48b2c7sm160975666b.186.2024.08.22.13.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 13:32:59 -0700 (PDT)
Date: Thu, 22 Aug 2024 22:32:55 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240822203255.GG1160317@pevik>
References: <20240822182050.65230-1-bernd@kuhls.net>
 <20240822182050.65230-6-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822182050.65230-6-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724358780; x=1724963580; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dAIhGCHXfsMn0aweE+lcDp7eghi3F5EYQkGlfTFlKW0=;
 b=RKbHK74TFkG0UtIzdeZg1a2UEdBPVVWaTO7Her+4o+t6KVvVQjcAU9HcSV05XUoRXb
 jLBOjr1AzckpBM9bBqZ0S5T1MzY0C//Die1ZGUsGfAoP93LiioNfysMV0WYKKQUZDGjk
 UgLRPTTwf7aBHAibyCnKuZ9ZvdyuKNUGNBb9DvzA6UtqlKmwmL3sSsyL01J+C5onOmNr
 CF9xLScGQW4k0egqmHE1LpbBxDM9rENM7gR38g66MyZQ8PDDWXmShSjv2M0NfDUpNSkV
 PWCqMGSpftmcuN4ZWOqjLbgibgqMrZbfhyDoo5jWLJefqU16z4jhu7M9yhfHHtw4EbYy
 tv0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RKbHK74T
Subject: Re: [Buildroot] [PATCH/next 06/13] package/rpcbind: bump version to
 1.2.7
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

I checked just for git (where Steve, the upstream maintainer haven't pushed the
changes), thus I didn't notice the change. Thanks for updating it,
connecting using abstract address is the feature I'm looking for (it fixes
nfslock on NFSv3).

Again, there could be changes fixed:
$ ./utils/check-package package/rpcbind/*
package/rpcbind/S30rpcbind:23: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/rpcbind/S30rpcbind:26: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/rpcbind/S30rpcbind:29: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/rpcbind/S30rpcbind:32: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/rpcbind/S30rpcbind:38: empty line at end of file
package/rpcbind/S30rpcbind:0: DAEMON variable not defined (https://nightly.buildroot.org/#adding-packages-start-script)
package/rpcbind/0001-Remove-yellow-pages-support.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)
138 lines processed
7 warnings generated

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
