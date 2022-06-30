Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F6FC43334
	for <buildroot@archiver.kernel.org>; Thu, 30 Jun 2022 21:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FF6540B48;
	Thu, 30 Jun 2022 21:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FF6540B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vx0hAKveHL28; Thu, 30 Jun 2022 21:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F5FE40B42;
	Thu, 30 Jun 2022 21:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F5FE40B42
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9DD41BF37C
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 21:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B397960F7E
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 21:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B397960F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozVyAAG8JJAK for <buildroot@lists.busybox.net>;
 Thu, 30 Jun 2022 21:21:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A0060B6C
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40A0060B6C
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 21:21:13 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id cu16so1151245qvb.7
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 14:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VrD2H0rFuJlIBwuvI3hblHmg4V+KvYX3+PEhNC/ON7A=;
 b=SxuBeFonzkjXXHWfaBNWJFhqzyLtg1DD/CBOE6Yip2ihGKUvUOGe4YWMFfaczb2qJ7
 y5b8p+zOCPIvqoDKi6ufvkR+2nztcwqwca4EHb1T7DA1pLf4WrmLCW36TyMvw+HNQMWe
 MaZKzvLfQp2v92Drv6EB2Jff+J0ZKR//RHTH7lX5RH0XRejtUkeca/tQ02fH6/rXlPbS
 eDgkY3TNb7wqsGHm71szbB9GhoSEHcC6PLzGcX5NHT4rne5Saoy01VlL00mCqXM7kuGt
 cmD6iAX/o0jVV7jbXi+3phrwbUPmhdeLx9WTZVsTUpbMm0xNWq7s5ZH91c9iWlJrlWwA
 Y9PQ==
X-Gm-Message-State: AJIora+8g7tKxwODpGZoG9h4rbef9Gq0b1TB08a58SuJpmjMUWShWatP
 /jvFz+jtRjodPSesOYLXyrRur1PxvAk7VSCLQIE8qhYXfwsFPyAx
X-Google-Smtp-Source: AGRyM1snhwHcTnnA3z7bDK0nuy/YjQ9aCzrfb7lLADYgrgMqwhe7IxrB4FiEnNuAYBc4Q9ls5sRltHBOWhZkQMZ/QyU=
X-Received: by 2002:ad4:5bc1:0:b0:42d:758c:f694 with SMTP id
 t1-20020ad45bc1000000b0042d758cf694mr14426962qvt.99.1656624071600; Thu, 30
 Jun 2022 14:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220616232311.2770826-1-mmayer@broadcom.com>
In-Reply-To: <20220616232311.2770826-1-mmayer@broadcom.com>
Date: Thu, 30 Jun 2022 14:21:00 -0700
Message-ID: <CAGt4E5tHObKWfyU9pJpEa8GEV_gqKuDMsV5YeF3+zWUL9aULhA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VrD2H0rFuJlIBwuvI3hblHmg4V+KvYX3+PEhNC/ON7A=;
 b=cu1UehIwRor/HaFhULHV9myt5peWQ2qu/0CCoj+qhYolt/oPA/FLgJ/oBdfNc59kC/
 3XcvluR0+Mbfe/Bubim0ZRpgo4bZd58ebAGTAA/ViGFEgGBXoaF/4vlLKSmc7puah4kp
 WO+ILG7ccGYmjU+PAsblfeD/1BbQ4rGs2KjWE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=cu1UehIw
Subject: Re: [Buildroot] [PATCH] package/iptables: add nf_log.h
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 16 Jun 2022 at 16:23, Markus Mayer <mmayer@broadcom.com> wrote:
>
> iptables generally bundles the netfilter header files inside its own
> tar-ball.
>
> Since iptables 1.8.8, it started to make use of netfilter/nf_log.h, but
> didn't include it in the iptables tar-ball. This can lead to build
> failures.
>
> Add a patch that rectifies this for iptables 1.8.8.

This change has now been accepted upstream.

https://git.netfilter.org/iptables/commit/?id=9ea7e6aa638d0dfa14613f6f97e6dc06c857e609

Since there isn't an iptables 1.8.9 yet, would it be possible to
accept the patch below into Buildroot for now, until the next iptables
release becomes available?

Thanks,
-Markus

> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  .../0001-netfilter-add-nf_log.h.patch         | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/iptables/0001-netfilter-add-nf_log.h.patch
>
> diff --git a/package/iptables/0001-netfilter-add-nf_log.h.patch b/package/iptables/0001-netfilter-add-nf_log.h.patch
> new file mode 100644
> index 000000000000..c014c45931e9
> --- /dev/null
> +++ b/package/iptables/0001-netfilter-add-nf_log.h.patch
> @@ -0,0 +1,37 @@
> +From 15ea3fa147dea25d8cae3c2ac417142f2e0f029e Mon Sep 17 00:00:00 2001
> +From: Markus Mayer <mmayer@broadcom.com>
> +To: Netfilter Mailing List <netfilter-devel@vger.kernel.org>
> +Date: Thu, 16 Jun 2022 15:29:58 -0700
> +Subject: [PATCH] netfilter: add nf_log.h
> +
> +Since libxt_NFLOG is now using the UAPI version of nf_log.h, it should
> +be bundled alongside the other netfilter kernel headers.
> +
> +This copy of nf_log.h was taken from Linux 5.18.
> +
> +Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> +---
> +diff --git a/include/linux/netfilter/nf_log.h b/include/linux/netfilter/nf_log.h
> +new file mode 100644
> +index 000000000000..2ae00932d3d2
> +--- /dev/null
> ++++ b/include/linux/netfilter/nf_log.h
> +@@ -0,0 +1,15 @@
> ++/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> ++#ifndef _NETFILTER_NF_LOG_H
> ++#define _NETFILTER_NF_LOG_H
> ++
> ++#define NF_LOG_TCPSEQ         0x01    /* Log TCP sequence numbers */
> ++#define NF_LOG_TCPOPT         0x02    /* Log TCP options */
> ++#define NF_LOG_IPOPT          0x04    /* Log IP options */
> ++#define NF_LOG_UID            0x08    /* Log UID owning local socket */
> ++#define NF_LOG_NFLOG          0x10    /* Unsupported, don't reuse */
> ++#define NF_LOG_MACDECODE      0x20    /* Decode MAC header */
> ++#define NF_LOG_MASK           0x2f
> ++
> ++#define NF_LOG_PREFIXLEN      128
> ++
> ++#endif /* _NETFILTER_NF_LOG_H */
> +--
> +2.25.1
> +
> --
> 2.25.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
