Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B5C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431A684762;
	Fri, 29 Jul 2022 20:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431A684762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VGZQ7fyRUIr; Fri, 29 Jul 2022 20:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3842384750;
	Fri, 29 Jul 2022 20:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3842384750
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E59651BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C11EF841AA
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C11EF841AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OMOGNuDwMms3 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:17:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2DEC84045
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2DEC84045
 for <buildroot@busybox.net>; Fri, 29 Jul 2022 20:17:03 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10e6bdbe218so7090224fac.10
 for <buildroot@busybox.net>; Fri, 29 Jul 2022 13:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=kAdNr1tJfL7qbMRzUlqKUm7JI/gjxKg/BnzAQln3C/8=;
 b=Ty+T9qIlXjld/ZN4Kutgar9MRBk8LGVUNNqRlzLfu/oMOUcZmG1yAO/VK7jFC/E782
 8jpvRa+LSKDHfB/7D0WSOGzmw8MQIXm/7ezJ0RZinBoDJKDd1Ys+HdeoSVfLadQ6004z
 cl/zG3pxwGJKXd4QGloOuSOFhNE/rQ9o2ZXkHILpQBfrueGfbYZzN3zcpcAZNeohx1l7
 K4LE9+y0Jlt5XLLBnl8YA2b8nYxPc2+ZCDaNwNr8TwEOP3ElP5P3izt/I0OHzs3M/Ly7
 /o60S6cwsQtGZi0xbmjE9SogJjf44/uqHrBmz/0gZOa/AJxkKnlfxt8OeB5MDgkcTivl
 gQ+A==
X-Gm-Message-State: AJIora9gec9Dms582U0YYIoRYFCh9nakkecZAXLyAxDV/GKkAhJmrIqr
 sdDXoHO+wdDTV3MyeizmIKTPt5r2XzxoZBRlQGk=
X-Google-Smtp-Source: AGRyM1sUXI/Nfo/y33RiP+F0VMRDGvJP33NzvkVQNzohuv4w/MxrUkEyjIvgkM//SyJiiqSH19avAA0oc+FDQKr9+kE=
X-Received: by 2002:a05:6870:8314:b0:10c:cc1a:57fc with SMTP id
 p20-20020a056870831400b0010ccc1a57fcmr2971814oae.153.1659125822815; Fri, 29
 Jul 2022 13:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220728113422.6739-1-guillaume.bressaix@gmail.com>
In-Reply-To: <20220728113422.6739-1-guillaume.bressaix@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 29 Jul 2022 14:16:51 -0600
Message-ID: <CADvTj4oSWWSnNejAipDXDPkMYJ-s1Y+PCv_5mOKNvuR3JHo8cA@mail.gmail.com>
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=kAdNr1tJfL7qbMRzUlqKUm7JI/gjxKg/BnzAQln3C/8=;
 b=Hvu/e7Ih3mjroHTewVH5pewQlbnvWT7jqXhJX5iwj71nyw131BNQkpSwrVuI0b/xAe
 ztF/L+KDzK6rYVoK/3kdK6LpOKpUUQBQKsIDviPuUmAq1JWkzE7V8EGmL7p1Spe77WR0
 VB9QPP6VtukudpqfkYzebeRTgxrvh9WaooIkuRfJ9P4Hp3MIsspcEIWiM0PbmmuuIqEX
 X8QMBmBTlhpO05XtvQFKr3LrTTxz2kUra/QqNKE0DGmKycxAZbhXqs2uqwKsduSLUBeV
 xAVQyH6gODKmH5MYd7rQ6VOWKa8pVeXgccziL4V5xiFLc0an7lsESBHEsxQjyZ7fjqMu
 vDyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Hvu/e7Ih
Subject: Re: [Buildroot] [PATCH] package/ntpsec: add systemd unit file
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
Cc: Buildroot <buildroot@busybox.net>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jul 28, 2022 at 5:35 AM Guillaume W. Bres
<guillaume.bressaix@gmail.com> wrote:
>
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
> Use -d to daemonize, use -g to allow a "big leap".
> Prior synchronization, system date is usually set to 01/01/1970.
> By default, ntpsec does not allow that big of a leap,
> and we never obtain synchronization without -g.
> Ideally, you want some sort of mechanism to only use
> -g on first (ever) boot.
> ---
>  package/ntpsec/ntpd.service | 10 ++++++++++
>  package/ntpsec/ntpsec.mk    |  5 +++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 package/ntpsec/ntpd.service
>
> diff --git a/package/ntpsec/ntpd.service b/package/ntpsec/ntpd.service
> new file mode 100644
> index 0000000..3987085
> --- /dev/null
> +++ b/package/ntpsec/ntpd.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=NTPSec
> +After=network.target
> +Conflicts=systemd-timesyncd.service
> +
> +[Service]
> +ExecStart=/usr/sbin/ntpd -d -g

You probably need to turn off dnssec validation for hostname lookups to work
prior to ntp syncing.

You can do that like this:
https://github.com/buildroot/buildroot/blob/2022.05.1/package/openntpd/ntpd.service#L8-L11

> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
> index a0d0662..a0fc49b 100644
> --- a/package/ntpsec/ntpsec.mk
> +++ b/package/ntpsec/ntpsec.mk
> @@ -62,6 +62,11 @@ define NTPSEC_INSTALL_INIT_SYSV
>         $(INSTALL) -D -m 755 package/ntpsec/S49ntpd $(TARGET_DIR)/etc/init.d/S49ntpd
>  endef
>
> +define NTPSEC_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 0644 package/ntpsec/ntpd.service \
> +               $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
> +endef
> +
>  define NTPSEC_USERS
>         ntp -1 ntp -1 * - - - ntpd user
>  endef
> --
> 1.8.3.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
