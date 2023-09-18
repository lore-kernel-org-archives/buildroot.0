Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA71CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 06:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE4AD40CC9;
	Mon, 18 Sep 2023 06:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE4AD40CC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aESolzT_lnvX; Mon, 18 Sep 2023 06:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34A5F404C1;
	Mon, 18 Sep 2023 06:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34A5F404C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 603A01BF40F
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37E2340992
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E2340992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjS1F3ZiKbRy for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 06:45:42 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3243640955
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 06:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3243640955
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c00c0f11b2so9462351fa.1
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 23:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695019540; x=1695624340;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J9bJ0ZGkQqmmkjE7E9BtNAStlzt4qh+33ab7bZhbc2M=;
 b=g8d8O575X3to+QXbedZbLeENdYeOAI4hLVZq1jj3aPx8yyQbjpi6KuH3l2Zrg9Va/+
 mJYgdZoQd2Fx8WtDvtdPMzSyufUY8VbOv9+4rILfYyOaVcWrgbJqFjhJNzHWieaVXUVX
 4ecDpn4w8d0vNwlztyRov9od7Gw7JIfsFdUClNDLReMVlme8Yrzr2X64b9nXVSpT3cZ8
 5v4KexBriFm6HEMKokV67UccZSVozNQr5oo2sS4e0hCWUKbZ0En40fJIIEzniYV5qBPw
 vE8pm4tsnypCkG7MZ51gjqFZ5AChWgc8nVAyRdRm6HH0se6kz0KnEhFrawTf889Tx914
 pOkw==
X-Gm-Message-State: AOJu0YxpmaKSULSKTTtJmAGndemWOLYg8puWpW4qKlroi5GCJcjbuKhW
 AavwnCo6HtqgWAWJ/wOowaIfM18xy5fN2WlSkVs=
X-Google-Smtp-Source: AGHT+IFIsAQ5cbub9KFAv9wAJNYr42RezGir7eFrPKsTP9cmXEGqd/8pn0ZI2msyuRpkCU3IBJ3tZUpB9ek7L0gVpms=
X-Received: by 2002:a05:651c:120f:b0:2b6:e958:5700 with SMTP id
 i15-20020a05651c120f00b002b6e9585700mr7031441lja.4.1695019539553; Sun, 17 Sep
 2023 23:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230915155835.51140-1-arbab@linux.ibm.com>
 <20230915155835.51140-4-arbab@linux.ibm.com>
In-Reply-To: <20230915155835.51140-4-arbab@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Sep 2023 06:45:28 +0000
Message-ID: <CACPK8XcxQAgxVpTy=-OXS4v6dvfaz4kUWVdSS3tAHDV9eSQ7RA@mail.gmail.com>
To: Reza Arbab <arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1695019540; x=1695624340; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J9bJ0ZGkQqmmkjE7E9BtNAStlzt4qh+33ab7bZhbc2M=;
 b=jORKNTqPr6QJEBW+v+yGwKysfRmOkYEO4csKeGs2kQq3c0TaxFVbxoRJt8C0F7iEu1
 VVQTfkBE8NWDdd3LqIGnXdYhmbelmwwkL7bjVDqt3jjF7qHU85JqbGZGvYhL7WRYlist
 LtOyu5GV3GwPs9OrMNrodokRK3RnskmttECu8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=jORKNTqP
Subject: Re: [Buildroot] [PATCH v2 3/5] package/petitboot: poll removable
 devices
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
Cc: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 15 Sept 2023 at 15:58, Reza Arbab <arbab@linux.ibm.com> wrote:
>
> Add a udev rule to enable notification of media change events on
> removable devices, so petitboot can dynamically adapt to them.
>
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  package/petitboot/petitboot.mk               | 2 ++
>  package/petitboot/removable-event-poll.rules | 3 +++
>  2 files changed, 5 insertions(+)
>  create mode 100644 package/petitboot/removable-event-poll.rules
>
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 556d41230237..9326738aa038 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -57,6 +57,8 @@ define PETITBOOT_POST_INSTALL
>                 $(TARGET_DIR)/etc/init.d/S15pb-discover
>         $(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
>                 $(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
> +       $(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/removable-event-poll.rules \
> +               $(TARGET_DIR)/etc/udev/rules.d/removable-event-poll.rules
>         $(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/sysctl.conf \
>                 $(TARGET_DIR)/etc/sysctl.d/petitboot.conf
>         mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
> diff --git a/package/petitboot/removable-event-poll.rules b/package/petitboot/removable-event-poll.rules
> new file mode 100644
> index 000000000000..57bb74d3c00c
> --- /dev/null
> +++ b/package/petitboot/removable-event-poll.rules
> @@ -0,0 +1,3 @@
> +# petitboot needs notification for media change events on removable devices,
> +# which we only get if we've set the poll_msecs sysfs attribute.
> +ACTION!="remove", ATTR{removable}=="1", ATTR{events_poll_msecs}="2000"
> --
> 2.39.3
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
