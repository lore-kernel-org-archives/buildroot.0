Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00313C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 05:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96AD841773;
	Fri, 27 Jan 2023 05:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96AD841773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWkCyJwzxFI7; Fri, 27 Jan 2023 05:14:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1BA44176E;
	Fri, 27 Jan 2023 05:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1BA44176E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8EA1BF489
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 05:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9F9E41BBE
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 05:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9F9E41BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fYEX-zXKwMU for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 05:14:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07C0441B6B
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07C0441B6B
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 05:14:36 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id h5so4674445ybj.8
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 21:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L9KJ2k3krqDTVoC5UR8rWZwuVkoiyzonIUnvuaABPLA=;
 b=nTnw/SLIkGzGW+qQ107Yfv/MBJlsGb6BenW5OVpQjnnlmqWUhgdBpFpOBtBPFpzaV9
 PDi9xo9KRvsLRKtkIr85QHM1HHnxirMo2zHWF9uyp1XorL58GtntSD0clIcHWO2fK/c0
 /ApIt1yVfGpEnh2x+cc+EXj7btjnUnrYSdjwooWuVBI7r0ny7qdCJt+CBdnpv0R97BE5
 /0/eCErMEzKyGQfR1ZZ0WMtmJ2+avaUCgDS47JX96tI1hwLIzk9r1Sk4ivHdAYJutfjR
 VXlH1I+F8q4h7yIM4M9C7z+gw7xR9ZCLqeCtRHhrV532bKN89M0Tc1JQN2RSkbFYpWiY
 5CKA==
X-Gm-Message-State: AFqh2koSqvTe4eo8tWFEXo2oY8vAUCZoTDzlYGpE4Bil+lpXJV2/e3xy
 Ugjo/6lwPBdcc+fmvVv8aW+x4Oj+IiNr3cdH5CoiqPaxeBE=
X-Google-Smtp-Source: AMrXdXuhFqn2NIhHz9WH7kWbw38L2MjzxjbUCqOtl3F6GJg2YOBgyrycHark8kmzhbXxwB0+WgDwE2On0OtScq7CVhk=
X-Received: by 2002:a25:8592:0:b0:802:7c87:593b with SMTP id
 x18-20020a258592000000b008027c87593bmr2874094ybk.157.1674796475874; Thu, 26
 Jan 2023 21:14:35 -0800 (PST)
MIME-Version: 1.0
References: <20230127050613.793962-1-james.hilliard1@gmail.com>
In-Reply-To: <20230127050613.793962-1-james.hilliard1@gmail.com>
Date: Fri, 27 Jan 2023 06:14:24 +0100
Message-ID: <CAGm1_ktsm15FGbsk47KzWEaDR+8eOf-N0-16qi89=tXO9TkMcQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L9KJ2k3krqDTVoC5UR8rWZwuVkoiyzonIUnvuaABPLA=;
 b=l8zqjenTfHf0YhdPsOd8nXX4nv/4MUufHOOLW5AmbOJ0CIqnn9CMDOfXq+a4g/cZYl
 OfxwvCKuqMW06pQvFfqWTpZOSnO47NeyXYxb/xwdnN2kzBCxIbTyL2F1MxnNEXIMkQXm
 epS3cuINgTbmpxKvYOVdURlbgUpjAAj7Qz5oYbpUxdeMMf1fOtB11DQjhe8nvzDy4mE8
 E6fo35XP15rdDLBVtIhI1ZZqRLrIGzENULImrIKLrtF4soQVcpfylNcuK5KDiywm9Vwd
 Yr/kIs4BIl33sJCm64EOODi/3Al5dRpv9DOH5JmzRO/rM9EcQC9QG01RhZoiRqx8w3HX
 Wcfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l8zqjenT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-greenlet: add missing
 C++ dependency
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Jan 27, 2023 at 6:06 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Fixes:
>  - http://autobuild.buildroot.net/results/529/5291fe0fac1d5c7b6587e4a566991a764a2632fb
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-greenlet/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
> index 9f66ebe119..32ccdaae27 100644
> --- a/package/python-greenlet/Config.in
> +++ b/package/python-greenlet/Config.in
> @@ -12,6 +12,7 @@ config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
>  config BR2_PACKAGE_PYTHON_GREENLET
>         bool "python-greenlet"
>         depends on BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
> +       depends on BR2_INSTALL_LIBSTDCPP
>         help
>           Lightweight in-process concurrent programming.
>
> --
> 2.34.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
