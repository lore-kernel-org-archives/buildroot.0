Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B60EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 01:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CC89403C9;
	Wed, 14 Jun 2023 01:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC89403C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6TWzuNJNRE69; Wed, 14 Jun 2023 01:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9A9140C5C;
	Wed, 14 Jun 2023 01:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9A9140C5C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBCFB1BF275
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 01:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C44FD40C5C
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 01:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C44FD40C5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWChEKBsrMHo for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 01:59:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B451C403C9
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B451C403C9
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 01:59:10 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-977c89c47bdso34374266b.2
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 18:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686707949; x=1689299949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=66O1Lv6QHP907lcGQsU+iOmC99WE89qjgL9Gabos4SQ=;
 b=NzaqVuTXF0xfU9kp0BYdnwqoVTlFQRl14vpMIj5zvpNP/0h4lC/Qy2ghWJaWoaOY16
 n4R+kwklwNm2trsOvUYax8UXsvpgIobECMM4SBxCKwgZmMP4Qla6cPYG8gBD++sCIm/7
 azNkQVVLaTzGuTo8IHtTKYEM+Fotw65jboYXtl9gNARIAu+ggDnurb9CR9FORIqBfB+k
 r4hVBSLwvG1W61cvjft6hbIwxfXeVgCPrp9hVf2in3hxdD76iKD2e8vGXb8jlhOi4DbF
 LcW1GpOUkyPS7Z3BENfTKNARE5BHIIfj5Y4BPXVROOSsr71yQVJ133bpdKgXdbjooPcU
 IQ2w==
X-Gm-Message-State: AC+VfDz8sNEqV24H776HKzGyfCTp0RxtcipG7IRhTK+WLEp6uR15wANy
 FTFio0h84Hha+uPu+KefLJI5ymvYbOEyzJGLHkc=
X-Google-Smtp-Source: ACHHUZ6WGBJEvXNWQ9WKAwji9XhI7T4K4nQxdGCiiz45b7ITO/dLhRq6xPq7dclfV9eqBNiCRRArGwgPWeugK3O2UHM=
X-Received: by 2002:a17:906:d54b:b0:978:94b1:25ac with SMTP id
 cr11-20020a170906d54b00b0097894b125acmr17292978ejc.40.1686707948517; Tue, 13
 Jun 2023 18:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230613105015.739870-1-laurent@vivier.eu>
 <20230613105015.739870-3-laurent@vivier.eu>
In-Reply-To: <20230613105015.739870-3-laurent@vivier.eu>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Jun 2023 01:58:55 +0000
Message-ID: <CACPK8XeCGWonbKMtxDLDC+GFy1Q1Fzq7EzD76wutTgLg=vb0mQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1686707949; x=1689299949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=66O1Lv6QHP907lcGQsU+iOmC99WE89qjgL9Gabos4SQ=;
 b=HiWFVJzZJ0KH4qt362DTExhnxw6NUCjXmzqelSNyTLq7auoJt3tm5/twNYOBhvknh8
 SSN5DGXTT6iKMLTDskjq3ZsoW8rGmDrrlKFAzeQAsShDMHr50DPE3vrOZC5tGIPncd1o
 M/vZFp62KlcztrY2hcDdFVKNyirycC2Kq2HEY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=HiWFVJzZ
Subject: Re: [Buildroot] [PATCH v14 2/4] petitboot: start petitboot on all
 tty
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Jun 2023 at 10:50, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  package/petitboot/petitboot-console-ui.rules | 5 +++++
>  package/petitboot/petitboot.mk               | 4 ++++
>  package/petitboot/sysctl.conf                | 1 +
>  system/Config.in                             | 2 +-
>  4 files changed, 11 insertions(+), 1 deletion(-)
>  create mode 100644 package/petitboot/petitboot-console-ui.rules
>  create mode 100644 package/petitboot/sysctl.conf
>
> diff --git a/package/petitboot/petitboot-console-ui.rules b/package/petitboot/petitboot-console-ui.rules
> new file mode 100644
> index 000000000000..ceeada256f2b
> --- /dev/null
> +++ b/package/petitboot/petitboot-console-ui.rules
> @@ -0,0 +1,5 @@
> +# spawn a petitboot UI on common user-visible interface devices
> +SUBSYSTEM=="tty", KERNEL=="ttyGF*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"
> +SUBSYSTEM=="tty", KERNEL=="hvc*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"
> +SUBSYSTEM=="tty", KERNEL=="tty0", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"
> +SUBSYSTEM=="tty", KERNEL=="ttyS*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 4d56b73938e7..e74a5ff623ea 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -55,6 +55,10 @@ define PETITBOOT_POST_INSTALL
>                 $(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
>         $(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
>                 $(TARGET_DIR)/etc/init.d/S15pb-discover
> +       $(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
> +               $(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
> +       $(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/sysctl.conf \
> +               $(TARGET_DIR)/etc/sysctl.conf
>         ln -sf /usr/sbin/pb-udhcpc \
>                 $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
>  endef
> diff --git a/package/petitboot/sysctl.conf b/package/petitboot/sysctl.conf
> new file mode 100644
> index 000000000000..02ab8e3275b5
> --- /dev/null
> +++ b/package/petitboot/sysctl.conf
> @@ -0,0 +1 @@
> +kernel.printk = 1 1 1 1
> diff --git a/system/Config.in b/system/Config.in
> index 1ca7690ea3ba..786ec9a1c6b3 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -375,7 +375,7 @@ config BR2_SYSTEM_BIN_SH
>
>  menuconfig BR2_TARGET_GENERIC_GETTY
>         bool "Run a getty (login prompt) after boot"
> -       default y
> +       default y         if !BR2_PACKAGE_PETITBOOT
>
>  if BR2_TARGET_GENERIC_GETTY
>  config BR2_TARGET_GENERIC_GETTY_PORT
> --
> 2.40.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
