Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE60AC38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 06:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60BE08230F;
	Sat, 28 Jan 2023 06:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60BE08230F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9ldJ4UBbaJI; Sat, 28 Jan 2023 06:34:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AABEA822FB;
	Sat, 28 Jan 2023 06:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AABEA822FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3EBD1BF424
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 06:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9790340117
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 06:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9790340117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHcLFD4C3ATH for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 06:34:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFE9B400BB
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFE9B400BB
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 06:34:40 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id m12so6535536edq.5
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 22:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oyzTdqHnp7fqsk2SkunyCr3t/Ov64jcpL/0wi7pHmcU=;
 b=rMBjfNtw9MUVQtGGCfFfEPS1CQJvu2f+nPwwYl+bm3q2XB69u9MBhcC5vAZ0Kjb6sT
 QtAsmqQtq+EPyXr5KWYDR4eMTpC+lRiPhpKP0glbRBp/AUabngUfGyHHTkmU4OdyGjgh
 vyg7lUoyrCzswtbitel+lnLSe49xoIZEKXJptlLnRUPOPpktOcZn9Q+xxUBCkhomV1Pl
 1zFSN2TQmHtcRuoqvZUnIUqx5OWYpLdt6qJc4yemle6/okcSDof3TgB/zNqif2EN0tZA
 arVS+wDw6QL1agV9/zQf3TbGjxQWpvqr17dfssT0u4YnOuN8uX7WVQxGgRf9fpsJW2AA
 Tz1Q==
X-Gm-Message-State: AFqh2kq8FIIyBWAlECeEhLuz6Oo7KJpVTb677+nEEcsbZnZq4to3+K1D
 smBkb+gEpe3ZEFZlL6Ad8w8=
X-Google-Smtp-Source: AMrXdXsAP9sZcU5bsFLi9WR7hAW4sVv1WSUVgCrlA6kftbQzJM3LscHvjvoxpiszmC4/fZESNWkkUA==
X-Received: by 2002:a05:6402:24a4:b0:49e:1f0e:e209 with SMTP id
 q36-20020a05640224a400b0049e1f0ee209mr50200880eda.10.1674887679077; 
 Fri, 27 Jan 2023 22:34:39 -0800 (PST)
Received: from localhost (tmo-064-101.customers.d1-online.com. [80.187.64.101])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a170906814900b0088091cca1besm937221ejw.134.2023.01.27.22.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 22:34:38 -0800 (PST)
Date: Sat, 28 Jan 2023 07:34:31 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
Message-ID: <20230128073431.6c617303@tuxfamily.org>
In-Reply-To: <20230108165438.1250779-3-laurent@vivier.eu>
References: <20230108165438.1250779-1-laurent@vivier.eu>
 <20230108165438.1250779-3-laurent@vivier.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v8 2/3] board/qemu/m68k-virt: Add virt-m68k
 linux config
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun,  8 Jan 2023 17:54:37 +0100
schrieb Laurent Vivier <laurent@vivier.eu>:

> Build a 5.19 (first version with the m68k virt machine) kernel
> for "qemu-system-m68k -M virt" machine.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
