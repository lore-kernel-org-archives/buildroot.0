Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE64C77B7D
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 10:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93C4540465;
	Sun, 14 May 2023 10:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93C4540465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N61OSAimPSsL; Sun, 14 May 2023 10:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFDB840169;
	Sun, 14 May 2023 10:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFDB840169
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAC1D1BF37C
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 10:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9417882218
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 10:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9417882218
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqcSdd31gQYm for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 10:34:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C2E082210
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C2E082210
 for <buildroot@buildroot.org>; Sun, 14 May 2023 10:34:44 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-965c3f9af2aso1778045966b.0
 for <buildroot@buildroot.org>; Sun, 14 May 2023 03:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684060482; x=1686652482;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SxW4+ViFnblipYIAWgV60R7jh22l9z9p/KKyHRWIWVE=;
 b=g6Wzj5OHenioBAmu7IMrUwpCv8+YyYoNNUxrj/u4LZjz5XBJ2mediZkEaxlSuj0fTy
 dUeICtlTVug7Be9sqTo4K92yhK3GviVLNhSuL4CKTGhi6FJoNE7lg2qwn6Eh3ZZcUqSs
 DgGgbLiq6G5zlYmqMI1idKL9gf1DW4SPPWgfmZAIefuOo8hCvn7GvW7LLDnq702lgH8n
 zJZ6USgpP0w5DrhQ3t3XJcnkEnTpLv0nbmaF72BVd8IdoUEwkGgOMpRBHITljuEhYCPb
 DBQ8wy2S0rC32b+BU7BvkeJbr9pqdoMCoYfpGp8fwNoTCHobk2KW1qsVxq7uA1UmVBou
 K+HQ==
X-Gm-Message-State: AC+VfDzcTeUlN8ChmwB44em5NkX6vZfNKI5xOC3wtZVEHflV9o1e4gxR
 /4+DeD5YsSL/gqTFE4LJA9U4+2ajG3jiBhshM1uDvnk5K3ebHQ==
X-Google-Smtp-Source: ACHHUZ4vT1CpG7+gcVCghgSNSp2pCiZAUqTq69U5x4eESU0+XXsSPrl2cg5OvqaWcbQOu6QoI/Rb4GX/TjnVvU0Bh0A=
X-Received: by 2002:a17:907:31ca:b0:960:d28d:3368 with SMTP id
 xf10-20020a17090731ca00b00960d28d3368mr26614524ejb.60.1684060482055; Sun, 14
 May 2023 03:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230514102037.261428-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230514102037.261428-1-giulio.benetti@benettiengineering.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 14 May 2023 12:34:30 +0200
Message-ID: <CAB1t1CwQrZhwtgZKhioCySMUG-sst7_491YGHrXccwyDLGLzLA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684060482; x=1686652482;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SxW4+ViFnblipYIAWgV60R7jh22l9z9p/KKyHRWIWVE=;
 b=iVGLuJ+JhRc3KUWyLQnJ6g/7sKF9Ez2wYHkXtz9oBKnLsmcpfQSIyAzsYlJA4lKepZ
 usBx1FhzLFyToGp28jmJE9KMS/V8LwYav+VlkGXh3+G9dHGy/JzxvyCwRfMhqdaSiTJx
 kBOwdkj75ROJssnBTXEx5EoODWj1trMJ8zqVmaqnmLyPBsN3Tq1XvwRlYDR7XE5rTnE8
 0sYPSRa0dDo8X1mR15ZsIvHg8S4jpKj85NXWWorihaTifkpb7mict+sayIMLiaQeW0cs
 wAjIKYH9vVO57MM4FAV65uIx2WvlyUQkzZgBAv31VFdteU6K4T9FNbhlrxJj1sFjxFj+
 n7xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iVGLuJ+J
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: fix host build failure
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Sun, 14 May 2023 at 12:20, Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Package nfs-utils requires libevent and sqlite so let's add these two
> packages as dependencies for host package too.
>
> Fixes:
> http://autobuild.buildroot.org/results/5e1ac97e4023f902dffa066c895aa6f6005d541c/

Fixes: f9dc4bab9f ("package/nfs-utils: bump to version 2.6.3")
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

I'm sorry for not spotting this in f9dc4bab9f review.
The error is about missing libevent, I suppose it'd fail for missing
sqlite if we add only host-libevent.

Kind regards,
Petr

>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/nfs-utils/nfs-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 2f2e200bb5..3c85be0558 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -22,7 +22,7 @@ NFS_UTILS_CONF_OPTS = \
>         --with-statedir=/run/nfs \
>         --with-rpcgen=$(HOST_DIR)/bin/rpcgen
>
> -HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
> +HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqlite
>
>  HOST_NFS_UTILS_CONF_OPTS = \
>         --enable-tirpc \
> --
> 2.34.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
