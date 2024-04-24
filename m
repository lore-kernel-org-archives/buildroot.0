Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88206C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 13:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A305415B2;
	Wed, 24 Apr 2024 13:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RgXEtpHrpRFX; Wed, 24 Apr 2024 13:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EC92404EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EC92404EB;
	Wed, 24 Apr 2024 13:28:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 644521BF2C1
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 13:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E1A04157E
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 13:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtw4r7bFOXyl for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 13:28:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=andreynech@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E5AB40195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E5AB40195
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E5AB40195
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 13:28:53 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5aa3f0fcd46so4086200eaf.1
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 06:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713965332; x=1714570132;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7i/CfrY8TRhhkzNqjDFQcgot/QBllm9+DDdrfR5zb/Q=;
 b=kfn+K80Gt/vL/rOT9WP1wFuEpsxVt2AeLMGcoRfEA8tWLVr6k00n8nrPodL1tdd/qG
 T92OnE1fLjAyoIT0A0dIXnzO9GATnA3nw5ZzRFo8fs5gQqcn4p8G8L68ES87v3gKspQe
 IoMLX0b/sSAAgM1/0+7ebiNHnNl+ZtV62VSnBCujiUbSQ9xrHPr/F9c4B9Kx183ylnd3
 m7mZw58eHGTbeEcDB8LXEOSVXQgXIp9myFXTfXwbeQlqhhItczlDMAmblQHoopxWZnc9
 xAWByTSL/ieqZqW2/ANPEtExMIX6dlbHU8Vckjgeaus0PKdA8E2fI+oZhhyfaTaKruDF
 +NTA==
X-Gm-Message-State: AOJu0YyYBrmSwaWlfgq1Q8FopjsDcGA+4tecDZ1HpB2Syyk9ugfco1pZ
 uqV7TmS7LHn4VyKLE/2xtpO8BYpVAImigCcVR59++/gh/XBUwNhqoIdcvH5vuVkMH0GDLn6Vua8
 pfxOq7/Qrb+7/9q9LJNx28idz4qEV+A==
X-Google-Smtp-Source: AGHT+IFriNUeg751JSVfDHDXFkmyH2IJ/Hi2VAa4pj+PoMpqWmvxQqoFfN6xM9T6SVQct4ETFBRnkROCYZumsScujTI=
X-Received: by 2002:a4a:6c2:0:b0:5ac:9f74:f659 with SMTP id
 185-20020a4a06c2000000b005ac9f74f659mr2370121ooj.7.1713965332295; Wed, 24 Apr
 2024 06:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAOiXNkDTjbvmeyAAqtc+Bj=QKxdHLxXS8EtR1rFi_vs9A6Dn=A@mail.gmail.com>
In-Reply-To: <CAOiXNkDTjbvmeyAAqtc+Bj=QKxdHLxXS8EtR1rFi_vs9A6Dn=A@mail.gmail.com>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 24 Apr 2024 15:28:41 +0200
Message-ID: <CAOiXNkDBOe+HN1h8t_kWyQ4tcANa_DkccWt7Js1Butiy01j2Ug@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713965332; x=1714570132; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7i/CfrY8TRhhkzNqjDFQcgot/QBllm9+DDdrfR5zb/Q=;
 b=k1FWrGtIP6BEKrS1zAhGvSDJ9Pr7FuX+8+NgWNIUUpoc3L65hH1jWudGFdqxduW0AG
 8GJXquOzhKs/U3CCF2CLfPIwKWLlUM2ZWXHATNVXRG+hw/X6FxfUvRj0Z8r8TdC4XuoM
 YqKmdFb4dR6stJt5rW77xP2eGWxngVlZZaQ+5Ovk8CXjA+By+btS2q7ADUIxoXgJ7xH4
 Y1f0VCa3oEOt01A2lvSkBzJwBl7KfLibxKp8VdCUn07TyPORn2GURp6MYVSFnzAmIXFx
 BS5nTSJTW+2wKo4D3x6CdKRpa3hxlATCu/C/yWXARci2MkUOQc+eJleJfkpVl/tsdF1O
 bjag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=k1FWrGtI
Subject: Re: [Buildroot] Growing rootfs.cpio after each make
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Folks,
Am I the only one with the problem mentioned below? :-)

On Fri, 19 Apr 2024 at 13:34, Andrey Nechypurenko <andreynech@gmail.com> wrote:
>
> Hi Buildrooters,
>
> I have BR2_TARGET_ROOTFS_CPIO enabled and just realized that every
> time I run make in the build directory, the images/rootfs.cpio file is
> growing. Even deleting the file before make still results in an ever
> growing file.
>
> So I am wondering why it is happening and if there is any way to
> prevent this without running make clean all or similar? Maybe some
> kind of pre- or post-build scripts?
>
> Thank you,
> Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
