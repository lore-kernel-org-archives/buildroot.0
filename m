Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21498C636D4
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 20:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9477680F66;
	Wed,  1 Feb 2023 20:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9477680F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxcWCewmpp0q; Wed,  1 Feb 2023 20:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D18E880F60;
	Wed,  1 Feb 2023 20:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D18E880F60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A5811BF3A0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 20:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71E664016F
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 20:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71E664016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwt1XPSRvWmT for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 20:38:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B211C4016B
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B211C4016B
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 20:38:33 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id ud5so96312ejc.4
 for <buildroot@buildroot.org>; Wed, 01 Feb 2023 12:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bZ2w4FdcUF1TjEu5I8p0YYuK9kao1PZmYckPn10DOCc=;
 b=kH3Ug8etm+zzsJJyBP4MqDhCYrDuSMr4fY5mZ8HmAXHrpz+W2HAdIRyAVee/d8yVnj
 1+vl16sKC63BUfyXNR8P4icBCZW9I/FuVGHoryTK+sdfZkytjiWneBJpiqLXeJy/epQT
 3N5L9H57QVkFq7GCJoz08r6Il8CQl/TsoKmzChCekY6ifj7GZyOozIpZbQ+j7PVyCBax
 y6tnG0XXBvj2PsR9zV9vk6diBpPCs7HKVEMSnCgyMZ4/iwC0ROnwpPEIPEGthFnPT6kA
 /PW7qRrzens9ZaW1MEKjkVnSHIynfyqdujS0uiLcsRDq2uUb6og/eRDHyyTzVhd55To7
 FE3w==
X-Gm-Message-State: AO0yUKX8iztc8eUYeo7IXdQ+ipoqaJGLiv4al4L17BNP9iFpdI0YPfJT
 hEg5AroQDJEyRUNUVajcB1o=
X-Google-Smtp-Source: AK7set/fVuFRYXMWBdEfWN9c/KUTFV6eRD5mMxVRgJgx3Xg+6YeBvM5aKbOhaH+Y2RFcb08XnuhqsA==
X-Received: by 2002:a17:906:2b9b:b0:809:c1f4:ea09 with SMTP id
 m27-20020a1709062b9b00b00809c1f4ea09mr3960416ejg.69.1675283911720; 
 Wed, 01 Feb 2023 12:38:31 -0800 (PST)
Received: from localhost (tmo-065-40.customers.d1-online.com. [80.187.65.40])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a170906784600b0088ad82a8de4sm4033077ejm.34.2023.02.01.12.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 12:38:31 -0800 (PST)
Date: Wed, 1 Feb 2023 21:38:20 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20230201213820.7c66aa8c@tuxfamily.org>
In-Reply-To: <20230201134609.2040073-2-laurent@vivier.eu>
References: <20230201134609.2040073-1-laurent@vivier.eu>
 <20230201134609.2040073-2-laurent@vivier.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v9 1/3] package: add petitboot
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Wed,  1 Feb 2023 14:46:07 +0100
schrieb Laurent Vivier <laurent@vivier.eu>:

> from https://github.com/glevand/petitboot--buildroot
> 
> Updated to work with m68k architecture rather than PlayStation3
> (focused on qemu-system-m68k virt machine)
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
...
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> new file mode 100644
> index 000000000000..b04710a535d3
> --- /dev/null
> +++ b/package/petitboot/petitboot.mk
> @@ -0,0 +1,77 @@
> +################################################################################
> +#
> +# petitboot
> +#
> +################################################################################
> +
> +PETITBOOT_VERSION = v1.13
> +PETITBOOT_SITE ?= https://github.com/open-power/petitboot/releases/download/$(PETITBOOT_VERSION)
> +PETITBOOT_DEPENDENCIES = elfutils ncurses udev host-bison host-flex lvm2
> +PETITBOOT_LICENSE = GPLv2

Sorry for not noticing this in my last review ... but looking at the other
packages, I think this should be "GPL-2.0" instead of "GPLv2" nowadays?

Apart from that, patch looks fine to me know, so with that changed:
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
